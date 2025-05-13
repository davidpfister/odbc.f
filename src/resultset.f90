module odbc_resultset
    use, intrinsic :: iso_c_binding
    use, intrinsic :: iso_fortran_env
    use sql
    use odbc_columnset
    use odbc_constants

    implicit none; private
    
    public :: columnset,    &
              new

    type, public :: resultset
        private
        type(SQLHSTMT)                  :: stmt
        integer(SQLUINTEGER)            :: rows
        integer(SQLUSMALLINT)           :: status(10)
        integer(SQLSMALLINT)            :: rec
        character(kind=SQLTCHAR, len=6) :: state
        character(kind=SQLTCHAR, len=SQL_MAX_MESSAGE_LENGTH) :: msg
        integer(SQLINTEGER)             :: ierr
        integer(SQLSMALLINT)            :: imsg
        type(columnset)                 :: columns
    contains
        private
        procedure, pass(this)           :: get_metadata => resultset_get_metadata
        procedure, pass(this), public   :: next         => resultset_movenext
        procedure, pass(this), public   :: previous     => resultset_moveprevious
        procedure, pass(this), public   :: first        => resultset_movefirst
        procedure, pass(this), public   :: last         => resultset_movelast
        procedure, pass(this), public   :: nrows        => resultset_get_nrows
        procedure, pass(this), public   :: ncolumns     => resultset_get_ncolumns
        procedure, pass(this), private  :: resultset_get_integer_from_index
        procedure, pass(this), private  :: resultset_get_real_from_index
        procedure, pass(this), private  :: resultset_get_double_from_index
        procedure, pass(this), private  :: resultset_get_string_from_index
        procedure, pass(this), private  :: resultset_get_integer_from_name
        procedure, pass(this), private  :: resultset_get_real_from_name
        procedure, pass(this), private  :: resultset_get_double_from_name
        procedure, pass(this), private  :: resultset_get_string_from_name
        generic, public                 :: get_integer  => resultset_get_integer_from_index,    &
                                                           resultset_get_integer_from_name
        generic, public                 :: get_real     => resultset_get_real_from_index,       &
                                                           resultset_get_real_from_name
        generic, public                 :: get_double   => resultset_get_double_from_index,     &
                                                           resultset_get_double_from_name
        generic, public                 :: get_string   => resultset_get_string_from_index,     &
                                                           resultset_get_string_from_name
        procedure, pass(this)           :: handle_errors
    end type

    interface new
        module procedure :: resultset_new
    end interface

contains

    subroutine resultset_new(that, stmt)
        type(SQLHSTMT), intent(in) :: stmt
        type(resultset), target :: that
        !private
        integer(SQLRETURN) :: rc

        that%stmt = stmt
        that%rows = 0
        rc = SQLSetStmtAttr(that%stmt, SQL_ATTR_ROW_STATUS_PTR, c_loc(that%status), 0)
        rc = SQLSetStmtAttr(that%stmt, SQL_ATTR_ROWS_FETCHED_PTR, c_loc(that%rows), 0)
        that%rec = 0_sqlsmallint
        call that%get_metadata(that%columns)
    end subroutine

    subroutine resultset_get_metadata(this, columns)
        class(resultset), intent(inout)     :: this
        type(columnset), intent(inout)      :: columns
        !private
        integer :: i
        integer(SQLSMALLINT) :: name_length
        integer(SQLSMALLINT), allocatable :: column_count
        type(column), allocatable, target :: cols(:)
        integer :: nErr, nMsg, iRec, cState

        allocate(column_count, source = 0_sqlsmallint)
        this%ierr = SQLNumResultCols(this%stmt, column_count)
        if (this%ierr == SQL_ERROR .or. this%ierr == SQL_INVALID_HANDLE) then
            call this%handle_errors()
        end if

        allocate(cols(column_count))
        do i = 1, column_count
            allocate(character(51) :: cols(i)%name)
            cols(i)%decim_size = 0
            cols(i)%nullable = 0
            cols(i)%size = 0
            cols(i)%type = 0
            this%ierr = SQLDescribeCol(this%stmt, int(i, c_short), cols(i)%name, len(cols(i)%name, kind=c_short), &
                                 name_length, cols(i)%type, cols(i)%size, &
                                 cols(i)%decim_size, cols(i)%nullable)
            if (this%ierr == SQL_ERROR .or. this%ierr == SQL_INVALID_HANDLE) then
                call this%handle_errors()
            end if
            cols(i)%name = clean_string(cols(i)%name)
            if (allocated(cols(i)%content)) deallocate(cols(i)%content)
            allocate(character(merge(4096, min(4096, cols(i)%size), cols(i)%size <= 0)) :: cols(i)%content)
        end do
        call columns%addrange(cols)
        
        do i = 1, column_count
            this%ierr = this%columns%bind(this%stmt, i)
            if (this%ierr == SQL_ERROR) call this%handle_errors()
        end do
    end subroutine

    logical function resultset_movenext(this) result(res)
        class(resultset), intent(inout)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long) :: offset
        offset = 0_c_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_NEXT, offset)
        if (rc == SQL_NO_DATA) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_moveprevious(this) result(res)
        class(resultset), intent(inout)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long) :: offset
        offset = 0_c_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_PRIOR, offset)
        if (rc == SQL_NO_DATA .or. rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_movefirst(this) result(res)
        class(resultset), intent(inout)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long) :: offset
        offset = 0_c_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_FIRST, offset)
        if (rc == SQL_NO_DATA) res = .false.
        if (rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    logical function resultset_movelast(this) result(res)
        class(resultset), intent(inout)    :: this
        integer(SQLRETURN) :: rc
        !private
        integer(c_long) :: offset
        offset = 0_c_long

        res = .true.
        rc = SQLFetchScroll(this%stmt, SQL_FETCH_LAST, offset)
        if (rc == SQL_NO_DATA .or. rc < SQL_ERROR) res = .false.
        if (rc == SQL_ERROR) call this%handle_errors()
    end function

    function resultset_get_nrows(this) result(res)
        class(resultset), intent(in)        :: this
        integer :: res

        res = this%rows
    end function
    
    function resultset_get_ncolumns(this) result(res)
        class(resultset), intent(in)        :: this
        integer :: res

        res = this%columns%count()
    end function
    
    function resultset_get_integer_from_index(this, col) result(res)
        class(resultset), intent(inout) :: this
        integer, intent(in)             :: col
        integer :: res
        !private
        type(column), pointer :: c => null()
        character(:), allocatable :: str
        
        if (col <= 0 .or. col > this%columns%count()) then
            res = 0
            return 
        end if
        
        c => this%columns%get(col)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0
        end if
        nullify(c)
    end function
    
    function resultset_get_integer_from_name(this, name) result(res)
        class(resultset), intent(inout) :: this
        character(*), intent(in)        :: name
        integer :: res
        !private
        type(column), pointer :: c => null()
        character(:), allocatable :: str
        
        c => this%columns%get(name)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0
        end if
        nullify(c)
    end function
    
    function resultset_get_real_from_index(this, col) result(res)
        class(resultset), intent(inout) :: this
        integer, intent(in)             :: col
        real(real32) :: res
        type(column), pointer :: c => null()
        character(:), allocatable :: str
        
        if (col <= 0 .or. col > this%columns%count()) then
            res = 0_real32
            return 
        end if
        
        c => this%columns%get(col)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0.0_real32
        end if
        nullify(c)
    end function
    
    function resultset_get_real_from_name(this, name) result(res)
        class(resultset), intent(inout) :: this
        character(*), intent(in)        :: name
        real(real32) :: res
        type(column), pointer :: c => null()
        character(:), allocatable :: str
               
        c => this%columns%get(name)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0.0_real32
        end if
        nullify(c)
    end function
    
    function resultset_get_double_from_index(this, col) result(res)
        class(resultset), intent(inout) :: this
        integer, intent(in)             :: col
        real(real64) :: res
        !private
        type(column), pointer :: c => null()
        character(:), allocatable :: str
        
        if (col <= 0 .or. col > this%columns%count()) then
            res = 0.0_real64
            return 
        end if
        
        c => this%columns%get(col)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0.0_real64
        end if
        nullify(c)
    end function
    
    function resultset_get_double_from_name(this, name) result(res)
        class(resultset), intent(inout) :: this
        character(*), intent(in)        :: name
        real(real64) :: res
        !private
        type(column), pointer :: c => null()
        character(:), allocatable :: str
                
        c => this%columns%get(name)
        if (associated(c)) then
            str = clean_string(c%content)
            read(str, *) res
        else
            res = 0.0_real64
        end if
        nullify(c)
    end function
    
    function resultset_get_string_from_index(this, col) result(res)
        class(resultset), intent(inout) :: this
        integer, intent(in)             :: col
        character(:), allocatable :: res
        !private
        type(column), pointer :: c => null()
        
        if (col <= 0 .or. col > this%columns%count()) then
            res = ''
            return 
        end if
        
        c => this%columns%get(col)
        if (associated(c)) then
            res = clean_string(c%content)
        else
            res = ''
        end if
        nullify(c)
    end function
    
    function resultset_get_string_from_name(this, name) result(res)
        class(resultset), intent(inout) :: this
        character(*), intent(in)        :: name
        character(:), allocatable :: res
        !private
        type(column), pointer :: c => null()
        
        c => this%columns%get(name)
        if (associated(c)) then
            res = clean_string(c%content)
        else
            res = ''
        end if
        nullify(c)
    end function

    subroutine handle_errors(this)
        class(resultset), intent(inout), target    :: this
        !private
        integer(SQLRETURN) :: status

        status = SQLGetDiagRec(SQL_HANDLE_STMT, this%stmt, this%rec, &
                               this%state, this%ierr, this%msg, &
                               len(this%msg, kind=SQLSMALLINT), this%imsg)

        print *, this%msg, ' Error code: ', this%ierr
        error stop this%ierr
    end subroutine
    
    pure function clean_string(value) result(str)
        character(*), intent(in)  :: value !< The string to clean
        character(:), allocatable :: str !< Left adjusted and trimmed string
        !private
        integer i
        
        str = value
        do i = 1, len(str)
            if (str(i:i) == c_null_char) exit
        end do
        str = trim(adjustl(str(:i-1)))
    end function

end module
