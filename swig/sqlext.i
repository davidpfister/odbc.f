#define SQL_API
%module sqlext
%typemap(bindc) DWORD "integer(c_int)"
%typemap(bindc) BOOL "integer(c_int)"
%typemap(bindc) SQLSMALLINT "integer(c_short)"
%typemap(bindc) SQLUSMALLINT "integer(c_short)"
%typemap(bindc) RETCODE "integer(c_short)"
%typemap(bindc) SQLRETURN "integer(c_short)"
%typemap(bindc) SQLHANDLE "type(c_ptr)"
%typemap(bindc) SQLHWND "type(c_ptr)"
%typemap(bindc) SQLHENV "type(c_ptr)"
%typemap(bindc) SQLHDBC "type(c_ptr)"
%typemap(bindc) SQLHSTMT "type(c_ptr)"
%typemap(bindc) SQLHDESC "type(c_ptr)"
%typemap(bindc) SQLPOINTER "type(c_ptr)"
%typemap(bindc) SQLLEN "integer(c_long_long)"
%typemap(bindc) SQLULEN "integer(c_long_long)"
%typemap(bindc) SQLSETPOSIROW "integer(c_long_long)"
%typemap(bindc) SQLCHAR "integer(c_signed_char)"
%typemap(bindc) SQLINTEGER "integer(c_int)"
%typemap(bindc) LPSTR "character(c_char), dimension(*)"
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
#include "../include/sqlext.h"
%}
%include "../include/sqlext.h"