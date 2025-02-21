#define ODBCVER 0x0380
%module sqltypes
%typemap(bindc) WORD "integer(c_short)"
%typemap(bindc) BYTE "integer(c_signed_char)"
%typemap(bindc) DWORD "integer(c_long)"
%typemap(bindc) SQLSMALLINT "integer(c_short)"
%typemap(bindc) SQLUSMALLINT "integer(c_short)"
%typemap(bindc) SQLRETURN "integer(c_short)"
%typemap(bindc) SQLHANDLE "type(c_ptr)"
%typemap(bindc) SQLHENV "type(c_ptr)"
%typemap(bindc) SQLHDBC "type(c_ptr)"
%typemap(bindc) SQLHSTMT "type(c_ptr)"
%typemap(bindc) SQLHDESC "type(c_ptr)"
%typemap(bindc) SQLPOINTER "type(c_ptr)"
%typemap(bindc) SQLLEN "integer(c_long)"
%typemap(bindc) SQLULEN "integer(c_long)"
%typemap(bindc) SQLCHAR "character(kind=c_char)"
%typemap(bindc) SQLINTEGER "integer(c_int)"
%fortran_struct(tagDATE_STRUCT);
%fortran_struct(tagTIME_STRUCT);
%fortran_struct(tagTIMESTAMP_STRUCT);
%fortran_struct(tagTIME_WITH_TIMEZONE_STRUCT);
%fortran_struct(tagTIMESTAMP_WITH_TIMEZONE_STRUCT);
%fortran_struct(tagSQL_YEAR_MONTH);
%fortran_struct(tagSQL_DAY_SECOND);
%fortran_struct(tagSQL_NUMERIC_STRUCT);
%fortran_struct(tagSQLGUID);
%fortranconst SQL_MAX_NUMERIC_LEN;
%{                // This adds the include to the generated wrapper.
#include <sqltypes.h>
%}
%include "../include/sqltypes.h"