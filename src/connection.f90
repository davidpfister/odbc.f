module odbc_connection
    use, intrinsic :: iso_c_binding
    use sql
    use odbc_constants
    use odbc_resultset, only: resultset

    implicit none; private

    enum, bind(c)
        enumerator :: SQL_CURSOR_FORWARD_ONLY = 0
        enumerator :: SQL_CURSOR_KEYSET_DRIVEN = 1
        enumerator :: SQL_CURSOR_DYNAMIC = 2
        enumerator :: SQL_CURSOR_STATIC = 3
    end enum

    type, public :: connection
        private
        type(SQLHENV)                   :: env
        type(SQLHDBC)                   :: dbc
        type(SQLHSTMT)                  :: stmt
        logical                         :: is_opened
        integer                         :: timeout
        integer(SQLSMALLINT)            :: rec
        character(kind=SQLTCHAR, len=1) :: state(6)
        character(kind=SQLTCHAR, len=1) :: msg(SQL_MAX_MESSAGE_LENGTH)
        integer(SQLSMALLINT)            :: ierr
        integer(SQLSMALLINT)            :: imsg
    contains
        private
        procedure, pass(this), public   :: set_timeout => connection_set_timeout
        procedure, pass(this), public   :: get_timeout => connection_get_timeout
        procedure, pass(this), public   :: isopened => connection_isopened
        procedure, pass(this), private  :: connection_open
        procedure, pass(this), private  :: connection_open_with_pwd
        generic, public                 :: open => connection_open, &
                                                   connection_open_with_pwd
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

contains

    function connection_new() result(that)
        type(connection) :: that

        that%env = c_null_ptr
        that%dbc = c_null_ptr
        that%stmt = c_null_ptr
        that%is_opened = .false.
        that%timeout = 10
        that%rec = 1_c_short
    end function

    function connection_open(this, dsn) result(success)
        class(connection), intent(inout)    :: this
        character(*), intent(in), target    :: dsn
        logical :: success

        success = connection_open_with_pwd(this, dsn, '', '')
    end function

    function connection_open_with_pwd(this, dsn, user, pwd) result(success)
        class(connection), intent(inout)    :: this
        character(*), intent(in), target    :: dsn
        character(*), target                :: user
        character(*), target                :: pwd
        logical :: success
        !private
        integer(SQLRETURN) :: ret

        if (len_trim(user) == 0) user = ''; if (len_trim(pwd) == 0) pwd = ''

        ret = SQLAllocEnv(this%env)
        if (ret == SQL_ERROR) call handle_error(this, 'ENV')

        ret = SQLAllocConnect(this%env, this%dbc)
        if (ret == SQL_ERROR) then
            call handle_error(this, 'ENV')
        else if (ret == SQL_INVALID_HANDLE .or. ret < SQL_SUCCESS) then
            call handle_error(this, 'ENV')
        end if

        ret = SQLConnect(this%dbc, c_loc(dsn), len_trim(dsn, kind=c_short), &
                         c_loc(user), len_trim(user, kind=c_short), &
                         c_loc(pwd), len_trim(pwd, kind=c_short))
        if (ret == SQL_ERROR) call handle_error(this, 'DBC')

        ret = SQLAllocStmt(this%dbc, this%stmt)
        if (ret == SQL_ERROR) call handle_error(this, 'DBC')

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
        character(*), intent(in), target    :: sql
        integer(c_int) :: count
        !private
        integer(SQLRETURN) :: ret
        integer(c_long), target :: countInt

        if (.not. this%is_opened) call handle_error(this, 'Call Open() before execute()')

        ret = SQLPrepare(this%stmt, c_loc(sql), SQL_NTS)
        if (ret == SQL_ERROR) call handle_error(this, 'STMT')

        ret = SQLExecute(this%stmt)
        if (ret == SQL_ERROR .or. ret < SQL_SUCCESS) call handle_error(this, 'STMT')

        countInt = -1
        ret = SQLRowCount(this%stmt, c_loc(countInt))
        count = countInt
    end function

    function connection_execute_query(this, sql) result(rslt)
        class(connection), intent(inout)    :: this
        character(*), intent(in), target    :: sql
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

        ret = SQLExecDirect(this%stmt, c_loc(sql), len_trim(sql))
        if (ret == -1) call handle_error(this, 'STMT')

        rslt = resultset(this%stmt)
    end function

    function connection_execute_query_with_cursor(this, sql, cursor_type, scrollable) result(rslt)
        class(connection), intent(inout)        :: this
        character(*), intent(in), target        :: sql
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

        ret = SQLExecDirect(this%stmt, c_loc(sql), len_trim(sql))
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
                                   c_loc(this%state), c_loc(this%ierr), c_loc(this%msg), &
                                   int(c_sizeof(this%msg), SQLSMALLINT), c_loc(this%imsg))
        else if (trim(type) == 'ENV') then
            status = SQLGetDiagRec(SQL_HANDLE_ENV, this%env, this%rec, &
                                   c_loc(this%state), c_loc(this%ierr), c_loc(this%msg), &
                                   int(c_sizeof(this%msg), SQLSMALLINT), c_loc(this%imsg))
        else if (trim(type) == 'DBC') then
            status = SQLGetDiagRec(SQL_HANDLE_DBC, this%dbc, this%rec, &
                                   c_loc(this%state), c_loc(this%ierr), c_loc(this%msg), &
                                   int(c_sizeof(this%msg), SQLSMALLINT), c_loc(this%imsg))
        else
            call throw_exception(trim(this%msg), this%ierr)
        end if

        if (status /= SQL_SUCCESS) then
            call throw_exception(trim(this%msg), this%ierr)
        end if
    end subroutine

    subroutine throw_exception(msg, errCode)
        character(*), intent(in)        :: msg
        integer(c_short), intent(in)    :: errCode

        print *, 'connection error: ', msg, ' Error code: ', errCode
        stop
    end subroutine
end module
