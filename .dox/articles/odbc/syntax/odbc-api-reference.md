# ODBC API Reference {#odbc-api-reference}

The articles in this section describe each ODBC function in alphabetical order. Each function is defined as a C programming language function. Descriptions include the following information:

- Purpose
- ODBC version
- Standard CLI conformance level
- Syntax
- Arguments
- Return values
- Diagnostics
- Comments about usage and implementation
- Code example
- References to related functions

The standard CLI conformance level can be one of the following: ISO 92, Open Group, ODBC, or Deprecated. A function tagged as ISO 92-conformant also appears in Open Group version 1, because Open Group is a pure superset of ISO 92. A function tagged as Open Group-compliant also appears in ODBC 3.*x*, because ODBC 3.*x* is a pure superset of Open Group version 1. A function tagged as ODBC-compliant appears in neither standard. A function tagged as deprecated has been deprecated in ODBC 3.*x*.

Handling of diagnostic information is described in the [SQLGetDiagField Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdiagfield-function?view=sql-server-ver16) function description. The text associated with SQLSTATE values is included to provide a description of the condition but isn't intended to prescribe specific text.

@note For driver-specific information about ODBC functions, see the section for the driver.

This section contains articles for the following functions:

- [SQLAllocConnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlallocconnect-function?view=sql-server-ver16)
- [SQLAllocEnv Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlallocenv-function?view=sql-server-ver16)
- [SQLAllocHandle Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlallochandle-function?view=sql-server-ver16)
- [SQLAllocStmt Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlallocstmt-function?view=sql-server-ver16)
- [SQLBindCol Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlbindcol-function?view=sql-server-ver16)
- [SQLBindParameter Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlbindparameter-function?view=sql-server-ver16)
- [SQLBrowseConnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlbrowseconnect-function?view=sql-server-ver16)
- [SQLBulkOperations Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlbulkoperations-function?view=sql-server-ver16)
- [SQLCancel Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcancelhandle-function?view=sql-server-ver16)
- [SQLCancelHandle Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcancelhandle-function?view=sql-server-ver16)
- [SQLCloseCursor Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlclosecursor-function?view=sql-server-ver16)
- [SQLColAttribute Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolattributes-function?view=sql-server-ver16)
- [SQLColAttributes Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolattributes-function?view=sql-server-ver16)
- [SQLColumnPrivileges Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolumnprivileges-function?view=sql-server-ver16)
- [SQLColumns Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolumns-function?view=sql-server-ver16)
- [SQLCompleteAsync Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcompleteasync-function?view=sql-server-ver16)
- [SQLConnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlconnect-function?view=sql-server-ver16)
- [SQLCopyDesc Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcompleteasync-function?view=sql-server-ver16)
- [SQLDataSources Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldatasources-function?view=sql-server-ver16)
- [SQLDescribeCol Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldescribecol-function?view=sql-server-ver16)
- [SQLDescribeParam Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldescribeparam-function?view=sql-server-ver16)
- [SQLDisconnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldisconnect-function?view=sql-server-ver16)
- [SQLDriverConnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldriverconnect-function?view=sql-server-ver16)
- [SQLDrivers Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqldrivers-function?view=sql-server-ver16)
- [SQLEndTran Function](https://learn.microsoft.com/en-us/sql/odbc/reference/appendixes/sqlendtran-cursor-library?view=sql-server-ver16)
- [SQLError Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlendtran-function?view=sql-server-ver16)
- [SQLExecDirect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlexecdirect-function?view=sql-server-ver16)
- [SQLExecute Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlexecute-function?view=sql-server-ver16)
- [SQLExtendedFetch Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlextendedfetch-function?view=sql-server-ver16)
- [SQLFetch Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfetch-function?view=sql-server-ver16)
- [SQLFetchScroll Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfetchscroll-function?view=sql-server-ver16)
- [SQLForeignKeys Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlforeignkeys-function?view=sql-server-ver16)
- [SQLFreeConnect Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfreeconnect-function?view=sql-server-ver16)
- [SQLFreeEnv Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfreeenv-function?view=sql-server-ver16)
- [SQLFreeHandle Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfreehandle-function?view=sql-server-ver16)
- [SQLFreeStmt Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfreestmt-function?view=sql-server-ver16)
- [SQLGetConnectAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetconnectattr-function?view=sql-server-ver16)
- [SQLGetConnectOption Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetconnectoption-function?view=sql-server-ver16)
- [SQLGetCursorName Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetcursorname-function?view=sql-server-ver16)
- [SQLGetData Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdata-function?view=sql-server-ver16)
- [SQLGetDescField Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdescfield-function?view=sql-server-ver16)
- [SQLGetDescRec Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdescrec-function?view=sql-server-ver16)
- [SQLGetDiagField Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdiagfield-function?view=sql-server-ver16)
- [SQLGetDiagRec Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetdiagrec-function?view=sql-server-ver16)
- [SQLGetEnvAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetenvattr-function?view=sql-server-ver16)
- [SQLGetFunctions Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetfunctions-function?view=sql-server-ver16)
- [SQLGetInfo Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetinfo-function?view=sql-server-ver16)
- [SQLGetStmtAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetstmtattr-function?view=sql-server-ver16)
- [SQLGetStmtOption Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgetstmtoption-function?view=sql-server-ver16)
- [SQLGetTypeInfo Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlgettypeinfo-function?view=sql-server-ver16)
- [SQLMoreResults Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlmoreresults-function?view=sql-server-ver16)
- [SQLNativeSql Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlnativesql-function?view=sql-server-ver16)
- [SQLNumParams Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlnumparams-function?view=sql-server-ver16)
- [SQLNumResultCols Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlnumresultcols-function?view=sql-server-ver16)
- [SQLParamData Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlparamdata-function?view=sql-server-ver16)
- [SQLParamOptions Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlparamoptions-function?view=sql-server-ver16)
- [SQLPrepare Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlprepare-function?view=sql-server-ver16)
- [SQLPrimaryKeys Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlprimarykeys-function?view=sql-server-ver16)
- [SQLProcedureColumns Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlprocedurecolumns-function?view=sql-server-ver16)
- [SQLProcedures Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlprocedures-function?view=sql-server-ver16)
- [SQLPutData Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlputdata-function?view=sql-server-ver16)
- [SQLRowCount Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlrowcount-function?view=sql-server-ver16)
- [SQLSetConnectAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetconnectattr-function?view=sql-server-ver16)
- [SQLSetConnectOption Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetconnectoption-function?view=sql-server-ver16)
- [SQLSetCursorName Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetcursorname-function?view=sql-server-ver16)
- [SQLSetDescField Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetdescfield-function?view=sql-server-ver16)
- [SQLSetDescRec Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetdescrec-function?view=sql-server-ver16)
- [SQLSetEnvAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetenvattr-function?view=sql-server-ver16)
- [SQLSetParam Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetparam-function?view=sql-server-ver16)
- [SQLSetPos Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetpos-function?view=sql-server-ver16)
- [SQLSetScrollOptions Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetscrolloptions-function?view=sql-server-ver16)
- [SQLSetStmtAttr Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetstmtattr-function?view=sql-server-ver16)
- [SQLSetStmtOption Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlsetstmtoption-function?view=sql-server-ver16)
- [SQLSpecialColumns Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlspecialcolumns-function?view=sql-server-ver16)
- [SQLStatistics Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlstatistics-function?view=sql-server-ver16)
- [SQLTablePrivileges Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqltableprivileges-function?view=sql-server-ver16)
- [SQLTables Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqltables-function?view=sql-server-ver16)
- [SQLTransact Function](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqltransact-function?view=sql-server-ver16)
