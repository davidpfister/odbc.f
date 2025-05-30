!> @defgroup group_odbc_columnset Columnset
!> @include{doc, raise=1} snippets/columnset.md
!! @{
module odbc_columnset
    use, intrinsic :: iso_c_binding
    use odbc_constants
    use sql, only: SQLBindCol

    implicit none; private

    !> @brief Represents metadata and data for a single column in 
    !! a query result, storing name, type, size, decimal digits, 
    !! nullability, and content for use in a @ref odbc_columnset::columnset.
    type, public :: column
        character(:, c_char), allocatable   :: name
        integer(SQLSMALLINT)                :: type
        integer(SQLULEN)                    :: size
        integer(SQLSMALLINT)                :: decim_size
        integer(SQLSMALLINT)                :: nullable !0: NOT-NULL,1: NULL,2: NOT-KNOWN
        character(:), allocatable           :: content
    end type

    !> @brief Manages a collection of @ref odbc_columnset::column objects in a query 
    !! result set, providing methods to add @ref odbc_columnset::column objects, bind 
    !! them to ODBC statements, and retrieve @ref odbc_columnset::column metadata for 
    !! use with @ref odbc_resultset::resultset.
    type, public :: columnset
        private
        integer                             :: ncols = 0
        type(column), allocatable, public   :: items(:)
    contains
        private
        procedure, pass(this), public   :: add      => columnset_add_column
        procedure, pass(this), public   :: addrange => columnset_addrange_columns
        procedure, pass(this), public   :: bind     => columnset_bind
        procedure, pass(this), public   :: count    => columnset_get_columns_count
        procedure, pass(this), private  :: columnset_get_column_from_id
        procedure, pass(this), private  :: columnset_get_column_from_name
        generic, public                 :: get      =>  columnset_get_column_from_id, &
                                                        columnset_get_column_from_name
        final :: columnset_finalize
    end type

contains
    
    !> @brief Binds a @ref odbc_columnset::column to an ODBC statement handle for data retrieval, 
    !! using SQL_CHAR binding within the @ref odbc_columnset::columnset.
    !! @param[inout] this The @ref odbc_columnset::columnset object.
    !! @param[inout] stmt The ODBC statement handle.
    !! @param[in] col_no The column index (1-based).
    !! @return The ODBC return code (SQL_SUCCESS or error code)
    function columnset_bind(this, stmt, col_no) result(res)
        class(columnset), intent(inout)                 :: this
        type(SQLHSTMT), intent(inout)                   :: stmt
        integer, intent(in)                             :: col_no
        !private
        integer(SQLRETURN) :: res
        
        res = columnset_bind_internal(stmt, int(col_no, SQLUSMALLINT), this%items(col_no)%content)
    contains 
        function columnset_bind_internal(stmt, col_no, buff) result(res)
            type(SQLHSTMT), intent(inout)                   :: stmt
            integer(SQLUSMALLINT), intent(in)               :: col_no
            character(*, SQLCHAR), intent(inout), target    :: buff
            !private
            integer(SQLLEN), allocatable :: sz
            integer(SQLRETURN) :: res
        
            allocate(sz, source = 0) 
            buff = ''
            res = SQLBindCol(stmt, col_no, SQL_CHAR, c_loc(buff), &
                            len(buff, c_long), sz)
        end function
    end function

    !> @brief Gets the number of @ref odbc_columnset::column objects in the @ref odbc_columnset::columnset.
    !! @param[in] this The @ref odbc_columnset::columnset object.
    !! @return The number of columns.
    function columnset_get_columns_count(this) result(res)
        class(columnset), intent(in) :: this
        integer :: res
        res = this%ncols
    end function

    !> @brief Adds a single @ref odbc_columnset::column to the @ref odbc_columnset::columnset.
    !! @param[inout] this The @ref odbc_columnset::columnset object.
    !! @param[in] col The @ref odbc_columnset::column object to add.
    subroutine columnset_add_column(this, col)
        class(columnset), intent(inout) :: this
        type(column), intent(in)        :: col
        !private
        type(column), allocatable :: tmp(:)
        
        if (.not. allocated(this%items)) allocate(this%items(0))
        this%ncols = this%ncols + 1
        allocate(tmp(this%ncols))
        tmp(:this%ncols-1) = this%items
        tmp(this%ncols) = col
        call move_alloc(tmp, this%items)   
    end subroutine
    
    !> @brief Adds an array of @ref odbc_columnset::column objects to the @ref odbc_columnset::columnset.
    !! @param[inout] this The @ref odbc_columnset::columnset object.
    !! @param[in] cols The array of @ref odbc_columnset::column objects to add.
    subroutine columnset_addrange_columns(this, cols)
        class(columnset), intent(inout) :: this
        type(column), intent(in)        :: cols(:)
        !private
        type(column), allocatable :: tmp(:)
        
        if (.not. allocated(this%items)) allocate(this%items(0))
        this%ncols = this%ncols + size(cols)
        allocate(tmp(this%ncols))
        tmp(:this%ncols-size(cols)) = this%items
        tmp(this%ncols-size(cols)+1:) = cols
        call move_alloc(tmp, this%items) 
    end subroutine

    !> @brief Retrieves a @ref odbc_columnset::column by its index (1-based) from the 
    !! @ref odbc_columnset::columnset.
    !! @param[inout] this The @ref odbc_columnset::columnset object.
    !! @param[in] n The column index (1-based).
    !! @return A pointer to the @ref odbc_columnset::column object, or null if invalid.
    function columnset_get_column_from_id(this, n) result(res)
        class(columnset), intent(inout), target :: this
        integer, intent(in)                     :: n
        type(column), pointer :: res

        if (size(this%items) <= 0) then
            res => null()
            return
        end if

        res => this%items(n)
    end function

    !> @brief Retrieves a @ref odbc_columnset::column by its name from the @ref odbc_columnset::columnset.
    !! @param[inout] this The @ref odbc_columnset::columnset object.
    !! @param[in] name The column name.
    !! @return A pointer to the @ref odbc_columnset::column object, or null if not found.
    function columnset_get_column_from_name(this, name) result(res)
        class(columnset), intent(inout), target :: this
        character(*), intent(in)                :: name
        type(column), pointer :: res
        !private
        integer :: i, sz

        sz = size(this%items)
        do i = 1, sz
            res => this%items(i)
            if (trim(res%name) == trim(adjustl(name))) then
                return
            end if
            res => null()
        end do
    end function

    subroutine columnset_finalize(this)
        type(columnset), intent(inout) :: this

        if (allocated(this%items)) deallocate (this%items)
    end subroutine

end module
!> @}