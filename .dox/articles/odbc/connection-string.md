# Connection string {#connection-string}

see [ConnectionString.com](https://www.connectionstrings.com/)

## Access
Driver={Microsoft Access Driver (*.mdb)};Dbq=C:\mydatabase.mdb;Uid=Admin;Pwd=;
## Excel
Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ=C:\MyExcel.xls;
## PostgreSQL
Driver={PostgreSQL};Server=IP address;Port=5432;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
## MySQL
- local
Driver={mySQL};Server=localhost;Option=16834;Database=myDataBase;
- remote
Driver={mySQL};Server=myServerAddress;Port=3306;Option=131072;Stmt=;Database=myDataBase;User=myUsername;Password=myPassword;
## SQLite
DRIVER=SQLite3 ODBC Driver;Database=c:\mydb.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;
## SQLServer
Driver={SQL Server};Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
## HDF5
DRIVER={HDF5 ODBC Connector BASIC};DBF=/home/user/HDF5_ODBC_Basic/HDF5/tickdata.h5
## CSV
Driver={Microsoft Access Text Driver (*.txt, *.csv)};Dbq="";Extensions=csv;