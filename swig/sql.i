#define SQL_API
%module sql
%typemap(bindc) WORD "integer(c_short)"
%typemap(bindc) BYTE "integer(c_signed_char)"
%typemap(bindc) DWORD "integer(c_long)"
%typemap(bindc) SQLSMALLINT "integer(c_short), intent(in), value"
%typemap(bindc) SQLSMALLINT *"integer(c_short), intent(out)"
%typemap(bindc) SQLUSMALLINT "integer(c_short), intent(in), value"
%typemap(bindc) SQLUSMALLINT *"integer(c_short), intent(out)"
%typemap(bindc) SQLRETURN "integer(c_short)"
%typemap(bindc) SQLHANDLE "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHANDLE *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHENV "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHENV * "type(c_ptr), intent(out)"
%typemap(bindc) SQLHDBC "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHDBC * "type(c_ptr), intent(out)"
%typemap(bindc) SQLHSTMT "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHSTMT *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHDESC "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHDESC *"type(c_ptr), intent(out)"
%typemap(bindc) SQLPOINTER "type(c_ptr), intent(in), value"
%typemap(bindc) SQLPOINTER *"type(c_ptr), intent(out)"
%typemap(bindc) SQLLEN "integer(c_long), intent(in), value"
%typemap(bindc) SQLLEN *"integer(c_long), intent(out)"
%typemap(bindc) SQLULEN "integer(c_long), intent(in), value"
%typemap(bindc) SQLULEN *"integer(c_long), intent(out)"
%typemap(bindc) SQLCHAR "character(kind=c_char, len=*), intent(in)"
%typemap(bindc) SQLCHAR *"character(kind=c_char)"
%typemap(bindc) SQLINTEGER *"integer(c_int), intent(out)"
%typemap(bindc) SQLINTEGER "integer(c_int), intent(in), value"

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
#include <sql.h>
%}
%rename("$ignore", regexmatch$name="^SQL_") "";  
%include "../include/sql.h"