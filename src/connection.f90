!> @defgroup group_odbc_connection Connection
!> @include{doc, raise=1} snippets/connection.md
!> @{
!! @cond
#include <c_interop.inc>
!! @endcond
module odbc_connection
    use, intrinsic :: iso_c_binding
    use, intrinsic :: iso_fortran_env, only: stderr => error_unit
    use sql
    use sqlext
    use odbc_constants
    use odbc_resultset, only: resultset, new

    implicit none; private
    
    public :: resultset

    !> @brief Represents a database connection with ODBC, managing 
    !! environment, connection, and statement handles, and providing 
    !! methods to open connections, execute SQL statements, and manage 
    !! transactions, with support for @ref odbc_resultset::resultset objects.
    type, public :: connection
        private
        type(SQLHENV)                   :: env
        type(SQLHDBC)                   :: dbc
        type(SQLHSTMT)                  :: stmt
        logical                         :: opened
        integer                         :: timeout
        integer(SQLSMALLINT)            :: rec
        character(kind=SQLTCHAR, len=6) :: state
        character(kind=SQLTCHAR, len=SQL_MAX_MESSAGE_LENGTH) :: msg
        integer(SQLINTEGER)             :: ierr
        integer(SQLSMALLINT)            :: imsg
        character(1024)                 :: connstring
    contains
        private
        procedure, pass(this), public   :: set_timeout  => connection_set_timeout
        procedure, pass(this), public   :: get_timeout  => connection_get_timeout
        procedure, pass(this), public   :: is_open    => connection_isopened
        procedure, pass(this), private  :: connection_open
        generic, public                 :: open         => connection_open
        procedure, pass(this), public   :: execute      => connection_execute
        procedure, pass(this), private  :: connection_execute_query
        procedure, pass(this), private  :: connection_execute_query_with_cursor
        generic, public                 :: execute_query => connection_execute_query, &
                                                            connection_execute_query_with_cursor
        procedure, pass(this), public   :: commit       => connection_commit
        procedure, pass(this), public   :: rollback     => connection_rollback
        procedure, pass(this), public   :: close        => connection_close
        final :: connection_finalize
    end type

    !> @brief Constructor interface for creating a new @ref connection 
    !! object with a specified ODBC connection string.
    !! @param[in] connstring The ODBC connection string.
    !! @return A new @ref connection object.
    interface connection
        module procedure :: connection_new
    end interface

    interface throw
            module procedure :: throw_i2
            module procedure :: throw_i4
    end interface

contains

    !> @brief Creates a new @ref connection object with the specified 
    !! ODBC connection string.
    !! @param[in] connstring The ODBC connection string (e.g., 
    !! "DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;").
    !! @return A new @ref connection object initialized with the 
    !! connection string.
    function connection_new(connstring) result(that)
        type(connection)            :: that
        character(*), intent(in)    :: connstring

        that%env = NULL
        that%dbc = NULL
        that%stmt = NULL
        that%opened = .false.
        that%timeout = 10
        that%rec = _SHORT(1)
        that%connstring = _STRING(connstring)
    end function

    !> @brief Opens a database connection using the stored connection 
    !! string in the @ref connection object.
    !! @param[inout] this The @ref connection object.
    subroutine connection_open(this)
        class(connection), intent(inout)    :: this

        this%ierr = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, this%env)
        if (this%ierr /= 0) call handle_error(this, 'ENV')

        this%ierr = SQLSetEnvAttr(this%env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0)
        if (this%ierr /= 0) call handle_error(this, 'ENV')

        this%ierr = SQLAllocHandle(SQL_HANDLE_DBC, this%env, this%dbc)
        if (this%ierr == SQL_ERROR) then
            call handle_error(this, 'ENV')
        else if (this%ierr == SQL_INVALID_HANDLE .or. this%ierr < SQL_SUCCESS) then
            call handle_error(this, 'ENV')
        end if

        this%ierr = SQLDriverConnect(this%dbc, NULL, this%connstring &
                , int(len_trim(this%connstring), c_short), STR_NULL_PTR, _SHORT(0), SHORT_NULL_PTR, SQL_DRIVER_COMPLETE)
        if (this%ierr /= SQL_SUCCESS) call handle_error(this, 'DBC')

        this%ierr = SQLAllocStmt(this%dbc, this%stmt)
        if (this%ierr /= SQL_SUCCESS) call handle_error(this, 'DBC')

        this%opened = .true.
    end subroutine

    !> @brief Opens a database connection using the stored connection 
    !! string in the @ref connection object.    
    !! @param[inout] this The @ref connection object.
    function connection_get_timeout(this) result(res)
        class(connection), intent(in)       :: this
        integer :: res

        res = this%timeout
    end function

    !> @brief Sets the connection timeout in seconds for the 
    !! @ref connection object.
    !! @param[inout] this The @ref connection object.
    !! @param[in] n The timeout value in seconds.
    subroutine connection_set_timeout(this, n)
        class(connection), intent(inout)    :: this
        integer, intent(in)                 :: n

        this%timeout = n
    end subroutine

    !> @brief Checks if the @ref connection is open.
    !! @param[in] this The @ref connection object.
    !! @return .true. if the connection is open, .false. otherwise.
    function connection_isopened(this) result(res)
        class(connection), intent(in)       :: this
        logical :: res

        res = this%opened
    end function

    !> @brief Executes a non-query SQL statement (e.g., INSERT, 
    !! UPDATE, DELETE) and returns the number of affected rows 
    !! using the @ref connection object.
    !! @param[inout] this The @ref connection object.
    !! @param[in] sql The SQL statement to execute.
    !! @return The number of affected rows, or an error code if 
    !! the operation fails.
    function connection_execute(this, sql) result(count)
        class(connection), intent(inout)    :: this
        character(*), intent(in)            :: sql
        integer(c_int) :: count
        !private
        integer(SQLLEN), allocatable :: countInt
        character(len(sql)) :: tmp

        if (.not. this%opened) call handle_error(this, 'Call Open() before execute()')

        this%ierr = SQLPrepare(this%stmt, _STRING(sql), SQL_NTS)
        if (this%ierr == SQL_ERROR) call handle_error(this, 'STMT')

        this%ierr = SQLExecute(this%stmt)
        if (this%ierr == SQL_ERROR .or. this%ierr < SQL_SUCCESS) call handle_error(this, 'STMT')

        allocate(countInt, source = _LONG(0))
        tmp = to_lower(sql)
        if (index(tmp, 'update') > 0 .or. &
            index(tmp, 'insert') > 0 .or. &
            index(tmp, 'delete') > 0) then
            this%ierr = SQLRowCount(this%stmt, countInt)
        end if
        count = merge(int(this%ierr, c_int), int(countInt, c_int), this%ierr /= SQL_SUCCESS)
    end function   

    !> @brief Executes a query and stores results in a @ref odbc_resultset::resultset 
    !! object.
    !! @param[inout] this The @ref connection object.
    !! @param[in] sql The SQL query to execute.
    !! @param[inout] rslt The @ref odbc_resultset::resultset object to store the query 
    !! results.
    subroutine connection_execute_query(this, sql, rslt)
        class(connection), intent(inout)    :: this
        character(*), intent(in)            :: sql
        type(resultset), intent(inout)      :: rslt
        !private
        integer(c_int), target :: cursor

        cursor = SQL_CURSOR_DYNAMIC

        if (.not. this%opened) call throw('Connection not opened', SQL_ERROR)

        this%ierr = SQLFreeStmt(this%stmt, SQL_CLOSE)
        this%ierr = SQLAllocStmt(this%dbc, this%stmt)
        if (this%ierr == SQL_ERROR .or. &
            this%ierr == SQL_INVALID_HANDLE .or. &
            this%ierr < SQL_SUCCESS) call handle_error(this, 'DBC')

        this%ierr = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_TYPE, c_loc(cursor), SQL_IS_INTEGER)
        if (this%ierr < SQL_SUCCESS) call handle_error(this, 'STMT')

        this%ierr = SQLExecDirect(this%stmt, _STRING(sql), SQL_NTS)
        if (this%ierr == -1) call handle_error(this, 'STMT')

        call new(rslt, this%stmt)
    end subroutine

    !> @brief Executes a query with a specified cursor type and scrollable 
    !! option, storing results in a @ref odbc_resultset::resultset object.
    !! @param[inout] this The @ref connection object.
    !! @param[in] sql The SQL query to execute.
    !! @param[in] cursor_type The cursor type (e.g., SQL_CURSOR_STATIC, 
    !! SQL_CURSOR_FORWARD_ONLY).
    !! @param[in] scrollable Whether the cursor is scrollable (.true. or 
    !! .false.).
    !! @param[inout] rslt The @ref odbc_resultset::resultset object to store the query 
    !! results.
    subroutine connection_execute_query_with_cursor(this, sql, cursor_type, scrollable, rslt)
        class(connection), intent(inout)        :: this
        character(*), intent(in)                :: sql
        integer(c_short), intent(in), target    :: cursor_type
        logical, intent(in)                     :: scrollable
        type(resultset), intent(inout)          :: rslt
        !private
        integer(c_short), target :: dummy

        dummy = SQL_SCROLLABLE

        if (.not. this%opened) call throw('Connection not opened', SQL_ERROR)

        if (cursor_type /= SQL_CURSOR_DYNAMIC .and. cursor_type /= SQL_CURSOR_FORWARD_ONLY &
            .and. cursor_type /= SQL_CURSOR_KEYSET_DRIVEN &
            .and. cursor_type /= SQL_CURSOR_STATIC) then
            call throw('Invalid cursor type', SQL_ERROR)
        end if

        this%ierr = SQLFreeStmt(this%stmt, SQL_CLOSE)
        this%ierr = SQLAllocStmt(this%dbc, this%stmt)
        if (this%ierr == SQL_ERROR .or. &
            this%ierr == SQL_INVALID_HANDLE .or. &
            this%ierr < SQL_SUCCESS) call handle_error(this, 'DBC')

        this%ierr = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_TYPE, c_loc(cursor_type), SQL_IS_INTEGER)
        if (this%ierr < SQL_SUCCESS) call handle_error(this, 'STMT')

        if (scrollable) then
            this%ierr = SQLSetStmtAttr(this%stmt, SQL_ATTR_CURSOR_SCROLLABLE, c_loc(dummy), SQL_IS_INTEGER)
            if (this%ierr < SQL_SUCCESS) call handle_error(this, 'STMT')
        end if

        this%ierr = SQLExecDirect(this%stmt, sql, len_trim(sql))
        if (this%ierr == SQL_ERROR) call handle_error(this, 'STMT')

        call new(rslt, this%stmt)
    end subroutine

    !> @brief Commits the current transaction using the @ref connection 
    !! object.
    !! @param[inout] this The @ref connection object.
    !! @return .true. if the commit succeeds, .false. otherwise.
    function connection_commit(this) result(success)
        class(connection), intent(inout)    :: this
        logical :: success

        this%ierr = SQLEndTran(SQL_HANDLE_DBC, this%dbc, SQL_COMMIT)
        if (this%ierr == SQL_ERROR .or. &
            this%ierr == SQL_INVALID_HANDLE) call throw('Commit failed', this%ierr)

        success = .true.
    end function

    !> @brief Rolls back the current transaction using the 
    !! @ref connection object.
    !! @param[inout] this The @ref connection object.
    !! @return .true. if the rollback succeeds, .false. otherwise.
    function connection_rollback(this) result(success)
        class(connection), intent(inout)    :: this
        logical :: success

        this%ierr = SQLEndTran(SQL_HANDLE_DBC, this%dbc, SQL_ROLLBACK)
        if (this%ierr == SQL_ERROR .or.&
            this%ierr == SQL_INVALID_HANDLE) call throw('Rollback failed', this%ierr)

        success = .true.
    end function

    !> @brief Closes the database connection and frees resources 
    !! in the @ref connection object.
    !! @param[inout] this The @ref connection object.
    subroutine connection_close(this)
        class(connection), intent(inout)    :: this

        if (this%opened) then
            this%ierr = SQLFreeStmt(this%stmt, SQL_CLOSE)
            this%ierr = SQLDisconnect(this%dbc)
            this%ierr = SQLFreeConnect(this%dbc)
            this%ierr = SQLFreeEnv(this%env)
            this%opened = .false.
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
            call throw(trim(this%msg), this%ierr)
        end if

        if (status /= SQL_SUCCESS) then
            call throw(trim(this%msg), this%ierr)
        end if
    end subroutine

    subroutine throw_i2(msg, ierr)
        character(*), intent(in)         :: msg
        integer(SQLSMALLINT), intent(in) :: ierr

        write(stderr, '("connection error: ", A, "Error code: ", i0)') msg, ierr
        error stop ierr
    end subroutine

    subroutine throw_i4(msg, ierr)
        character(*), intent(in)        :: msg
        integer(SQLINTEGER), intent(in) :: ierr

        write(stderr, '("connection error: ", A, "Error code: ", i0)') msg, ierr
        error stop ierr
    end subroutine
    
    pure function to_lower(str) result(res)
        character(*), intent(in)    :: str
        character(len(str))         :: res
        !private
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
!! @}
