program test 
    use, intrinsic :: iso_c_binding
    use sql
    use odbc_constants
    
    integer(c_short) :: err
    type(c_ptr) :: env, dbc, stmt

    err = SQLAllocHandle(SQL_HANDLE_ENV, c_null_ptr, env)
    if (err /= 0) print *, "Can't allocate environment: "

    err = SQLSetEnvAttr(env, 200, transfer(3, c_null_ptr), 0)
    if (err /= 0) print *, "Can't request version"

    err = SQLAllocHandle(SQL_HANDLE_DBC, env, dbc)
    if (err /= 0) print *, "Can't allocate DBC handle"


    if (c_associated(stmt)) then
        err = SQLFreeHandle(SQL_HANDLE_STMT, stmt)
        if (0 /= err) &
             print *, "Failed to free statement handle"
     end if
     if (c_associated(dbc)) then
        err = SQLDisconnect(dbc)
        if (err /= 0) print *, "Failed to disconnect"
        err = SQLFreeHandle(SQL_HANDLE_ENV, dbc)
        if (err /= 0) print *, "Failed to free DB handle"
     end if
     if (c_associated(env)) then
        err = SQLFreeHandle(SQL_HANDLE_ENV, env)
        if (err /= 0) print *, "Failed to free environment handle"
     end if

end program