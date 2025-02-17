add #define SIZEOF_LONG_INT 8 in sqltypes.h
and #define SQL_API in other files

 
```cmd
@echo off

set mylist=sqltypes,sql,sqlext

for %%i in (%mylist%) do (
  unifdef -DODBCVER=0x0380 -DSIZEOF_LONG_INT=8 include/unixodbc/%%i.h > include/%%i.h
  swig -fortran -outdir src/ swig/%%i.i
  move /Y swig\%%i_wrap.c src
)
```

for WINDOWS 
```
unifdef -DODBCVER=0x0380 -D_MSC_VER=1920 -DEXPORT -D_WIN64 -UWIN32 -UUNIX -UOS2 include/winodbc/sqltypes.h > include/sqltypes.h
``

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