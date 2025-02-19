module odbc_resultset
    use, intrinsic :: iso_c_binding
    use sql
    use odbc_resultsetmetadata
    use odbc_constants

    implicit none; private

    type, public :: resultset
        private
        type(SQLHSTMT)                  :: stmt
        integer(SQLUINTEGER)            :: nrows
        integer(SQLUSMALLINT)           :: status(10)
        integer(SQLSMALLINT)            :: rec
        character(kind=SQLTCHAR, len=1) :: state(6)
        character(kind=SQLTCHAR, len=1) :: msg(SQL_MAX_MESSAGE_LENGTH)
        integer(SQLSMALLINT)            :: ierr
        integer(SQLSMALLINT)            :: imsg
    contains
        private
        procedure, pass(this), public   :: get_metadata => resultset_get_metadata
        procedure, pass(this), public   :: movenext => resultset_movenext
        procedure, pass(this), public   :: moveprevious => resultset_moveprevious
        procedure, pass(this), public   :: movefirst => resultset_movefirst
        procedure, pass(this), public   :: movelast => resultset_movelast
        procedure, pass(this), public   :: bind => resultset_bind
        procedure, pass(this), public   :: get_nrows => resultset_get_nrows
        procedure, pass(this)           :: handle_errors
    end type

    interface resultset
        module procedure :: resultset_new
    end interface

contains

    function resultset_new(stmt) result(that)
        type(SQLHSTMT), intent(in) :: stmt
        type(resultset), target :: that
        !private
        integer(SQLRETURN) :: rc

        that%stmt = stmt
        that%nrows = 0
        rc = SQLSetStmtAttr(that%stmt, SQL_ATTR_ROW_STATUS_PTR, c_loc(that%status), 0)
        rc = SQLSetStmtAttr(that%stmt, SQL_ATTR_ROWS_FETCHED_PTR, c_loc(that%nrows), 0)
        that%rec = 0_sqlsmallint
    end function

    function resultset_get_metadata(this) result(mtdt)
        class(resultset), intent(in) :: this
        type(resultsetmetadata) :: mtdt
        !private
        integer, target :: i, name_length
        integer, target :: column_count
        integer(SQLRETURN) :: ret
        type(column), target :: col
        character(len=256) :: cMsg
        integer :: nErr, nMsg, iRec, cState

        ret = SQLNumResultCols(this%stmt, c_loc(column_count))
        if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE) then
            call this%handle_errors()
        end if

        call mtdt%set_ncols(column_count)
        do i = 1, column_count
            col%name = ""
            col%decim_size = 0
            col%nullable = 0
            col%size = 0
            col%type = 0
            ret = SQLDescribeCol(this%stmt, int(i, c_short), c_loc(col%name), size(col%name, kind=c_short), &
                                 c_loc(name_length), c_loc(col%type), c_loc(col%size), &
                                 c_loc(col%decim_size), c_loc(col%nullable))
            if (ret == SQL_ERROR .or. ret == SQL_INVALID_HANDLE) then
                call this%handle_errors()
            end if
            call mtdt%add_column(col)
        end do
    end function

    logical function resultset_movenext(this) result(res)
        class(resultset), intent(in)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long_long) :: offset
        offset = 0_c_long_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_NEXT, offset)
        if (rc == SQL_NO_DATA) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_moveprevious(this) result(res)
        class(resultset), intent(in)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long_long) :: offset
        offset = 0_c_long_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_PRIOR, offset)
        if (rc == SQL_NO_DATA .or. rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_movefirst(this) result(res)
        class(resultset), intent(in)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long_long) :: offset
        offset = 0_c_long_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_FIRST, offset)
        if (rc == SQL_NO_DATA) res = .false.
        if (rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_movelast(this) result(res)
        class(resultset), intent(in)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long_long) :: offset
        offset = 0_c_long_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_LAST, offset)
        if (rc == SQL_NO_DATA .or. rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_bind(this, col_no, buff, n) result(res)
        class(resultset), intent(in)        :: this
        integer(SQLUSMALLINT), intent(in)   :: col_no
        character(kind=SQLCHAR, len=1), intent(inout), target :: buff(n)
        integer(c_long_long), intent(in)                 :: n
        !private
        integer, target :: sz
        integer(SQLRETURN) :: rc

        rc = SQLBindCol(this%stmt, col_no, SQL_CHAR, c_loc(buff), n, c_loc(sz))
        if (rc == SQL_ERROR) call this%handle_errors()
        res = .true.
    end function

    function resultset_get_nrows(this) result(res)
        class(resultset), intent(in)        :: this
        integer :: res

        res = this%nrows
    end function

    subroutine handle_errors(this)
        class(resultset), intent(in), target    :: this
        !private
        integer(SQLRETURN) :: status

        status = SQLGetDiagRec(SQL_HANDLE_STMT, this%stmt, this%rec, &
                               c_loc(this%state), c_loc(this%ierr), c_loc(this%msg), &
                               int(c_sizeof(this%msg), SQLSMALLINT), c_loc(this%imsg))

        print *, this%msg, ' Error code: ', this%ierr
        error stop this%ierr
    end subroutine

end module
