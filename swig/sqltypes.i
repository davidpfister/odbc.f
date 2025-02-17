#define SQL_API
%module sqltypes
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
%{                // This adds the include to the generated wrapper.
#include "../include/sqltypes.h"
%}
%include "../include/sqltypes.h"