#define SQL_API
%module sqlext
%typemap(bindc) DWORD "integer(c_int), intent(in), value"
%typemap(bindc) BOOL "integer(c_int), intent(in), value"
%typemap(bindc) SQLSMALLINT "integer(c_short), intent(in), value"
%typemap(bindc) SQLUSMALLINT "integer(c_short), intent(in), value"
%typemap(bindc) RETCODE "integer(c_short), intent(in), value"
%typemap(bindc) SQLRETURN "integer(c_short)"
%typemap(bindc) SQLHANDLE "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHWND "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHENV "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHDBC "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHSTMT "type(c_ptr), intent(in), value"
%typemap(bindc) SQLHDESC "type(c_ptr), intent(in), value"
%typemap(bindc) SQLPOINTER "type(c_ptr), intent(in), value"
%typemap(bindc) SQLLEN "integer(c_long_long), intent(in), value"
%typemap(bindc) SQLULEN "integer(c_long_long), intent(in), value"
%typemap(bindc) SQLSETPOSIROW "integer(c_long_long), intent(in), value"
%typemap(bindc) SQLCHAR "character(kind=c_char, len=*), intent(in)"
%typemap(bindc) SQLINTEGER "integer(c_int), intent(in), value"
%typemap(bindc) DWORD *"integer(c_int), intent(out)"
%typemap(bindc) BOOL *"integer(c_int), intent(out)"
%typemap(bindc) SQLSMALLINT *"integer(c_short), intent(out)"
%typemap(bindc) SQLUSMALLINT *"integer(c_short), intent(out)"
%typemap(bindc) RETCODE *"integer(c_short), intent(out)"
%typemap(bindc) SQLHANDLE *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHWND *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHENV *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHDBC *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHSTMT *"type(c_ptr), intent(out)"
%typemap(bindc) SQLHDESC *"type(c_ptr), intent(out)"
%typemap(bindc) SQLPOINTER *"type(c_ptr), intent(out)"
%typemap(bindc) SQLLEN *"integer(c_long_long), intent(out)"
%typemap(bindc) SQLULEN *"integer(c_long_long), intent(out)"
%typemap(bindc) SQLSETPOSIROW *"integer(c_long_long), intent(out)"
%typemap(bindc) SQLCHAR *"character(kind=c_char)"
%typemap(bindc) SQLINTEGER *"integer(c_int), intent(out)"
%typemap(bindc) LPSTR "character(c_char), dimension(*)"

%fortranbindc SQLBulkOperations;
%fortranbindc SQLDriverConnect;
%fortranbindc SQLBrowseConnect;
%fortranbindc SQLBrowseConnect;
%fortranbindc FireVSDebugEvent;
%fortranbindc ODBCSetTryWaitValue;
%fortranbindc ODBCGetTryWaitValue;
%fortranbindc TraceOpenLogFile;
%fortranbindc TraceCloseLogFile;
%fortranbindc TraceReturn;
%fortranbindc TraceVersion;
%fortranbindc TraceVSControl;
%fortranbindc SQLAllocHandleStd;
%fortranbindc SQLColAttributes;
%fortranbindc SQLColumnPrivileges;
%fortranbindc SQLDescribeParam;
%fortranbindc SQLExtendedFetch;
%fortranbindc SQLForeignKeys;
%fortranbindc SQLMoreResults;
%fortranbindc SQLNativeSql;
%fortranbindc SQLNumParams;
%fortranbindc SQLParamOptions;
%fortranbindc SQLPrimaryKeys;
%fortranbindc SQLProcedureColumns;
%fortranbindc SQLProcedures;
%fortranbindc SQLSetPos;
%fortranbindc SQLTablePrivileges;
%fortranbindc SQLDrivers;
%fortranbindc SQLBindParameter;
%fortranbindc SQLSetScrollOptions;
%{                // This adds the include to the generated wrapper.
#include <sqlext.h>
%}
%rename("$ignore", regexmatch$name="^SQL_") "";  
%rename("$ignore", regexmatch$name="^SQLColumns_") "";  
%rename("$ignore", regexmatch$name="^SQLTables_") "";  
%rename("$ignore", regexmatch$name="^ODBC_") "";  
%rename("$ignore", regexmatch$name="^TRACE_") "";  
%include "../include/sqlext.h"