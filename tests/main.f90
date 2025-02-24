program test 
    use, intrinsic :: iso_c_binding
    use odbc
    
    integer(c_short) :: err, lens
    integer(c_int), target :: native
    type(c_ptr) :: env, dbc, stmt
    character(256, c_char), target :: text
    character(6, c_char), target :: state

    err = SQLAllocHandle(SQL_HANDLE_ENV, c_null_ptr, env)
    if (err /= 0) print *, "Can't allocate environment: "

    err = SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, transfer(SQL_OV_ODBC3, c_null_ptr), 0)
    if (err /= 0) print *, "Can't request version"

    err = SQLAllocHandle(SQL_HANDLE_DBC, env, dbc)
    if (err /= 0) print *, "Can't allocate DBC handle"

    write (text, '(A)'), 'Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};ReadOnly=False;DBQ=test.xlsx'
    err = SQLDriverConnect(dbc, c_null_ptr, text &
         , int(len_trim(text), c_short), STR_NULL_PTR, 0_c_short, SHORT_NULL_PTR, SQL_DRIVER_COMPLETE)
    if (err /= 0) print *, "Can't connect", err
    err = 1
    do while (SQL_SUCCESS == SQLGetDiagRec(SQL_HANDLE_DBC, dbc, err, state, native, text, int(len(text), c_short), lens))
       print *, text(1:lens)
       print *, state
       err = err + 1_c_short
    end do

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