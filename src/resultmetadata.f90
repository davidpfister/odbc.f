module odbc_resultmetadata
    use, intrinsic :: iso_c_binding
    use odbc_constants
    
    implicit none; private

    type, public :: column
        character(kind=c_char, len=1)  :: name(51)
        integer                         :: type
        integer                         :: size
        integer                         :: decim_size
        integer                         :: nullable !0: NOT-NULL,1: NULL,2: NOT-KNOWN
    end type

    type, public :: resultsetmetadata
        integer                     :: ncols
        type(column), allocatable   :: columns(:)
    contains
        private
        procedure, pass(this), public   :: set_ncols => resultsetmetadata_set_ncols
        procedure, pass(this), public   :: count => resultsetmetadata_get_columns_count
        procedure, pass(this), public   :: add_column => resultsetmetadata_add_column
        procedure, pass(this), private  :: resultsetmetadata_get_column_from_id
        procedure, pass(this), private  :: resultsetmetadata_get_column_from_name
        generic, public                 :: get_column => resultsetmetadata_get_column_from_id, &
                                                         resultsetmetadata_get_column_from_name
        final :: resultmetadata_finalize
    end type

    interface resultsetmetadata
        module procedure :: resultsetmetadata_new
    end interface

contains

    function resultsetmetadata_new() result(that)
        type(resultsetmetadata) :: that
        that%ncols = 0
    end function

    subroutine resultsetmetadata_set_ncols(this, count)
        class(resultsetmetadata), intent(inout) :: this
        integer, intent(in) :: count
        this%ncols = count
        if (allocated(this%columns)) deallocate(this%columns)
        allocate(this%columns(count))
    end subroutine

    function resultsetmetadata_get_columns_count(this) result(res)
        class(resultsetmetadata), intent(in) :: this
        integer :: res
        res = this%ncols
    end function

    subroutine resultsetmetadata_add_column(this, col)
        class(resultsetmetadata), intent(inout) :: this
        type(column), intent(in) :: col
        this%columns(this%ncols) = col
        this%ncols = this%ncols + 1
    end subroutine

    logical function resultsetmetadata_get_column_from_id(this, n, col) result(res)
        class(resultsetmetadata), intent(inout), target :: this
        integer, intent(in)                             :: n
        type(column), pointer                           :: col

        if (size(this%columns) <= 0) then
            res = .false.
            return
        end if

        col => this%columns(n)
        res = .true.
    end function

    logical function resultsetmetadata_get_column_from_name(this, name, col) result(res)
        class(resultsetmetadata), intent(inout), target :: this
        character(len=*), intent(in)                    :: name
        type(column), pointer                           :: col
        !private
        integer :: sz, i

        sz = size(this%columns)
        do i = 1, sz
            col => this%columns(i)
            if (trim(col%name) == trim(adjustl(name))) then
                res = .true.
                return
            end if
            col => null()
        end do
        res = .false.
    end function

    subroutine resultmetadata_finalize(this)
        type(resultsetmetadata), intent(inout) :: this

        if (allocated(this%columns)) deallocate(this%columns)
    end subroutine

end module