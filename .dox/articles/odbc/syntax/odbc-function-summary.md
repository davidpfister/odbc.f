# ODBC Function Summary {#odbc-function-reference}
The following table lists ODBC functions, grouped by type of task, and includes the conformance designation and a brief description of the purpose of each function. For more information about the syntax and semantics for each function, see [ODBC API Reference](odbc-api-reference.md).  
  
 An application can call the **SQLGetInfo** function to obtain conformance information about a driver. To obtain information about support for a specific function in a driver, an application can call **SQLGetFunctions**.  

|Task|Function name|Conformance|Purpose|  
|----------|-------------------|-----------------|-------------|  
|Connecting to a data source|[SQLAllocHandle](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlallochandle-function?view=sql-server-ver16)|ISO 92|Obtains an environment, connection, statement, or descriptor handle.|  
||[SQLConnect](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlconnect-function?view=sql-server-ver16)|ISO 92|Connects to a specific driver by data source name, user ID, and password.|  
||[SQLDriverConnect](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldriverconnect-function?view=sql-server-ver16)|ODBC|Connects to a specific driver by connection string or requests that the Driver Manager and driver display connection dialog boxes for the user.|  
||[SQLBrowseConnect](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlbrowseconnect-function?view=sql-server-ver16)|ODBC|Returns successive levels of connection attributes and valid attribute values. When a value has been specified for each connection attribute, connects to the data source.|  
|Obtaining information about a driver and data source|[SQLDataSources](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldatasources-function?view=sql-server-ver16)<br /><br /> [SQLDrivers](sqldrivers-function.md)|ISO 92<br /><br /> ODBC|Returns the list of available data sources.<br /><br /> Returns the list of installed drivers and their attributes.|  
||[SQLGetInfo](sqlgetinfo-function.md)|ISO 92|Returns information about a specific driver and data source.|  
||[SQLGetFunctions](sqlgetfunctions-function.md)|ISO 92|Returns supported driver functions.|  
||[SQLGetTypeInfo](sqlgettypeinfo-function.md)|ISO 92|Returns information about supported data types.|  
|Setting and retrieving driver attributes|[SQLSetConnectAttr](sqlsetconnectattr-function.md)<br /><br /> [SQLGetConnectAttr](sqlgetconnectattr-function.md)|ISO 92<br /><br /> ISO 92|Sets a connection attribute.<br /><br /> Returns the value of a connection attribute.|  
||[SQLSetEnvAttr](sqlsetenvattr-function.md)|ISO 92|Sets an environment attribute.|  
||[SQLGetEnvAttr](sqlgetenvattr-function.md)|ISO 92|Returns the value of an environment attribute.|  
||[SQLSetStmtAttr](sqlsetstmtattr-function.md)|ISO 92|Sets a statement attribute.|  
||[SQLGetStmtAttr](sqlgetstmtattr-function.md)|ISO 92|Returns the value of a statement attribute.|  
|Setting and retrieving descriptor fields|[SQLGetDescField](sqlgetdescfield-function.md)<br /><br /> [SQLGetDescRec](sqlgetdescrec-function.md)|ISO 92<br /><br /> ISO 92|Returns the value of a single descriptor field.<br /><br /> Returns the values of multiple descriptor fields.|  
||[SQLSetDescField](sqlsetdescfield-function.md)|ISO 92|Sets a single descriptor field.|  
||[SQLSetDescRec](sqlsetdescrec-function.md)|ISO 92|Sets multiple descriptor fields.|  
||[SQLCopyDesc](sqlcopydesc-function.md)|ISO 92|Copies descriptor information from one descriptor handle to another.|  
|Preparing SQL requests|[SQLPrepare](sqlprepare-function.md)|ISO 92|Prepares a SQL statement for later execution.|  
||[SQLBindParameter](sqlbindparameter-function.md)|ODBC|Assigns storage for a parameter in a SQL statement.|  
||[SQLGetCursorName](sqlgetcursorname-function.md)|ISO 92|Returns the cursor name associated with a statement handle.|  
||[SQLSetCursorName](sqlsetcursorname-function.md)|ISO 92|Specifies a cursor name.|  
||[SQLSetScrollOptions](sqlsetscrolloptions-function.md)|ODBC|Sets options that control cursor behavior.|  
|Submitting requests|[SQLExecute](sqlexecute-function.md)<br /><br /> [SQLExecDirect](sqlexecdirect-function.md)|ISO 92<br /><br /> ISO 92|Executes a prepared statement.<br /><br /> Executes a statement.|  
||[SQLNativeSql](sqlnativesql-function.md)|ODBC|Returns the text of a SQL statement as translated by the driver.|  
||[SQLDescribeParam](sqldescribeparam-function.md)|ODBC|Returns the description for a specific parameter in a statement.|  
||[SQLNumParams](sqlnumparams-function.md)|ISO 92|Returns the number of parameters in a statement.|  
||[SQLParamData](sqlparamdata-function.md)|ISO 92|Used in conjunction with **SQLPutData** to supply parameter data at execution time. (Useful for long data values.)|  
||[SQLPutData](sqlputdata-function.md)|ISO 92|Sends part or all of a data value for a parameter. (Useful for long data values.)|  
|Retrieving results and information about results|[SQLRowCount](sqlrowcount-function.md)<br /><br /> [SQLNumResultCols](sqlnumresultcols-function.md)|ISO 92<br /><br /> ISO 92|Returns the number of rows affected by an insert, update, or delete request.<br /><br /> Returns the number of columns in the result set.|  
||[SQLDescribeCol](sqldescribecol-function.md)|ISO 92|Describes a column in the result set.|  
||[SQLColAttribute](sqlcolattribute-function.md)|ISO 92|Describes attributes of a column in the result set.|  
||[SQLBindCol](sqlbindcol-function.md)|ISO 92|Assigns storage for a result column and specifies the data type.|  
||[SQLFetch](sqlfetch-function.md)|ISO 92|Returns multiple result rows.|  
||[SQLFetchScroll](sqlfetchscroll-function.md)|ISO 92|Returns scrollable result rows.|  
||[SQLGetData](sqlgetdata-function.md)|ISO 92|Returns part or all of one column of one row of a result set. (Useful for long data values.)|  
||[SQLSetPos](sqlsetpos-function.md)|ODBC|Positions a cursor within a fetched block of data and allows an application to refresh data in the rowset or to update or delete data in the result set.|  
||[SQLBulkOperations](sqlbulkoperations-function.md)|ODBC|Performs bulk insertions and bulk bookmark operations, including update, delete, and fetch by bookmark.|  
||[SQLMoreResults](sqlmoreresults-function.md)|ODBC|Determines whether there are more result sets available and, if so, initializes processing for the next result set.|  
||[SQLGetDiagField](sqlgetdiagfield-function.md)|ISO 92|Returns additional diagnostic information (a single field of the diagnostic data structure).|  
||[SQLGetDiagRec](sqlgetdiagrec-function.md)|ISO 92|Returns additional diagnostic information (multiple fields of the diagnostic data structure).|  
|Obtaining information about the data source's system tables (catalog functions)|[SQLColumnPrivileges](sqlcolumnprivileges-function.md)<br /><br /> [SQLColumns](sqlcolumns-function.md)|ODBC<br /><br /> Open Group|Returns a list of columns and associated privileges for one or more tables.<br /><br /> Returns the list of column names in specified tables.|  
||[SQLForeignKeys](sqlforeignkeys-function.md)|ODBC|Returns a list of column names that make up foreign keys, if they exist for a specified table.|  
||[SQLPrimaryKeys](sqlprimarykeys-function.md)|ODBC|Returns the list of column names that make up the primary key for a table.|  
||[SQLProcedureColumns](sqlprocedurecolumns-function.md)|ODBC|Returns the list of input and output parameters, as well as the columns that make up the result set for the specified procedures.|  
||[SQLProcedures](sqlprocedures-function.md)|ODBC|Returns the list of procedure names stored in a specific data source.|  
||[SQLSpecialColumns](sqlspecialcolumns-function.md)|Open Group|Returns information about the optimal set of columns that uniquely identifies a row in a specified table, or the columns that are automatically updated when any value in the row is updated by a transaction.|  
||[SQLStatistics](sqlstatistics-function.md)|ISO 92|Returns statistics about a single table and the list of indexes associated with the table.|  
||[SQLTablePrivileges](sqltableprivileges-function.md)|ODBC|Returns a list of tables and the privileges associated with each table.|  
||[SQLTables](sqltables-function.md)|Open Group|Returns the list of table names stored in a specific data source.|  
|Terminating a statement|[SQLFreeStmt](sqlfreestmt-function.md)|ISO 92|Ends statement processing, discards pending results, and, optionally, frees all resources associated with the statement handle.|  
||[SQLCloseCursor](sqlclosecursor-function.md)|ISO 92|Closes a cursor that has been opened on a statement handle.|  
||[SQLCancel](sqlcancel-function.md)|ISO 92|Cancels the processing on a statement.|  
||[SQLCancelHandle](sqlcancelhandle-function.md)|ODBC|Cancels the processing on a statement or connection.|  
||[SQLEndTran](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlendtran-function?view=sql-server-ver16)|ISO 92|Commits or rolls back a transaction.|  
|Terminating a connection|[SQLDisconnect](sqldisconnect-function.md)<br /><br /> [SQLFreeHandle](sqlfreehandle-function.md)|ISO 92<br /><br /> ISO 92|Closes the connection.<br /><br /> Releases an environment, connection, statement, or descriptor handle.|
