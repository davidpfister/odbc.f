# Connection string {#connection-string}

An ODBC connection string is a text string used to specify parameters for connecting to a database via ODBC, including details like the driver, server, database name, and credentials. A DSN (Data Source Name) connection string references a preconfigured data source stored in the system’s ODBC Data Source Administrator, which contains settings like the driver and server details, simplifying connections (e.g., `DSN=myDataSource;UID=user;PWD=password`). 

In contrast, a file connection (or DSN-less connection) embeds all connection details directly in the string, bypassing the need for a preconfigured DSN (e.g., `Driver={SQL Server};Server=myServer;Database=myDB;UID=user;PWD=password`). DSN connections are easier to manage for shared or reusable configurations, while file connections offer flexibility and portability since they don’t rely on system-specific DSN entries.

Here are some connection strings that are commonly used. For more examples see [ConnectionStrings](https://www.connectionstrings.com/) 

## Access
```
Driver={Microsoft Access Driver (*.mdb)};Dbq=C:\mydatabase.mdb;Uid=Admin;Pwd=;
```
## Excel
```
Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ=C:\MyExcel.xls;
```
## PostgreSQL
```
Driver={PostgreSQL};Server=IP address;Port=5432;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
```
## MySQL

- local
```
Driver={mySQL};Server=localhost;Option=16834;Database=myDataBase;
```
- remote
```
Driver={mySQL};Server=myServerAddress;Port=3306;Option=131072;Stmt=;Database=myDataBase;User=myUsername;Password=myPassword;
```
## SQLite
```
DRIVER=SQLite3 ODBC Driver;Database=c:\mydb.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;
```
## SQLServer
```
Driver={SQL Server};Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
```
## HDF5
```
DRIVER={HDF5 ODBC Connector BASIC};DBF=/home/user/HDF5_ODBC_Basic/HDF5/tickdata.h5
```
## CSV
```
Driver={Microsoft Access Text Driver (*.txt, *.csv)};Dbq="";Extensions=csv;
```