add #define SIZEOF_LONG_INT 8 in sqltypes.h
and #define SQL_API in other files

 
```cmd
@echo off

set mylist=sqltypes,sql,sqlext

for %%i in (%mylist%) do (
  unifdef -DODBCVER=0x0380 -DSIZEOF_LONG_INT=8 include/origin/%%i.h > include/%%i.h
  swig -fortran -outdir src/ swig/%%i.i
  move /Y swig\%%i_wrap.c src
)
```

for WINDOWS 
```
unifdef -DODBCVER=0x0380 -D_MSC_VER=1920 -DEXPORT -D_WIN64 -UWIN32 -UUNIX -UOS2 include/origin/sqltypes.h > include/sqltypes.h
```

SQL_SUCCEEDED(rc) (((rc)&(~1))==0) => rc = 0; result = ((iand(rc, ior(-1, 1))) == 0)

## Redefine constant

### Change type
%apply short {int SQL_HANDLE_ENV};
%apply short {int SQL_HANDLE_DBC};
%apply short {int SQL_HANDLE_STMT};
%apply short {int SQL_HANDLE_DESC};

### Make is constant parameter
%fortranconst SQL_HANDLE_ENV;
%constant short SQL_HANDLE_ENV = 1;
%fortranconst SQL_HANDLE_DBC;
%constant short SQL_HANDLE_DBC = 2;
%fortranconst SQL_HANDLE_STMT;
%constant short SQL_HANDLE_STMT = 3;
%fortranconst SQL_HANDLE_DESC;
%constant short SQL_HANDLE_DESC = 4;

## Connection string

see [ConnectionString.com](https://www.connectionstrings.com/)

### Access
Driver={Microsoft Access Driver (*.mdb)};Dbq=C:\mydatabase.mdb;Uid=Admin;Pwd=;
### Excel
Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ=C:\MyExcel.xls;
### PostgreSQL
Driver={PostgreSQL};Server=IP address;Port=5432;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
### MySQL
- local
Driver={mySQL};Server=localhost;Option=16834;Database=myDataBase;
- remote
Driver={mySQL};Server=myServerAddress;Port=3306;Option=131072;Stmt=;Database=myDataBase;User=myUsername;Password=myPassword;
### SQLite
DRIVER=SQLite3 ODBC Driver;Database=c:\mydb.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;
### SQLServer
Driver={SQL Server};Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
### HDF5
DRIVER={HDF5 ODBC Connector BASIC};DBF=/home/user/HDF5_ODBC_Basic/HDF5/tickdata.h5
### CSV
Driver={Microsoft Access Text Driver (*.txt, *.csv)};Dbq="";Extensions=csv;

## Using the code
To open a connection to an ODBC data source, you have to create an object of type `connection` and call its `open()` member function:
```fortran
type(connection) :: db
call db%open("MY_ODBC","username","password")
```
For retrieving data from the database, you have to use the `resultset` type:
```fortran
type(resulset) :: rslt
rslt = db%execute_query("SELECT * FROM emp")
```
Information about the `resultset`, like the number of columns in it, can be obtained by calling the `get_metadata()` function, which returns an object of `resultsetmetadata`.
```fortran
type(resultsetmetadata) :: mtdt
integer :: column_count

mtdt = rslt%get_metadata()
column_count = mtdt%count()
print *, "Columns returned", column_count
```
For getting information about a particular column, call the `get_column` member function of `resultsetmetadata`:
```fortran
type(column) :: col
call mtdt%get_column(1, col)
```

Data stored in a `resultset` has to be bound to memory buffers for retrieval. This is done using the `bind()` function of `resultset`:
```fortran
character(kind=c_char, len=1) :: strName(26)
call rslt%bind(1,strName,25) // arguments: column number, buffer, maximum length of buffer
```

The above code binds the first column in the table with the buffer strName. Now, whenever data is returned by the `resultset`, the first column's data will be stored in the variable strName. Data can be pulled out of the `resultset` object by calling either the `movefirst()`, `movenext()`, `moveprevious()` or `movelast()` member functions. For e.g., the following code prints out the value of the first column in the `resultset`:
```fortran
do while(rslt%movenext())
    print*,strName
end do
```

For executing any other SQL statements, you have to call the `execute()` member function of `connection`:
```fortran
integer :: nrows
nrows = db%Execute("DELETE FROM emp")
```
The `exceute()` function will return the number of rows affected by the statement. After database operations are over, you must release the resources occupied by ODBC by calling the `close()` function of the class `connection`.
