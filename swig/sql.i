#define SQL_API
%module sql
%typemap(bindc) SQLSMALLINT "integer(c_short)"
%typemap(bindc) SQLUSMALLINT "integer(c_short)"
%typemap(bindc) SQLRETURN "integer(c_short)"
%typemap(bindc) SQLHANDLE "type(c_ptr)"
%typemap(bindc) SQLHENV "type(c_ptr)"
%typemap(bindc) SQLHDBC "type(c_ptr)"
%typemap(bindc) SQLHSTMT "type(c_ptr)"
%typemap(bindc) SQLHDESC "type(c_ptr)"
%typemap(bindc) SQLPOINTER "type(c_ptr)"
%typemap(bindc) SQLLEN "integer(c_long_long)"
%typemap(bindc) SQLULEN "integer(c_long_long)"
%typemap(bindc) SQLCHAR "integer(c_signed_char)"
%typemap(bindc) SQLINTEGER "integer(c_int)"
%apply short {int SQL_HANDLE_ENV};%fortranconst SQL_HANDLE_ENV;
%apply short {int SQL_HANDLE_DBC};%fortranconst SQL_HANDLE_DBC;
%apply short {int SQL_HANDLE_STMT};%fortranconst SQL_HANDLE_STMT;
%apply short {int SQL_HANDLE_DESC};%fortranconst SQL_HANDLE_DESC;
%fortranbindc SQLAllocConnect;
%fortranbindc SQLAllocConnect;
%fortranbindc SQLAllocEnv;
%fortranbindc SQLAllocHandle;
%fortranbindc SQLAllocStmt;
%fortranbindc SQLBindCol;
%fortranbindc SQLBindParam;
%fortranbindc SQLCancel;
%fortranbindc SQLCancelHandle;
%fortranbindc SQLCloseCursor;
%fortranbindc SQLColAttribute;
%fortranbindc SQLColumns;
%fortranbindc SQLConnect;
%fortranbindc SQLCopyDesc;
%fortranbindc SQLDataSources;
%fortranbindc SQLDescribeCol;
%fortranbindc SQLDisconnect;
%fortranbindc SQLEndTran;
%fortranbindc SQLError;
%fortranbindc SQLExecDirect;
%fortranbindc SQLExecute;
%fortranbindc SQLFetch;
%fortranbindc SQLFetchScroll;
%fortranbindc SQLFreeConnect;
%fortranbindc SQLFreeEnv;
%fortranbindc SQLFreeHandle;
%fortranbindc SQLFreeStmt;
%fortranbindc SQLGetConnectAttr;
%fortranbindc SQLGetConnectOption;
%fortranbindc SQLGetCursorName;
%fortranbindc SQLGetData;
%fortranbindc SQLGetDescField;
%fortranbindc SQLGetDescRec;
%fortranbindc SQLGetDiagField;
%fortranbindc SQLGetDiagRec;
%fortranbindc SQLGetEnvAttr;
%fortranbindc SQLGetFunctions;
%fortranbindc SQLGetInfo;
%fortranbindc SQLGetStmtAttr;
%fortranbindc SQLGetStmtOption;
%fortranbindc SQLGetTypeInfo;
%fortranbindc SQLNumResultCols;
%fortranbindc SQLParamData;
%fortranbindc SQLPrepare;
%fortranbindc SQLPutData;
%fortranbindc SQLRowCount;
%fortranbindc SQLSetConnectAttr;
%fortranbindc SQLSetConnectOption;
%fortranbindc SQLSetCursorName;
%fortranbindc SQLSetDescField;
%fortranbindc SQLSetDescRec;
%fortranbindc SQLSetEnvAttr;
%fortranbindc SQLSetParam;
%fortranbindc SQLSetStmtAttr;
%fortranbindc SQLSetStmtOption;
%fortranbindc SQLSpecialColumns;
%fortranbindc SQLStatistics;
%fortranbindc SQLTables;
%fortranbindc SQLTransact;
%{                // This adds the include to the generated wrapper.
#include "../include/sql.h"
%}
%include "../include/sql.h"