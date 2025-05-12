#include <assertion.inc>
#include <c_interop.inc>
TESTPROGRAM(main)
    
    TEST(test_alloc_env)
        use odbc
   
        integer(c_short) :: err
        type(c_ptr) :: env = NULL

        EXPECT_EQ(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env), SQL_SUCCESS)
        EXPECT_TRUE(c_associated(env))
        EXPECT_EQ(SQLFreeHandle(SQL_HANDLE_ENV, env), SQL_SUCCESS)
    END_TEST
    
    TEST(test_set_version)
        use odbc
   
        integer(SQLRETURN) :: err
        integer(SQLINTEGER) :: lens = transfer(c_null_ptr, 0_SQLINTEGER)
        type(SQLHENV) :: env = NULL
        integer(SQLINTEGER), target :: ver

        EXPECT_EQ(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env), SQL_SUCCESS)
        
        EXPECT_EQ(SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0), SQL_SUCCESS)
        
        EXPECT_EQ(SQLGetEnvAttr(env, SQL_ATTR_ODBC_VERSION, c_loc(ver), int(sizeof(ver), SQLINTEGER), lens), SQL_SUCCESS)
        EXPECT_EQ(_SHORT(ver), SQL_SPEC_MAJOR)
        
        EXPECT_TRUE(c_associated(env))
        EXPECT_EQ(SQLFreeHandle(SQL_HANDLE_ENV, env), SQL_SUCCESS)
    END_TEST
    
    TEST(test_drivers)
        use odbc
   
        integer(SQLRETURN) :: err
        character(kind=SQLVARCHAR, len=256) :: driver, attr
        type(SQLHENV) :: env = NULL
        integer(SQLSMALLINT) :: direction, driver_ret, attr_ret
        logical :: has_excel, has_access

        EXPECT_EQ(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env), SQL_SUCCESS)
        EXPECT_EQ(SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0), SQL_SUCCESS)
        
        has_excel = .false.; has_access = .false.
        direction = SQL_FETCH_FIRST
        do while (SQL_SUCCESS == SQLDrivers(env, direction, driver, _SHORT(sizeof(driver)), driver_ret, attr, _SHORT(sizeof(attr)), attr_ret))
            direction = SQL_FETCH_NEXT
            !print *, driver(:driver_ret), attr(:attr_ret)
            if (index(driver(:driver_ret), 'Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)') > 0) has_excel = .true.
            if (index(driver(:driver_ret), 'Microsoft Access Driver (*.mdb, *.accdb)') > 0) has_access = .true.
        end do
        
        EXPECT_TRUE(has_excel)
        EXPECT_TRUE(has_access)
        EXPECT_TRUE(c_associated(env))
        EXPECT_EQ(SQLFreeHandle(SQL_HANDLE_ENV, env), SQL_SUCCESS)
    END_TEST
    
    TEST(test_datasources)
        use odbc
   
        integer(SQLRETURN) :: err
        character(kind=SQLVARCHAR, len=256) :: dsn, desc
        type(SQLHENV) :: env = NULL
        integer(SQLSMALLINT) :: direction, dsn_ret, desc_ret
        integer :: count = 0

        EXPECT_EQ(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env), SQL_SUCCESS)
        EXPECT_EQ(SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0), SQL_SUCCESS)

        direction = SQL_FETCH_FIRST
        do while (SQL_SUCCESS == SQLDataSources(env, direction, dsn, _SHORT(sizeof(dsn)), dsn_ret, desc, _SHORT(sizeof(desc)), desc_ret))
            direction = SQL_FETCH_NEXT
            !dsn(:dsn_ret)
            count = count + 1
        end do
        EXPECT_TRUE(count > 0)
        EXPECT_TRUE(c_associated(env))
        EXPECT_EQ(SQLFreeHandle(SQL_HANDLE_ENV, env), SQL_SUCCESS)
    END_TEST
    
    TEST(test_access)
        use odbc
   
        integer(c_short) :: err
        integer(SQLLEN), allocatable :: lens
        integer(c_int) :: native
        integer(c_long) :: pcbValue = SQL_NTS
        integer :: i, ierr, lu 
        type(c_ptr) :: env = NULL
        type(c_ptr) :: dbc = NULL
        type(c_ptr) :: stmt = NULL
        character(256, c_char), target :: text
        integer(SQLUSMALLINT) :: col_no = 1
        character(14), parameter :: tables(12) = ['albums        ', &
                                                  'artists       ', &
                                                  'customers     ', &
                                                  'employees     ', &
                                                  'genres        ', &
                                                  'invoice_items ', &
                                                  'invoices      ', &
                                                  'media_types   ', &
                                                  'playlist_track', &
                                                  'playlist      ', &
                                                  'sqlite_stat1  ', &
                                                  'tracks        ']
#ifndef _FPM
        character(*), parameter :: dir = 'TestData/'
        character(*), parameter :: xfile = dir//'chinook.accdb'
#else
        character(*), parameter :: dir = 'tests/TestData/'
        character(*), parameter :: xfile = dir//'chinook.accdb'
#endif
        ! Allocate environment handle
        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env) == SQL_SUCCESS)    
        ! Set the ODBC version environment attribute
        EXPECT_TRUE(SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0) == SQL_SUCCESS)
        ! Allocate connection handle
        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_DBC, env, dbc) == SQL_SUCCESS)
        ! Set login timeout to 5 seconds
        EXPECT_TRUE(SQLSetConnectAttr(dbc, SQL_LOGIN_TIMEOUT, _PTR(5), 0) == SQL_SUCCESS)
        ! Connect to data source
        write (text, & 
            '("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=", A)') xfile
        err = SQLDriverConnect(dbc, NULL, text, len_trim(text, c_short), & 
            STR_NULL_PTR, _SHORT(0), SHORT_NULL_PTR, SQL_DRIVER_NOPROMPT)
        EXPECT_TRUE(err == SQL_SUCCESS .or. err == SQL_SUCCESS_WITH_INFO)

        ! Allocate statement handle
        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_STMT, dbc, stmt) == SQL_SUCCESS)
        ! Execute query
        err = SQLExecDirect(stmt, _STRING("SELECT MSysObjects.Name FROM MsysObjects WHERE (Left$([Name],1)<>'~') AND (Left$([Name],4) <> 'Msys') AND (MSysObjects.Type)=1 ORDER BY MSysObjects.Name"), SQL_NTS)
        EXPECT_TRUE(err == SQL_SUCCESS)
        call check_error(err, "SQLExecDirect()", stmt, SQL_HANDLE_STMT)

        ! Bind columns
        text = ''; allocate(lens, source = 0)
        err = SQLBindCol(stmt, col_no, SQLCHAR, c_loc(text), len(text, c_long), lens)

        ! Fetch and print results
        err = SQLFetch(stmt)
        i = 1
        do while(err == SQL_SUCCESS .or. err == SQL_SUCCESS_WITH_INFO)
            EXPECT_STREQ(text(:len_trim(tables(i))), tables(i))
            i = i + 1; text = ''
            err = SQLFetch(stmt)
        end do

        ! Free handles
        EXPECT_TRUE(c_associated(stmt))
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_STMT, stmt) == SQL_SUCCESS)

        EXPECT_TRUE(c_associated(dbc))
        EXPECT_TRUE(SQLDisconnect(dbc) == SQL_SUCCESS)
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_DBC, dbc) == SQL_SUCCESS)

        EXPECT_TRUE(c_associated(env))
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_ENV, env) == SQL_SUCCESS)
    END_TEST

    !The following test cases have been inspired by the ones found at 
    !https://github.com/mlt/fodbc
    TEST(test_excel)
        use odbc
   
        integer(c_short) :: err, lens
        integer(c_int) :: native
        integer(c_long) :: pcbValue = SQL_NTS
        integer :: i, ierr, lu 
        type(c_ptr) :: env = NULL
        type(c_ptr) :: dbc = NULL
        type(c_ptr) :: stmt = NULL
        character(256, c_char) :: text
        character(6, c_char) :: state
        real(c_float), allocatable, target :: x(:), y(:)       
#ifndef _FPM
        character(*), parameter :: dir = 'TestData/'
        character(*), parameter :: xfile = dir//'test.xls'
#else
        character(*), parameter :: dir = 'tests/TestData/'
        character(*), parameter :: xfile = dir//'test.xls'
#endif
        
        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, env) == SQL_SUCCESS)
        EXPECT_TRUE(SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, _PTR(SQL_OV_ODBC3), 0) == SQL_SUCCESS)
        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_DBC, env, dbc) == SQL_SUCCESS)

        write (text, & 
            '("DRIVER={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};ReadOnly=False;DBQ=", A)') xfile
        err = SQLDriverConnect(dbc, NULL, text, len_trim(text, c_short), & 
            STR_NULL_PTR, _SHORT(0), SHORT_NULL_PTR, SQL_DRIVER_COMPLETE)
        EXPECT_TRUE(err == SQL_SUCCESS)
        do while (SQL_SUCCESS == SQLGetDiagRec(SQL_HANDLE_DBC, dbc, err, & 
            state, native, text, len(text, c_short), lens))
            print *, text(1:lens)
            print *, state
            err = err + _SHORT(1)
        end do

        EXPECT_TRUE(SQLAllocHandle(SQL_HANDLE_STMT, dbc, stmt) == SQL_SUCCESS)
        EXPECT_TRUE(SQLExecDirect(stmt, _STRING('create table sin (x numeric,y numeric)'), SQL_NTS) == SQL_SUCCESS)

        x = [((i*.1), i=1, 100)]
        y = sin(x)
   
        EXPECT_TRUE(SQLPrepare(stmt, _STRING('insert into sin values(?,?)'), SQL_NTS) == SQL_SUCCESS)
   
        do i = 1, 100
            err = SQLBindParameter(stmt, _SHORT(1), SQL_PARAM_INPUT, SQL_REAL, SQL_REAL, &
                _LONG(0), _SHORT(0), c_loc(x(i)), int(sizeof(x(i)), c_long), pcbValue)
            EXPECT_TRUE(err == 0)

            err = SQLBindParameter(stmt, _SHORT(2), SQL_PARAM_INPUT, SQL_REAL, SQL_REAL, &
                _LONG(0), _SHORT(0), c_loc(y(i)), int(sizeof(y(i)), c_long), pcbValue)
            EXPECT_TRUE(err == 0)

            err = SQLExecute(stmt)
            EXPECT_TRUE(err == 0)
            if (SQL_SUCCESS == SQLGetDiagRec(SQL_HANDLE_STMT, stmt, _SHORT(1), state, native, text, len(text, c_short), lens)) &
                print *, text(1:lens)
        end do
   
        EXPECT_TRUE(c_associated(stmt))
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_STMT, stmt) == SQL_SUCCESS)

        EXPECT_TRUE(c_associated(dbc))
        EXPECT_TRUE(SQLDisconnect(dbc) == SQL_SUCCESS)
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_DBC, dbc) == SQL_SUCCESS)

        EXPECT_TRUE(c_associated(env))
        EXPECT_TRUE(SQLFreeHandle(SQL_HANDLE_ENV, env) == SQL_SUCCESS)
        
        open(newunit=lu, iostat=ierr, file=xfile, status='old')
        if (ierr == 0) close(lu, status='delete')
    END_TEST

    TEST(test_excel_oop)
        use odbc_connection
   
        type(connection) :: conn
        character(256) :: stmt
        integer :: i, ierr, lu
        real, allocatable :: x(:), y(:) 
#ifndef _FPM
        character(*), parameter :: dir = 'TestData/'
        character(*), parameter :: xfile = dir//'test.xls'
#else
        character(*), parameter :: dir = 'tests/TestData/'
        character(*), parameter :: xfile = dir//'test.xls'
#endif
        conn = connection("DRIVER={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};ReadOnly=False;DBQ="// xfile)
        EXPECT_TRUE(conn%open())
        EXPECT_TRUE(conn%execute('create table sin (x numeric, y numeric)') == 0)

        x = [((i*.1), i=1, 100)]
        y = sin(x)
   
        do i = 1, 100
            write(stmt, '("insert into sin values(", es15.8e2,",", es15.8e2,")")') x(i), y(i)
            EXPECT_TRUE(conn%execute(stmt) == 1)
        end do
        call conn%close()
        
        open(newunit=lu, iostat=ierr, file=xfile, status='old')
        if (ierr == 0) close(lu, status='delete')
    END_TEST
    
    TEST(test_access_oop)
        use odbc_connection
   
        type(connection) :: conn
        character(256) :: text
        type(resultset) :: rslt
        type(resultsetmetadata) :: mtdt
        character(50, SQLCHAR) :: strName
        integer :: n
#ifndef _FPM
        character(*), parameter :: dir = 'TestData/'
        character(*), parameter :: xfile = dir//'chinook.accdb'
#else
        character(*), parameter :: dir = 'tests/TestData/'
        character(*), parameter :: xfile = dir//'chinook.accdb'
#endif
        write (text, & 
            '("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=", A)') xfile
        conn = connection(text)
        EXPECT_TRUE(conn%open())
        
        rslt = conn%execute_query('SELECT TOP 3 * FROM albums ORDER BY AlbumId')
        mtdt = rslt%get_metadata()
        EXPECT_EQ(mtdt%count(), 3)
        
        EXPECT_TRUE(rslt%bind(2, strName))
        do while(rslt%movenext())
            print*, strName
            strName = ''
        end do
        call conn%close()
    END_TEST
END_TESTPROGRAM