program test 
   use, intrinsic :: iso_c_binding
   use odbc
   
   integer(c_short) :: err, lens
   integer(c_int), target :: native
   integer(c_long) :: pcbValue
   integer :: i 
   type(c_ptr) :: env = c_null_ptr
   type(c_ptr) :: dbc = c_null_ptr
   type(c_ptr) :: stmt = c_null_ptr
   character(256, c_char), target :: text
   character(6, c_char), target :: state
   double precision, allocatable, target :: x(:), y(:)
   double precision :: a

   err = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env)
   if (err /= 0) print *, "Can't allocate environment: "

   err = SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, transfer(SQL_OV_ODBC3, c_null_ptr), 0)
   if (err /= 0) print *, "Can't request version"

   err = SQLAllocHandle(SQL_HANDLE_DBC, env, dbc)
   if (err /= 0) print *, "Can't allocate DBC handle"

   write (text, '("Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};ReadOnly=False;DBQ=", A)') 'test.xlsx'
   err = SQLDriverConnect(dbc, c_null_ptr, text &
      , int(len_trim(text), c_short), STR_NULL_PTR, 0_c_short, SHORT_NULL_PTR, SQL_DRIVER_COMPLETE)
   if (err /= 0) print *, "Can't connect", err
   err = 1
   do while (SQL_SUCCESS == SQLGetDiagRec(SQL_HANDLE_DBC, dbc, err, state, native, text, int(len(text), c_short), lens))
      print *, text(1:lens)
      print *, state
      err = err + 1_c_short
   end do

   err = SQLAllocHandle(SQL_HANDLE_STMT, dbc, stmt);
   if (err /= 0) print *, "Can't allocate statement handle", err

   if (SQL_SUCCESS /= SQLExecDirect(stmt, "create table sin (x numeric,y numeric)" // c_null_char, SQL_NTS)) &
      print *, "Failed to create a table. Perhaps it already exists."

   a = .1
   x = [((i*a), i=1, 100)]
   y = sin(x)
   
   if (SQL_SUCCESS /= SQLPrepare(stmt, &
      "insert into sin values(?,?)" // c_null_char, SQL_NTS)) then
      print *, "Failed to prepare statement", err
      return
   end if
   
   do i = 1, 100
      err = SQLBindParameter(stmt, 1_c_short, SQL_PARAM_INPUT, SQL_REAL, SQL_REAL, &
         0_c_long, 0_c_short, c_loc(x(i)), int(c_sizeof(x(i)), c_long), pcbValue)
      if (err /= 0) print *, "Failed to bind parameter", err

      err = SQLBindParameter(stmt, 2_c_short, SQL_PARAM_INPUT, SQL_REAL, SQL_REAL, &
         0_c_long, 0_c_short, c_loc(y(i)), int(c_sizeof(y(i)), c_long), pcbValue)
      if (err /= 0) print *, "Failed to bind parameter", err

      err = SQLExecute(stmt)
      if (err /= 0) print *, "Failed to execute statement", err
      if (SQL_SUCCESS == SQLGetDiagRec(SQL_HANDLE_STMT, stmt, 1_c_short, state, native, text, len(text, kind=c_short), lens)) &
         print *, text(1:lens)
   end do
   
   if (c_associated(stmt)) then
      err = SQLFreeHandle(SQL_HANDLE_STMT, stmt)
      if (0 /= err) print *, "Failed to free statement handle"
   end if
   if (c_associated(dbc)) then
      err = SQLDisconnect(dbc)
      if (err /= 0) print *, "Failed to disconnect"
      err = SQLFreeHandle(SQL_HANDLE_DBC, dbc)
      if (err /= 0) print *, "Failed to free DB handle"
   end if
   if (c_associated(env)) then
      err = SQLFreeHandle(SQL_HANDLE_ENV, env)
      if (err /= 0) print *, "Failed to free environment handle"
   end if

end program