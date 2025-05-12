#include <c_interop.inc>
module odbc_connection
    use, intrinsic :: iso_c_binding
    use sql
    use sqlext
    use odbc_constants
    use odbc_resultset, only: resultset, resultsetmetadata

    implicit none; private
    
    public :: resultset,    &
              resultsetmetadata

    type, public :: connection
        private
        type(SQLHENV)                   :: env
        type(SQLHDBC)                   :: dbc
        type(SQLHSTMT)                  :: stmt
        logical                         :: is_opened
        integer                         :: timeout
        integer(SQLSMALLINT)            :: rec
        character(kind=SQLTCHAR, len=6) :: state
        character(kind=SQLTCHAR, len=SQL_MAX_MESSAGE_LENGTH) :: msg
        integer(SQLINTEGER)             :: ierr
        integer(SQLSMALLINT)            :: imsg
        character(1024)                 :: connstring
    contains
        private
        procedure, pass(this), public   :: set_timeout => connection_set_timeout
        procedure, pass(this), public   :: get_timeout => connection_get_timeout
        procedure, pass(this), public   :: isopened => connection_isopened
        procedure, pass(this), private  :: connection_open
        generic, public                 :: open => connection_open
        procedure, pass(this), public   :: execute => connection_execute
        procedure, pass(this), private  :: connection_execute_query
        procedure, pass(this), private  :: connection_execute_query_with_cursor
        generic, public                 :: execute_query => connection_execute_query, &
                                                            connection_execute_query_with_cursor
        procedure, pass(this), public   :: commit => connection_commit
        procedure, pass(this), public   :: rollback => connection_rollback
        procedure, pass(this), public   :: close => connection_close
        final :: connection_finalize
    end type

    interface connection
        module procedure :: connection_new
    end interface

    interface throw_exception
            module procedure :: throw_exception_i2
            module procedure :: throw_exception_i4
    end interface

contains

    function connection_new(connstring) result(that)
        type(connection)            :: that
        character(*), intent(in)    :: connstring

        that%env = NULL
        that%dbc = NULL
        that%stmt = NULL
        that%is_opened = .false.
        that%timeout = 10
        that%rec = _SHORT(1)
        that%connstring = _STRING(connstring)
    end function

    function connection_open(this) result(success)
        class(connection), intent(inout)    :: this
        logical :: success
        !private
        integer(SQLRETURN) :: ret 

        ret = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, this%env)
        if (ret /= 0) call handle_error(this, 'ENV')

        ret = SQLSetEnvAttr(this%env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0)
        if (ret /= 0) call handle_error(this, 'ENV')

        ret = SQLAllocHandle(SQL_HANDLE_DBC, this%env, this%dbc)
        if (ret == SQL_ERROR) then
            call handle_error(this, 'ENV')
        else if (ret == SQL_INVALID_HANDLE .or. ret < SQL_SUCCESS) then
            call handle_error(this, 'ENV')
        end if

        ret = SQLDriverConnect(this%dbc, NULL, this%connstring &
                , int(len_trim(this%connstring), c_short), STR_NULL_PTR, _SHORT(0), SHORT_NULL_PTR, SQL_DRIVER_COMPLETE)
        if (ret /= SQL_SUCCESS) call handle_error(this, 'DBC')

        ret = SQLAllocStmt(this%dbc, this%stmt)
        if (ret /= SQL_SUCCESS) call handle_error(this, 'DBC')

        this%is_opened = .true.
        success = .true.
    end function

    function connection_get_timeout(this) result(res)
        class(connection), intent(in)       :: this
        integer :: res

        res = this%timeout
    end function

    subroutine connection_set_timeout(this, n)
        class(connection), intent(inout)    :: this
        integer, intent(in)                 :: n

        this%timeout = n
    end subroutine

    function connection_isopened(this) result(res)
        class(connection), intent(in)       :: this
        logical :: res

        res = this%is_opened
    end function

    function connection_execute(this, sql) result(count)
        class(connection), intent(inout)    :: this
        character(*), intent(in)            :: sql
        integer(c_int) :: count
        !private
        integer(SQLRETURN) :: ret
        integer(SQLLEN), allocatable :: countInt
        character(len(sql)) :: tmp

        if (.not. this%is_opened) call handle_error(this, 'Call Open() before execute()')

        ret = SQLPrepare(this%stmt, _STRING(sql), SQL_NTS)
        if (ret == SQL_ERROR) call handle_error(this, 'STMT')

        ret = SQLExecute(this%stmt)
        if (ret == SQL_ERROR .or. ret < SQL_SUCCESS) call handle_error(this, 'STMT')

        allocate(countInt, source = _LONG(0))
        tmp = to_lower(sql)
        if (index(tmp, 'update') > 0 .or. &
            index(tmp, 'insert') > 0 .or. &
            index(tmp, 'deleta') > 0) then
            ret = SQLRowCount(this%stmt, countInt)
        end if
        count = merge(int(ret, c_int), int(countInt, c_int), ret /= SQL_SUCCESS)
    end function   

    function connection_execute_query(this, sql) result(rslt)
        class(connection), intent(inout)    :: this
        character(*), intent(in)            :: sql
        type(resultset) :: rslt
        !private
        integer(SQLRETURN) :: ret
        integer(c_int), target :: cursor

        cursor = SQL_CURSOR_DYNAMIC

        if (.not. this%is_opened) call throw_exception('Connection not opened', SQL_ERROR)

        ret = SQLFreeStmt(this%stmt, SQL_CLOSE)
        ret = SQLAllocStmt(this%dbc, this%stmt)
        if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE .or. ret < SQL_SUCCESS) call handle_error(this, 'DBC')

        ret = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_TYPE, c_loc(cursor), SQL_IS_INTEGER)
        if (ret < SQL_SUCCESS) call handle_error(this, 'STMT')

        ret = SQLExecDirect(this%stmt, _STRING(sql), SQL_NTS)
        if (ret == -1) call handle_error(this, 'STMT')

        rslt = resultset(this%stmt)
    end function

    function connection_execute_query_with_cursor(this, sql, cursor_type, scrollable) result(rslt)
        class(connection), intent(inout)        :: this
        character(*), intent(in)                :: sql
        integer(c_short), intent(in), target    :: cursor_type
        logical, intent(in)                     :: scrollable
        type(resultset) :: rslt
        !private
        integer(c_short) :: ret
        integer(c_short), target :: dummy

        dummy = SQL_SCROLLABLE

        if (.not. this%is_opened) call throw_exception('Connection not opened', SQL_ERROR)

        if (cursor_type /= SQL_CURSOR_DYNAMIC .and. cursor_type /= SQL_CURSOR_FORWARD_ONLY &
            .and. cursor_type /= SQL_CURSOR_KEYSET_DRIVEN &
            .and. cursor_type /= SQL_CURSOR_STATIC) then
            call throw_exception('Invalid cursor type', SQL_ERROR)
        end if

        ret = SQLFreeStmt(this%stmt, SQL_CLOSE)
        ret = SQLAllocStmt(this%dbc, this%stmt)
        if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE .or. ret < SQL_SUCCESS) call handle_error(this, 'DBC')

        ret = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_TYPE, c_loc(cursor_type), SQL_IS_INTEGER)
        if (ret < SQL_SUCCESS) call handle_error(this, 'STMT')

        if (scrollable) then
            ret = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_SCROLLABLE, c_loc(dummy), SQL_IS_INTEGER)
            if (ret < SQL_SUCCESS) call handle_error(this, 'STMT')
        end if

        ret = SQLExecDirect(this%stmt, sql, len_trim(sql))
        if (ret == SQL_ERROR) call handle_error(this, 'STMT')

        rslt = resultset(this%stmt)
    end function

    function connection_commit(this) result(success)
        class(connection), intent(inout)    :: this
        logical :: success
        !private
        integer(SQLRETURN) :: ret

        ret = SQLEndTran(SQL_HANDLE_DBC, this%dbc, SQL_COMMIT)
        if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE) call throw_exception('Commit failed', ret)

        success = .true.
    end function

    function connection_rollback(this) result(success)
        class(connection), intent(inout)    :: this
        logical :: success
        !private
        integer(c_short) :: ret

        ret = SQLEndTran(SQL_HANDLE_DBC, this%dbc, SQL_ROLLBACK)
        if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE) call throw_exception('Rollback failed', ret)

        success = .true.
    end function

    subroutine connection_close(this)
        class(connection), intent(inout)    :: this
        !private
        integer(SQLRETURN) :: ret
        if (this%is_opened) then
            ret = SQLFreeStmt(this%stmt, SQL_CLOSE)
            ret = SQLDisconnect(this%dbc)
            ret = SQLFreeConnect(this%dbc)
            ret = SQLFreeEnv(this%env)
            this%is_opened = .false.
        end if
    end subroutine

    subroutine connection_finalize(this)
        type(connection), intent(inout)    :: this

        call this%close()
    end subroutine

    subroutine handle_error(this, type)
        class(connection), intent(inout), target    :: this
        character(*), intent(in)                    :: type
        !private
        integer(SQLRETURN) :: status

        ! Error handling
        if (trim(type) == 'STMT') then
            status = SQLGetDiagRec(SQL_HANDLE_STMT, this%stmt, this%rec, &
                                    this%state, this%ierr, this%msg, &
                                    len(this%msg, SQLSMALLINT), this%imsg)
        else if (trim(type) == 'ENV') then
            status = SQLGetDiagRec(SQL_HANDLE_ENV, this%env, this%rec, &
                                    this%state, this%ierr, this%msg, &
                                    len(this%msg, SQLSMALLINT), this%imsg)
        else if (trim(type) == 'DBC') then
            status = SQLGetDiagRec(SQL_HANDLE_DBC, this%dbc, this%rec, &
                                   this%state, this%ierr, this%msg, &
                                   len(this%msg, SQLSMALLINT), this%imsg)
        else
            call throw_exception(trim(this%msg), this%ierr)
        end if

        if (status /= SQL_SUCCESS) then
            call throw_exception(trim(this%msg), this%ierr)
        end if
    end subroutine

    subroutine throw_exception_i2(msg, errCode)
        character(*), intent(in)        :: msg
        integer(SQLSMALLINT), intent(in) :: errCode

        print *, 'connection error: ', msg, ' Error code: ', errCode
        stop
    end subroutine

    subroutine throw_exception_i4(msg, errCode)
        character(*), intent(in)        :: msg
        integer(SQLINTEGER), intent(in) :: errCode

        print *, 'connection error: ', msg, ' Error code: ', errCode
        stop
    end subroutine
    
    pure function to_lower(str) result(res)
        character(*), intent(in) :: str
        character(len(str)) :: res
        integer :: i,j
        integer, parameter :: A = iachar('A'), Z = iachar('Z') 
        
        do i = 1, len(str)
            j = iachar(str(i:i))
            if (j >= A .and. j <= Z) then
                res(i:i) = achar(iachar(str(i:i)) + 32)
            else
                res(i:i) = str(i:i)
            end if
        end do

    end function
end module
