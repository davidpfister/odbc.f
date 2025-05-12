#include <c_interop.inc>
module odbc
    use, intrinsic :: iso_c_binding
    use sqltypes
    use sql
    use sqlext
    use odbc_constants

    implicit none
    
    private :: extract_error
    
contains
    
    subroutine check_error(code, msg, handle, htype)
        integer(SQLRETURN), intent(in)      :: code
        character(*), intent(in)            :: msg
        type(SQLHANDLE), intent(in)         :: handle
        integer(SQLSMALLINT), intent(in)    :: htype
        
        if (code /= SQL_SUCCESS .and. code /= SQL_SUCCESS_WITH_INFO) then
            call extract_error(msg, handle, htype)
        end if
    end subroutine

    subroutine extract_error(msg, handle, htype)
        character(*), intent(in)        :: msg
        type(SQLHANDLE), intent(in)     :: handle
        integer(c_short), intent(in)    :: htype
        !private
        integer(c_short) :: err, lmsg
        integer(c_int) :: native_error
        character(6, c_char) :: state
        character(256, c_char) :: text
        integer(SQLRETURN) :: ret

        write(*, *) "The driver reported the following error ", trim(msg)
        err = 1
        ret = SQLGetDiagRec(htype, handle, err, state, native_error, &
                                text, len(text, c_short), lmsg)
        do while (ret == SQL_SUCCESS .or. ret == SQL_SUCCESS_WITH_INFO)
            err = err + _SHORT(1)
            write(*, '(A,":",i0,":",i0,":",A)') trim(state), err, native_error, trim(text)
            ret = SQLGetDiagRec(htype, handle, err, state, native_error, &
                                text, len(text, c_short), lmsg)
        end do
    end subroutine  
    
end module