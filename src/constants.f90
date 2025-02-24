module odbc_constants
    use, intrinsic :: iso_c_binding, only: c_short, &
                                                                              c_int, &
                                                                              c_long, &
                                                                              c_char, &
                                                                              SQLCHAR => c_char, &
                                                                              SQLTCHAR => c_char, &
                                                                              SQLNUMERIC => c_char, &
                                                                              SQLPOINTER => c_ptr, &
                                                                              SQLREAL => c_float, &
                                                                              SQLSMALLINT => c_short, &
                                                                              SQLUSMALLINT => c_short, &
                                                                              SQLINTEGER => c_int, &
                                                                              SQLUINTEGER => c_int, &
                                                                              SQLLEN => c_long, &
                                                                              SQLULEN => c_long, &
                                                                              SQLSETPOSIROW => c_long, &
                                                                              SQLTIME => c_char, &
                                                                              SQLTIMESTAMP => c_char, &
                                                                              SQLVARCHAR => c_char, &
                                                                              SQLRETURN => c_short, &
                                                                              SQLHANDLE => c_ptr, &
                                                                              SQLHENV => c_ptr, &
                                                                              SQLHDBC => c_ptr, &
                                                                              SQLHSTMT => c_ptr, &
                                                                              SQLHDESC => c_ptr, &
                                                                              HENV => c_ptr, &
                                                                              HDBC => c_ptr, &
                                                                              HSTMT => c_ptr

    implicit none; private

    public ::   SQLNUMERIC, &
              SQLPOINTER, &
              SQLREAL, &
              SQLSMALLINT, &
              SQLUSMALLINT, &
              SQLINTEGER, &
              SQLUINTEGER, &
              SQLLEN, &
              SQLULEN, &
              SQLSETPOSIROW, &
              SQLTIME, &
              SQLTIMESTAMP, &
              SQLVARCHAR, &
              SQLRETURN, &
              SQLHANDLE, &
              SQLHENV, &
              SQLHDBC, &
              SQLHSTMT, &
              SQLHDESC, &
              HENV, &
              HDBC, &
              HSTMT, &
              SQLCHAR, &
              SQLTCHAR

    public :: trim
    character(kind=c_char), pointer, public :: STR_NULL_PTR => NULL()
    integer(kind=c_short), pointer, public :: SHORT_NULL_PTR => NULL()

    !from sql.h
    integer(C_SHORT), parameter, public :: SQL_NULL_DATA = -1
    integer(C_SHORT), parameter, public :: SQL_DATA_AT_EXEC = -2
    integer(C_SHORT), parameter, public :: SQL_SUCCESS = 0
    integer(C_SHORT), parameter, public :: SQL_SUCCESS_WITH_INFO = 1
    integer(C_SHORT), parameter, public :: SQL_NO_DATA = 100
    integer(C_SHORT), parameter, public :: SQL_ERROR = -1
    integer(C_SHORT), parameter, public :: SQL_INVALID_HANDLE = -2
    integer(C_SHORT), parameter, public :: SQL_STILL_EXECUTING = 2
    integer(C_SHORT), parameter, public :: SQL_NEED_DATA = 99
    integer(C_SHORT), parameter, public :: SQL_PARAM_DATA_AVAILABLE = 101
    integer(C_INT), parameter, public :: SQL_NTS = -3
    integer(C_INT), parameter, public :: SQL_NTSL = -3
    integer(C_SHORT), parameter, public :: SQL_MAX_MESSAGE_LENGTH = 512
    integer(C_SHORT), parameter, public :: SQL_DATE_LEN = 10
    integer(C_SHORT), parameter, public :: SQL_TIME_LEN = 8
    integer(C_SHORT), parameter, public :: SQL_TIMESTAMP_LEN = 19
    integer(C_SHORT), parameter, public :: SQL_HANDLE_ENV = 1
    integer(C_SHORT), parameter, public :: SQL_HANDLE_DBC = 2
    integer(C_SHORT), parameter, public :: SQL_HANDLE_STMT = 3
    integer(C_SHORT), parameter, public :: SQL_HANDLE_DESC = 4
    integer(C_INT), parameter, public :: SQL_ATTR_OUTPUT_NTS = 10001
    integer(C_INT), parameter, public :: SQL_ATTR_AUTO_IPD = 10001
    integer(C_INT), parameter, public :: SQL_ATTR_METADATA_ID = 10014
    integer(C_INT), parameter, public :: SQL_ATTR_APP_ROW_DESC = 10010
    integer(C_INT), parameter, public :: SQL_ATTR_APP_PARAM_DESC = 10011
    integer(C_INT), parameter, public :: SQL_ATTR_IMP_ROW_DESC = 10012
    integer(C_INT), parameter, public :: SQL_ATTR_IMP_PARAM_DESC = 10013
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_SCROLLABLE = -1
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_SENSITIVITY = -2
    integer(C_SHORT), parameter, public :: SQL_NONSCROLLABLE = 0
    integer(C_SHORT), parameter, public :: SQL_SCROLLABLE = 1
    integer(C_SHORT), parameter, public :: SQL_DESC_COUNT = 1001
    integer(C_SHORT), parameter, public :: SQL_DESC_TYPE = 1002
    integer(C_SHORT), parameter, public :: SQL_DESC_LENGTH = 1003
    integer(C_SHORT), parameter, public :: SQL_DESC_OCTET_LENGTH_PTR = 1004
    integer(C_SHORT), parameter, public :: SQL_DESC_PRECISION = 1005
    integer(C_SHORT), parameter, public :: SQL_DESC_SCALE = 1006
    integer(C_SHORT), parameter, public :: SQL_DESC_DATETIME_INTERVAL_CODE = 1007
    integer(C_SHORT), parameter, public :: SQL_DESC_NULLABLE = 1008
    integer(C_SHORT), parameter, public :: SQL_DESC_INDICATOR_PTR = 1009
    integer(C_SHORT), parameter, public :: SQL_DESC_DATA_PTR = 1010
    integer(C_SHORT), parameter, public :: SQL_DESC_NAME = 1011
    integer(C_SHORT), parameter, public :: SQL_DESC_UNNAMED = 1012
    integer(C_SHORT), parameter, public :: SQL_DESC_OCTET_LENGTH = 1013
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_TYPE = 1099
    integer(C_SHORT), parameter, public :: SQL_DIAG_RETURNCODE = 1
    integer(C_SHORT), parameter, public :: SQL_DIAG_NUMBER = 2
    integer(C_SHORT), parameter, public :: SQL_DIAG_ROW_COUNT = 3
    integer(C_SHORT), parameter, public :: SQL_DIAG_SQLSTATE = 4
    integer(C_SHORT), parameter, public :: SQL_DIAG_NATIVE = 5
    integer(C_SHORT), parameter, public :: SQL_DIAG_MESSAGE_TEXT = 6
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_FUNCTION = 7
    integer(C_SHORT), parameter, public :: SQL_DIAG_CLASS_ORIGIN = 8
    integer(C_SHORT), parameter, public :: SQL_DIAG_SUBCLASS_ORIGIN = 9
    integer(C_SHORT), parameter, public :: SQL_DIAG_CONNECTION_NAME = 10
    integer(C_SHORT), parameter, public :: SQL_DIAG_SERVER_NAME = 11
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_FUNCTION_CODE = 12
    integer(C_SHORT), parameter, public :: SQL_DIAG_ALTER_DOMAIN = 3
    integer(C_SHORT), parameter, public :: SQL_DIAG_ALTER_TABLE = 4
    integer(C_SHORT), parameter, public :: SQL_DIAG_CALL = 7
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_ASSERTION = 6
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_CHARACTER_SET = 8
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_COLLATION = 10
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_DOMAIN = 23
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_INDEX = -1
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_SCHEMA = 64
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_TABLE = 77
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_TRANSLATION = 79
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_VIEW = 84
    integer(C_SHORT), parameter, public :: SQL_DIAG_DELETE_WHERE = 19
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_ASSERTION = 24
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_CHARACTER_SET = 25
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_COLLATION = 26
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_DOMAIN = 27
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_INDEX = -2
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_SCHEMA = 31
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_TABLE = 32
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_TRANSLATION = 33
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_VIEW = 36
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_DELETE_CURSOR = 38
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_UPDATE_CURSOR = 81
    integer(C_SHORT), parameter, public :: SQL_DIAG_GRANT = 48
    integer(C_SHORT), parameter, public :: SQL_DIAG_INSERT = 50
    integer(C_SHORT), parameter, public :: SQL_DIAG_REVOKE = 59
    integer(C_SHORT), parameter, public :: SQL_DIAG_SELECT_CURSOR = 85
    integer(C_SHORT), parameter, public :: SQL_DIAG_UNKNOWN_STATEMENT = 0
    integer(C_SHORT), parameter, public :: SQL_DIAG_UPDATE_WHERE = 82
    integer(C_SHORT), parameter, public :: SQL_UNKNOWN_TYPE = 0
    integer(C_SHORT), parameter, public :: SQL_CHAR = 1
    integer(C_SHORT), parameter, public :: SQL_NUMERIC = 2
    integer(C_SHORT), parameter, public :: SQL_DECIMAL = 3
    integer(C_SHORT), parameter, public :: SQL_INTEGER = 4
    integer(C_SHORT), parameter, public :: SQL_SMALLINT = 5
    integer(C_SHORT), parameter, public :: SQL_FLOAT = 6
    integer(C_SHORT), parameter, public :: SQL_REAL = 7
    integer(C_SHORT), parameter, public :: SQL_DOUBLE = 8
    integer(C_SHORT), parameter, public :: SQL_DATETIME = 9
    integer(C_SHORT), parameter, public :: SQL_VARCHAR = 12
    integer(C_SHORT), parameter, public :: SQL_TYPE_DATE = 91
    integer(C_SHORT), parameter, public :: SQL_TYPE_TIME = 92
    integer(C_SHORT), parameter, public :: SQL_TYPE_TIMESTAMP = 93
    integer(C_SHORT), parameter, public :: SQL_UNSPECIFIED = 0
    integer(C_SHORT), parameter, public :: SQL_INSENSITIVE = 1
    integer(C_SHORT), parameter, public :: SQL_SENSITIVE = 2
    integer(C_SHORT), parameter, public :: SQL_ALL_TYPES = 0
    integer(C_SHORT), parameter, public :: SQL_DEFAULT = 99
    integer(C_SHORT), parameter, public :: SQL_ARD_TYPE = -99
    integer(C_SHORT), parameter, public :: SQL_CODE_DATE = 1
    integer(C_SHORT), parameter, public :: SQL_CODE_TIME = 2
    integer(C_SHORT), parameter, public :: SQL_CODE_TIMESTAMP = 3
    integer(C_SHORT), parameter, public :: SQL_FALSE = 0
    integer(C_SHORT), parameter, public :: SQL_TRUE = 1
    integer(C_SHORT), parameter, public :: SQL_NO_NULLS = 0
    integer(C_SHORT), parameter, public :: SQL_NULLABLE = 1
    integer(C_SHORT), parameter, public :: SQL_NULLABLE_UNKNOWN = 2
    integer(C_SHORT), parameter, public :: SQL_PRED_NONE = 0
    integer(C_SHORT), parameter, public :: SQL_PRED_CHAR = 1
    integer(C_SHORT), parameter, public :: SQL_PRED_BASIC = 2
    integer(C_SHORT), parameter, public :: SQL_NAMED = 0
    integer(C_SHORT), parameter, public :: SQL_UNNAMED = 1
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_AUTO = 1
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_USER = 2
    integer(C_SHORT), parameter, public :: SQL_CLOSE = 0
    integer(C_SHORT), parameter, public :: SQL_DROP = 1
    integer(C_SHORT), parameter, public :: SQL_UNBIND = 2
    integer(C_SHORT), parameter, public :: SQL_RESET_PARAMS = 3
    integer(C_SHORT), parameter, public :: SQL_FETCH_NEXT = 1
    integer(C_SHORT), parameter, public :: SQL_FETCH_FIRST = 2
    integer(C_SHORT), parameter, public :: SQL_FETCH_LAST = 3
    integer(C_SHORT), parameter, public :: SQL_FETCH_PRIOR = 4
    integer(C_SHORT), parameter, public :: SQL_FETCH_ABSOLUTE = 5
    integer(C_SHORT), parameter, public :: SQL_FETCH_RELATIVE = 6
    integer(C_SHORT), parameter, public :: SQL_COMMIT = 0
    integer(C_SHORT), parameter, public :: SQL_ROLLBACK = 1
    integer(C_SHORT), parameter, public :: SQL_NULL_HENV = 0
    integer(C_SHORT), parameter, public :: SQL_NULL_HDBC = 0
    integer(C_SHORT), parameter, public :: SQL_NULL_HSTMT = 0
    integer(C_SHORT), parameter, public :: SQL_NULL_HDESC = 0
    integer(C_SHORT), parameter, public :: SQL_NULL_DESC = 0
    integer(C_LONG), parameter, public :: SQL_NULL_HANDLE = 0
    integer(C_SHORT), parameter, public :: SQL_SCOPE_CURROW = 0
    integer(C_SHORT), parameter, public :: SQL_SCOPE_TRANSACTION = 1
    integer(C_SHORT), parameter, public :: SQL_SCOPE_SESSION = 2
    integer(C_SHORT), parameter, public :: SQL_PC_UNKNOWN = 0
    integer(C_SHORT), parameter, public :: SQL_PC_NON_PSEUDO = 1
    integer(C_SHORT), parameter, public :: SQL_PC_PSEUDO = 2
    integer(C_SHORT), parameter, public :: SQL_ROW_IDENTIFIER = 1
    integer(C_SHORT), parameter, public :: SQL_INDEX_UNIQUE = 0
    integer(C_SHORT), parameter, public :: SQL_INDEX_ALL = 1
    integer(C_SHORT), parameter, public :: SQL_INDEX_CLUSTERED = 1
    integer(C_SHORT), parameter, public :: SQL_INDEX_HASHED = 2
    integer(C_SHORT), parameter, public :: SQL_INDEX_OTHER = 3
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCCONNECT = 1
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCENV = 2
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCHANDLE = 1001
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCSTMT = 3
    integer(C_SHORT), parameter, public :: SQL_API_SQLBINDCOL = 4
    integer(C_SHORT), parameter, public :: SQL_API_SQLBINDPARAM = 1002
    integer(C_SHORT), parameter, public :: SQL_API_SQLCANCEL = 5
    integer(C_SHORT), parameter, public :: SQL_API_SQLCLOSECURSOR = 1003
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLATTRIBUTE = 6
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLUMNS = 40
    integer(C_SHORT), parameter, public :: SQL_API_SQLCONNECT = 7
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOPYDESC = 1004
    integer(C_SHORT), parameter, public :: SQL_API_SQLDATASOURCES = 57
    integer(C_SHORT), parameter, public :: SQL_API_SQLDESCRIBECOL = 8
    integer(C_SHORT), parameter, public :: SQL_API_SQLDISCONNECT = 9
    integer(C_SHORT), parameter, public :: SQL_API_SQLENDTRAN = 1005
    integer(C_SHORT), parameter, public :: SQL_API_SQLERROR = 10
    integer(C_SHORT), parameter, public :: SQL_API_SQLEXECDIRECT = 11
    integer(C_SHORT), parameter, public :: SQL_API_SQLEXECUTE = 12
    integer(C_SHORT), parameter, public :: SQL_API_SQLFETCH = 13
    integer(C_SHORT), parameter, public :: SQL_API_SQLFETCHSCROLL = 1021
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREECONNECT = 14
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREEENV = 15
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREEHANDLE = 1006
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREESTMT = 16
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCONNECTATTR = 1007
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCONNECTOPTION = 42
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCURSORNAME = 17
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDATA = 43
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDESCFIELD = 1008
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDESCREC = 1009
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDIAGFIELD = 1010
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDIAGREC = 1011
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETENVATTR = 1012
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETFUNCTIONS = 44
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETINFO = 45
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETSTMTATTR = 1014
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETSTMTOPTION = 46
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETTYPEINFO = 47
    integer(C_SHORT), parameter, public :: SQL_API_SQLNUMRESULTCOLS = 18
    integer(C_SHORT), parameter, public :: SQL_API_SQLPARAMDATA = 48
    integer(C_SHORT), parameter, public :: SQL_API_SQLPREPARE = 19
    integer(C_SHORT), parameter, public :: SQL_API_SQLPUTDATA = 49
    integer(C_SHORT), parameter, public :: SQL_API_SQLROWCOUNT = 20
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCONNECTATTR = 1016
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCONNECTOPTION = 50
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCURSORNAME = 21
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETDESCFIELD = 1017
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETDESCREC = 1018
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETENVATTR = 1019
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETPARAM = 22
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETSTMTATTR = 1020
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETSTMTOPTION = 51
    integer(C_SHORT), parameter, public :: SQL_API_SQLSPECIALCOLUMNS = 52
    integer(C_SHORT), parameter, public :: SQL_API_SQLSTATISTICS = 53
    integer(C_SHORT), parameter, public :: SQL_API_SQLTABLES = 54
    integer(C_SHORT), parameter, public :: SQL_API_SQLTRANSACT = 23
    integer(C_SHORT), parameter, public :: SQL_API_SQLCANCELHANDLE = 1022
    integer(C_SHORT), parameter, public :: SQL_MAX_DRIVER_CONNECTIONS = 0
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_DRIVER_CONNECTIONS = 0
    integer(C_SHORT), parameter, public :: SQL_MAX_CONCURRENT_ACTIVITIES = 1
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CONCURRENT_ACTIVITIES = 1
    integer(C_SHORT), parameter, public :: SQL_DATA_SOURCE_NAME = 2
    integer(C_SHORT), parameter, public :: SQL_FETCH_DIRECTION = 8
    integer(C_SHORT), parameter, public :: SQL_SERVER_NAME = 13
    integer(C_SHORT), parameter, public :: SQL_SEARCH_PATTERN_ESCAPE = 14
    integer(C_SHORT), parameter, public :: SQL_DBMS_NAME = 17
    integer(C_SHORT), parameter, public :: SQL_DBMS_VER = 18
    integer(C_SHORT), parameter, public :: SQL_ACCESSIBLE_TABLES = 19
    integer(C_SHORT), parameter, public :: SQL_ACCESSIBLE_PROCEDURES = 20
    integer(C_SHORT), parameter, public :: SQL_CURSOR_COMMIT_BEHAVIOR = 23
    integer(C_SHORT), parameter, public :: SQL_DATA_SOURCE_READ_ONLY = 25
    integer(C_SHORT), parameter, public :: SQL_DEFAULT_TXN_ISOLATION = 26
    integer(C_SHORT), parameter, public :: SQL_IDENTIFIER_CASE = 28
    integer(C_SHORT), parameter, public :: SQL_IDENTIFIER_QUOTE_CHAR = 29
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMN_NAME_LEN = 30
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMN_NAME_LENGTH = 30
    integer(C_SHORT), parameter, public :: SQL_MAX_CURSOR_NAME_LEN = 31
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CURSOR_NAME_LENGTH = 31
    integer(C_SHORT), parameter, public :: SQL_MAX_SCHEMA_NAME_LEN = 32
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_SCHEMA_NAME_LENGTH = 32
    integer(C_SHORT), parameter, public :: SQL_MAX_CATALOG_NAME_LEN = 34
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CATALOG_NAME_LENGTH = 34
    integer(C_SHORT), parameter, public :: SQL_MAX_TABLE_NAME_LEN = 35
    integer(C_SHORT), parameter, public :: SQL_SCROLL_CONCURRENCY = 43
    integer(C_SHORT), parameter, public :: SQL_TXN_CAPABLE = 46
    integer(C_SHORT), parameter, public :: SQL_TRANSACTION_CAPABLE = 46
    integer(C_SHORT), parameter, public :: SQL_USER_NAME = 47
    integer(C_SHORT), parameter, public :: SQL_TXN_ISOLATION_OPTION = 72
    integer(C_SHORT), parameter, public :: SQL_TRANSACTION_ISOLATION_OPTION = 72
    integer(C_SHORT), parameter, public :: SQL_INTEGRITY = 73
    integer(C_SHORT), parameter, public :: SQL_GETDATA_EXTENSIONS = 81
    integer(C_SHORT), parameter, public :: SQL_NULL_COLLATION = 85
    integer(C_SHORT), parameter, public :: SQL_ALTER_TABLE = 86
    integer(C_SHORT), parameter, public :: SQL_ORDER_BY_COLUMNS_IN_SELECT = 90
    integer(C_SHORT), parameter, public :: SQL_SPECIAL_CHARACTERS = 94
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_GROUP_BY = 97
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_GROUP_BY = 97
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_INDEX = 98
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_INDEX = 98
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_ORDER_BY = 99
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_ORDER_BY = 99
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_SELECT = 100
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_SELECT = 100
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_TABLE = 101
    integer(C_SHORT), parameter, public :: SQL_MAX_INDEX_SIZE = 102
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_INDEX_SIZE = 102
    integer(C_SHORT), parameter, public :: SQL_MAX_ROW_SIZE = 104
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_ROW_SIZE = 104
    integer(C_SHORT), parameter, public :: SQL_MAX_STATEMENT_LEN = 105
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_STATEMENT_LENGTH = 105
    integer(C_SHORT), parameter, public :: SQL_MAX_TABLES_IN_SELECT = 106
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_TABLES_IN_SELECT = 106
    integer(C_SHORT), parameter, public :: SQL_MAX_USER_NAME_LEN = 107
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_USER_NAME_LENGTH = 107
    integer(C_SHORT), parameter, public :: SQL_OJ_CAPABILITIES = 115
    integer(C_SHORT), parameter, public :: SQL_OUTER_JOIN_CAPABILITIES = 115
    integer(C_SHORT), parameter, public :: SQL_XOPEN_CLI_YEAR = 10000
    integer(C_SHORT), parameter, public :: SQL_CURSOR_SENSITIVITY = 10001
    integer(C_SHORT), parameter, public :: SQL_DESCRIBE_PARAMETER = 10002
    integer(C_SHORT), parameter, public :: SQL_CATALOG_NAME = 10003
    integer(C_SHORT), parameter, public :: SQL_COLLATION_SEQ = 10004
    integer(C_SHORT), parameter, public :: SQL_MAX_IDENTIFIER_LEN = 10005
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_IDENTIFIER_LENGTH = 10005
    integer(C_LONG), parameter, public :: SQL_AT_ADD_COLUMN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_COLUMN = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_ADD_CONSTRAINT = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CB_DELETE = 0
    integer(C_SHORT), parameter, public :: SQL_CB_CLOSE = 1
    integer(C_SHORT), parameter, public :: SQL_CB_PRESERVE = 2
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_NEXT = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_FIRST = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_LAST = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_PRIOR = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_ABSOLUTE = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_RELATIVE = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_ANY_COLUMN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_ANY_ORDER = int(z'00000002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_IC_UPPER = 1
    integer(C_SHORT), parameter, public :: SQL_IC_LOWER = 2
    integer(C_SHORT), parameter, public :: SQL_IC_SENSITIVE = 3
    integer(C_SHORT), parameter, public :: SQL_IC_MIXED = 4
    integer(C_LONG), parameter, public :: SQL_OJ_LEFT = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_RIGHT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_FULL = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_NESTED = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_NOT_ORDERED = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_INNER = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OJ_ALL_COMPARISON_OPS = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCCO_READ_ONLY = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCCO_LOCK = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCCO_OPT_ROWVER = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCCO_OPT_VALUES = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_TC_NONE = 0
    integer(C_SHORT), parameter, public :: SQL_TC_DML = 1
    integer(C_SHORT), parameter, public :: SQL_TC_ALL = 2
    integer(C_SHORT), parameter, public :: SQL_TC_DDL_COMMIT = 3
    integer(C_SHORT), parameter, public :: SQL_TC_DDL_IGNORE = 4
    integer(C_LONG), parameter, public :: SQL_TXN_READ_UNCOMMITTED = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_READ_UNCOMMITTED = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_READ_COMMITTED = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_READ_COMMITTED = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_REPEATABLE_READ = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_REPEATABLE_READ = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_SERIALIZABLE = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_SERIALIZABLE = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NC_HIGH = 0
    integer(C_SHORT), parameter, public :: SQL_NC_LOW = 1

    !from sqlext.h
    integer(C_SHORT), parameter, public :: SQLTables_TABLE_CATALOG = 1
    integer(C_SHORT), parameter, public :: SQLTables_TABLE_SCHEM = 2
    integer(C_SHORT), parameter, public :: SQLTables_TABLE_NAME = 3
    integer(C_SHORT), parameter, public :: SQLTables_TABLE_TYPE = 4
    integer(C_SHORT), parameter, public :: SQLTables_REMARKS = 5
    integer(C_SHORT), parameter, public :: SQLColumns_TABLE_CAT = 1
    integer(C_SHORT), parameter, public :: SQLColumns_TABLE_SCHEM = 2
    integer(C_SHORT), parameter, public :: SQLColumns_TABLE_NAME = 3
    integer(C_SHORT), parameter, public :: SQLColumns_COLUMN_NAME = 4
    integer(C_SHORT), parameter, public :: SQLColumns_DATA_TYPE = 5
    integer(C_SHORT), parameter, public :: SQLColumns_TYPE_NAME = 6
    integer(C_SHORT), parameter, public :: SQLColumns_COLUMN_SIZE = 7
    integer(C_SHORT), parameter, public :: SQLColumns_BUFFER_LENGTH = 8
    integer(C_SHORT), parameter, public :: SQLColumns_DECIMAL_DIGITS = 9
    integer(C_SHORT), parameter, public :: SQLColumns_NUM_PREC_RADIX = 10
    integer(C_SHORT), parameter, public :: SQLColumns_NULLABLE = 11
    integer(C_SHORT), parameter, public :: SQLColumns_REMARKS = 12
    integer(C_SHORT), parameter, public :: SQLColumns_COLUMN_DEF = 13
    integer(C_SHORT), parameter, public :: SQLColumns_SQL_DATA_TYPE = 14
    integer(C_SHORT), parameter, public :: SQLColumns_SQL_DATETIME_SUB = 15
    integer(C_SHORT), parameter, public :: SQLColumns_CHAR_OCTET_LENGTH = 16
    integer(C_SHORT), parameter, public :: SQLColumns_ORDINAL_POSITION = 17
    integer(C_SHORT), parameter, public :: SQLColumns_IS_NULLABLE = 18
    integer(C_SHORT), parameter, public :: SQL_SPEC_MAJOR = 3
    integer(C_SHORT), parameter, public :: SQL_SPEC_MINOR = 52
    character(kind=C_CHAR, len=*), parameter, public :: SQL_SPEC_STRING = "03.52"
    integer(C_SHORT), parameter, public :: SQL_SQLSTATE_SIZE = 5
    integer(C_SHORT), parameter, public :: SQL_MAX_DSN_LENGTH = 32
    integer(C_SHORT), parameter, public :: SQL_MAX_OPTION_STRING_LENGTH = 256
    integer(C_SHORT), parameter, public :: SQL_HANDLE_SENV = 5
    integer(C_INT), parameter, public :: SQL_ATTR_ODBC_VERSION = 200
    integer(C_INT), parameter, public :: SQL_ATTR_CONNECTION_POOLING = 201
    integer(C_INT), parameter, public :: SQL_ATTR_CP_MATCH = 202
    integer(C_INT), parameter, public :: SQL_ATTR_UNIXODBC_SYSPATH = 65001
    integer(C_INT), parameter, public :: SQL_ATTR_UNIXODBC_VERSION = 65002
    integer(C_INT), parameter, public :: SQL_ATTR_UNIXODBC_ENVATTR = 65003
    integer(C_LONG), parameter, public :: SQL_CP_OFF = 0
    integer(C_LONG), parameter, public :: SQL_CP_ONE_PER_DRIVER = 1
    integer(C_LONG), parameter, public :: SQL_CP_ONE_PER_HENV = 2
    integer(C_LONG), parameter, public :: SQL_CP_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_CP_STRICT_MATCH = 0
    integer(C_LONG), parameter, public :: SQL_CP_RELAXED_MATCH = 1
    integer(C_LONG), parameter, public :: SQL_CP_MATCH_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_OV_ODBC2 = 2
    integer(C_LONG), parameter, public :: SQL_OV_ODBC3 = 3
    integer(C_LONG), parameter, public :: SQL_OV_ODBC3_80 = 380
    integer(C_SHORT), parameter, public :: SQL_ACCESS_MODE = 101
    integer(C_SHORT), parameter, public :: SQL_AUTOCOMMIT = 102
    integer(C_SHORT), parameter, public :: SQL_LOGIN_TIMEOUT = 103
    integer(C_SHORT), parameter, public :: SQL_OPT_TRACE = 104
    integer(C_SHORT), parameter, public :: SQL_OPT_TRACEFILE = 105
    integer(C_SHORT), parameter, public :: SQL_TRANSLATE_DLL = 106
    integer(C_SHORT), parameter, public :: SQL_TRANSLATE_OPTION = 107
    integer(C_SHORT), parameter, public :: SQL_TXN_ISOLATION = 108
    integer(C_SHORT), parameter, public :: SQL_CURRENT_QUALIFIER = 109
    integer(C_SHORT), parameter, public :: SQL_ODBC_CURSORS = 110
    integer(C_SHORT), parameter, public :: SQL_QUIET_MODE = 111
    integer(C_SHORT), parameter, public :: SQL_PACKET_SIZE = 112
    integer(C_INT), parameter, public :: SQL_ATTR_ACCESS_MODE = 101
    integer(C_INT), parameter, public :: SQL_ATTR_AUTOCOMMIT = 102
    integer(C_INT), parameter, public :: SQL_ATTR_CONNECTION_TIMEOUT = 113
    integer(C_INT), parameter, public :: SQL_ATTR_CURRENT_CATALOG = 109
    integer(C_INT), parameter, public :: SQL_ATTR_DISCONNECT_BEHAVIOR = 114
    integer(C_INT), parameter, public :: SQL_ATTR_ENLIST_IN_DTC = 1207
    integer(C_INT), parameter, public :: SQL_ATTR_ENLIST_IN_XA = 1208
    integer(C_INT), parameter, public :: SQL_ATTR_LOGIN_TIMEOUT = 103
    integer(C_INT), parameter, public :: SQL_ATTR_ODBC_CURSORS = 110
    integer(C_INT), parameter, public :: SQL_ATTR_PACKET_SIZE = 112
    integer(C_INT), parameter, public :: SQL_ATTR_QUIET_MODE = 111
    integer(C_INT), parameter, public :: SQL_ATTR_TRACE = 104
    integer(C_INT), parameter, public :: SQL_ATTR_TRACEFILE = 105
    integer(C_INT), parameter, public :: SQL_ATTR_TRANSLATE_LIB = 106
    integer(C_INT), parameter, public :: SQL_ATTR_TRANSLATE_OPTION = 107
    integer(C_INT), parameter, public :: SQL_ATTR_TXN_ISOLATION = 108
    integer(C_INT), parameter, public :: SQL_ATTR_CONNECTION_DEAD = 1209
    integer(C_INT), parameter, public :: SQL_ATTR_DRIVER_THREADING = 1028
    integer(C_INT), parameter, public :: SQL_ATTR_ANSI_APP = 115
    integer(C_INT), parameter, public :: SQL_ATTR_RESET_CONNECTION = 116
    integer(C_INT), parameter, public :: SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE = 117
    integer(C_LONG), parameter, public :: SQL_MODE_READ_WRITE = 0
    integer(C_LONG), parameter, public :: SQL_MODE_READ_ONLY = 1
    integer(C_LONG), parameter, public :: SQL_MODE_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_AUTOCOMMIT_OFF = 0
    integer(C_LONG), parameter, public :: SQL_AUTOCOMMIT_ON = 1
    integer(C_LONG), parameter, public :: SQL_AUTOCOMMIT_DEFAULT = 1
    integer(C_LONG), parameter, public :: SQL_LOGIN_TIMEOUT_DEFAULT = 15
    integer(C_LONG), parameter, public :: SQL_OPT_TRACE_OFF = 0
    integer(C_LONG), parameter, public :: SQL_OPT_TRACE_ON = 1
    integer(C_LONG), parameter, public :: SQL_OPT_TRACE_DEFAULT = 0
    character(kind=C_CHAR, len=*), parameter, public :: SQL_OPT_TRACE_FILE_DEFAULT = "/tmp/SQL.LOG"
    integer(C_LONG), parameter, public :: SQL_CUR_USE_IF_NEEDED = 0
    integer(C_LONG), parameter, public :: SQL_CUR_USE_ODBC = 1
    integer(C_LONG), parameter, public :: SQL_CUR_USE_DRIVER = 2
    integer(C_LONG), parameter, public :: SQL_CUR_DEFAULT = 2
    integer(C_LONG), parameter, public :: SQL_DB_RETURN_TO_POOL = 0
    integer(C_LONG), parameter, public :: SQL_DB_DISCONNECT = 1
    integer(C_LONG), parameter, public :: SQL_DB_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_DTC_DONE = 0
    integer(C_LONG), parameter, public :: SQL_CD_TRUE = 1
    integer(C_LONG), parameter, public :: SQL_CD_FALSE = 0
    integer(C_LONG), parameter, public :: SQL_AA_TRUE = 1
    integer(C_LONG), parameter, public :: SQL_AA_FALSE = 0
    integer(C_LONG), parameter, public :: SQL_RESET_CONNECTION_YES = 1
    integer(C_LONG), parameter, public :: SQL_ASYNC_DBC_ENABLE_ON = 1
    integer(C_LONG), parameter, public :: SQL_ASYNC_DBC_ENABLE_OFF = 0
    integer(C_LONG), parameter, public :: SQL_ASYNC_DBC_ENABLE_DEFAULT = 0
    integer(C_SHORT), parameter, public :: SQL_QUERY_TIMEOUT = 0
    integer(C_SHORT), parameter, public :: SQL_MAX_ROWS = 1
    integer(C_SHORT), parameter, public :: SQL_NOSCAN = 2
    integer(C_SHORT), parameter, public :: SQL_MAX_LENGTH = 3
    integer(C_SHORT), parameter, public :: SQL_ASYNC_ENABLE = 4
    integer(C_SHORT), parameter, public :: SQL_BIND_TYPE = 5
    integer(C_SHORT), parameter, public :: SQL_CURSOR_TYPE = 6
    integer(C_SHORT), parameter, public :: SQL_CONCURRENCY = 7
    integer(C_SHORT), parameter, public :: SQL_KEYSET_SIZE = 8
    integer(C_SHORT), parameter, public :: SQL_ROWSET_SIZE = 9
    integer(C_SHORT), parameter, public :: SQL_SIMULATE_CURSOR = 10
    integer(C_SHORT), parameter, public :: SQL_RETRIEVE_DATA = 11
    integer(C_SHORT), parameter, public :: SQL_USE_BOOKMARKS = 12
    integer(C_SHORT), parameter, public :: SQL_GET_BOOKMARK = 13
    integer(C_SHORT), parameter, public :: SQL_ROW_NUMBER = 14
    integer(C_INT), parameter, public :: SQL_ATTR_ASYNC_ENABLE = 4
    integer(C_INT), parameter, public :: SQL_ATTR_CONCURRENCY = 7
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_TYPE = 6
    integer(C_INT), parameter, public :: SQL_ATTR_ENABLE_AUTO_IPD = 15
    integer(C_INT), parameter, public :: SQL_ATTR_FETCH_BOOKMARK_PTR = 16
    integer(C_INT), parameter, public :: SQL_ATTR_KEYSET_SIZE = 8
    integer(C_INT), parameter, public :: SQL_ATTR_MAX_LENGTH = 3
    integer(C_INT), parameter, public :: SQL_ATTR_MAX_ROWS = 1
    integer(C_INT), parameter, public :: SQL_ATTR_NOSCAN = 2
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_BIND_OFFSET_PTR = 17
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_BIND_TYPE = 18
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_OPERATION_PTR = 19
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_STATUS_PTR = 20
    integer(C_INT), parameter, public :: SQL_ATTR_PARAMS_PROCESSED_PTR = 21
    integer(C_INT), parameter, public :: SQL_ATTR_PARAMSET_SIZE = 22
    integer(C_INT), parameter, public :: SQL_ATTR_QUERY_TIMEOUT = 0
    integer(C_INT), parameter, public :: SQL_ATTR_RETRIEVE_DATA = 11
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_BIND_OFFSET_PTR = 23
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_BIND_TYPE = 5
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_NUMBER = 14
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_OPERATION_PTR = 24
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_STATUS_PTR = 25
    integer(C_INT), parameter, public :: SQL_ATTR_ROWS_FETCHED_PTR = 26
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_ARRAY_SIZE = 27
    integer(C_INT), parameter, public :: SQL_ATTR_SIMULATE_CURSOR = 10
    integer(C_INT), parameter, public :: SQL_ATTR_USE_BOOKMARKS = 12
    integer(C_INT), parameter, public :: SQL_ATTR_ASYNC_STMT_EVENT = 29
    integer(C_INT), parameter, public :: SQL_IS_POINTER = -4
    integer(C_INT), parameter, public :: SQL_IS_UINTEGER = -5
    integer(C_INT), parameter, public :: SQL_IS_INTEGER = -6
    integer(C_INT), parameter, public :: SQL_IS_USMALLINT = -7
    integer(C_INT), parameter, public :: SQL_IS_SMALLINT = -8
    integer(C_LONG), parameter, public :: SQL_PARAM_BIND_BY_COLUMN = 0
    integer(C_LONG), parameter, public :: SQL_PARAM_BIND_TYPE_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_QUERY_TIMEOUT_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_MAX_ROWS_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_NOSCAN_OFF = 0
    integer(C_LONG), parameter, public :: SQL_NOSCAN_ON = 1
    integer(C_LONG), parameter, public :: SQL_NOSCAN_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_MAX_LENGTH_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_ASYNC_ENABLE_OFF = 0
    integer(C_LONG), parameter, public :: SQL_ASYNC_ENABLE_ON = 1
    integer(C_LONG), parameter, public :: SQL_ASYNC_ENABLE_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_BIND_BY_COLUMN = 0
    integer(C_LONG), parameter, public :: SQL_BIND_TYPE_DEFAULT = 0
    integer(C_SHORT), parameter, public :: SQL_CONCUR_READ_ONLY = 1
    integer(C_SHORT), parameter, public :: SQL_CONCUR_LOCK = 2
    integer(C_SHORT), parameter, public :: SQL_CONCUR_ROWVER = 3
    integer(C_SHORT), parameter, public :: SQL_CONCUR_VALUES = 4
    integer(C_SHORT), parameter, public :: SQL_CONCUR_DEFAULT = 1
    integer(C_LONG), parameter, public :: SQL_CURSOR_FORWARD_ONLY = 0
    integer(C_LONG), parameter, public :: SQL_CURSOR_KEYSET_DRIVEN = 1
    integer(C_LONG), parameter, public :: SQL_CURSOR_DYNAMIC = 2
    integer(C_LONG), parameter, public :: SQL_CURSOR_STATIC = 3
    integer(C_LONG), parameter, public :: SQL_CURSOR_TYPE_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_ROWSET_SIZE_DEFAULT = 1
    integer(C_LONG), parameter, public :: SQL_KEYSET_SIZE_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_SC_NON_UNIQUE = 0
    integer(C_LONG), parameter, public :: SQL_SC_TRY_UNIQUE = 1
    integer(C_LONG), parameter, public :: SQL_SC_UNIQUE = 2
    integer(C_LONG), parameter, public :: SQL_RD_OFF = 0
    integer(C_LONG), parameter, public :: SQL_RD_ON = 1
    integer(C_LONG), parameter, public :: SQL_RD_DEFAULT = 1
    integer(C_LONG), parameter, public :: SQL_UB_OFF = 0
    integer(C_LONG), parameter, public :: SQL_UB_ON = 01
    integer(C_LONG), parameter, public :: SQL_UB_DEFAULT = 0
    integer(C_LONG), parameter, public :: SQL_UB_FIXED = 01
    integer(C_LONG), parameter, public :: SQL_UB_VARIABLE = 2
    integer(C_SHORT), parameter, public :: SQL_DESC_ARRAY_SIZE = 20
    integer(C_SHORT), parameter, public :: SQL_DESC_ARRAY_STATUS_PTR = 21
    integer(C_SHORT), parameter, public :: SQL_DESC_BASE_COLUMN_NAME = 22
    integer(C_SHORT), parameter, public :: SQL_DESC_BASE_TABLE_NAME = 23
    integer(C_SHORT), parameter, public :: SQL_DESC_BIND_OFFSET_PTR = 24
    integer(C_SHORT), parameter, public :: SQL_DESC_BIND_TYPE = 25
    integer(C_SHORT), parameter, public :: SQL_DESC_DATETIME_INTERVAL_PRECISION = 26
    integer(C_SHORT), parameter, public :: SQL_DESC_LITERAL_PREFIX = 27
    integer(C_SHORT), parameter, public :: SQL_DESC_LITERAL_SUFFIX = 28
    integer(C_SHORT), parameter, public :: SQL_DESC_LOCAL_TYPE_NAME = 29
    integer(C_SHORT), parameter, public :: SQL_DESC_MAXIMUM_SCALE = 30
    integer(C_SHORT), parameter, public :: SQL_DESC_MINIMUM_SCALE = 31
    integer(C_SHORT), parameter, public :: SQL_DESC_NUM_PREC_RADIX = 32
    integer(C_SHORT), parameter, public :: SQL_DESC_PARAMETER_TYPE = 33
    integer(C_SHORT), parameter, public :: SQL_DESC_ROWS_PROCESSED_PTR = 34
    integer(C_SHORT), parameter, public :: SQL_DESC_ROWVER = 35
    integer(C_SHORT), parameter, public :: SQL_DIAG_CURSOR_ROW_COUNT = -1249
    integer(C_SHORT), parameter, public :: SQL_DIAG_ROW_NUMBER = -1248
    integer(C_SHORT), parameter, public :: SQL_DIAG_COLUMN_NUMBER = -1247
    integer(C_SHORT), parameter, public :: SQL_DATE = 9
    integer(C_SHORT), parameter, public :: SQL_INTERVAL = 10
    integer(C_SHORT), parameter, public :: SQL_TIME = 10
    integer(C_SHORT), parameter, public :: SQL_TIMESTAMP = 11
    integer(C_SHORT), parameter, public :: SQL_LONGVARCHAR = -1
    integer(C_SHORT), parameter, public :: SQL_BINARY = -2
    integer(C_SHORT), parameter, public :: SQL_VARBINARY = -3
    integer(C_SHORT), parameter, public :: SQL_LONGVARBINARY = -4
    integer(C_SHORT), parameter, public :: SQL_BIGINT = -5
    integer(C_SHORT), parameter, public :: SQL_TINYINT = -6
    integer(C_SHORT), parameter, public :: SQL_BIT = -7
    integer(C_SHORT), parameter, public :: SQL_GUID = -11
    integer(C_SHORT), parameter, public :: SQL_CODE_YEAR = 1
    integer(C_SHORT), parameter, public :: SQL_CODE_MONTH = 2
    integer(C_SHORT), parameter, public :: SQL_CODE_DAY = 3
    integer(C_SHORT), parameter, public :: SQL_CODE_HOUR = 4
    integer(C_SHORT), parameter, public :: SQL_CODE_MINUTE = 5
    integer(C_SHORT), parameter, public :: SQL_CODE_SECOND = 6
    integer(C_SHORT), parameter, public :: SQL_CODE_YEAR_TO_MONTH = 7
    integer(C_SHORT), parameter, public :: SQL_CODE_DAY_TO_HOUR = 8
    integer(C_SHORT), parameter, public :: SQL_CODE_DAY_TO_MINUTE = 9
    integer(C_SHORT), parameter, public :: SQL_CODE_DAY_TO_SECOND = 10
    integer(C_SHORT), parameter, public :: SQL_CODE_HOUR_TO_MINUTE = 11
    integer(C_SHORT), parameter, public :: SQL_CODE_HOUR_TO_SECOND = 12
    integer(C_SHORT), parameter, public :: SQL_CODE_MINUTE_TO_SECOND = 13
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_YEAR = 100+1
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_MONTH = 100+2
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_DAY = 100+3
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_HOUR = 100+4
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_MINUTE = 100+5
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_SECOND = 100+6
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_YEAR_TO_MONTH = 100+7
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_DAY_TO_HOUR = 100+8
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_DAY_TO_MINUTE = 100+9
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_DAY_TO_SECOND = 100+10
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_HOUR_TO_MINUTE = 100+11
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_HOUR_TO_SECOND = 100+12
    integer(C_SHORT), parameter, public :: SQL_INTERVAL_MINUTE_TO_SECOND = 100+13
    integer(C_SHORT), parameter, public :: SQL_C_DEFAULT = 99
    integer(C_SHORT), parameter, public :: SQL_SIGNED_OFFSET = -20
    integer(C_SHORT), parameter, public :: SQL_UNSIGNED_OFFSET = -22
    integer(C_SHORT), parameter, public :: SQL_C_DATE = 9
    integer(C_SHORT), parameter, public :: SQL_C_TIME = 10
    integer(C_SHORT), parameter, public :: SQL_C_TIMESTAMP = 11
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_YEAR = 100+1
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_MONTH = 100+2
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_DAY = 100+3
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_HOUR = 100+4
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_MINUTE = 100+5
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_SECOND = 100+6
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_YEAR_TO_MONTH = 100+7
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_DAY_TO_HOUR = 100+8
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_DAY_TO_MINUTE = 100+9
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_DAY_TO_SECOND = 100+10
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_HOUR_TO_MINUTE = 100+11
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_HOUR_TO_SECOND = 100+12
    integer(C_SHORT), parameter, public :: SQL_C_INTERVAL_MINUTE_TO_SECOND = 100+13
    integer(C_SHORT), parameter, public :: SQL_C_BINARY = -2
    integer(C_SHORT), parameter, public :: SQL_C_BIT = -7
    integer(C_SHORT), parameter, public :: SQL_C_SBIGINT = -5 - 20
    integer(C_SHORT), parameter, public :: SQL_C_UBIGINT = -5 - 22
    integer(C_SHORT), parameter, public :: SQL_C_TINYINT = -6
    integer(C_SHORT), parameter, public :: SQL_C_STINYINT = -6 - 20
    integer(C_SHORT), parameter, public :: SQL_C_UTINYINT = -6 - 22
    integer(C_SHORT), parameter, public :: SQL_C_GUID = -11
    integer(C_SHORT), parameter, public :: SQL_TYPE_NULL = 0
    integer(C_SHORT), parameter, public :: SQL_DRIVER_C_TYPE_BASE = int(z'4000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_SQL_TYPE_BASE = int(z'4000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_DESC_FIELD_BASE = int(z'4000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_DIAG_FIELD_BASE = int(z'4000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_INFO_TYPE_BASE = int(z'4000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_CONN_ATTR_BASE = int(z'00004000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_DRIVER_STMT_ATTR_BASE = int(z'00004000',C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_C_VARBOOKMARK = -2
    integer(C_SHORT), parameter, public :: SQL_NO_ROW_NUMBER = -1
    integer(C_SHORT), parameter, public :: SQL_NO_COLUMN_NUMBER = -1
    integer(C_SHORT), parameter, public :: SQL_ROW_NUMBER_UNKNOWN = -2
    integer(C_SHORT), parameter, public :: SQL_COLUMN_NUMBER_UNKNOWN = -2
    integer(C_SHORT), parameter, public :: SQL_DEFAULT_PARAM = -5
    integer(C_SHORT), parameter, public :: SQL_IGNORE = -6
    integer(C_SHORT), parameter, public :: SQL_COLUMN_IGNORE = -6
    integer(C_SHORT), parameter, public :: SQL_LEN_DATA_AT_EXEC_OFFSET = -100
    integer(C_SHORT), parameter, public :: SQL_LEN_BINARY_ATTR_OFFSET = -100
    integer(C_LONG), parameter, public :: SQL_SETPARAM_VALUE_MAX = -1
    integer(C_SHORT), parameter, public :: SQL_COLUMN_COUNT = 0
    integer(C_SHORT), parameter, public :: SQL_COLUMN_NAME = 1
    integer(C_SHORT), parameter, public :: SQL_COLUMN_TYPE = 2
    integer(C_SHORT), parameter, public :: SQL_COLUMN_LENGTH = 3
    integer(C_SHORT), parameter, public :: SQL_COLUMN_PRECISION = 4
    integer(C_SHORT), parameter, public :: SQL_COLUMN_SCALE = 5
    integer(C_SHORT), parameter, public :: SQL_COLUMN_DISPLAY_SIZE = 6
    integer(C_SHORT), parameter, public :: SQL_COLUMN_NULLABLE = 7
    integer(C_SHORT), parameter, public :: SQL_COLUMN_UNSIGNED = 8
    integer(C_SHORT), parameter, public :: SQL_COLUMN_MONEY = 9
    integer(C_SHORT), parameter, public :: SQL_COLUMN_UPDATABLE = 10
    integer(C_SHORT), parameter, public :: SQL_COLUMN_AUTO_INCREMENT = 11
    integer(C_SHORT), parameter, public :: SQL_COLUMN_CASE_SENSITIVE = 12
    integer(C_SHORT), parameter, public :: SQL_COLUMN_SEARCHABLE = 13
    integer(C_SHORT), parameter, public :: SQL_COLUMN_TYPE_NAME = 14
    integer(C_SHORT), parameter, public :: SQL_COLUMN_TABLE_NAME = 15
    integer(C_SHORT), parameter, public :: SQL_COLUMN_OWNER_NAME = 16
    integer(C_SHORT), parameter, public :: SQL_COLUMN_QUALIFIER_NAME = 17
    integer(C_SHORT), parameter, public :: SQL_COLUMN_LABEL = 18
    integer(C_SHORT), parameter, public :: SQL_COLATT_OPT_MAX = 18
    integer(C_SHORT), parameter, public :: SQL_COLATT_OPT_MIN = 0
    integer(C_INT), parameter, public :: SQL_ATTR_READONLY = 0
    integer(C_INT), parameter, public :: SQL_ATTR_WRITE = 1
    integer(C_INT), parameter, public :: SQL_ATTR_READWRITE_UNKNOWN = 2
    integer(C_SHORT), parameter, public :: SQL_UNSEARCHABLE = 0
    integer(C_SHORT), parameter, public :: SQL_LIKE_ONLY = 1
    integer(C_SHORT), parameter, public :: SQL_ALL_EXCEPT_LIKE = 2
    integer(C_SHORT), parameter, public :: SQL_SEARCHABLE = 3
    integer(C_SHORT), parameter, public :: SQL_PRED_SEARCHABLE = 3
    integer(C_SHORT), parameter, public :: SQL_NO_TOTAL = -4
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCHANDLESTD = 73
    integer(C_SHORT), parameter, public :: SQL_API_SQLBULKOPERATIONS = 24
    integer(C_SHORT), parameter, public :: SQL_API_SQLBINDPARAMETER = 72
    integer(C_SHORT), parameter, public :: SQL_API_SQLBROWSECONNECT = 55
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLATTRIBUTES = 6
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLUMNPRIVILEGES = 56
    integer(C_SHORT), parameter, public :: SQL_API_SQLDESCRIBEPARAM = 58
    integer(C_SHORT), parameter, public :: SQL_API_SQLDRIVERCONNECT = 41
    integer(C_SHORT), parameter, public :: SQL_API_SQLDRIVERS = 71
    integer(C_SHORT), parameter, public :: SQL_API_SQLEXTENDEDFETCH = 59
    integer(C_SHORT), parameter, public :: SQL_API_SQLFOREIGNKEYS = 60
    integer(C_SHORT), parameter, public :: SQL_API_SQLMORERESULTS = 61
    integer(C_SHORT), parameter, public :: SQL_API_SQLNATIVESQL = 62
    integer(C_SHORT), parameter, public :: SQL_API_SQLNUMPARAMS = 63
    integer(C_SHORT), parameter, public :: SQL_API_SQLPARAMOPTIONS = 64
    integer(C_SHORT), parameter, public :: SQL_API_SQLPRIMARYKEYS = 65
    integer(C_SHORT), parameter, public :: SQL_API_SQLPROCEDURECOLUMNS = 66
    integer(C_SHORT), parameter, public :: SQL_API_SQLPROCEDURES = 67
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETPOS = 68
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETSCROLLOPTIONS = 69
    integer(C_SHORT), parameter, public :: SQL_API_SQLTABLEPRIVILEGES = 70
    integer(C_SHORT), parameter, public :: SQL_API_ALL_FUNCTIONS = 0
    integer(C_SHORT), parameter, public :: SQL_API_LOADBYORDINAL = 199
    integer(C_SHORT), parameter, public :: SQL_API_ODBC3_ALL_FUNCTIONS = 999
    integer(C_SHORT), parameter, public :: SQL_API_ODBC3_ALL_FUNCTIONS_SIZE = 250
    integer(C_SHORT), parameter, public :: SQL_INFO_FIRST = 0
    integer(C_SHORT), parameter, public :: SQL_ACTIVE_CONNECTIONS = 0
    integer(C_SHORT), parameter, public :: SQL_ACTIVE_STATEMENTS = 1
    integer(C_SHORT), parameter, public :: SQL_DRIVER_HDBC = 3
    integer(C_SHORT), parameter, public :: SQL_DRIVER_HENV = 4
    integer(C_SHORT), parameter, public :: SQL_DRIVER_HSTMT = 5
    integer(C_SHORT), parameter, public :: SQL_DRIVER_NAME = 6
    integer(C_SHORT), parameter, public :: SQL_DRIVER_VER = 7
    integer(C_SHORT), parameter, public :: SQL_ODBC_API_CONFORMANCE = 9
    integer(C_SHORT), parameter, public :: SQL_ODBC_VER = 10
    integer(C_SHORT), parameter, public :: SQL_ROW_UPDATES = 11
    integer(C_SHORT), parameter, public :: SQL_ODBC_SAG_CLI_CONFORMANCE = 12
    integer(C_SHORT), parameter, public :: SQL_ODBC_SQL_CONFORMANCE = 15
    integer(C_SHORT), parameter, public :: SQL_PROCEDURES = 21
    integer(C_SHORT), parameter, public :: SQL_CONCAT_NULL_BEHAVIOR = 22
    integer(C_SHORT), parameter, public :: SQL_CURSOR_ROLLBACK_BEHAVIOR = 24
    integer(C_SHORT), parameter, public :: SQL_EXPRESSIONS_IN_ORDERBY = 27
    integer(C_SHORT), parameter, public :: SQL_MAX_OWNER_NAME_LEN = 32
    integer(C_SHORT), parameter, public :: SQL_MAX_PROCEDURE_NAME_LEN = 33
    integer(C_SHORT), parameter, public :: SQL_MAX_QUALIFIER_NAME_LEN = 34
    integer(C_SHORT), parameter, public :: SQL_MULT_RESULT_SETS = 36
    integer(C_SHORT), parameter, public :: SQL_MULTIPLE_ACTIVE_TXN = 37
    integer(C_SHORT), parameter, public :: SQL_OUTER_JOINS = 38
    integer(C_SHORT), parameter, public :: SQL_OWNER_TERM = 39
    integer(C_SHORT), parameter, public :: SQL_PROCEDURE_TERM = 40
    integer(C_SHORT), parameter, public :: SQL_QUALIFIER_NAME_SEPARATOR = 41
    integer(C_SHORT), parameter, public :: SQL_QUALIFIER_TERM = 42
    integer(C_SHORT), parameter, public :: SQL_SCROLL_OPTIONS = 44
    integer(C_SHORT), parameter, public :: SQL_TABLE_TERM = 45
    integer(C_SHORT), parameter, public :: SQL_CONVERT_FUNCTIONS = 48
    integer(C_SHORT), parameter, public :: SQL_NUMERIC_FUNCTIONS = 49
    integer(C_SHORT), parameter, public :: SQL_STRING_FUNCTIONS = 50
    integer(C_SHORT), parameter, public :: SQL_SYSTEM_FUNCTIONS = 51
    integer(C_SHORT), parameter, public :: SQL_TIMEDATE_FUNCTIONS = 52
    integer(C_SHORT), parameter, public :: SQL_CONVERT_BIGINT = 53
    integer(C_SHORT), parameter, public :: SQL_CONVERT_BINARY = 54
    integer(C_SHORT), parameter, public :: SQL_CONVERT_BIT = 55
    integer(C_SHORT), parameter, public :: SQL_CONVERT_CHAR = 56
    integer(C_SHORT), parameter, public :: SQL_CONVERT_DATE = 57
    integer(C_SHORT), parameter, public :: SQL_CONVERT_DECIMAL = 58
    integer(C_SHORT), parameter, public :: SQL_CONVERT_DOUBLE = 59
    integer(C_SHORT), parameter, public :: SQL_CONVERT_FLOAT = 60
    integer(C_SHORT), parameter, public :: SQL_CONVERT_INTEGER = 61
    integer(C_SHORT), parameter, public :: SQL_CONVERT_LONGVARCHAR = 62
    integer(C_SHORT), parameter, public :: SQL_CONVERT_NUMERIC = 63
    integer(C_SHORT), parameter, public :: SQL_CONVERT_REAL = 64
    integer(C_SHORT), parameter, public :: SQL_CONVERT_SMALLINT = 65
    integer(C_SHORT), parameter, public :: SQL_CONVERT_TIME = 66
    integer(C_SHORT), parameter, public :: SQL_CONVERT_TIMESTAMP = 67
    integer(C_SHORT), parameter, public :: SQL_CONVERT_TINYINT = 68
    integer(C_SHORT), parameter, public :: SQL_CONVERT_VARBINARY = 69
    integer(C_SHORT), parameter, public :: SQL_CONVERT_VARCHAR = 70
    integer(C_SHORT), parameter, public :: SQL_CONVERT_LONGVARBINARY = 71
    integer(C_SHORT), parameter, public :: SQL_CONVERT_GUID = 173
    integer(C_SHORT), parameter, public :: SQL_ODBC_SQL_OPT_IEF = 73
    integer(C_SHORT), parameter, public :: SQL_CORRELATION_NAME = 74
    integer(C_SHORT), parameter, public :: SQL_NON_NULLABLE_COLUMNS = 75
    integer(C_SHORT), parameter, public :: SQL_DRIVER_HLIB = 76
    integer(C_SHORT), parameter, public :: SQL_DRIVER_ODBC_VER = 77
    integer(C_SHORT), parameter, public :: SQL_LOCK_TYPES = 78
    integer(C_SHORT), parameter, public :: SQL_POS_OPERATIONS = 79
    integer(C_SHORT), parameter, public :: SQL_POSITIONED_STATEMENTS = 80
    integer(C_SHORT), parameter, public :: SQL_BOOKMARK_PERSISTENCE = 82
    integer(C_SHORT), parameter, public :: SQL_STATIC_SENSITIVITY = 83
    integer(C_SHORT), parameter, public :: SQL_FILE_USAGE = 84
    integer(C_SHORT), parameter, public :: SQL_COLUMN_ALIAS = 87
    integer(C_SHORT), parameter, public :: SQL_GROUP_BY = 88
    integer(C_SHORT), parameter, public :: SQL_KEYWORDS = 89
    integer(C_SHORT), parameter, public :: SQL_OWNER_USAGE = 91
    integer(C_SHORT), parameter, public :: SQL_QUALIFIER_USAGE = 92
    integer(C_SHORT), parameter, public :: SQL_QUOTED_IDENTIFIER_CASE = 93
    integer(C_SHORT), parameter, public :: SQL_SUBQUERIES = 95
    integer(C_SHORT), parameter, public :: SQL_UNION = 96
    integer(C_SHORT), parameter, public :: SQL_MAX_ROW_SIZE_INCLUDES_LONG = 103
    integer(C_SHORT), parameter, public :: SQL_MAX_CHAR_LITERAL_LEN = 108
    integer(C_SHORT), parameter, public :: SQL_TIMEDATE_ADD_INTERVALS = 109
    integer(C_SHORT), parameter, public :: SQL_TIMEDATE_DIFF_INTERVALS = 110
    integer(C_SHORT), parameter, public :: SQL_NEED_LONG_DATA_LEN = 111
    integer(C_SHORT), parameter, public :: SQL_MAX_BINARY_LITERAL_LEN = 112
    integer(C_SHORT), parameter, public :: SQL_LIKE_ESCAPE_CLAUSE = 113
    integer(C_SHORT), parameter, public :: SQL_QUALIFIER_LOCATION = 114
    integer(C_SHORT), parameter, public :: SQL_ACTIVE_ENVIRONMENTS = 116
    integer(C_SHORT), parameter, public :: SQL_ALTER_DOMAIN = 117
    integer(C_SHORT), parameter, public :: SQL_SQL_CONFORMANCE = 118
    integer(C_SHORT), parameter, public :: SQL_DATETIME_LITERALS = 119
    integer(C_SHORT), parameter, public :: SQL_ASYNC_MODE = 10021
    integer(C_SHORT), parameter, public :: SQL_BATCH_ROW_COUNT = 120
    integer(C_SHORT), parameter, public :: SQL_BATCH_SUPPORT = 121
    integer(C_SHORT), parameter, public :: SQL_CATALOG_LOCATION = 114
    integer(C_SHORT), parameter, public :: SQL_CATALOG_NAME_SEPARATOR = 41
    integer(C_SHORT), parameter, public :: SQL_CATALOG_TERM = 42
    integer(C_SHORT), parameter, public :: SQL_CATALOG_USAGE = 92
    integer(C_SHORT), parameter, public :: SQL_CONVERT_WCHAR = 122
    integer(C_SHORT), parameter, public :: SQL_CONVERT_INTERVAL_DAY_TIME = 123
    integer(C_SHORT), parameter, public :: SQL_CONVERT_INTERVAL_YEAR_MONTH = 124
    integer(C_SHORT), parameter, public :: SQL_CONVERT_WLONGVARCHAR = 125
    integer(C_SHORT), parameter, public :: SQL_CONVERT_WVARCHAR = 126
    integer(C_SHORT), parameter, public :: SQL_CREATE_ASSERTION = 127
    integer(C_SHORT), parameter, public :: SQL_CREATE_CHARACTER_SET = 128
    integer(C_SHORT), parameter, public :: SQL_CREATE_COLLATION = 129
    integer(C_SHORT), parameter, public :: SQL_CREATE_DOMAIN = 130
    integer(C_SHORT), parameter, public :: SQL_CREATE_SCHEMA = 131
    integer(C_SHORT), parameter, public :: SQL_CREATE_TABLE = 132
    integer(C_SHORT), parameter, public :: SQL_CREATE_TRANSLATION = 133
    integer(C_SHORT), parameter, public :: SQL_CREATE_VIEW = 134
    integer(C_SHORT), parameter, public :: SQL_DRIVER_HDESC = 135
    integer(C_SHORT), parameter, public :: SQL_DROP_ASSERTION = 136
    integer(C_SHORT), parameter, public :: SQL_DROP_CHARACTER_SET = 137
    integer(C_SHORT), parameter, public :: SQL_DROP_COLLATION = 138
    integer(C_SHORT), parameter, public :: SQL_DROP_DOMAIN = 139
    integer(C_SHORT), parameter, public :: SQL_DROP_SCHEMA = 140
    integer(C_SHORT), parameter, public :: SQL_DROP_TABLE = 141
    integer(C_SHORT), parameter, public :: SQL_DROP_TRANSLATION = 142
    integer(C_SHORT), parameter, public :: SQL_DROP_VIEW = 143
    integer(C_SHORT), parameter, public :: SQL_DYNAMIC_CURSOR_ATTRIBUTES1 = 144
    integer(C_SHORT), parameter, public :: SQL_DYNAMIC_CURSOR_ATTRIBUTES2 = 145
    integer(C_SHORT), parameter, public :: SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES1 = 146
    integer(C_SHORT), parameter, public :: SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES2 = 147
    integer(C_SHORT), parameter, public :: SQL_INDEX_KEYWORDS = 148
    integer(C_SHORT), parameter, public :: SQL_INFO_SCHEMA_VIEWS = 149
    integer(C_SHORT), parameter, public :: SQL_KEYSET_CURSOR_ATTRIBUTES1 = 150
    integer(C_SHORT), parameter, public :: SQL_KEYSET_CURSOR_ATTRIBUTES2 = 151
    integer(C_SHORT), parameter, public :: SQL_MAX_ASYNC_CONCURRENT_STATEMENTS = 10022
    integer(C_SHORT), parameter, public :: SQL_ODBC_INTERFACE_CONFORMANCE = 152
    integer(C_SHORT), parameter, public :: SQL_PARAM_ARRAY_ROW_COUNTS = 153
    integer(C_SHORT), parameter, public :: SQL_PARAM_ARRAY_SELECTS = 154
    integer(C_SHORT), parameter, public :: SQL_SCHEMA_TERM = 39
    integer(C_SHORT), parameter, public :: SQL_SCHEMA_USAGE = 91
    integer(C_SHORT), parameter, public :: SQL_SQL92_DATETIME_FUNCTIONS = 155
    integer(C_SHORT), parameter, public :: SQL_SQL92_FOREIGN_KEY_DELETE_RULE = 156
    integer(C_SHORT), parameter, public :: SQL_SQL92_FOREIGN_KEY_UPDATE_RULE = 157
    integer(C_SHORT), parameter, public :: SQL_SQL92_GRANT = 158
    integer(C_SHORT), parameter, public :: SQL_SQL92_NUMERIC_VALUE_FUNCTIONS = 159
    integer(C_SHORT), parameter, public :: SQL_SQL92_PREDICATES = 160
    integer(C_SHORT), parameter, public :: SQL_SQL92_RELATIONAL_JOIN_OPERATORS = 161
    integer(C_SHORT), parameter, public :: SQL_SQL92_REVOKE = 162
    integer(C_SHORT), parameter, public :: SQL_SQL92_ROW_VALUE_CONSTRUCTOR = 163
    integer(C_SHORT), parameter, public :: SQL_SQL92_STRING_FUNCTIONS = 164
    integer(C_SHORT), parameter, public :: SQL_SQL92_VALUE_EXPRESSIONS = 165
    integer(C_SHORT), parameter, public :: SQL_STANDARD_CLI_CONFORMANCE = 166
    integer(C_SHORT), parameter, public :: SQL_STATIC_CURSOR_ATTRIBUTES1 = 167
    integer(C_SHORT), parameter, public :: SQL_STATIC_CURSOR_ATTRIBUTES2 = 168
    integer(C_SHORT), parameter, public :: SQL_AGGREGATE_FUNCTIONS = 169
    integer(C_SHORT), parameter, public :: SQL_DDL_INDEX = 170
    integer(C_SHORT), parameter, public :: SQL_DM_VER = 171
    integer(C_SHORT), parameter, public :: SQL_INSERT_STATEMENT = 172
    integer(C_SHORT), parameter, public :: SQL_UNION_STATEMENT = 96
    integer(C_SHORT), parameter, public :: SQL_ASYNC_DBC_FUNCTIONS = 10023
    integer(C_SHORT), parameter, public :: SQL_DRIVER_AWARE_POOLING_SUPPORTED = 10024
    integer(C_SHORT), parameter, public :: SQL_ASYNC_NOTIFICATION = 10025
    integer(C_LONG), parameter, public :: SQL_ASYNC_NOTIFICATION_NOT_CAPABLE = int(z'00000000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_ASYNC_NOTIFICATION_CAPABLE = int(z'00000001',C_LONG)
    integer(C_SHORT), parameter, public :: SQL_DTC_TRANSITION_COST = 1750
    integer(C_LONG), parameter, public :: SQL_AT_ADD_COLUMN_SINGLE = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_ADD_COLUMN_DEFAULT = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_ADD_COLUMN_COLLATION = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_SET_COLUMN_DEFAULT = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_COLUMN_DEFAULT = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_COLUMN_CASCADE = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_COLUMN_RESTRICT = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_ADD_TABLE_CONSTRAINT = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_TABLE_CONSTRAINT_CASCADE = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_TABLE_CONSTRAINT_RESTRICT = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_CONSTRAINT_NAME_DEFINITION = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_CONSTRAINT_INITIALLY_DEFERRED = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_CONSTRAINT_INITIALLY_IMMEDIATE = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_CONSTRAINT_DEFERRABLE = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_CONSTRAINT_NON_DEFERRABLE = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_CHAR = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_NUMERIC = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_DECIMAL = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_INTEGER = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_SMALLINT = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_FLOAT = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_REAL = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_DOUBLE = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_VARCHAR = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_LONGVARCHAR = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_BINARY = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_VARBINARY = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_BIT = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_TINYINT = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_BIGINT = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_DATE = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_TIME = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_TIMESTAMP = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_LONGVARBINARY = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_INTERVAL_YEAR_MONTH = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_INTERVAL_DAY_TIME = int(z'00100000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_WCHAR = int(z'00200000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_WLONGVARCHAR = int(z'00400000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_WVARCHAR = int(z'00800000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CVT_GUID = int(z'01000000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_CVT_CONVERT = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_CVT_CAST = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_CONCAT = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_INSERT = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LEFT = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LTRIM = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LENGTH = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LOCATE = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LCASE = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_REPEAT = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_REPLACE = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_RIGHT = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_RTRIM = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_SUBSTRING = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_UCASE = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_ASCII = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_CHAR = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_DIFFERENCE = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_LOCATE_2 = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_SOUNDEX = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_SPACE = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_BIT_LENGTH = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_CHAR_LENGTH = int(z'00100000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_CHARACTER_LENGTH = int(z'00200000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_OCTET_LENGTH = int(z'00400000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_STR_POSITION = int(z'00800000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_CONVERT = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_LOWER = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_UPPER = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_SUBSTRING = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_TRANSLATE = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_TRIM_BOTH = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_TRIM_LEADING = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SSF_TRIM_TRAILING = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ABS = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ACOS = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ASIN = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ATAN = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ATAN2 = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_CEILING = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_COS = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_COT = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_EXP = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_FLOOR = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_LOG = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_MOD = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_SIGN = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_SIN = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_SQRT = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_TAN = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_PI = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_RAND = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_DEGREES = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_LOG10 = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_POWER = int(z'00100000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_RADIANS = int(z'00200000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_ROUND = int(z'00400000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_NUM_TRUNCATE = int(z'00800000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_BIT_LENGTH = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_CHAR_LENGTH = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_CHARACTER_LENGTH = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_EXTRACT = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_OCTET_LENGTH = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SNVF_POSITION = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_NOW = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_CURDATE = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_DAYOFMONTH = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_DAYOFWEEK = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_DAYOFYEAR = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_MONTH = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_QUARTER = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_WEEK = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_YEAR = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_CURTIME = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_HOUR = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_MINUTE = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_SECOND = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_TIMESTAMPADD = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_TIMESTAMPDIFF = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_DAYNAME = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_MONTHNAME = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_CURRENT_DATE = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_CURRENT_TIME = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_CURRENT_TIMESTAMP = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TD_EXTRACT = int(z'00100000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SDF_CURRENT_DATE = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SDF_CURRENT_TIME = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_SDF_CURRENT_TIMESTAMP = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_SYS_USERNAME = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_SYS_DBNAME = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_SYS_IFNULL = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_FRAC_SECOND = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_SECOND = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_MINUTE = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_HOUR = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_DAY = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_WEEK = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_MONTH = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_QUARTER = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_FN_TSI_YEAR = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_NEXT = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_ABSOLUTE = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_RELATIVE = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_BOOKMARK = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_LOCK_NO_CHANGE = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_LOCK_EXCLUSIVE = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_LOCK_UNLOCK = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POS_POSITION = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POS_UPDATE = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POS_DELETE = int(z'00000800',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POS_REFRESH = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POSITIONED_UPDATE = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_POSITIONED_DELETE = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_SELECT_FOR_UPDATE = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_BULK_ADD = int(z'00010000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_BULK_UPDATE_BY_BOOKMARK = int(z'00020000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_BULK_DELETE_BY_BOOKMARK = int(z'00040000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA1_BULK_FETCH_BY_BOOKMARK = int(z'00080000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_READ_ONLY_CONCURRENCY = int(z'00000001',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_LOCK_CONCURRENCY = int(z'00000002',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_OPT_ROWVER_CONCURRENCY = int(z'00000004',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_OPT_VALUES_CONCURRENCY = int(z'00000008',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SENSITIVITY_ADDITIONS = int(z'00000010',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SENSITIVITY_DELETIONS = int(z'00000020',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SENSITIVITY_UPDATES = int(z'00000040',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_SELECT = int(z'00000080',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_INSERT = int(z'00000100',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_DELETE = int(z'00000200',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_UPDATE = int(z'00000400',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_CATALOG = int(z'00000800',C_LONG)
    ! integer(C_LONG), parameter, public :: SQL_CA2_MAX_ROWS_AFFECTS_ALL = (int(z'00000080',C_LONG).or.int(z'00000100',C_LONG).or.int(z'00000200',C_LONG).or.int(z'00000400',C_LONG).or.int(z'00000800',C_LONG))
    integer(C_LONG), parameter, public :: SQL_CA2_CRC_EXACT = int(z'00001000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_CRC_APPROXIMATE = int(z'00002000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SIMULATE_NON_UNIQUE = int(z'00004000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SIMULATE_TRY_UNIQUE = int(z'00008000',C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA2_SIMULATE_UNIQUE = int(z'00010000',C_LONG)
    integer(C_SHORT), parameter, public :: SQL_OAC_NONE = int(z'0000', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OAC_LEVEL1 = int(z'0001', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OAC_LEVEL2 = int(z'0002', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OSCC_NOT_COMPLIANT = int(z'0000', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OSCC_COMPLIANT = int(z'0001', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OSC_MINIMUM = int(z'0000', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OSC_CORE = int(z'0001', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_OSC_EXTENDED = int(z'0002', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_CB_NULL = int(z'0000', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_CB_NON_NULL = int(z'0001', C_SHORT)
    integer(C_LONG), parameter, public :: SQL_SO_FORWARD_ONLY = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SO_KEYSET_DRIVEN = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SO_DYNAMIC = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SO_MIXED = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SO_STATIC = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_BOOKMARK = int(z'00000080', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CN_NONE = int(z'0000', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CN_DIFFERENT = int(z'0001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CN_ANY = int(z'0002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NNC_NULL = int(z'0000', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NNC_NON_NULL = int(z'0001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NC_START = int(z'0002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NC_END = int(z'0004', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_FILE_NOT_SUPPORTED = int(z'0000', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_FILE_TABLE = int(z'0001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_FILE_QUALIFIER = int(z'0002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_FILE_CATALOG = int(z'0002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_BLOCK = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_BOUND = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_OUTPUT_PARAMS = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_PS_POSITIONED_DELETE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_PS_POSITIONED_UPDATE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_PS_SELECT_FOR_UPDATE = int(z'00000004', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_GB_NOT_SUPPORTED = int(z'0000', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_GB_GROUP_BY_EQUALS_SELECT = int(z'0001', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_GB_GROUP_BY_CONTAINS_SELECT = int(z'0002', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_GB_NO_RELATION = int(z'0003', C_SHORT)
    integer(C_SHORT), parameter, public :: SQL_GB_COLLATE = int(z'0004', C_SHORT)
    integer(C_LONG), parameter, public :: SQL_OU_DML_STATEMENTS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OU_PROCEDURE_INVOCATION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OU_TABLE_DEFINITION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OU_INDEX_DEFINITION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OU_PRIVILEGE_DEFINITION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SU_DML_STATEMENTS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SU_PROCEDURE_INVOCATION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SU_TABLE_DEFINITION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SU_INDEX_DEFINITION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SU_PRIVILEGE_DEFINITION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_QU_DML_STATEMENTS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_QU_PROCEDURE_INVOCATION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_QU_TABLE_DEFINITION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_QU_INDEX_DEFINITION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_QU_PRIVILEGE_DEFINITION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CU_DML_STATEMENTS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CU_PROCEDURE_INVOCATION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CU_TABLE_DEFINITION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CU_INDEX_DEFINITION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CU_PRIVILEGE_DEFINITION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SQ_COMPARISON = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SQ_EXISTS = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SQ_IN = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SQ_QUANTIFIED = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SQ_CORRELATED_SUBQUERIES = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_U_UNION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_U_UNION_ALL = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_CLOSE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_DELETE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_DROP = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_TRANSACTION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_UPDATE = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_OTHER_HSTMT = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BP_SCROLL = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SS_ADDITIONS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SS_DELETIONS = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SS_UPDATES = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CV_CREATE_VIEW = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CV_CHECK_OPTION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CV_CASCADED = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CV_LOCAL = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_LCK_NO_CHANGE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_LCK_EXCLUSIVE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_LCK_UNLOCK = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_POS_POSITION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_POS_REFRESH = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_POS_UPDATE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_POS_DELETE = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_POS_ADD = int(z'00000010', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_QL_START = int(z'0001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_QL_END = int(z'0002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_AVG = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_COUNT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_MAX = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_MIN = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_SUM = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_DISTINCT = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AF_ALL = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SC_SQL92_ENTRY = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SC_FIPS127_2_TRANSITIONAL = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SC_SQL92_INTERMEDIATE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SC_SQL92_FULL = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_DATE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_TIME = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_TIMESTAMP = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_YEAR = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_MONTH = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_DAY = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_HOUR = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_MINUTE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_SECOND = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_YEAR_TO_MONTH = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_DAY_TO_HOUR = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_DAY_TO_MINUTE = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_DAY_TO_SECOND = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_HOUR_TO_MINUTE = int(z'00002000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_HOUR_TO_SECOND = int(z'00004000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DL_SQL92_INTERVAL_MINUTE_TO_SECOND = int(z'00008000', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CL_START = int(z'0001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_CL_END = int(z'0002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_BRC_PROCEDURES = int(z'0000001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_BRC_EXPLICIT = int(z'0000002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_BRC_ROLLED_UP = int(z'0000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BS_SELECT_EXPLICIT = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BS_ROW_COUNT_EXPLICIT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BS_SELECT_PROC = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_BS_ROW_COUNT_PROC = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_PARC_BATCH = 1
    integer(C_SHORT), parameter, public :: SQL_PARC_NO_BATCH = 2
    integer(C_SHORT), parameter, public :: SQL_PAS_BATCH = 1
    integer(C_SHORT), parameter, public :: SQL_PAS_NO_BATCH = 2
    integer(C_SHORT), parameter, public :: SQL_PAS_NO_SELECT = 3
    integer(C_LONG), parameter, public :: SQL_IK_NONE = int(z'00000000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_IK_ASC = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_IK_DESC = int(z'00000002', C_LONG)
    ! integer(C_LONG), parameter, public :: SQL_IK_ALL = (int(z'00000001', C_LONG).or.int(z'00000002', C_LONG))
    integer(C_LONG), parameter, public :: SQL_ISV_ASSERTIONS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_CHARACTER_SETS = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_CHECK_CONSTRAINTS = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_COLLATIONS = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_COLUMN_DOMAIN_USAGE = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_COLUMN_PRIVILEGES = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_COLUMNS = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_CONSTRAINT_COLUMN_USAGE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_CONSTRAINT_TABLE_USAGE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_DOMAIN_CONSTRAINTS = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_DOMAINS = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_KEY_COLUMN_USAGE = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_REFERENTIAL_CONSTRAINTS = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_SCHEMATA = int(z'00002000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_SQL_LANGUAGES = int(z'00004000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_TABLE_CONSTRAINTS = int(z'00008000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_TABLE_PRIVILEGES = int(z'00010000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_TABLES = int(z'00020000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_TRANSLATIONS = int(z'00040000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_USAGE_PRIVILEGES = int(z'00080000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_VIEW_COLUMN_USAGE = int(z'00100000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_VIEW_TABLE_USAGE = int(z'00200000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ISV_VIEWS = int(z'00400000', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_AM_NONE = 0
    integer(C_SHORT), parameter, public :: SQL_AM_CONNECTION = 1
    integer(C_SHORT), parameter, public :: SQL_AM_STATEMENT = 2
    integer(C_LONG), parameter, public :: SQL_AD_CONSTRAINT_NAME_DEFINITION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_DOMAIN_CONSTRAINT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_DROP_DOMAIN_CONSTRAINT = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_DOMAIN_DEFAULT = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_DROP_DOMAIN_DEFAULT = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_CONSTRAINT_INITIALLY_DEFERRED = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_CONSTRAINT_INITIALLY_IMMEDIATE = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_CONSTRAINT_DEFERRABLE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AD_ADD_CONSTRAINT_NON_DEFERRABLE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CS_CREATE_SCHEMA = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CS_AUTHORIZATION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CS_DEFAULT_CHARACTER_SET = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CTR_CREATE_TRANSLATION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA_CREATE_ASSERTION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA_CONSTRAINT_INITIALLY_DEFERRED = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA_CONSTRAINT_INITIALLY_IMMEDIATE = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA_CONSTRAINT_DEFERRABLE = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CA_CONSTRAINT_NON_DEFERRABLE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CCS_CREATE_CHARACTER_SET = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CCS_COLLATE_CLAUSE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CCS_LIMITED_COLLATION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CCOL_CREATE_COLLATION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CREATE_DOMAIN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_DEFAULT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_COLLATION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT_NAME_DEFINITION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT_INITIALLY_DEFERRED = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT_INITIALLY_IMMEDIATE = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT_DEFERRABLE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CDO_CONSTRAINT_NON_DEFERRABLE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CREATE_TABLE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_COMMIT_PRESERVE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_COMMIT_DELETE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_GLOBAL_TEMPORARY = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_LOCAL_TEMPORARY = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CONSTRAINT_INITIALLY_DEFERRED = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CONSTRAINT_INITIALLY_IMMEDIATE = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CONSTRAINT_DEFERRABLE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CONSTRAINT_NON_DEFERRABLE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_COLUMN_CONSTRAINT = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_COLUMN_DEFAULT = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_COLUMN_COLLATION = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_TABLE_CONSTRAINT = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_CT_CONSTRAINT_NAME_DEFINITION = int(z'00002000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DI_CREATE_INDEX = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DI_DROP_INDEX = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DC_DROP_COLLATION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DD_DROP_DOMAIN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DD_RESTRICT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DD_CASCADE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DS_DROP_SCHEMA = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DS_RESTRICT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DS_CASCADE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DCS_DROP_CHARACTER_SET = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DA_DROP_ASSERTION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DT_DROP_TABLE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DT_RESTRICT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DT_CASCADE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DTR_DROP_TRANSLATION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DV_DROP_VIEW = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DV_RESTRICT = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DV_CASCADE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_IS_INSERT_LITERALS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_IS_INSERT_SEARCHED = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_IS_SELECT_INTO = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_OIC_CORE = 1
    integer(C_LONG), parameter, public :: SQL_OIC_LEVEL1 = 2
    integer(C_LONG), parameter, public :: SQL_OIC_LEVEL2 = 3
    integer(C_LONG), parameter, public :: SQL_SFKD_CASCADE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKD_NO_ACTION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKD_SET_DEFAULT = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKD_SET_NULL = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKU_CASCADE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKU_NO_ACTION = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKU_SET_DEFAULT = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SFKU_SET_NULL = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_USAGE_ON_DOMAIN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_USAGE_ON_CHARACTER_SET = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_USAGE_ON_COLLATION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_USAGE_ON_TRANSLATION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_WITH_GRANT_OPTION = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_DELETE_TABLE = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_INSERT_TABLE = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_INSERT_COLUMN = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_REFERENCES_TABLE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_REFERENCES_COLUMN = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_SELECT_TABLE = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_UPDATE_TABLE = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SG_UPDATE_COLUMN = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_EXISTS = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_ISNOTNULL = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_ISNULL = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_MATCH_FULL = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_MATCH_PARTIAL = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_MATCH_UNIQUE_FULL = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_MATCH_UNIQUE_PARTIAL = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_OVERLAPS = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_UNIQUE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_LIKE = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_IN = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_BETWEEN = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_COMPARISON = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SP_QUANTIFIED_COMPARISON = int(z'00002000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_CORRESPONDING_CLAUSE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_CROSS_JOIN = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_EXCEPT_JOIN = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_FULL_OUTER_JOIN = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_INNER_JOIN = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_INTERSECT_JOIN = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_LEFT_OUTER_JOIN = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_NATURAL_JOIN = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_RIGHT_OUTER_JOIN = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRJO_UNION_JOIN = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_USAGE_ON_DOMAIN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_USAGE_ON_CHARACTER_SET = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_USAGE_ON_COLLATION = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_USAGE_ON_TRANSLATION = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_GRANT_OPTION_FOR = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_CASCADE = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_RESTRICT = int(z'00000040', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_DELETE_TABLE = int(z'00000080', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_INSERT_TABLE = int(z'00000100', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_INSERT_COLUMN = int(z'00000200', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_REFERENCES_TABLE = int(z'00000400', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_REFERENCES_COLUMN = int(z'00000800', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_SELECT_TABLE = int(z'00001000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_UPDATE_TABLE = int(z'00002000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SR_UPDATE_COLUMN = int(z'00004000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRVC_VALUE_EXPRESSION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRVC_NULL = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRVC_DEFAULT = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SRVC_ROW_SUBQUERY = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SVE_CASE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SVE_CAST = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SVE_COALESCE = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SVE_NULLIF = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCC_XOPEN_CLI_VERSION1 = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_SCC_ISO92_CLI = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_US_UNION = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_US_UNION_ALL = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DRIVER_AWARE_POOLING_NOT_CAPABLE = int(z'00000000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DRIVER_AWARE_POOLING_CAPABLE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DTC_ENLIST_EXPENSIVE = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_DTC_UNENLIST_EXPENSIVE = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ASYNC_DBC_NOT_CAPABLE = int(z'00000000', C_LONG)
    integer(C_LONG), parameter, public :: SQL_ASYNC_DBC_CAPABLE = int(z'00000001', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_FETCH_FIRST_USER = 31
    integer(C_SHORT), parameter, public :: SQL_FETCH_FIRST_SYSTEM = 32
    integer(C_SHORT), parameter, public :: SQL_ENTIRE_ROWSET = 0
    integer(C_SHORT), parameter, public :: SQL_POSITION = 0
    integer(C_SHORT), parameter, public :: SQL_REFRESH = 1
    integer(C_SHORT), parameter, public :: SQL_UPDATE = 2
    integer(C_SHORT), parameter, public :: SQL_DELETE = 3
    integer(C_SHORT), parameter, public :: SQL_ADD = 4
    integer(C_SHORT), parameter, public :: SQL_SETPOS_MAX_OPTION_VALUE = 4
    integer(C_SHORT), parameter, public :: SQL_UPDATE_BY_BOOKMARK = 5
    integer(C_SHORT), parameter, public :: SQL_DELETE_BY_BOOKMARK = 6
    integer(C_SHORT), parameter, public :: SQL_FETCH_BY_BOOKMARK = 7
    integer(C_SHORT), parameter, public :: SQL_LOCK_NO_CHANGE = 0
    integer(C_SHORT), parameter, public :: SQL_LOCK_EXCLUSIVE = 1
    integer(C_SHORT), parameter, public :: SQL_LOCK_UNLOCK = 2
    integer(C_SHORT), parameter, public :: SQL_SETPOS_MAX_LOCK_VALUE = 2
    integer(C_SHORT), parameter, public :: SQL_BEST_ROWID = 1
    integer(C_SHORT), parameter, public :: SQL_ROWVER = 2
    integer(C_SHORT), parameter, public :: SQL_PC_NOT_PSEUDO = 1
    integer(C_SHORT), parameter, public :: SQL_QUICK = 0
    integer(C_SHORT), parameter, public :: SQL_ENSURE = 1
    integer(C_SHORT), parameter, public :: SQL_TABLE_STAT = 0
    character(kind=C_CHAR, len=*), parameter, public :: SQL_ALL_CATALOGS = "%"
    character(kind=C_CHAR, len=*), parameter, public :: SQL_ALL_SCHEMAS = "%"
    character(kind=C_CHAR, len=*), parameter, public :: SQL_ALL_TABLE_TYPES = "%"
    integer(C_SHORT), parameter, public :: SQL_DRIVER_NOPROMPT = 0
    integer(C_SHORT), parameter, public :: SQL_DRIVER_COMPLETE = 1
    integer(C_SHORT), parameter, public :: SQL_DRIVER_PROMPT = 2
    integer(C_SHORT), parameter, public :: SQL_DRIVER_COMPLETE_REQUIRED = 3
    integer(C_SHORT), parameter, public :: SQL_FETCH_BOOKMARK = 8
    integer(C_SHORT), parameter, public :: SQL_ROW_SUCCESS = 0
    integer(C_SHORT), parameter, public :: SQL_ROW_DELETED = 1
    integer(C_SHORT), parameter, public :: SQL_ROW_UPDATED = 2
    integer(C_SHORT), parameter, public :: SQL_ROW_NOROW = 3
    integer(C_SHORT), parameter, public :: SQL_ROW_ADDED = 4
    integer(C_SHORT), parameter, public :: SQL_ROW_ERROR = 5
    integer(C_SHORT), parameter, public :: SQL_ROW_SUCCESS_WITH_INFO = 6
    integer(C_SHORT), parameter, public :: SQL_ROW_PROCEED = 0
    integer(C_SHORT), parameter, public :: SQL_ROW_IGNORE = 1
    integer(C_SHORT), parameter, public :: SQL_PARAM_SUCCESS = 0
    integer(C_SHORT), parameter, public :: SQL_PARAM_SUCCESS_WITH_INFO = 6
    integer(C_SHORT), parameter, public :: SQL_PARAM_ERROR = 5
    integer(C_SHORT), parameter, public :: SQL_PARAM_UNUSED = 7
    integer(C_SHORT), parameter, public :: SQL_PARAM_DIAG_UNAVAILABLE = 1
    integer(C_SHORT), parameter, public :: SQL_PARAM_PROCEED = 0
    integer(C_SHORT), parameter, public :: SQL_PARAM_IGNORE = 1
    integer(C_SHORT), parameter, public :: SQL_CASCADE = 0
    integer(C_SHORT), parameter, public :: SQL_RESTRICT = 1
    integer(C_SHORT), parameter, public :: SQL_SET_NULL = 2
    integer(C_SHORT), parameter, public :: SQL_NO_ACTION = 3
    integer(C_SHORT), parameter, public :: SQL_SET_DEFAULT = 4
    integer(C_SHORT), parameter, public :: SQL_INITIALLY_DEFERRED = 5
    integer(C_SHORT), parameter, public :: SQL_INITIALLY_IMMEDIATE = 6
    integer(C_SHORT), parameter, public :: SQL_NOT_DEFERRABLE = 7
    integer(C_SHORT), parameter, public :: SQL_PARAM_TYPE_UNKNOWN = 0
    integer(C_SHORT), parameter, public :: SQL_PARAM_INPUT = 1
    integer(C_SHORT), parameter, public :: SQL_PARAM_INPUT_OUTPUT = 2
    integer(C_SHORT), parameter, public :: SQL_RESULT_COL = 3
    integer(C_SHORT), parameter, public :: SQL_PARAM_OUTPUT = 4
    integer(C_SHORT), parameter, public :: SQL_RETURN_VALUE = 5
    integer(C_SHORT), parameter, public :: SQL_PARAM_INPUT_OUTPUT_STREAM = 8
    integer(C_SHORT), parameter, public :: SQL_PARAM_OUTPUT_STREAM = 16
    integer(C_SHORT), parameter, public :: SQL_PT_UNKNOWN = 0
    integer(C_SHORT), parameter, public :: SQL_PT_PROCEDURE = 1
    integer(C_SHORT), parameter, public :: SQL_PT_FUNCTION = 2
    character(kind=C_CHAR, len=*), parameter, public :: SQL_ODBC_KEYWORDS = "ABSOLUTE,ACTION,ADA,ADD,ALL,ALLOCATE,ALTER,AND,ANY,ARE,AS,ASC,ASSERTION,AT,AUTHORIZATION,AVG,BEGIN,BETWEEN,BIT,BIT_LENGTH,BOTH,BY,CASCADE,CASCADED,CASE,CAST,CATALOG,CHAR,CHAR_LENGTH,CHARACTER,CHARACTER_LENGTH,CHECK,CLOSE,COALESCE,COLLATE,COLLATION,COLUMN,COMMIT,CONNECT,CONNECTION,CONSTRAINT,CONSTRAINTS,CONTINUE,CONVERT,CORRESPONDING,COUNT,CREATE,CROSS,CURRENT,CURRENT_DATE,CURRENT_TIME,CURRENT_TIMESTAMP,CURRENT_USER,CURSOR,DATE,DAY,DEALLOCATE,DEC,DECIMAL,DECLARE,DEFAULT,DEFERRABLE,DEFERRED,DELETE,DESC,DESCRIBE,DESCRIPTOR,DIAGNOSTICS,DISCONNECT,DISTINCT,DOMAIN,DOUBLE,DROP,ELSE,END,END-EXEC,ESCAPE,EXCEPT,EXCEPTION,EXEC,EXECUTE,EXISTS,EXTERNAL,EXTRACT,FALSE,FETCH,FIRST,FLOAT,FOR,FOREIGN,FORTRAN,FOUND,FROM,FULL,GET,GLOBAL,GO,GOTO,GRANT,GROUP,HAVING,HOUR,IDENTITY,IMMEDIATE,IN,INCLUDE,INDEX,INDICATOR,INITIALLY,INNER,INPUT,INSENSITIVE,INSERT,INT,INTEGER,INTERSECT,INTERVAL,INTO,IS,ISOLATION,JOIN,KEY,LANGUAGE,LAST,LEADING,LEFT,LEVEL,LIKE,LOCAL,LOWER,MATCH,MAX,MIN,MINUTE,MODULE,MONTH,NAMES,NATIONAL,NATURAL,NCHAR,NEXT,NO,NONE,NOT,NULL,NULLIF,NUMERIC,OCTET_LENGTH,OF,ON,ONLY,OPEN,OPTION,OR,ORDER,OUTER,OUTPUT,OVERLAPS,PAD,PARTIAL,PASCAL,PLI,POSITION,PRECISION,PREPARE,PRESERVE,PRIMARY,PRIOR,PRIVILEGES,PROCEDURE,PUBLIC,READ,REAL,REFERENCES,RELATIVE,RESTRICT,REVOKE,RIGHT,ROLLBACK,ROWSSCHEMA,SCROLL,SECOND,SECTION,SELECT,SESSION,SESSION_USER,SET,SIZE,SMALLINT,SOME,SPACE,SQL,SQLCA,SQLCODE,SQLERROR,SQLSTATE,SQLWARNING,SUBSTRING,SUM,SYSTEM_USER,TABLE,TEMPORARY,THEN,TIME,TIMESTAMP,TIMEZONE_HOUR,TIMEZONE_MINUTE,TO,TRAILING,TRANSACTION,TRANSLATE,TRANSLATION,TRIM,TRUE,UNION,UNIQUE,UNKNOWN,UPDATE,UPPER,USAGE,USER,USING,VALUE,VALUES,VARCHAR,VARYING,VIEW,WHEN,WHENEVER,WHERE,WITH,WORK,WRITE,YEAR,ZONE"

    interface trim
        module procedure :: trim_c_char
    end interface

contains

    function trim_c_char(cchar) result(fchar)
        character(kind=c_char, len=1), intent(in) :: cchar(:)
        character(:), allocatable :: fchar
        !private
        integer :: i

        allocate (character(size(cchar)) :: fchar)
        do i = 1, size(cchar)
            fchar(i:i) = cchar(i)
        end do
        fchar = trim(fchar)
    end function
end module

! %apply short {int SQL_HANDLE_ENV};
! %apply short {int SQL_HANDLE_DBC};
! %apply short {int SQL_HANDLE_STMT};
! %apply short {int SQL_HANDLE_DESC};
! %apply short {int ODBCVER};
! %apply short {int SQL_NULL_DATA};
! %apply short {int SQL_DATA_AT_EXEC};
! %apply short {int SQL_SUCCESS};
! %apply short {int SQL_SUCCESS_WITH_INFO};
! %apply short {int SQL_NO_DATA};
! %apply short {int SQL_ERROR};
! %apply short {int SQL_INVALID_HANDLE};
! %apply short {int SQL_STILL_EXECUTING};
! %apply short {int SQL_NEED_DATA};
! %apply short {int SQL_PARAM_DATA_AVAILABLE};
! %apply short {int SQL_NTS};
! %apply short {int SQL_NTSL};
! %apply short {int SQL_MAX_MESSAGE_LENGTH};
! %apply short {int SQL_DATE_LEN};
! %apply short {int SQL_TIME_LEN};
! %apply short {int SQL_TIMESTAMP_LEN};
! %apply short {int SQL_ATTR_OUTPUT_NTS};
! %apply short {int SQL_ATTR_AUTO_IPD};
! %apply short {int SQL_ATTR_METADATA_ID};
! %apply short {int SQL_ATTR_APP_ROW_DESC};
! %apply short {int SQL_ATTR_APP_PARAM_DESC};
! %apply short {int SQL_ATTR_IMP_ROW_DESC};
! %apply short {int SQL_ATTR_IMP_PARAM_DESC};
! %apply short {int SQL_ATTR_CURSOR_SCROLLABLE};
! %apply short {int SQL_ATTR_CURSOR_SENSITIVITY};
! %apply short {int SQL_NONSCROLLABLE};
! %apply short {int SQL_SCROLLABLE};
! %apply short {int SQL_DESC_COUNT};
! %apply short {int SQL_DESC_TYPE};
! %apply short {int SQL_DESC_LENGTH};
! %apply short {int SQL_DESC_OCTET_LENGTH_PTR};
! %apply short {int SQL_DESC_PRECISION};
! %apply short {int SQL_DESC_SCALE};
! %apply short {int SQL_DESC_DATETIME_INTERVAL_CODE};
! %apply short {int SQL_DESC_NULLABLE};
! %apply short {int SQL_DESC_INDICATOR_PTR};
! %apply short {int SQL_DESC_DATA_PTR};
! %apply short {int SQL_DESC_NAME};
! %apply short {int SQL_DESC_UNNAMED};
! %apply short {int SQL_DESC_OCTET_LENGTH};
! %apply short {int SQL_DESC_ALLOC_TYPE};
! %apply short {int SQL_DIAG_RETURNCODE};
! %apply short {int SQL_DIAG_NUMBER};
! %apply short {int SQL_DIAG_ROW_COUNT};
! %apply short {int SQL_DIAG_SQLSTATE};
! %apply short {int SQL_DIAG_NATIVE};
! %apply short {int SQL_DIAG_MESSAGE_TEXT};
! %apply short {int SQL_DIAG_DYNAMIC_FUNCTION};
! %apply short {int SQL_DIAG_CLASS_ORIGIN};
! %apply short {int SQL_DIAG_SUBCLASS_ORIGIN};
! %apply short {int SQL_DIAG_CONNECTION_NAME};
! %apply short {int SQL_DIAG_SERVER_NAME};
! %apply short {int SQL_DIAG_DYNAMIC_FUNCTION_CODE};
! %apply short {int SQL_DIAG_ALTER_DOMAIN};
! %apply short {int SQL_DIAG_ALTER_TABLE};
! %apply short {int SQL_DIAG_CALL};
! %apply short {int SQL_DIAG_CREATE_ASSERTION};
! %apply short {int SQL_DIAG_CREATE_CHARACTER_SET};
! %apply short {int SQL_DIAG_CREATE_COLLATION};
! %apply short {int SQL_DIAG_CREATE_DOMAIN};
! %apply short {int SQL_DIAG_CREATE_INDEX};
! %apply short {int SQL_DIAG_CREATE_SCHEMA};
! %apply short {int SQL_DIAG_CREATE_TABLE};
! %apply short {int SQL_DIAG_CREATE_TRANSLATION};
! %apply short {int SQL_DIAG_CREATE_VIEW};
! %apply short {int SQL_DIAG_DELETE_WHERE};
! %apply short {int SQL_DIAG_DROP_ASSERTION};
! %apply short {int SQL_DIAG_DROP_CHARACTER_SET};
! %apply short {int SQL_DIAG_DROP_COLLATION};
! %apply short {int SQL_DIAG_DROP_DOMAIN};
! %apply short {int SQL_DIAG_DROP_INDEX};
! %apply short {int SQL_DIAG_DROP_SCHEMA};
! %apply short {int SQL_DIAG_DROP_TABLE};
! %apply short {int SQL_DIAG_DROP_TRANSLATION};
! %apply short {int SQL_DIAG_DROP_VIEW};
! %apply short {int SQL_DIAG_DYNAMIC_DELETE_CURSOR};
! %apply short {int SQL_DIAG_DYNAMIC_UPDATE_CURSOR};
! %apply short {int SQL_DIAG_GRANT};
! %apply short {int SQL_DIAG_INSERT};
! %apply short {int SQL_DIAG_REVOKE};
! %apply short {int SQL_DIAG_SELECT_CURSOR};
! %apply short {int SQL_DIAG_UNKNOWN_STATEMENT};
! %apply short {int SQL_DIAG_UPDATE_WHERE};
! %apply short {int SQL_UNKNOWN_TYPE};
! %apply short {int SQL_CHAR};
! %apply short {int SQL_NUMERIC};
! %apply short {int SQL_DECIMAL};
! %apply short {int SQL_INTEGER};
! %apply short {int SQL_SMALLINT};
! %apply short {int SQL_FLOAT};
! %apply short {int SQL_REAL};
! %apply short {int SQL_DOUBLE};
! %apply short {int SQL_DATETIME};
! %apply short {int SQL_VARCHAR};
! %apply short {int SQL_TYPE_DATE};
! %apply short {int SQL_TYPE_TIME};
! %apply short {int SQL_TYPE_TIMESTAMP};
! %apply short {int SQL_UNSPECIFIED};
! %apply short {int SQL_INSENSITIVE};
! %apply short {int SQL_SENSITIVE};
! %apply short {int SQL_ALL_TYPES};
! %apply short {int SQL_DEFAULT};
! %apply short {int SQL_ARD_TYPE};
! %apply short {int SQL_CODE_DATE};
! %apply short {int SQL_CODE_TIME};
! %apply short {int SQL_CODE_TIMESTAMP};
! %apply short {int SQL_FALSE};
! %apply short {int SQL_TRUE};
! %apply short {int SQL_NO_NULLS};
! %apply short {int SQL_NULLABLE};
! %apply short {int SQL_NULLABLE_UNKNOWN};
! %apply short {int SQL_PRED_NONE};
! %apply short {int SQL_PRED_CHAR};
! %apply short {int SQL_PRED_BASIC};
! %apply short {int SQL_NAMED};
! %apply short {int SQL_UNNAMED};
! %apply short {int SQL_DESC_ALLOC_AUTO};
! %apply short {int SQL_DESC_ALLOC_USER};
! %apply short {int SQL_CLOSE};
! %apply short {int SQL_DROP};
! %apply short {int SQL_UNBIND};
! %apply short {int SQL_RESET_PARAMS};
! %apply short {int SQL_FETCH_NEXT};
! %apply short {int SQL_FETCH_FIRST};
! %apply short {int SQL_FETCH_LAST};
! %apply short {int SQL_FETCH_PRIOR};
! %apply short {int SQL_FETCH_ABSOLUTE};
! %apply short {int SQL_FETCH_RELATIVE};
! %apply short {int SQL_COMMIT};
! %apply short {int SQL_ROLLBACK};
! %apply short {int SQL_NULL_HENV};
! %apply short {int SQL_NULL_HDBC};
! %apply short {int SQL_NULL_HSTMT};
! %apply short {int SQL_NULL_HDESC};
! %apply short {int SQL_NULL_DESC};
! %apply short {int SQL_NULL_HANDLE};
! %apply short {int SQL_SCOPE_CURROW};
! %apply short {int SQL_SCOPE_TRANSACTION};
! %apply short {int SQL_SCOPE_SESSION};
! %apply short {int SQL_PC_UNKNOWN};
! %apply short {int SQL_PC_NON_PSEUDO};
! %apply short {int SQL_PC_PSEUDO};
! %apply short {int SQL_ROW_IDENTIFIER};
! %apply short {int SQL_INDEX_UNIQUE};
! %apply short {int SQL_INDEX_ALL};
! %apply short {int SQL_INDEX_CLUSTERED};
! %apply short {int SQL_INDEX_HASHED};
! %apply short {int SQL_INDEX_OTHER};
! %apply short {int SQL_API_SQLALLOCCONNECT};
! %apply short {int SQL_API_SQLALLOCENV};
! %apply short {int SQL_API_SQLALLOCHANDLE};
! %apply short {int SQL_API_SQLALLOCSTMT};
! %apply short {int SQL_API_SQLBINDCOL};
! %apply short {int SQL_API_SQLBINDPARAM};
! %apply short {int SQL_API_SQLCANCEL};
! %apply short {int SQL_API_SQLCLOSECURSOR};
! %apply short {int SQL_API_SQLCOLATTRIBUTE};
! %apply short {int SQL_API_SQLCOLUMNS};
! %apply short {int SQL_API_SQLCONNECT};
! %apply short {int SQL_API_SQLCOPYDESC};
! %apply short {int SQL_API_SQLDATASOURCES};
! %apply short {int SQL_API_SQLDESCRIBECOL};
! %apply short {int SQL_API_SQLDISCONNECT};
! %apply short {int SQL_API_SQLENDTRAN};
! %apply short {int SQL_API_SQLERROR};
! %apply short {int SQL_API_SQLEXECDIRECT};
! %apply short {int SQL_API_SQLEXECUTE};
! %apply short {int SQL_API_SQLFETCH};
! %apply short {int SQL_API_SQLFETCHSCROLL};
! %apply short {int SQL_API_SQLFREECONNECT};
! %apply short {int SQL_API_SQLFREEENV};
! %apply short {int SQL_API_SQLFREEHANDLE};
! %apply short {int SQL_API_SQLFREESTMT};
! %apply short {int SQL_API_SQLGETCONNECTATTR};
! %apply short {int SQL_API_SQLGETCONNECTOPTION};
! %apply short {int SQL_API_SQLGETCURSORNAME};
! %apply short {int SQL_API_SQLGETDATA};
! %apply short {int SQL_API_SQLGETDESCFIELD};
! %apply short {int SQL_API_SQLGETDESCREC};
! %apply short {int SQL_API_SQLGETDIAGFIELD};
! %apply short {int SQL_API_SQLGETDIAGREC};
! %apply short {int SQL_API_SQLGETENVATTR};
! %apply short {int SQL_API_SQLGETFUNCTIONS};
! %apply short {int SQL_API_SQLGETINFO};
! %apply short {int SQL_API_SQLGETSTMTATTR};
! %apply short {int SQL_API_SQLGETSTMTOPTION};
! %apply short {int SQL_API_SQLGETTYPEINFO};
! %apply short {int SQL_API_SQLNUMRESULTCOLS};
! %apply short {int SQL_API_SQLPARAMDATA};
! %apply short {int SQL_API_SQLPREPARE};
! %apply short {int SQL_API_SQLPUTDATA};
! %apply short {int SQL_API_SQLROWCOUNT};
! %apply short {int SQL_API_SQLSETCONNECTATTR};
! %apply short {int SQL_API_SQLSETCONNECTOPTION};
! %apply short {int SQL_API_SQLSETCURSORNAME};
! %apply short {int SQL_API_SQLSETDESCFIELD};
! %apply short {int SQL_API_SQLSETDESCREC};
! %apply short {int SQL_API_SQLSETENVATTR};
! %apply short {int SQL_API_SQLSETPARAM};
! %apply short {int SQL_API_SQLSETSTMTATTR};
! %apply short {int SQL_API_SQLSETSTMTOPTION};
! %apply short {int SQL_API_SQLSPECIALCOLUMNS};
! %apply short {int SQL_API_SQLSTATISTICS};
! %apply short {int SQL_API_SQLTABLES};
! %apply short {int SQL_API_SQLTRANSACT};
! %apply short {int SQL_API_SQLCANCELHANDLE};
! %apply short {int SQL_MAX_DRIVER_CONNECTIONS};
! %apply short {int SQL_MAXIMUM_DRIVER_CONNECTIONS};
! %apply short {int SQL_MAX_CONCURRENT_ACTIVITIES};
! %apply short {int SQL_MAXIMUM_CONCURRENT_ACTIVITIES};
! %apply short {int SQL_DATA_SOURCE_NAME};
! %apply short {int SQL_FETCH_DIRECTION};
! %apply short {int SQL_SERVER_NAME};
! %apply short {int SQL_SEARCH_PATTERN_ESCAPE};
! %apply short {int SQL_DBMS_NAME};
! %apply short {int SQL_DBMS_VER};
! %apply short {int SQL_ACCESSIBLE_TABLES};
! %apply short {int SQL_ACCESSIBLE_PROCEDURES};
! %apply short {int SQL_CURSOR_COMMIT_BEHAVIOR};
! %apply short {int SQL_DATA_SOURCE_READ_ONLY};
! %apply short {int SQL_DEFAULT_TXN_ISOLATION};
! %apply short {int SQL_IDENTIFIER_CASE};
! %apply short {int SQL_IDENTIFIER_QUOTE_CHAR};
! %apply short {int SQL_MAX_COLUMN_NAME_LEN};
! %apply short {int SQL_MAXIMUM_COLUMN_NAME_LENGTH};
! %apply short {int SQL_MAX_CURSOR_NAME_LEN};
! %apply short {int SQL_MAXIMUM_CURSOR_NAME_LENGTH};
! %apply short {int SQL_MAX_SCHEMA_NAME_LEN};
! %apply short {int SQL_MAXIMUM_SCHEMA_NAME_LENGTH};
! %apply short {int SQL_MAX_CATALOG_NAME_LEN};
! %apply short {int SQL_MAXIMUM_CATALOG_NAME_LENGTH};
! %apply short {int SQL_MAX_TABLE_NAME_LEN};
! %apply short {int SQL_SCROLL_CONCURRENCY};
! %apply short {int SQL_TXN_CAPABLE};
! %apply short {int SQL_TRANSACTION_CAPABLE};
! %apply short {int SQL_USER_NAME};
! %apply short {int SQL_TXN_ISOLATION_OPTION};
! %apply short {int SQL_TRANSACTION_ISOLATION_OPTION};
! %apply short {int SQL_INTEGRITY};
! %apply short {int SQL_GETDATA_EXTENSIONS};
! %apply short {int SQL_NULL_COLLATION};
! %apply short {int SQL_ALTER_TABLE};
! %apply short {int SQL_ORDER_BY_COLUMNS_IN_SELECT};
! %apply short {int SQL_SPECIAL_CHARACTERS};
! %apply short {int SQL_MAX_COLUMNS_IN_GROUP_BY};
! %apply short {int SQL_MAXIMUM_COLUMNS_IN_GROUP_BY};
! %apply short {int SQL_MAX_COLUMNS_IN_INDEX};
! %apply short {int SQL_MAXIMUM_COLUMNS_IN_INDEX};
! %apply short {int SQL_MAX_COLUMNS_IN_ORDER_BY};
! %apply short {int SQL_MAXIMUM_COLUMNS_IN_ORDER_BY};
! %apply short {int SQL_MAX_COLUMNS_IN_SELECT};
! %apply short {int SQL_MAXIMUM_COLUMNS_IN_SELECT};
! %apply short {int SQL_MAX_COLUMNS_IN_TABLE};
! %apply short {int SQL_MAX_INDEX_SIZE};
! %apply short {int SQL_MAXIMUM_INDEX_SIZE};
! %apply short {int SQL_MAX_ROW_SIZE};
! %apply short {int SQL_MAXIMUM_ROW_SIZE};
! %apply short {int SQL_MAX_STATEMENT_LEN};
! %apply short {int SQL_MAXIMUM_STATEMENT_LENGTH};
! %apply short {int SQL_MAX_TABLES_IN_SELECT};
! %apply short {int SQL_MAXIMUM_TABLES_IN_SELECT};
! %apply short {int SQL_MAX_USER_NAME_LEN};
! %apply short {int SQL_MAXIMUM_USER_NAME_LENGTH};
! %apply short {int SQL_OJ_CAPABILITIES};
! %apply short {int SQL_OUTER_JOIN_CAPABILITIES};
! %apply short {int SQL_XOPEN_CLI_YEAR};
! %apply short {int SQL_CURSOR_SENSITIVITY};
! %apply short {int SQL_DESCRIBE_PARAMETER};
! %apply short {int SQL_CATALOG_NAME};
! %apply short {int SQL_COLLATION_SEQ};
! %apply short {int SQL_MAX_IDENTIFIER_LEN};
! %apply short {int SQL_MAXIMUM_IDENTIFIER_LENGTH};
! %apply long {int SQL_AT_ADD_COLUMN};
! %apply short {int SQL_AT_DROP_COLUMN};
! %apply short {int SQL_AT_ADD_CONSTRAINT};
! %apply short {int SQL_AM_NONE};
! %apply short {int SQL_AM_CONNECTION};
! %apply short {int SQL_AM_STATEMENT};
! %apply short {int SQL_CB_DELETE};
! %apply short {int SQL_CB_CLOSE};
! %apply short {int SQL_CB_PRESERVE};
! %apply short {int SQL_FD_FETCH_NEXT};
! %apply short {int SQL_FD_FETCH_FIRST};
! %apply short {int SQL_FD_FETCH_LAST};
! %apply short {int SQL_FD_FETCH_PRIOR};
! %apply short {int SQL_FD_FETCH_ABSOLUTE};
! %apply short {int SQL_FD_FETCH_RELATIVE};
! %apply short {int SQL_GD_ANY_COLUMN};
! %apply short {int SQL_GD_ANY_ORDER};
! %apply short {int SQL_IC_UPPER};
! %apply short {int SQL_IC_LOWER};
! %apply short {int SQL_IC_SENSITIVE};
! %apply short {int SQL_IC_MIXED};
! %apply short {int SQL_OJ_LEFT};
! %apply short {int SQL_OJ_RIGHT};
! %apply short {int SQL_OJ_FULL};
! %apply short {int SQL_OJ_NESTED};
! %apply short {int SQL_OJ_NOT_ORDERED};
! %apply short {int SQL_OJ_INNER};
! %apply short {int SQL_OJ_ALL_COMPARISON_OPS};
! %apply short {int SQL_SCCO_READ_ONLY};
! %apply short {int SQL_SCCO_LOCK};
! %apply short {int SQL_SCCO_OPT_ROWVER};
! %apply short {int SQL_SCCO_OPT_VALUES};
! %apply short {int SQL_TC_NONE};
! %apply short {int SQL_TC_DML};
! %apply short {int SQL_TC_ALL};
! %apply short {int SQL_TC_DDL_COMMIT};
! %apply short {int SQL_TC_DDL_IGNORE};
! %apply short {int SQL_TXN_READ_UNCOMMITTED};
! %apply short {int SQL_TRANSACTION_READ_UNCOMMITTED};
! %apply short {int SQL_TXN_READ_COMMITTED};
! %apply short {int SQL_TRANSACTION_READ_COMMITTED};
! %apply short {int SQL_TXN_REPEATABLE_READ};
! %apply short {int SQL_TRANSACTION_REPEATABLE_READ};
! %apply short {int SQL_TXN_SERIALIZABLE};
! %apply short {int SQL_TRANSACTION_SERIALIZABLE};
! %apply short {int SQL_NC_HIGH};
! %apply short {int SQL_NC_LOW};

! %fortranconst SQL_HANDLE_ENV;
! %fortranconst SQL_HANDLE_DBC;
! %fortranconst SQL_HANDLE_STMT;
! %fortranconst SQL_HANDLE_DESC;
! %fortranconst ODBCVER;
! %fortranconst SQL_NULL_DATA;
! %fortranconst SQL_DATA_AT_EXEC;
! %fortranconst SQL_SUCCESS;
! %fortranconst SQL_SUCCESS_WITH_INFO;
! %fortranconst SQL_NO_DATA;
! %fortranconst SQL_ERROR;
! %fortranconst SQL_INVALID_HANDLE;
! %fortranconst SQL_STILL_EXECUTING;
! %fortranconst SQL_NEED_DATA;
! %fortranconst SQL_PARAM_DATA_AVAILABLE;
! %fortranconst SQL_NTS;
! %fortranconst SQL_NTSL;
! %fortranconst SQL_MAX_MESSAGE_LENGTH;
! %fortranconst SQL_DATE_LEN;
! %fortranconst SQL_TIME_LEN;
! %fortranconst SQL_TIMESTAMP_LEN;
! %fortranconst SQL_ATTR_OUTPUT_NTS;
! %fortranconst SQL_ATTR_AUTO_IPD;
! %fortranconst SQL_ATTR_METADATA_ID;
! %fortranconst SQL_ATTR_APP_ROW_DESC;
! %fortranconst SQL_ATTR_APP_PARAM_DESC;
! %fortranconst SQL_ATTR_IMP_ROW_DESC;
! %fortranconst SQL_ATTR_IMP_PARAM_DESC;
! %fortranconst SQL_ATTR_CURSOR_SCROLLABLE;
! %fortranconst SQL_ATTR_CURSOR_SENSITIVITY;
! %fortranconst SQL_NONSCROLLABLE;
! %fortranconst SQL_SCROLLABLE;
! %fortranconst SQL_DESC_COUNT;
! %fortranconst SQL_DESC_TYPE;
! %fortranconst SQL_DESC_LENGTH;
! %fortranconst SQL_DESC_OCTET_LENGTH_PTR;
! %fortranconst SQL_DESC_PRECISION;
! %fortranconst SQL_DESC_SCALE;
! %fortranconst SQL_DESC_DATETIME_INTERVAL_CODE;
! %fortranconst SQL_DESC_NULLABLE;
! %fortranconst SQL_DESC_INDICATOR_PTR;
! %fortranconst SQL_DESC_DATA_PTR;
! %fortranconst SQL_DESC_NAME;
! %fortranconst SQL_DESC_UNNAMED;
! %fortranconst SQL_DESC_OCTET_LENGTH;
! %fortranconst SQL_DESC_ALLOC_TYPE;
! %fortranconst SQL_DIAG_RETURNCODE;
! %fortranconst SQL_DIAG_NUMBER;
! %fortranconst SQL_DIAG_ROW_COUNT;
! %fortranconst SQL_DIAG_SQLSTATE;
! %fortranconst SQL_DIAG_NATIVE;
! %fortranconst SQL_DIAG_MESSAGE_TEXT;
! %fortranconst SQL_DIAG_DYNAMIC_FUNCTION;
! %fortranconst SQL_DIAG_CLASS_ORIGIN;
! %fortranconst SQL_DIAG_SUBCLASS_ORIGIN;
! %fortranconst SQL_DIAG_CONNECTION_NAME;
! %fortranconst SQL_DIAG_SERVER_NAME;
! %fortranconst SQL_DIAG_DYNAMIC_FUNCTION_CODE;
! %fortranconst SQL_DIAG_ALTER_DOMAIN;
! %fortranconst SQL_DIAG_ALTER_TABLE;
! %fortranconst SQL_DIAG_CALL;
! %fortranconst SQL_DIAG_CREATE_ASSERTION;
! %fortranconst SQL_DIAG_CREATE_CHARACTER_SET;
! %fortranconst SQL_DIAG_CREATE_COLLATION;
! %fortranconst SQL_DIAG_CREATE_DOMAIN;
! %fortranconst SQL_DIAG_CREATE_INDEX;
! %fortranconst SQL_DIAG_CREATE_SCHEMA;
! %fortranconst SQL_DIAG_CREATE_TABLE;
! %fortranconst SQL_DIAG_CREATE_TRANSLATION;
! %fortranconst SQL_DIAG_CREATE_VIEW;
! %fortranconst SQL_DIAG_DELETE_WHERE;
! %fortranconst SQL_DIAG_DROP_ASSERTION;
! %fortranconst SQL_DIAG_DROP_CHARACTER_SET;
! %fortranconst SQL_DIAG_DROP_COLLATION;
! %fortranconst SQL_DIAG_DROP_DOMAIN;
! %fortranconst SQL_DIAG_DROP_INDEX;
! %fortranconst SQL_DIAG_DROP_SCHEMA;
! %fortranconst SQL_DIAG_DROP_TABLE;
! %fortranconst SQL_DIAG_DROP_TRANSLATION;
! %fortranconst SQL_DIAG_DROP_VIEW;
! %fortranconst SQL_DIAG_DYNAMIC_DELETE_CURSOR;
! %fortranconst SQL_DIAG_DYNAMIC_UPDATE_CURSOR;
! %fortranconst SQL_DIAG_GRANT;
! %fortranconst SQL_DIAG_INSERT;
! %fortranconst SQL_DIAG_REVOKE;
! %fortranconst SQL_DIAG_SELECT_CURSOR;
! %fortranconst SQL_DIAG_UNKNOWN_STATEMENT;
! %fortranconst SQL_DIAG_UPDATE_WHERE;
! %fortranconst SQL_UNKNOWN_TYPE;
! %fortranconst SQL_CHAR;
! %fortranconst SQL_NUMERIC;
! %fortranconst SQL_DECIMAL;
! %fortranconst SQL_INTEGER;
! %fortranconst SQL_SMALLINT;
! %fortranconst SQL_FLOAT;
! %fortranconst SQL_REAL;
! %fortranconst SQL_DOUBLE;
! %fortranconst SQL_DATETIME;
! %fortranconst SQL_VARCHAR;
! %fortranconst SQL_TYPE_DATE;
! %fortranconst SQL_TYPE_TIME;
! %fortranconst SQL_TYPE_TIMESTAMP;
! %fortranconst SQL_UNSPECIFIED;
! %fortranconst SQL_INSENSITIVE;
! %fortranconst SQL_SENSITIVE;
! %fortranconst SQL_ALL_TYPES;
! %fortranconst SQL_DEFAULT;
! %fortranconst SQL_ARD_TYPE;
! %fortranconst SQL_CODE_DATE;
! %fortranconst SQL_CODE_TIME;
! %fortranconst SQL_CODE_TIMESTAMP;
! %fortranconst SQL_FALSE;
! %fortranconst SQL_TRUE;
! %fortranconst SQL_NO_NULLS;
! %fortranconst SQL_NULLABLE;
! %fortranconst SQL_NULLABLE_UNKNOWN;
! %fortranconst SQL_PRED_NONE;
! %fortranconst SQL_PRED_CHAR;
! %fortranconst SQL_PRED_BASIC;
! %fortranconst SQL_NAMED;
! %fortranconst SQL_UNNAMED;
! %fortranconst SQL_DESC_ALLOC_AUTO;
! %fortranconst SQL_DESC_ALLOC_USER;
! %fortranconst SQL_CLOSE;
! %fortranconst SQL_DROP;
! %fortranconst SQL_UNBIND;
! %fortranconst SQL_RESET_PARAMS;
! %fortranconst SQL_FETCH_NEXT;
! %fortranconst SQL_FETCH_FIRST;
! %fortranconst SQL_FETCH_LAST;
! %fortranconst SQL_FETCH_PRIOR;
! %fortranconst SQL_FETCH_ABSOLUTE;
! %fortranconst SQL_FETCH_RELATIVE;
! %fortranconst SQL_COMMIT;
! %fortranconst SQL_ROLLBACK;
! %fortranconst SQL_NULL_HENV;
! %fortranconst SQL_NULL_HDBC;
! %fortranconst SQL_NULL_HSTMT;
! %fortranconst SQL_NULL_HDESC;
! %fortranconst SQL_NULL_DESC;
! %fortranconst SQL_NULL_HANDLE;
! %fortranconst SQL_SCOPE_CURROW;
! %fortranconst SQL_SCOPE_TRANSACTION;
! %fortranconst SQL_SCOPE_SESSION;
! %fortranconst SQL_PC_UNKNOWN;
! %fortranconst SQL_PC_NON_PSEUDO;
! %fortranconst SQL_PC_PSEUDO;
! %fortranconst SQL_ROW_IDENTIFIER;
! %fortranconst SQL_INDEX_UNIQUE;
! %fortranconst SQL_INDEX_ALL;
! %fortranconst SQL_INDEX_CLUSTERED;
! %fortranconst SQL_INDEX_HASHED;
! %fortranconst SQL_INDEX_OTHER;
! %fortranconst SQL_API_SQLALLOCCONNECT;
! %fortranconst SQL_API_SQLALLOCENV;
! %fortranconst SQL_API_SQLALLOCHANDLE;
! %fortranconst SQL_API_SQLALLOCSTMT;
! %fortranconst SQL_API_SQLBINDCOL;
! %fortranconst SQL_API_SQLBINDPARAM;
! %fortranconst SQL_API_SQLCANCEL;
! %fortranconst SQL_API_SQLCLOSECURSOR;
! %fortranconst SQL_API_SQLCOLATTRIBUTE;
! %fortranconst SQL_API_SQLCOLUMNS;
! %fortranconst SQL_API_SQLCONNECT;
! %fortranconst SQL_API_SQLCOPYDESC;
! %fortranconst SQL_API_SQLDATASOURCES;
! %fortranconst SQL_API_SQLDESCRIBECOL;
! %fortranconst SQL_API_SQLDISCONNECT;
! %fortranconst SQL_API_SQLENDTRAN;
! %fortranconst SQL_API_SQLERROR;
! %fortranconst SQL_API_SQLEXECDIRECT;
! %fortranconst SQL_API_SQLEXECUTE;
! %fortranconst SQL_API_SQLFETCH;
! %fortranconst SQL_API_SQLFETCHSCROLL;
! %fortranconst SQL_API_SQLFREECONNECT;
! %fortranconst SQL_API_SQLFREEENV;
! %fortranconst SQL_API_SQLFREEHANDLE;
! %fortranconst SQL_API_SQLFREESTMT;
! %fortranconst SQL_API_SQLGETCONNECTATTR;
! %fortranconst SQL_API_SQLGETCONNECTOPTION;
! %fortranconst SQL_API_SQLGETCURSORNAME;
! %fortranconst SQL_API_SQLGETDATA;
! %fortranconst SQL_API_SQLGETDESCFIELD;
! %fortranconst SQL_API_SQLGETDESCREC;
! %fortranconst SQL_API_SQLGETDIAGFIELD;
! %fortranconst SQL_API_SQLGETDIAGREC;
! %fortranconst SQL_API_SQLGETENVATTR;
! %fortranconst SQL_API_SQLGETFUNCTIONS;
! %fortranconst SQL_API_SQLGETINFO;
! %fortranconst SQL_API_SQLGETSTMTATTR;
! %fortranconst SQL_API_SQLGETSTMTOPTION;
! %fortranconst SQL_API_SQLGETTYPEINFO;
! %fortranconst SQL_API_SQLNUMRESULTCOLS;
! %fortranconst SQL_API_SQLPARAMDATA;
! %fortranconst SQL_API_SQLPREPARE;
! %fortranconst SQL_API_SQLPUTDATA;
! %fortranconst SQL_API_SQLROWCOUNT;
! %fortranconst SQL_API_SQLSETCONNECTATTR;
! %fortranconst SQL_API_SQLSETCONNECTOPTION;
! %fortranconst SQL_API_SQLSETCURSORNAME;
! %fortranconst SQL_API_SQLSETDESCFIELD;
! %fortranconst SQL_API_SQLSETDESCREC;
! %fortranconst SQL_API_SQLSETENVATTR;
! %fortranconst SQL_API_SQLSETPARAM;
! %fortranconst SQL_API_SQLSETSTMTATTR;
! %fortranconst SQL_API_SQLSETSTMTOPTION;
! %fortranconst SQL_API_SQLSPECIALCOLUMNS;
! %fortranconst SQL_API_SQLSTATISTICS;
! %fortranconst SQL_API_SQLTABLES;
! %fortranconst SQL_API_SQLTRANSACT;
! %fortranconst SQL_API_SQLCANCELHANDLE;
! %fortranconst SQL_MAX_DRIVER_CONNECTIONS;
! %fortranconst SQL_MAXIMUM_DRIVER_CONNECTIONS;
! %fortranconst SQL_MAX_CONCURRENT_ACTIVITIES;
! %fortranconst SQL_MAXIMUM_CONCURRENT_ACTIVITIES;
! %fortranconst SQL_DATA_SOURCE_NAME;
! %fortranconst SQL_FETCH_DIRECTION;
! %fortranconst SQL_SERVER_NAME;
! %fortranconst SQL_SEARCH_PATTERN_ESCAPE;
! %fortranconst SQL_DBMS_NAME;
! %fortranconst SQL_DBMS_VER;
! %fortranconst SQL_ACCESSIBLE_TABLES;
! %fortranconst SQL_ACCESSIBLE_PROCEDURES;
! %fortranconst SQL_CURSOR_COMMIT_BEHAVIOR;
! %fortranconst SQL_DATA_SOURCE_READ_ONLY;
! %fortranconst SQL_DEFAULT_TXN_ISOLATION;
! %fortranconst SQL_IDENTIFIER_CASE;
! %fortranconst SQL_IDENTIFIER_QUOTE_CHAR;
! %fortranconst SQL_MAX_COLUMN_NAME_LEN;
! %fortranconst SQL_MAXIMUM_COLUMN_NAME_LENGTH;
! %fortranconst SQL_MAX_CURSOR_NAME_LEN;
! %fortranconst SQL_MAXIMUM_CURSOR_NAME_LENGTH;
! %fortranconst SQL_MAX_SCHEMA_NAME_LEN;
! %fortranconst SQL_MAXIMUM_SCHEMA_NAME_LENGTH;
! %fortranconst SQL_MAX_CATALOG_NAME_LEN;
! %fortranconst SQL_MAXIMUM_CATALOG_NAME_LENGTH;
! %fortranconst SQL_MAX_TABLE_NAME_LEN;
! %fortranconst SQL_SCROLL_CONCURRENCY;
! %fortranconst SQL_TXN_CAPABLE;
! %fortranconst SQL_TRANSACTION_CAPABLE;
! %fortranconst SQL_USER_NAME;
! %fortranconst SQL_TXN_ISOLATION_OPTION;
! %fortranconst SQL_TRANSACTION_ISOLATION_OPTION;
! %fortranconst SQL_INTEGRITY;
! %fortranconst SQL_GETDATA_EXTENSIONS;
! %fortranconst SQL_NULL_COLLATION;
! %fortranconst SQL_ALTER_TABLE;
! %fortranconst SQL_ORDER_BY_COLUMNS_IN_SELECT;
! %fortranconst SQL_SPECIAL_CHARACTERS;
! %fortranconst SQL_MAX_COLUMNS_IN_GROUP_BY;
! %fortranconst SQL_MAXIMUM_COLUMNS_IN_GROUP_BY;
! %fortranconst SQL_MAX_COLUMNS_IN_INDEX;
! %fortranconst SQL_MAXIMUM_COLUMNS_IN_INDEX;
! %fortranconst SQL_MAX_COLUMNS_IN_ORDER_BY;
! %fortranconst SQL_MAXIMUM_COLUMNS_IN_ORDER_BY;
! %fortranconst SQL_MAX_COLUMNS_IN_SELECT;
! %fortranconst SQL_MAXIMUM_COLUMNS_IN_SELECT;
! %fortranconst SQL_MAX_COLUMNS_IN_TABLE;
! %fortranconst SQL_MAX_INDEX_SIZE;
! %fortranconst SQL_MAXIMUM_INDEX_SIZE;
! %fortranconst SQL_MAX_ROW_SIZE;
! %fortranconst SQL_MAXIMUM_ROW_SIZE;
! %fortranconst SQL_MAX_STATEMENT_LEN;
! %fortranconst SQL_MAXIMUM_STATEMENT_LENGTH;
! %fortranconst SQL_MAX_TABLES_IN_SELECT;
! %fortranconst SQL_MAXIMUM_TABLES_IN_SELECT;
! %fortranconst SQL_MAX_USER_NAME_LEN;
! %fortranconst SQL_MAXIMUM_USER_NAME_LENGTH;
! %fortranconst SQL_OJ_CAPABILITIES;
! %fortranconst SQL_OUTER_JOIN_CAPABILITIES;
! %fortranconst SQL_XOPEN_CLI_YEAR;
! %fortranconst SQL_CURSOR_SENSITIVITY;
! %fortranconst SQL_DESCRIBE_PARAMETER;
! %fortranconst SQL_CATALOG_NAME;
! %fortranconst SQL_COLLATION_SEQ;
! %fortranconst SQL_MAX_IDENTIFIER_LEN;
! %fortranconst SQL_MAXIMUM_IDENTIFIER_LENGTH;
! %fortranconst SQL_AT_ADD_COLUMN;
! %fortranconst SQL_AT_DROP_COLUMN;
! %fortranconst SQL_AT_ADD_CONSTRAINT;
! %fortranconst SQL_AM_NONE;
! %fortranconst SQL_AM_CONNECTION;
! %fortranconst SQL_AM_STATEMENT;
! %fortranconst SQL_CB_DELETE;
! %fortranconst SQL_CB_CLOSE;
! %fortranconst SQL_CB_PRESERVE;
! %fortranconst SQL_FD_FETCH_NEXT;
! %fortranconst SQL_FD_FETCH_FIRST;
! %fortranconst SQL_FD_FETCH_LAST;
! %fortranconst SQL_FD_FETCH_PRIOR;
! %fortranconst SQL_FD_FETCH_ABSOLUTE;
! %fortranconst SQL_FD_FETCH_RELATIVE;
! %fortranconst SQL_GD_ANY_COLUMN;
! %fortranconst SQL_GD_ANY_ORDER;
! %fortranconst SQL_IC_UPPER;
! %fortranconst SQL_IC_LOWER;
! %fortranconst SQL_IC_SENSITIVE;
! %fortranconst SQL_IC_MIXED;
! %fortranconst SQL_OJ_LEFT;
! %fortranconst SQL_OJ_RIGHT;
! %fortranconst SQL_OJ_FULL;
! %fortranconst SQL_OJ_NESTED;
! %fortranconst SQL_OJ_NOT_ORDERED;
! %fortranconst SQL_OJ_INNER;
! %fortranconst SQL_OJ_ALL_COMPARISON_OPS;
! %fortranconst SQL_SCCO_READ_ONLY;
! %fortranconst SQL_SCCO_LOCK;
! %fortranconst SQL_SCCO_OPT_ROWVER;
! %fortranconst SQL_SCCO_OPT_VALUES;
! %fortranconst SQL_TC_NONE;
! %fortranconst SQL_TC_DML;
! %fortranconst SQL_TC_ALL;
! %fortranconst SQL_TC_DDL_COMMIT;
! %fortranconst SQL_TC_DDL_IGNORE;
! %fortranconst SQL_TXN_READ_UNCOMMITTED;
! %fortranconst SQL_TRANSACTION_READ_UNCOMMITTED;
! %fortranconst SQL_TXN_READ_COMMITTED;
! %fortranconst SQL_TRANSACTION_READ_COMMITTED;
! %fortranconst SQL_TXN_REPEATABLE_READ;
! %fortranconst SQL_TRANSACTION_REPEATABLE_READ;
! %fortranconst SQL_TXN_SERIALIZABLE;
! %fortranconst SQL_TRANSACTION_SERIALIZABLE;
! %fortranconst SQL_NC_HIGH;
! %fortranconst SQL_NC_LOW;

! %apply short {int SQLTables_TABLE_CATALOG};
! %apply short {int SQLTables_TABLE_SCHEM};
! %apply short {int SQLTables_TABLE_NAME};
! %apply short {int SQLTables_TABLE_TYPE};
! %apply short {int SQLTables_REMARKS};
! %apply short {int SQLColumns_TABLE_CAT};
! %apply short {int SQLColumns_TABLE_SCHEM};
! %apply short {int SQLColumns_TABLE_NAME};
! %apply short {int SQLColumns_COLUMN_NAME};
! %apply short {int SQLColumns_DATA_TYPE};
! %apply short {int SQLColumns_TYPE_NAME};
! %apply short {int SQLColumns_COLUMN_SIZE};
! %apply short {int SQLColumns_BUFFER_LENGTH};
! %apply short {int SQLColumns_DECIMAL_DIGITS};
! %apply short {int SQLColumns_NUM_PREC_RADIX};
! %apply short {int SQLColumns_NULLABLE};
! %apply short {int SQLColumns_REMARKS};
! %apply short {int SQLColumns_COLUMN_DEF};
! %apply short {int SQLColumns_SQL_DATA_TYPE};
! %apply short {int SQLColumns_SQL_DATETIME_SUB};
! %apply short {int SQLColumns_CHAR_OCTET_LENGTH};
! %apply short {int SQLColumns_ORDINAL_POSITION};
! %apply short {int SQLColumns_IS_NULLABLE};
! %apply short {int SQL_SPEC_MAJOR};
! %apply short {int SQL_SPEC_MINOR};
! %apply short {int SQL_SQLSTATE_SIZE};
! %apply short {int SQL_MAX_DSN_LENGTH};
! %apply short {int SQL_MAX_OPTION_STRING_LENGTH};
! %apply short {int SQL_HANDLE_SENV};
! %apply short {int SQL_ATTR_ODBC_VERSION};
! %apply short {int SQL_ATTR_CONNECTION_POOLING};
! %apply short {int SQL_ATTR_CP_MATCH};
! %apply short {int SQL_ATTR_UNIXODBC_SYSPATH};
! %apply short {int SQL_ATTR_UNIXODBC_VERSION};
! %apply short {int SQL_ATTR_UNIXODBC_ENVATTR};
! %apply short {int SQL_CP_OFF};
! %apply short {int SQL_CP_ONE_PER_DRIVER};
! %apply short {int SQL_CP_ONE_PER_HENV};
! %apply short {int SQL_CP_DEFAULT};
! %apply short {int SQL_CP_STRICT_MATCH};
! %apply short {int SQL_CP_RELAXED_MATCH};
! %apply short {int SQL_CP_MATCH_DEFAULT};
! %apply short {int SQL_OV_ODBC2};
! %apply short {int SQL_OV_ODBC3};
! %apply short {int SQL_OV_ODBC3_80};
! %apply short {int SQL_ACCESS_MODE};
! %apply short {int SQL_AUTOCOMMIT};
! %apply short {int SQL_LOGIN_TIMEOUT};
! %apply short {int SQL_OPT_TRACE};
! %apply short {int SQL_OPT_TRACEFILE};
! %apply short {int SQL_TRANSLATE_DLL};
! %apply short {int SQL_TRANSLATE_OPTION};
! %apply short {int SQL_TXN_ISOLATION};
! %apply short {int SQL_CURRENT_QUALIFIER};
! %apply short {int SQL_ODBC_CURSORS};
! %apply short {int SQL_QUIET_MODE};
! %apply short {int SQL_PACKET_SIZE};
! %apply short {int SQL_ATTR_ACCESS_MODE};
! %apply short {int SQL_ATTR_AUTOCOMMIT};
! %apply short {int SQL_ATTR_CONNECTION_TIMEOUT};
! %apply short {int SQL_ATTR_CURRENT_CATALOG};
! %apply short {int SQL_ATTR_DISCONNECT_BEHAVIOR};
! %apply short {int SQL_ATTR_ENLIST_IN_DTC};
! %apply short {int SQL_ATTR_ENLIST_IN_XA};
! %apply short {int SQL_ATTR_LOGIN_TIMEOUT};
! %apply short {int SQL_ATTR_ODBC_CURSORS};
! %apply short {int SQL_ATTR_PACKET_SIZE};
! %apply short {int SQL_ATTR_QUIET_MODE};
! %apply short {int SQL_ATTR_TRACE};
! %apply short {int SQL_ATTR_TRACEFILE};
! %apply short {int SQL_ATTR_TRANSLATE_LIB};
! %apply short {int SQL_ATTR_TRANSLATE_OPTION};
! %apply short {int SQL_ATTR_TXN_ISOLATION};
! %apply short {int SQL_ATTR_CONNECTION_DEAD};
! %apply short {int SQL_ATTR_DRIVER_THREADING};
! %apply short {int SQL_ATTR_ANSI_APP};
! %apply short {int SQL_ATTR_RESET_CONNECTION};
! %apply short {int SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE};
! %apply short {int SQL_MODE_READ_WRITE};
! %apply short {int SQL_MODE_READ_ONLY};
! %apply short {int SQL_MODE_DEFAULT};
! %apply short {int SQL_AUTOCOMMIT_OFF};
! %apply short {int SQL_AUTOCOMMIT_ON};
! %apply short {int SQL_AUTOCOMMIT_DEFAULT};
! %apply short {int SQL_LOGIN_TIMEOUT_DEFAULT};
! %apply short {int SQL_OPT_TRACE_OFF};
! %apply short {int SQL_OPT_TRACE_ON};
! %apply short {int SQL_OPT_TRACE_DEFAULT};
! %apply short {int SQL_CUR_USE_IF_NEEDED};
! %apply short {int SQL_CUR_USE_ODBC};
! %apply short {int SQL_CUR_USE_DRIVER};
! %apply short {int SQL_CUR_DEFAULT};
! %apply short {int SQL_DB_RETURN_TO_POOL};
! %apply short {int SQL_DB_DISCONNECT};
! %apply short {int SQL_DB_DEFAULT};
! %apply short {int SQL_DTC_DONE};
! %apply short {int SQL_CD_TRUE};
! %apply short {int SQL_CD_FALSE};
! %apply short {int SQL_AA_TRUE};
! %apply short {int SQL_AA_FALSE};
! %apply short {int SQL_RESET_CONNECTION_YES};
! %apply short {int SQL_ASYNC_DBC_ENABLE_ON};
! %apply short {int SQL_ASYNC_DBC_ENABLE_OFF};
! %apply short {int SQL_ASYNC_DBC_ENABLE_DEFAULT};
! %apply short {int SQL_QUERY_TIMEOUT};
! %apply short {int SQL_MAX_ROWS};
! %apply short {int SQL_NOSCAN};
! %apply short {int SQL_MAX_LENGTH};
! %apply short {int SQL_ASYNC_ENABLE};
! %apply short {int SQL_BIND_TYPE};
! %apply short {int SQL_CURSOR_TYPE};
! %apply short {int SQL_CONCURRENCY};
! %apply short {int SQL_KEYSET_SIZE};
! %apply short {int SQL_ROWSET_SIZE};
! %apply short {int SQL_SIMULATE_CURSOR};
! %apply short {int SQL_RETRIEVE_DATA};
! %apply short {int SQL_USE_BOOKMARKS};
! %apply short {int SQL_GET_BOOKMARK};
! %apply short {int SQL_ROW_NUMBER};
! %apply short {int SQL_ATTR_ASYNC_ENABLE};
! %apply short {int SQL_ATTR_CONCURRENCY};
! %apply short {int SQL_ATTR_CURSOR_TYPE};
! %apply short {int SQL_ATTR_ENABLE_AUTO_IPD};
! %apply short {int SQL_ATTR_FETCH_BOOKMARK_PTR};
! %apply short {int SQL_ATTR_KEYSET_SIZE};
! %apply short {int SQL_ATTR_MAX_LENGTH};
! %apply short {int SQL_ATTR_MAX_ROWS};
! %apply short {int SQL_ATTR_NOSCAN};
! %apply short {int SQL_ATTR_PARAM_BIND_OFFSET_PTR};
! %apply short {int SQL_ATTR_PARAM_BIND_TYPE};
! %apply short {int SQL_ATTR_PARAM_OPERATION_PTR};
! %apply short {int SQL_ATTR_PARAM_STATUS_PTR};
! %apply short {int SQL_ATTR_PARAMS_PROCESSED_PTR};
! %apply short {int SQL_ATTR_PARAMSET_SIZE};
! %apply short {int SQL_ATTR_QUERY_TIMEOUT};
! %apply short {int SQL_ATTR_RETRIEVE_DATA};
! %apply short {int SQL_ATTR_ROW_BIND_OFFSET_PTR};
! %apply short {int SQL_ATTR_ROW_BIND_TYPE};
! %apply short {int SQL_ATTR_ROW_NUMBER};
! %apply short {int SQL_ATTR_ROW_OPERATION_PTR};
! %apply short {int SQL_ATTR_ROW_STATUS_PTR};
! %apply short {int SQL_ATTR_ROWS_FETCHED_PTR};
! %apply short {int SQL_ATTR_ROW_ARRAY_SIZE};
! %apply short {int SQL_ATTR_SIMULATE_CURSOR};
! %apply short {int SQL_ATTR_USE_BOOKMARKS};
! %apply short {int SQL_ATTR_ASYNC_STMT_EVENT};
! %apply short {int SQL_IS_POINTER};
! %apply short {int SQL_IS_UINTEGER};
! %apply short {int SQL_IS_INTEGER};
! %apply short {int SQL_IS_USMALLINT};
! %apply short {int SQL_IS_SMALLINT};
! %apply short {int SQL_PARAM_BIND_BY_COLUMN};
! %apply short {int SQL_PARAM_BIND_TYPE_DEFAULT};
! %apply short {int SQL_QUERY_TIMEOUT_DEFAULT};
! %apply short {int SQL_MAX_ROWS_DEFAULT};
! %apply short {int SQL_NOSCAN_OFF};
! %apply short {int SQL_NOSCAN_ON};
! %apply short {int SQL_NOSCAN_DEFAULT};
! %apply short {int SQL_MAX_LENGTH_DEFAULT};
! %apply short {int SQL_ASYNC_ENABLE_OFF};
! %apply short {int SQL_ASYNC_ENABLE_ON};
! %apply short {int SQL_ASYNC_ENABLE_DEFAULT};
! %apply short {int SQL_BIND_BY_COLUMN};
! %apply short {int SQL_BIND_TYPE_DEFAULT};
! %apply short {int SQL_CONCUR_READ_ONLY};
! %apply short {int SQL_CONCUR_LOCK};
! %apply short {int SQL_CONCUR_ROWVER};
! %apply short {int SQL_CONCUR_VALUES};
! %apply short {int SQL_CONCUR_DEFAULT};
! %apply short {int SQL_CURSOR_FORWARD_ONLY};
! %apply short {int SQL_CURSOR_KEYSET_DRIVEN};
! %apply short {int SQL_CURSOR_DYNAMIC};
! %apply short {int SQL_CURSOR_STATIC};
! %apply short {int SQL_CURSOR_TYPE_DEFAULT};
! %apply short {int SQL_ROWSET_SIZE_DEFAULT};
! %apply short {int SQL_KEYSET_SIZE_DEFAULT};
! %apply short {int SQL_SC_NON_UNIQUE};
! %apply short {int SQL_SC_TRY_UNIQUE};
! %apply short {int SQL_SC_UNIQUE};
! %apply short {int SQL_RD_OFF};
! %apply short {int SQL_RD_ON};
! %apply short {int SQL_RD_DEFAULT};
! %apply short {int SQL_UB_OFF};
! %apply short {int SQL_UB_ON};
! %apply short {int SQL_UB_DEFAULT};
! %apply short {int SQL_UB_FIXED};
! %apply short {int SQL_UB_VARIABLE};
! %apply short {int SQL_DESC_ARRAY_SIZE};
! %apply short {int SQL_DESC_ARRAY_STATUS_PTR};
! %apply short {int SQL_DESC_BASE_COLUMN_NAME};
! %apply short {int SQL_DESC_BASE_TABLE_NAME};
! %apply short {int SQL_DESC_BIND_OFFSET_PTR};
! %apply short {int SQL_DESC_BIND_TYPE};
! %apply short {int SQL_DESC_DATETIME_INTERVAL_PRECISION};
! %apply short {int SQL_DESC_LITERAL_PREFIX};
! %apply short {int SQL_DESC_LITERAL_SUFFIX};
! %apply short {int SQL_DESC_LOCAL_TYPE_NAME};
! %apply short {int SQL_DESC_MAXIMUM_SCALE};
! %apply short {int SQL_DESC_MINIMUM_SCALE};
! %apply short {int SQL_DESC_NUM_PREC_RADIX};
! %apply short {int SQL_DESC_PARAMETER_TYPE};
! %apply short {int SQL_DESC_ROWS_PROCESSED_PTR};
! %apply short {int SQL_DESC_ROWVER};
! %apply short {int SQL_DIAG_CURSOR_ROW_COUNT};
! %apply short {int SQL_DIAG_ROW_NUMBER};
! %apply short {int SQL_DIAG_COLUMN_NUMBER};
! %apply short {int SQL_DATE};
! %apply short {int SQL_INTERVAL};
! %apply short {int SQL_TIME};
! %apply short {int SQL_TIMESTAMP};
! %apply short {int SQL_LONGVARCHAR};
! %apply short {int SQL_BINARY};
! %apply short {int SQL_VARBINARY};
! %apply short {int SQL_LONGVARBINARY};
! %apply short {int SQL_BIGINT};
! %apply short {int SQL_TINYINT};
! %apply short {int SQL_BIT};
! %apply short {int SQL_GUID};
! %apply short {int SQL_CODE_YEAR};
! %apply short {int SQL_CODE_MONTH};
! %apply short {int SQL_CODE_DAY};
! %apply short {int SQL_CODE_HOUR};
! %apply short {int SQL_CODE_MINUTE};
! %apply short {int SQL_CODE_SECOND};
! %apply short {int SQL_CODE_YEAR_TO_MONTH};
! %apply short {int SQL_CODE_DAY_TO_HOUR};
! %apply short {int SQL_CODE_DAY_TO_MINUTE};
! %apply short {int SQL_CODE_DAY_TO_SECOND};
! %apply short {int SQL_CODE_HOUR_TO_MINUTE};
! %apply short {int SQL_CODE_HOUR_TO_SECOND};
! %apply short {int SQL_CODE_MINUTE_TO_SECOND};
! %apply short {int SQL_INTERVAL_YEAR};
! %apply short {int SQL_INTERVAL_MONTH};
! %apply short {int SQL_INTERVAL_DAY};
! %apply short {int SQL_INTERVAL_HOUR};
! %apply short {int SQL_INTERVAL_MINUTE};
! %apply short {int SQL_INTERVAL_SECOND};
! %apply short {int SQL_INTERVAL_YEAR_TO_MONTH};
! %apply short {int SQL_INTERVAL_DAY_TO_HOUR};
! %apply short {int SQL_INTERVAL_DAY_TO_MINUTE};
! %apply short {int SQL_INTERVAL_DAY_TO_SECOND};
! %apply short {int SQL_INTERVAL_HOUR_TO_MINUTE};
! %apply short {int SQL_INTERVAL_HOUR_TO_SECOND};
! %apply short {int SQL_INTERVAL_MINUTE_TO_SECOND};
! %apply short {int SQL_C_DEFAULT};
! %apply short {int SQL_SIGNED_OFFSET};
! %apply short {int SQL_UNSIGNED_OFFSET};
! %apply short {int SQL_C_DATE};
! %apply short {int SQL_C_TIME};
! %apply short {int SQL_C_TIMESTAMP};
! %apply short {int SQL_C_INTERVAL_YEAR};
! %apply short {int SQL_C_INTERVAL_MONTH};
! %apply short {int SQL_C_INTERVAL_DAY};
! %apply short {int SQL_C_INTERVAL_HOUR};
! %apply short {int SQL_C_INTERVAL_MINUTE};
! %apply short {int SQL_C_INTERVAL_SECOND};
! %apply short {int SQL_C_INTERVAL_YEAR_TO_MONTH};
! %apply short {int SQL_C_INTERVAL_DAY_TO_HOUR};
! %apply short {int SQL_C_INTERVAL_DAY_TO_MINUTE};
! %apply short {int SQL_C_INTERVAL_DAY_TO_SECOND};
! %apply short {int SQL_C_INTERVAL_HOUR_TO_MINUTE};
! %apply short {int SQL_C_INTERVAL_HOUR_TO_SECOND};
! %apply short {int SQL_C_INTERVAL_MINUTE_TO_SECOND};
! %apply short {int SQL_C_BINARY};
! %apply short {int SQL_C_BIT};
! %apply short {int SQL_C_SBIGINT};
! %apply short {int SQL_C_UBIGINT};
! %apply short {int SQL_C_TINYINT};
! %apply short {int SQL_C_STINYINT};
! %apply short {int SQL_C_UTINYINT};
! %apply short {int SQL_C_GUID};
! %apply short {int SQL_TYPE_NULL};
! %apply short {int SQL_DRIVER_C_TYPE_BASE};
! %apply short {int SQL_DRIVER_SQL_TYPE_BASE};
! %apply short {int SQL_DRIVER_DESC_FIELD_BASE};
! %apply short {int SQL_DRIVER_DIAG_FIELD_BASE};
! %apply short {int SQL_DRIVER_INFO_TYPE_BASE};
! %apply short {int SQL_DRIVER_CONN_ATTR_BASE};
! %apply short {int SQL_DRIVER_STMT_ATTR_BASE};
! %apply short {int SQL_C_VARBOOKMARK};
! %apply short {int SQL_NO_ROW_NUMBER};
! %apply short {int SQL_NO_COLUMN_NUMBER};
! %apply short {int SQL_ROW_NUMBER_UNKNOWN};
! %apply short {int SQL_COLUMN_NUMBER_UNKNOWN};
! %apply short {int SQL_DEFAULT_PARAM};
! %apply short {int SQL_IGNORE};
! %apply short {int SQL_COLUMN_IGNORE};
! %apply short {int SQL_LEN_DATA_AT_EXEC_OFFSET};
! %apply short {int SQL_LEN_BINARY_ATTR_OFFSET};
! %apply short {int SQL_SETPARAM_VALUE_MAX};
! %apply short {int SQL_COLUMN_COUNT};
! %apply short {int SQL_COLUMN_NAME};
! %apply short {int SQL_COLUMN_TYPE};
! %apply short {int SQL_COLUMN_LENGTH};
! %apply short {int SQL_COLUMN_PRECISION};
! %apply short {int SQL_COLUMN_SCALE};
! %apply short {int SQL_COLUMN_DISPLAY_SIZE};
! %apply short {int SQL_COLUMN_NULLABLE};
! %apply short {int SQL_COLUMN_UNSIGNED};
! %apply short {int SQL_COLUMN_MONEY};
! %apply short {int SQL_COLUMN_UPDATABLE};
! %apply short {int SQL_COLUMN_AUTO_INCREMENT};
! %apply short {int SQL_COLUMN_CASE_SENSITIVE};
! %apply short {int SQL_COLUMN_SEARCHABLE};
! %apply short {int SQL_COLUMN_TYPE_NAME};
! %apply short {int SQL_COLUMN_TABLE_NAME};
! %apply short {int SQL_COLUMN_OWNER_NAME};
! %apply short {int SQL_COLUMN_QUALIFIER_NAME};
! %apply short {int SQL_COLUMN_LABEL};
! %apply short {int SQL_COLATT_OPT_MAX};
! %apply short {int SQL_COLATT_OPT_MIN};
! %apply short {int SQL_ATTR_READONLY};
! %apply short {int SQL_ATTR_WRITE};
! %apply short {int SQL_ATTR_READWRITE_UNKNOWN};
! %apply short {int SQL_UNSEARCHABLE};
! %apply short {int SQL_LIKE_ONLY};
! %apply short {int SQL_ALL_EXCEPT_LIKE};
! %apply short {int SQL_SEARCHABLE};
! %apply short {int SQL_PRED_SEARCHABLE};
! %apply short {int SQL_NO_TOTAL};
! %apply short {int SQL_API_SQLALLOCHANDLESTD};
! %apply short {int SQL_API_SQLBULKOPERATIONS};
! %apply short {int SQL_API_SQLBINDPARAMETER};
! %apply short {int SQL_API_SQLBROWSECONNECT};
! %apply short {int SQL_API_SQLCOLATTRIBUTES};
! %apply short {int SQL_API_SQLCOLUMNPRIVILEGES};
! %apply short {int SQL_API_SQLDESCRIBEPARAM};
! %apply short {int SQL_API_SQLDRIVERCONNECT};
! %apply short {int SQL_API_SQLDRIVERS};
! %apply short {int SQL_API_SQLEXTENDEDFETCH};
! %apply short {int SQL_API_SQLFOREIGNKEYS};
! %apply short {int SQL_API_SQLMORERESULTS};
! %apply short {int SQL_API_SQLNATIVESQL};
! %apply short {int SQL_API_SQLNUMPARAMS};
! %apply short {int SQL_API_SQLPARAMOPTIONS};
! %apply short {int SQL_API_SQLPRIMARYKEYS};
! %apply short {int SQL_API_SQLPROCEDURECOLUMNS};
! %apply short {int SQL_API_SQLPROCEDURES};
! %apply short {int SQL_API_SQLSETPOS};
! %apply short {int SQL_API_SQLSETSCROLLOPTIONS};
! %apply short {int SQL_API_SQLTABLEPRIVILEGES};
! %apply short {int SQL_API_ALL_FUNCTIONS};
! %apply short {int SQL_API_LOADBYORDINAL};
! %apply short {int SQL_API_ODBC3_ALL_FUNCTIONS};
! %apply short {int SQL_API_ODBC3_ALL_FUNCTIONS_SIZE};
! %apply short {int SQL_INFO_FIRST};
! %apply short {int SQL_ACTIVE_CONNECTIONS};
! %apply short {int SQL_ACTIVE_STATEMENTS};
! %apply short {int SQL_DRIVER_HDBC};
! %apply short {int SQL_DRIVER_HENV};
! %apply short {int SQL_DRIVER_HSTMT};
! %apply short {int SQL_DRIVER_NAME};
! %apply short {int SQL_DRIVER_VER};
! %apply short {int SQL_ODBC_API_CONFORMANCE};
! %apply short {int SQL_ODBC_VER};
! %apply short {int SQL_ROW_UPDATES};
! %apply short {int SQL_ODBC_SAG_CLI_CONFORMANCE};
! %apply short {int SQL_ODBC_SQL_CONFORMANCE};
! %apply short {int SQL_PROCEDURES};
! %apply short {int SQL_CONCAT_NULL_BEHAVIOR};
! %apply short {int SQL_CURSOR_ROLLBACK_BEHAVIOR};
! %apply short {int SQL_EXPRESSIONS_IN_ORDERBY};
! %apply short {int SQL_MAX_OWNER_NAME_LEN};
! %apply short {int SQL_MAX_PROCEDURE_NAME_LEN};
! %apply short {int SQL_MAX_QUALIFIER_NAME_LEN};
! %apply short {int SQL_MULT_RESULT_SETS};
! %apply short {int SQL_MULTIPLE_ACTIVE_TXN};
! %apply short {int SQL_OUTER_JOINS};
! %apply short {int SQL_OWNER_TERM};
! %apply short {int SQL_PROCEDURE_TERM};
! %apply short {int SQL_QUALIFIER_NAME_SEPARATOR};
! %apply short {int SQL_QUALIFIER_TERM};
! %apply short {int SQL_SCROLL_OPTIONS};
! %apply short {int SQL_TABLE_TERM};
! %apply short {int SQL_CONVERT_FUNCTIONS};
! %apply short {int SQL_NUMERIC_FUNCTIONS};
! %apply short {int SQL_STRING_FUNCTIONS};
! %apply short {int SQL_SYSTEM_FUNCTIONS};
! %apply short {int SQL_TIMEDATE_FUNCTIONS};
! %apply short {int SQL_CONVERT_BIGINT};
! %apply short {int SQL_CONVERT_BINARY};
! %apply short {int SQL_CONVERT_BIT};
! %apply short {int SQL_CONVERT_CHAR};
! %apply short {int SQL_CONVERT_DATE};
! %apply short {int SQL_CONVERT_DECIMAL};
! %apply short {int SQL_CONVERT_DOUBLE};
! %apply short {int SQL_CONVERT_FLOAT};
! %apply short {int SQL_CONVERT_INTEGER};
! %apply short {int SQL_CONVERT_LONGVARCHAR};
! %apply short {int SQL_CONVERT_NUMERIC};
! %apply short {int SQL_CONVERT_REAL};
! %apply short {int SQL_CONVERT_SMALLINT};
! %apply short {int SQL_CONVERT_TIME};
! %apply short {int SQL_CONVERT_TIMESTAMP};
! %apply short {int SQL_CONVERT_TINYINT};
! %apply short {int SQL_CONVERT_VARBINARY};
! %apply short {int SQL_CONVERT_VARCHAR};
! %apply short {int SQL_CONVERT_LONGVARBINARY};
! %apply short {int SQL_CONVERT_GUID};
! %apply short {int SQL_ODBC_SQL_OPT_IEF};
! %apply short {int SQL_CORRELATION_NAME};
! %apply short {int SQL_NON_NULLABLE_COLUMNS};
! %apply short {int SQL_DRIVER_HLIB};
! %apply short {int SQL_DRIVER_ODBC_VER};
! %apply short {int SQL_LOCK_TYPES};
! %apply short {int SQL_POS_OPERATIONS};
! %apply short {int SQL_POSITIONED_STATEMENTS};
! %apply short {int SQL_BOOKMARK_PERSISTENCE};
! %apply short {int SQL_STATIC_SENSITIVITY};
! %apply short {int SQL_FILE_USAGE};
! %apply short {int SQL_COLUMN_ALIAS};
! %apply short {int SQL_GROUP_BY};
! %apply short {int SQL_KEYWORDS};
! %apply short {int SQL_OWNER_USAGE};
! %apply short {int SQL_QUALIFIER_USAGE};
! %apply short {int SQL_QUOTED_IDENTIFIER_CASE};
! %apply short {int SQL_SUBQUERIES};
! %apply short {int SQL_UNION};
! %apply short {int SQL_MAX_ROW_SIZE_INCLUDES_LONG};
! %apply short {int SQL_MAX_CHAR_LITERAL_LEN};
! %apply short {int SQL_TIMEDATE_ADD_INTERVALS};
! %apply short {int SQL_TIMEDATE_DIFF_INTERVALS};
! %apply short {int SQL_NEED_LONG_DATA_LEN};
! %apply short {int SQL_MAX_BINARY_LITERAL_LEN};
! %apply short {int SQL_LIKE_ESCAPE_CLAUSE};
! %apply short {int SQL_QUALIFIER_LOCATION};
! %apply short {int SQL_ACTIVE_ENVIRONMENTS};
! %apply short {int SQL_ALTER_DOMAIN};
! %apply short {int SQL_SQL_CONFORMANCE};
! %apply short {int SQL_DATETIME_LITERALS};
! %apply short {int SQL_ASYNC_MODE};
! %apply short {int SQL_BATCH_ROW_COUNT};
! %apply short {int SQL_BATCH_SUPPORT};
! %apply short {int SQL_CATALOG_LOCATION};
! %apply short {int SQL_CATALOG_NAME_SEPARATOR};
! %apply short {int SQL_CATALOG_TERM};
! %apply short {int SQL_CATALOG_USAGE};
! %apply short {int SQL_CONVERT_WCHAR};
! %apply short {int SQL_CONVERT_INTERVAL_DAY_TIME};
! %apply short {int SQL_CONVERT_INTERVAL_YEAR_MONTH};
! %apply short {int SQL_CONVERT_WLONGVARCHAR};
! %apply short {int SQL_CONVERT_WVARCHAR};
! %apply short {int SQL_CREATE_ASSERTION};
! %apply short {int SQL_CREATE_CHARACTER_SET};
! %apply short {int SQL_CREATE_COLLATION};
! %apply short {int SQL_CREATE_DOMAIN};
! %apply short {int SQL_CREATE_SCHEMA};
! %apply short {int SQL_CREATE_TABLE};
! %apply short {int SQL_CREATE_TRANSLATION};
! %apply short {int SQL_CREATE_VIEW};
! %apply short {int SQL_DRIVER_HDESC};
! %apply short {int SQL_DROP_ASSERTION};
! %apply short {int SQL_DROP_CHARACTER_SET};
! %apply short {int SQL_DROP_COLLATION};
! %apply short {int SQL_DROP_DOMAIN};
! %apply short {int SQL_DROP_SCHEMA};
! %apply short {int SQL_DROP_TABLE};
! %apply short {int SQL_DROP_TRANSLATION};
! %apply short {int SQL_DROP_VIEW};
! %apply short {int SQL_DYNAMIC_CURSOR_ATTRIBUTES1};
! %apply short {int SQL_DYNAMIC_CURSOR_ATTRIBUTES2};
! %apply short {int SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES1};
! %apply short {int SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES2};
! %apply short {int SQL_INDEX_KEYWORDS};
! %apply short {int SQL_INFO_SCHEMA_VIEWS};
! %apply short {int SQL_KEYSET_CURSOR_ATTRIBUTES1};
! %apply short {int SQL_KEYSET_CURSOR_ATTRIBUTES2};
! %apply short {int SQL_MAX_ASYNC_CONCURRENT_STATEMENTS};
! %apply short {int SQL_ODBC_INTERFACE_CONFORMANCE};
! %apply short {int SQL_PARAM_ARRAY_ROW_COUNTS};
! %apply short {int SQL_PARAM_ARRAY_SELECTS};
! %apply short {int SQL_SCHEMA_TERM};
! %apply short {int SQL_SCHEMA_USAGE};
! %apply short {int SQL_SQL92_DATETIME_FUNCTIONS};
! %apply short {int SQL_SQL92_FOREIGN_KEY_DELETE_RULE};
! %apply short {int SQL_SQL92_FOREIGN_KEY_UPDATE_RULE};
! %apply short {int SQL_SQL92_GRANT};
! %apply short {int SQL_SQL92_NUMERIC_VALUE_FUNCTIONS};
! %apply short {int SQL_SQL92_PREDICATES};
! %apply short {int SQL_SQL92_RELATIONAL_JOIN_OPERATORS};
! %apply short {int SQL_SQL92_REVOKE};
! %apply short {int SQL_SQL92_ROW_VALUE_CONSTRUCTOR};
! %apply short {int SQL_SQL92_STRING_FUNCTIONS};
! %apply short {int SQL_SQL92_VALUE_EXPRESSIONS};
! %apply short {int SQL_STANDARD_CLI_CONFORMANCE};
! %apply short {int SQL_STATIC_CURSOR_ATTRIBUTES1};
! %apply short {int SQL_STATIC_CURSOR_ATTRIBUTES2};
! %apply short {int SQL_AGGREGATE_FUNCTIONS};
! %apply short {int SQL_DDL_INDEX};
! %apply short {int SQL_DM_VER};
! %apply short {int SQL_INSERT_STATEMENT};
! %apply short {int SQL_UNION_STATEMENT};
! %apply short {int SQL_ASYNC_DBC_FUNCTIONS};
! %apply short {int SQL_DRIVER_AWARE_POOLING_SUPPORTED};
! %apply short {int SQL_ASYNC_NOTIFICATION};
! %apply short {int SQL_ASYNC_NOTIFICATION_NOT_CAPABLE};
! %apply short {int SQL_ASYNC_NOTIFICATION_CAPABLE};
! %apply short {int SQL_DTC_TRANSITION_COST};
! %apply short {int SQL_AT_ADD_COLUMN_SINGLE};
! %apply short {int SQL_AT_ADD_COLUMN_DEFAULT};
! %apply short {int SQL_AT_ADD_COLUMN_COLLATION};
! %apply short {int SQL_AT_SET_COLUMN_DEFAULT};
! %apply short {int SQL_AT_DROP_COLUMN_DEFAULT};
! %apply short {int SQL_AT_DROP_COLUMN_CASCADE};
! %apply short {int SQL_AT_DROP_COLUMN_RESTRICT};
! %apply short {int SQL_AT_ADD_TABLE_CONSTRAINT};
! %apply short {int SQL_AT_DROP_TABLE_CONSTRAINT_CASCADE};
! %apply short {int SQL_AT_DROP_TABLE_CONSTRAINT_RESTRICT};
! %apply short {int SQL_AT_CONSTRAINT_NAME_DEFINITION};
! %apply short {int SQL_AT_CONSTRAINT_INITIALLY_DEFERRED};
! %apply short {int SQL_AT_CONSTRAINT_INITIALLY_IMMEDIATE};
! %apply short {int SQL_AT_CONSTRAINT_DEFERRABLE};
! %apply short {int SQL_AT_CONSTRAINT_NON_DEFERRABLE};
! %apply short {int SQL_CVT_CHAR};
! %apply short {int SQL_CVT_NUMERIC};
! %apply short {int SQL_CVT_DECIMAL};
! %apply short {int SQL_CVT_INTEGER};
! %apply short {int SQL_CVT_SMALLINT};
! %apply short {int SQL_CVT_FLOAT};
! %apply short {int SQL_CVT_REAL};
! %apply short {int SQL_CVT_DOUBLE};
! %apply short {int SQL_CVT_VARCHAR};
! %apply short {int SQL_CVT_LONGVARCHAR};
! %apply short {int SQL_CVT_BINARY};
! %apply short {int SQL_CVT_VARBINARY};
! %apply short {int SQL_CVT_BIT};
! %apply short {int SQL_CVT_TINYINT};
! %apply short {int SQL_CVT_BIGINT};
! %apply short {int SQL_CVT_DATE};
! %apply short {int SQL_CVT_TIME};
! %apply short {int SQL_CVT_TIMESTAMP};
! %apply short {int SQL_CVT_LONGVARBINARY};
! %apply short {int SQL_CVT_INTERVAL_YEAR_MONTH};
! %apply short {int SQL_CVT_INTERVAL_DAY_TIME};
! %apply short {int SQL_CVT_WCHAR};
! %apply short {int SQL_CVT_WLONGVARCHAR};
! %apply short {int SQL_CVT_WVARCHAR};
! %apply short {int SQL_CVT_GUID};
! %apply short {int SQL_FN_CVT_CONVERT};
! %apply short {int SQL_FN_CVT_CAST};
! %apply short {int SQL_FN_STR_CONCAT};
! %apply short {int SQL_FN_STR_INSERT};
! %apply short {int SQL_FN_STR_LEFT};
! %apply short {int SQL_FN_STR_LTRIM};
! %apply short {int SQL_FN_STR_LENGTH};
! %apply short {int SQL_FN_STR_LOCATE};
! %apply short {int SQL_FN_STR_LCASE};
! %apply short {int SQL_FN_STR_REPEAT};
! %apply short {int SQL_FN_STR_REPLACE};
! %apply short {int SQL_FN_STR_RIGHT};
! %apply short {int SQL_FN_STR_RTRIM};
! %apply short {int SQL_FN_STR_SUBSTRING};
! %apply short {int SQL_FN_STR_UCASE};
! %apply short {int SQL_FN_STR_ASCII};
! %apply short {int SQL_FN_STR_CHAR};
! %apply short {int SQL_FN_STR_DIFFERENCE};
! %apply short {int SQL_FN_STR_LOCATE_2};
! %apply short {int SQL_FN_STR_SOUNDEX};
! %apply short {int SQL_FN_STR_SPACE};
! %apply short {int SQL_FN_STR_BIT_LENGTH};
! %apply short {int SQL_FN_STR_CHAR_LENGTH};
! %apply short {int SQL_FN_STR_CHARACTER_LENGTH};
! %apply short {int SQL_FN_STR_OCTET_LENGTH};
! %apply short {int SQL_FN_STR_POSITION};
! %apply short {int SQL_SSF_CONVERT};
! %apply short {int SQL_SSF_LOWER};
! %apply short {int SQL_SSF_UPPER};
! %apply short {int SQL_SSF_SUBSTRING};
! %apply short {int SQL_SSF_TRANSLATE};
! %apply short {int SQL_SSF_TRIM_BOTH};
! %apply short {int SQL_SSF_TRIM_LEADING};
! %apply short {int SQL_SSF_TRIM_TRAILING};
! %apply short {int SQL_FN_NUM_ABS};
! %apply short {int SQL_FN_NUM_ACOS};
! %apply short {int SQL_FN_NUM_ASIN};
! %apply short {int SQL_FN_NUM_ATAN};
! %apply short {int SQL_FN_NUM_ATAN2};
! %apply short {int SQL_FN_NUM_CEILING};
! %apply short {int SQL_FN_NUM_COS};
! %apply short {int SQL_FN_NUM_COT};
! %apply short {int SQL_FN_NUM_EXP};
! %apply short {int SQL_FN_NUM_FLOOR};
! %apply short {int SQL_FN_NUM_LOG};
! %apply short {int SQL_FN_NUM_MOD};
! %apply short {int SQL_FN_NUM_SIGN};
! %apply short {int SQL_FN_NUM_SIN};
! %apply short {int SQL_FN_NUM_SQRT};
! %apply short {int SQL_FN_NUM_TAN};
! %apply short {int SQL_FN_NUM_PI};
! %apply short {int SQL_FN_NUM_RAND};
! %apply short {int SQL_FN_NUM_DEGREES};
! %apply short {int SQL_FN_NUM_LOG10};
! %apply short {int SQL_FN_NUM_POWER};
! %apply short {int SQL_FN_NUM_RADIANS};
! %apply short {int SQL_FN_NUM_ROUND};
! %apply short {int SQL_FN_NUM_TRUNCATE};
! %apply short {int SQL_SNVF_BIT_LENGTH};
! %apply short {int SQL_SNVF_CHAR_LENGTH};
! %apply short {int SQL_SNVF_CHARACTER_LENGTH};
! %apply short {int SQL_SNVF_EXTRACT};
! %apply short {int SQL_SNVF_OCTET_LENGTH};
! %apply short {int SQL_SNVF_POSITION};
! %apply short {int SQL_FN_TD_NOW};
! %apply short {int SQL_FN_TD_CURDATE};
! %apply short {int SQL_FN_TD_DAYOFMONTH};
! %apply short {int SQL_FN_TD_DAYOFWEEK};
! %apply short {int SQL_FN_TD_DAYOFYEAR};
! %apply short {int SQL_FN_TD_MONTH};
! %apply short {int SQL_FN_TD_QUARTER};
! %apply short {int SQL_FN_TD_WEEK};
! %apply short {int SQL_FN_TD_YEAR};
! %apply short {int SQL_FN_TD_CURTIME};
! %apply short {int SQL_FN_TD_HOUR};
! %apply short {int SQL_FN_TD_MINUTE};
! %apply short {int SQL_FN_TD_SECOND};
! %apply short {int SQL_FN_TD_TIMESTAMPADD};
! %apply short {int SQL_FN_TD_TIMESTAMPDIFF};
! %apply short {int SQL_FN_TD_DAYNAME};
! %apply short {int SQL_FN_TD_MONTHNAME};
! %apply short {int SQL_FN_TD_CURRENT_DATE};
! %apply short {int SQL_FN_TD_CURRENT_TIME};
! %apply short {int SQL_FN_TD_CURRENT_TIMESTAMP};
! %apply short {int SQL_FN_TD_EXTRACT};
! %apply short {int SQL_SDF_CURRENT_DATE};
! %apply short {int SQL_SDF_CURRENT_TIME};
! %apply short {int SQL_SDF_CURRENT_TIMESTAMP};
! %apply short {int SQL_FN_SYS_USERNAME};
! %apply short {int SQL_FN_SYS_DBNAME};
! %apply short {int SQL_FN_SYS_IFNULL};
! %apply short {int SQL_FN_TSI_FRAC_SECOND};
! %apply short {int SQL_FN_TSI_SECOND};
! %apply short {int SQL_FN_TSI_MINUTE};
! %apply short {int SQL_FN_TSI_HOUR};
! %apply short {int SQL_FN_TSI_DAY};
! %apply short {int SQL_FN_TSI_WEEK};
! %apply short {int SQL_FN_TSI_MONTH};
! %apply short {int SQL_FN_TSI_QUARTER};
! %apply short {int SQL_FN_TSI_YEAR};
! %apply short {int SQL_CA1_NEXT};
! %apply short {int SQL_CA1_ABSOLUTE};
! %apply short {int SQL_CA1_RELATIVE};
! %apply short {int SQL_CA1_BOOKMARK};
! %apply short {int SQL_CA1_LOCK_NO_CHANGE};
! %apply short {int SQL_CA1_LOCK_EXCLUSIVE};
! %apply short {int SQL_CA1_LOCK_UNLOCK};
! %apply short {int SQL_CA1_POS_POSITION};
! %apply short {int SQL_CA1_POS_UPDATE};
! %apply short {int SQL_CA1_POS_DELETE};
! %apply short {int SQL_CA1_POS_REFRESH};
! %apply short {int SQL_CA1_POSITIONED_UPDATE};
! %apply short {int SQL_CA1_POSITIONED_DELETE};
! %apply short {int SQL_CA1_SELECT_FOR_UPDATE};
! %apply short {int SQL_CA1_BULK_ADD};
! %apply short {int SQL_CA1_BULK_UPDATE_BY_BOOKMARK};
! %apply short {int SQL_CA1_BULK_DELETE_BY_BOOKMARK};
! %apply short {int SQL_CA1_BULK_FETCH_BY_BOOKMARK};
! %apply short {int SQL_CA2_READ_ONLY_CONCURRENCY};
! %apply short {int SQL_CA2_LOCK_CONCURRENCY};
! %apply short {int SQL_CA2_OPT_ROWVER_CONCURRENCY};
! %apply short {int SQL_CA2_OPT_VALUES_CONCURRENCY};
! %apply short {int SQL_CA2_SENSITIVITY_ADDITIONS};
! %apply short {int SQL_CA2_SENSITIVITY_DELETIONS};
! %apply short {int SQL_CA2_SENSITIVITY_UPDATES};
! %apply short {int SQL_CA2_MAX_ROWS_SELECT};
! %apply short {int SQL_CA2_MAX_ROWS_INSERT};
! %apply short {int SQL_CA2_MAX_ROWS_DELETE};
! %apply short {int SQL_CA2_MAX_ROWS_UPDATE};
! %apply short {int SQL_CA2_MAX_ROWS_CATALOG};
! %apply short {int SQL_CA2_MAX_ROWS_AFFECTS_ALL};
! %apply short {int SQL_CA2_CRC_EXACT};
! %apply short {int SQL_CA2_CRC_APPROXIMATE};
! %apply short {int SQL_CA2_SIMULATE_NON_UNIQUE};
! %apply short {int SQL_CA2_SIMULATE_TRY_UNIQUE};
! %apply short {int SQL_CA2_SIMULATE_UNIQUE};
! %apply short {int SQL_OAC_NONE};
! %apply short {int SQL_OAC_LEVEL1};
! %apply short {int SQL_OAC_LEVEL2};
! %apply short {int SQL_OSCC_NOT_COMPLIANT};
! %apply short {int SQL_OSCC_COMPLIANT};
! %apply short {int SQL_OSC_MINIMUM};
! %apply short {int SQL_OSC_CORE};
! %apply short {int SQL_OSC_EXTENDED};
! %apply short {int SQL_CB_NULL};
! %apply short {int SQL_CB_NON_NULL};
! %apply short {int SQL_SO_FORWARD_ONLY};
! %apply short {int SQL_SO_KEYSET_DRIVEN};
! %apply short {int SQL_SO_DYNAMIC};
! %apply short {int SQL_SO_MIXED};
! %apply short {int SQL_SO_STATIC};
! %apply short {int SQL_FD_FETCH_BOOKMARK};
! %apply short {int SQL_CN_NONE};
! %apply short {int SQL_CN_DIFFERENT};
! %apply short {int SQL_CN_ANY};
! %apply short {int SQL_NNC_NULL};
! %apply short {int SQL_NNC_NON_NULL};
! %apply short {int SQL_NC_START};
! %apply short {int SQL_NC_END};
! %apply short {int SQL_FILE_NOT_SUPPORTED};
! %apply short {int SQL_FILE_TABLE};
! %apply short {int SQL_FILE_QUALIFIER};
! %apply short {int SQL_FILE_CATALOG};
! %apply short {int SQL_GD_BLOCK};
! %apply short {int SQL_GD_BOUND};
! %apply short {int SQL_GD_OUTPUT_PARAMS};
! %apply short {int SQL_PS_POSITIONED_DELETE};
! %apply short {int SQL_PS_POSITIONED_UPDATE};
! %apply short {int SQL_PS_SELECT_FOR_UPDATE};
! %apply short {int SQL_GB_NOT_SUPPORTED};
! %apply short {int SQL_GB_GROUP_BY_EQUALS_SELECT};
! %apply short {int SQL_GB_GROUP_BY_CONTAINS_SELECT};
! %apply short {int SQL_GB_NO_RELATION};
! %apply short {int SQL_GB_COLLATE};
! %apply short {int SQL_OU_DML_STATEMENTS};
! %apply short {int SQL_OU_PROCEDURE_INVOCATION};
! %apply short {int SQL_OU_TABLE_DEFINITION};
! %apply short {int SQL_OU_INDEX_DEFINITION};
! %apply short {int SQL_OU_PRIVILEGE_DEFINITION};
! %apply short {int SQL_SU_DML_STATEMENTS};
! %apply short {int SQL_SU_PROCEDURE_INVOCATION};
! %apply short {int SQL_SU_TABLE_DEFINITION};
! %apply short {int SQL_SU_INDEX_DEFINITION};
! %apply short {int SQL_SU_PRIVILEGE_DEFINITION};
! %apply short {int SQL_QU_DML_STATEMENTS};
! %apply short {int SQL_QU_PROCEDURE_INVOCATION};
! %apply short {int SQL_QU_TABLE_DEFINITION};
! %apply short {int SQL_QU_INDEX_DEFINITION};
! %apply short {int SQL_QU_PRIVILEGE_DEFINITION};
! %apply short {int SQL_CU_DML_STATEMENTS};
! %apply short {int SQL_CU_PROCEDURE_INVOCATION};
! %apply short {int SQL_CU_TABLE_DEFINITION};
! %apply short {int SQL_CU_INDEX_DEFINITION};
! %apply short {int SQL_CU_PRIVILEGE_DEFINITION};
! %apply short {int SQL_SQ_COMPARISON};
! %apply short {int SQL_SQ_EXISTS};
! %apply short {int SQL_SQ_IN};
! %apply short {int SQL_SQ_QUANTIFIED};
! %apply short {int SQL_SQ_CORRELATED_SUBQUERIES};
! %apply short {int SQL_U_UNION};
! %apply short {int SQL_U_UNION_ALL};
! %apply short {int SQL_BP_CLOSE};
! %apply short {int SQL_BP_DELETE};
! %apply short {int SQL_BP_DROP};
! %apply short {int SQL_BP_TRANSACTION};
! %apply short {int SQL_BP_UPDATE};
! %apply short {int SQL_BP_OTHER_HSTMT};
! %apply short {int SQL_BP_SCROLL};
! %apply short {int SQL_SS_ADDITIONS};
! %apply short {int SQL_SS_DELETIONS};
! %apply short {int SQL_SS_UPDATES};
! %apply short {int SQL_CV_CREATE_VIEW};
! %apply short {int SQL_CV_CHECK_OPTION};
! %apply short {int SQL_CV_CASCADED};
! %apply short {int SQL_CV_LOCAL};
! %apply short {int SQL_LCK_NO_CHANGE};
! %apply short {int SQL_LCK_EXCLUSIVE};
! %apply short {int SQL_LCK_UNLOCK};
! %apply short {int SQL_POS_POSITION};
! %apply short {int SQL_POS_REFRESH};
! %apply short {int SQL_POS_UPDATE};
! %apply short {int SQL_POS_DELETE};
! %apply short {int SQL_POS_ADD};
! %apply short {int SQL_QL_START};
! %apply short {int SQL_QL_END};
! %apply short {int SQL_AF_AVG};
! %apply short {int SQL_AF_COUNT};
! %apply short {int SQL_AF_MAX};
! %apply short {int SQL_AF_MIN};
! %apply short {int SQL_AF_SUM};
! %apply short {int SQL_AF_DISTINCT};
! %apply short {int SQL_AF_ALL};
! %apply short {int SQL_SC_SQL92_ENTRY};
! %apply short {int SQL_SC_FIPS127_2_TRANSITIONAL};
! %apply short {int SQL_SC_SQL92_INTERMEDIATE};
! %apply short {int SQL_SC_SQL92_FULL};
! %apply short {int SQL_DL_SQL92_DATE};
! %apply short {int SQL_DL_SQL92_TIME};
! %apply short {int SQL_DL_SQL92_TIMESTAMP};
! %apply short {int SQL_DL_SQL92_INTERVAL_YEAR};
! %apply short {int SQL_DL_SQL92_INTERVAL_MONTH};
! %apply short {int SQL_DL_SQL92_INTERVAL_DAY};
! %apply short {int SQL_DL_SQL92_INTERVAL_HOUR};
! %apply short {int SQL_DL_SQL92_INTERVAL_MINUTE};
! %apply short {int SQL_DL_SQL92_INTERVAL_SECOND};
! %apply short {int SQL_DL_SQL92_INTERVAL_YEAR_TO_MONTH};
! %apply short {int SQL_DL_SQL92_INTERVAL_DAY_TO_HOUR};
! %apply short {int SQL_DL_SQL92_INTERVAL_DAY_TO_MINUTE};
! %apply short {int SQL_DL_SQL92_INTERVAL_DAY_TO_SECOND};
! %apply short {int SQL_DL_SQL92_INTERVAL_HOUR_TO_MINUTE};
! %apply short {int SQL_DL_SQL92_INTERVAL_HOUR_TO_SECOND};
! %apply short {int SQL_DL_SQL92_INTERVAL_MINUTE_TO_SECOND};
! %apply short {int SQL_CL_START};
! %apply short {int SQL_CL_END};
! %apply short {int SQL_BRC_PROCEDURES};
! %apply short {int SQL_BRC_EXPLICIT};
! %apply short {int SQL_BRC_ROLLED_UP};
! %apply short {int SQL_BS_SELECT_EXPLICIT};
! %apply short {int SQL_BS_ROW_COUNT_EXPLICIT};
! %apply short {int SQL_BS_SELECT_PROC};
! %apply short {int SQL_BS_ROW_COUNT_PROC};
! %apply short {int SQL_PARC_BATCH};
! %apply short {int SQL_PARC_NO_BATCH};
! %apply short {int SQL_PAS_BATCH};
! %apply short {int SQL_PAS_NO_BATCH};
! %apply short {int SQL_PAS_NO_SELECT};
! %apply short {int SQL_IK_NONE};
! %apply short {int SQL_IK_ASC};
! %apply short {int SQL_IK_DESC};
! %apply short {int SQL_IK_ALL};
! %apply short {int SQL_ISV_ASSERTIONS};
! %apply short {int SQL_ISV_CHARACTER_SETS};
! %apply short {int SQL_ISV_CHECK_CONSTRAINTS};
! %apply short {int SQL_ISV_COLLATIONS};
! %apply short {int SQL_ISV_COLUMN_DOMAIN_USAGE};
! %apply short {int SQL_ISV_COLUMN_PRIVILEGES};
! %apply short {int SQL_ISV_COLUMNS};
! %apply short {int SQL_ISV_CONSTRAINT_COLUMN_USAGE};
! %apply short {int SQL_ISV_CONSTRAINT_TABLE_USAGE};
! %apply short {int SQL_ISV_DOMAIN_CONSTRAINTS};
! %apply short {int SQL_ISV_DOMAINS};
! %apply short {int SQL_ISV_KEY_COLUMN_USAGE};
! %apply short {int SQL_ISV_REFERENTIAL_CONSTRAINTS};
! %apply short {int SQL_ISV_SCHEMATA};
! %apply short {int SQL_ISV_SQL_LANGUAGES};
! %apply short {int SQL_ISV_TABLE_CONSTRAINTS};
! %apply short {int SQL_ISV_TABLE_PRIVILEGES};
! %apply short {int SQL_ISV_TABLES};
! %apply short {int SQL_ISV_TRANSLATIONS};
! %apply short {int SQL_ISV_USAGE_PRIVILEGES};
! %apply short {int SQL_ISV_VIEW_COLUMN_USAGE};
! %apply short {int SQL_ISV_VIEW_TABLE_USAGE};
! %apply short {int SQL_ISV_VIEWS};
! %apply short {int SQL_AM_NONE};
! %apply short {int SQL_AM_CONNECTION};
! %apply short {int SQL_AM_STATEMENT};
! %apply short {int SQL_AD_CONSTRAINT_NAME_DEFINITION};
! %apply short {int SQL_AD_ADD_DOMAIN_CONSTRAINT};
! %apply short {int SQL_AD_DROP_DOMAIN_CONSTRAINT};
! %apply short {int SQL_AD_ADD_DOMAIN_DEFAULT};
! %apply short {int SQL_AD_DROP_DOMAIN_DEFAULT};
! %apply short {int SQL_AD_ADD_CONSTRAINT_INITIALLY_DEFERRED};
! %apply short {int SQL_AD_ADD_CONSTRAINT_INITIALLY_IMMEDIATE};
! %apply short {int SQL_AD_ADD_CONSTRAINT_DEFERRABLE};
! %apply short {int SQL_AD_ADD_CONSTRAINT_NON_DEFERRABLE};
! %apply short {int SQL_CS_CREATE_SCHEMA};
! %apply short {int SQL_CS_AUTHORIZATION};
! %apply short {int SQL_CS_DEFAULT_CHARACTER_SET};
! %apply short {int SQL_CTR_CREATE_TRANSLATION};
! %apply short {int SQL_CA_CREATE_ASSERTION};
! %apply short {int SQL_CA_CONSTRAINT_INITIALLY_DEFERRED};
! %apply short {int SQL_CA_CONSTRAINT_INITIALLY_IMMEDIATE};
! %apply short {int SQL_CA_CONSTRAINT_DEFERRABLE};
! %apply short {int SQL_CA_CONSTRAINT_NON_DEFERRABLE};
! %apply short {int SQL_CCS_CREATE_CHARACTER_SET};
! %apply short {int SQL_CCS_COLLATE_CLAUSE};
! %apply short {int SQL_CCS_LIMITED_COLLATION};
! %apply short {int SQL_CCOL_CREATE_COLLATION};
! %apply short {int SQL_CDO_CREATE_DOMAIN};
! %apply short {int SQL_CDO_DEFAULT};
! %apply short {int SQL_CDO_CONSTRAINT};
! %apply short {int SQL_CDO_COLLATION};
! %apply short {int SQL_CDO_CONSTRAINT_NAME_DEFINITION};
! %apply short {int SQL_CDO_CONSTRAINT_INITIALLY_DEFERRED};
! %apply short {int SQL_CDO_CONSTRAINT_INITIALLY_IMMEDIATE};
! %apply short {int SQL_CDO_CONSTRAINT_DEFERRABLE};
! %apply short {int SQL_CDO_CONSTRAINT_NON_DEFERRABLE};
! %apply short {int SQL_CT_CREATE_TABLE};
! %apply short {int SQL_CT_COMMIT_PRESERVE};
! %apply short {int SQL_CT_COMMIT_DELETE};
! %apply short {int SQL_CT_GLOBAL_TEMPORARY};
! %apply short {int SQL_CT_LOCAL_TEMPORARY};
! %apply short {int SQL_CT_CONSTRAINT_INITIALLY_DEFERRED};
! %apply short {int SQL_CT_CONSTRAINT_INITIALLY_IMMEDIATE};
! %apply short {int SQL_CT_CONSTRAINT_DEFERRABLE};
! %apply short {int SQL_CT_CONSTRAINT_NON_DEFERRABLE};
! %apply short {int SQL_CT_COLUMN_CONSTRAINT};
! %apply short {int SQL_CT_COLUMN_DEFAULT};
! %apply short {int SQL_CT_COLUMN_COLLATION};
! %apply short {int SQL_CT_TABLE_CONSTRAINT};
! %apply short {int SQL_CT_CONSTRAINT_NAME_DEFINITION};
! %apply short {int SQL_DI_CREATE_INDEX};
! %apply short {int SQL_DI_DROP_INDEX};
! %apply short {int SQL_DC_DROP_COLLATION};
! %apply short {int SQL_DD_DROP_DOMAIN};
! %apply short {int SQL_DD_RESTRICT};
! %apply short {int SQL_DD_CASCADE};
! %apply short {int SQL_DS_DROP_SCHEMA};
! %apply short {int SQL_DS_RESTRICT};
! %apply short {int SQL_DS_CASCADE};
! %apply short {int SQL_DCS_DROP_CHARACTER_SET};
! %apply short {int SQL_DA_DROP_ASSERTION};
! %apply short {int SQL_DT_DROP_TABLE};
! %apply short {int SQL_DT_RESTRICT};
! %apply short {int SQL_DT_CASCADE};
! %apply short {int SQL_DTR_DROP_TRANSLATION};
! %apply short {int SQL_DV_DROP_VIEW};
! %apply short {int SQL_DV_RESTRICT};
! %apply short {int SQL_DV_CASCADE};
! %apply short {int SQL_IS_INSERT_LITERALS};
! %apply short {int SQL_IS_INSERT_SEARCHED};
! %apply short {int SQL_IS_SELECT_INTO};
! %apply short {int SQL_OIC_CORE};
! %apply short {int SQL_OIC_LEVEL1};
! %apply short {int SQL_OIC_LEVEL2};
! %apply short {int SQL_SFKD_CASCADE};
! %apply short {int SQL_SFKD_NO_ACTION};
! %apply short {int SQL_SFKD_SET_DEFAULT};
! %apply short {int SQL_SFKD_SET_NULL};
! %apply short {int SQL_SFKU_CASCADE};
! %apply short {int SQL_SFKU_NO_ACTION};
! %apply short {int SQL_SFKU_SET_DEFAULT};
! %apply short {int SQL_SFKU_SET_NULL};
! %apply short {int SQL_SG_USAGE_ON_DOMAIN};
! %apply short {int SQL_SG_USAGE_ON_CHARACTER_SET};
! %apply short {int SQL_SG_USAGE_ON_COLLATION};
! %apply short {int SQL_SG_USAGE_ON_TRANSLATION};
! %apply short {int SQL_SG_WITH_GRANT_OPTION};
! %apply short {int SQL_SG_DELETE_TABLE};
! %apply short {int SQL_SG_INSERT_TABLE};
! %apply short {int SQL_SG_INSERT_COLUMN};
! %apply short {int SQL_SG_REFERENCES_TABLE};
! %apply short {int SQL_SG_REFERENCES_COLUMN};
! %apply short {int SQL_SG_SELECT_TABLE};
! %apply short {int SQL_SG_UPDATE_TABLE};
! %apply short {int SQL_SG_UPDATE_COLUMN};
! %apply short {int SQL_SP_EXISTS};
! %apply short {int SQL_SP_ISNOTNULL};
! %apply short {int SQL_SP_ISNULL};
! %apply short {int SQL_SP_MATCH_FULL};
! %apply short {int SQL_SP_MATCH_PARTIAL};
! %apply short {int SQL_SP_MATCH_UNIQUE_FULL};
! %apply short {int SQL_SP_MATCH_UNIQUE_PARTIAL};
! %apply short {int SQL_SP_OVERLAPS};
! %apply short {int SQL_SP_UNIQUE};
! %apply short {int SQL_SP_LIKE};
! %apply short {int SQL_SP_IN};
! %apply short {int SQL_SP_BETWEEN};
! %apply short {int SQL_SP_COMPARISON};
! %apply short {int SQL_SP_QUANTIFIED_COMPARISON};
! %apply short {int SQL_SRJO_CORRESPONDING_CLAUSE};
! %apply short {int SQL_SRJO_CROSS_JOIN};
! %apply short {int SQL_SRJO_EXCEPT_JOIN};
! %apply short {int SQL_SRJO_FULL_OUTER_JOIN};
! %apply short {int SQL_SRJO_INNER_JOIN};
! %apply short {int SQL_SRJO_INTERSECT_JOIN};
! %apply short {int SQL_SRJO_LEFT_OUTER_JOIN};
! %apply short {int SQL_SRJO_NATURAL_JOIN};
! %apply short {int SQL_SRJO_RIGHT_OUTER_JOIN};
! %apply short {int SQL_SRJO_UNION_JOIN};
! %apply short {int SQL_SR_USAGE_ON_DOMAIN};
! %apply short {int SQL_SR_USAGE_ON_CHARACTER_SET};
! %apply short {int SQL_SR_USAGE_ON_COLLATION};
! %apply short {int SQL_SR_USAGE_ON_TRANSLATION};
! %apply short {int SQL_SR_GRANT_OPTION_FOR};
! %apply short {int SQL_SR_CASCADE};
! %apply short {int SQL_SR_RESTRICT};
! %apply short {int SQL_SR_DELETE_TABLE};
! %apply short {int SQL_SR_INSERT_TABLE};
! %apply short {int SQL_SR_INSERT_COLUMN};
! %apply short {int SQL_SR_REFERENCES_TABLE};
! %apply short {int SQL_SR_REFERENCES_COLUMN};
! %apply short {int SQL_SR_SELECT_TABLE};
! %apply short {int SQL_SR_UPDATE_TABLE};
! %apply short {int SQL_SR_UPDATE_COLUMN};
! %apply short {int SQL_SRVC_VALUE_EXPRESSION};
! %apply short {int SQL_SRVC_NULL};
! %apply short {int SQL_SRVC_DEFAULT};
! %apply short {int SQL_SRVC_ROW_SUBQUERY};
! %apply short {int SQL_SVE_CASE};
! %apply short {int SQL_SVE_CAST};
! %apply short {int SQL_SVE_COALESCE};
! %apply short {int SQL_SVE_NULLIF};
! %apply short {int SQL_SCC_XOPEN_CLI_VERSION1};
! %apply short {int SQL_SCC_ISO92_CLI};
! %apply short {int SQL_US_UNION};
! %apply short {int SQL_US_UNION_ALL};
! %apply short {int SQL_DRIVER_AWARE_POOLING_NOT_CAPABLE};
! %apply short {int SQL_DRIVER_AWARE_POOLING_CAPABLE};
! %apply short {int SQL_DTC_ENLIST_EXPENSIVE};
! %apply short {int SQL_DTC_UNENLIST_EXPENSIVE};
! %apply short {int SQL_ASYNC_DBC_NOT_CAPABLE};
! %apply short {int SQL_ASYNC_DBC_CAPABLE};
! %apply short {int SQL_FETCH_FIRST_USER};
! %apply short {int SQL_FETCH_FIRST_SYSTEM};
! %apply short {int SQL_ENTIRE_ROWSET};
! %apply short {int SQL_POSITION};
! %apply short {int SQL_REFRESH};
! %apply short {int SQL_UPDATE};
! %apply short {int SQL_DELETE};
! %apply short {int SQL_ADD};
! %apply short {int SQL_SETPOS_MAX_OPTION_VALUE};
! %apply short {int SQL_UPDATE_BY_BOOKMARK};
! %apply short {int SQL_DELETE_BY_BOOKMARK};
! %apply short {int SQL_FETCH_BY_BOOKMARK};
! %apply short {int SQL_LOCK_NO_CHANGE};
! %apply short {int SQL_LOCK_EXCLUSIVE};
! %apply short {int SQL_LOCK_UNLOCK};
! %apply short {int SQL_SETPOS_MAX_LOCK_VALUE};
! %apply short {int SQL_BEST_ROWID};
! %apply short {int SQL_ROWVER};
! %apply short {int SQL_PC_NOT_PSEUDO};
! %apply short {int SQL_QUICK};
! %apply short {int SQL_ENSURE};
! %apply short {int SQL_TABLE_STAT};
! %apply short {int SQL_DRIVER_NOPROMPT};
! %apply short {int SQL_DRIVER_COMPLETE};
! %apply short {int SQL_DRIVER_PROMPT};
! %apply short {int SQL_DRIVER_COMPLETE_REQUIRED};
! %apply short {int SQL_FETCH_BOOKMARK};
! %apply short {int SQL_ROW_SUCCESS};
! %apply short {int SQL_ROW_DELETED};
! %apply short {int SQL_ROW_UPDATED};
! %apply short {int SQL_ROW_NOROW};
! %apply short {int SQL_ROW_ADDED};
! %apply short {int SQL_ROW_ERROR};
! %apply short {int SQL_ROW_SUCCESS_WITH_INFO};
! %apply short {int SQL_ROW_PROCEED};
! %apply short {int SQL_ROW_IGNORE};
! %apply short {int SQL_PARAM_SUCCESS};
! %apply short {int SQL_PARAM_SUCCESS_WITH_INFO};
! %apply short {int SQL_PARAM_ERROR};
! %apply short {int SQL_PARAM_UNUSED};
! %apply short {int SQL_PARAM_DIAG_UNAVAILABLE};
! %apply short {int SQL_PARAM_PROCEED};
! %apply short {int SQL_PARAM_IGNORE};
! %apply short {int SQL_CASCADE};
! %apply short {int SQL_RESTRICT};
! %apply short {int SQL_SET_NULL};
! %apply short {int SQL_NO_ACTION};
! %apply short {int SQL_SET_DEFAULT};
! %apply short {int SQL_INITIALLY_DEFERRED};
! %apply short {int SQL_INITIALLY_IMMEDIATE};
! %apply short {int SQL_NOT_DEFERRABLE};
! %apply short {int SQL_PARAM_TYPE_UNKNOWN};
! %apply short {int SQL_PARAM_INPUT};
! %apply short {int SQL_PARAM_INPUT_OUTPUT};
! %apply short {int SQL_RESULT_COL};
! %apply short {int SQL_PARAM_OUTPUT};
! %apply short {int SQL_RETURN_VALUE};
! %apply short {int SQL_PARAM_INPUT_OUTPUT_STREAM};
! %apply short {int SQL_PARAM_OUTPUT_STREAM};
! %apply short {int SQL_PT_UNKNOWN};
! %apply short {int SQL_PT_PROCEDURE};
! %apply short {int SQL_PT_FUNCTION};
! %apply short {int SQL_DATABASE_NAME};
! %apply short {int SQL_CONCUR_TIMESTAMP};
! %apply short {int SQL_SCROLL_FORWARD_ONLY};
! %apply short {int SQL_SCROLL_KEYSET_DRIVEN};
! %apply short {int SQL_SCROLL_DYNAMIC};
! %apply short {int SQL_SCROLL_STATIC};
! %apply short {int TRACE_VERSION};
! %apply short {int TRACE_ON};
! %apply short {int TRACE_VS_EVENT_ON};
! %apply short {int ODBC_VS_FLAG_UNICODE_ARG};
! %apply short {int ODBC_VS_FLAG_UNICODE_COR};
! %apply short {int ODBC_VS_FLAG_RETCODE};
! %apply short {int ODBC_VS_FLAG_STOP};

! %fortranconst SQLTables_TABLE_CATALOG;
! %fortranconst SQLTables_TABLE_SCHEM;
! %fortranconst SQLTables_TABLE_NAME;
! %fortranconst SQLTables_TABLE_TYPE;
! %fortranconst SQLTables_REMARKS;
! %fortranconst SQLColumns_TABLE_CAT;
! %fortranconst SQLColumns_TABLE_SCHEM;
! %fortranconst SQLColumns_TABLE_NAME;
! %fortranconst SQLColumns_COLUMN_NAME;
! %fortranconst SQLColumns_DATA_TYPE;
! %fortranconst SQLColumns_TYPE_NAME;
! %fortranconst SQLColumns_COLUMN_SIZE;
! %fortranconst SQLColumns_BUFFER_LENGTH;
! %fortranconst SQLColumns_DECIMAL_DIGITS;
! %fortranconst SQLColumns_NUM_PREC_RADIX;
! %fortranconst SQLColumns_NULLABLE;
! %fortranconst SQLColumns_REMARKS;
! %fortranconst SQLColumns_COLUMN_DEF;
! %fortranconst SQLColumns_SQL_DATA_TYPE;
! %fortranconst SQLColumns_SQL_DATETIME_SUB;
! %fortranconst SQLColumns_CHAR_OCTET_LENGTH;
! %fortranconst SQLColumns_ORDINAL_POSITION;
! %fortranconst SQLColumns_IS_NULLABLE;
! %fortranconst SQL_SPEC_MAJOR;
! %fortranconst SQL_SPEC_MINOR;
! %fortranconst SQL_SPEC_STRING;
! %fortranconst SQL_SQLSTATE_SIZE;
! %fortranconst SQL_MAX_DSN_LENGTH;
! %fortranconst SQL_MAX_OPTION_STRING_LENGTH;
! %fortranconst SQL_HANDLE_SENV;
! %fortranconst SQL_ATTR_ODBC_VERSION;
! %fortranconst SQL_ATTR_CONNECTION_POOLING;
! %fortranconst SQL_ATTR_CP_MATCH;
! %fortranconst SQL_ATTR_UNIXODBC_SYSPATH;
! %fortranconst SQL_ATTR_UNIXODBC_VERSION;
! %fortranconst SQL_ATTR_UNIXODBC_ENVATTR;
! %fortranconst SQL_CP_OFF;
! %fortranconst SQL_CP_ONE_PER_DRIVER;
! %fortranconst SQL_CP_ONE_PER_HENV;
! %fortranconst SQL_CP_DEFAULT;
! %fortranconst SQL_CP_STRICT_MATCH;
! %fortranconst SQL_CP_RELAXED_MATCH;
! %fortranconst SQL_CP_MATCH_DEFAULT;
! %fortranconst SQL_OV_ODBC2;
! %fortranconst SQL_OV_ODBC3;
! %fortranconst SQL_OV_ODBC3_80;
! %fortranconst SQL_ACCESS_MODE;
! %fortranconst SQL_AUTOCOMMIT;
! %fortranconst SQL_LOGIN_TIMEOUT;
! %fortranconst SQL_OPT_TRACE;
! %fortranconst SQL_OPT_TRACEFILE;
! %fortranconst SQL_TRANSLATE_DLL;
! %fortranconst SQL_TRANSLATE_OPTION;
! %fortranconst SQL_TXN_ISOLATION;
! %fortranconst SQL_CURRENT_QUALIFIER;
! %fortranconst SQL_ODBC_CURSORS;
! %fortranconst SQL_QUIET_MODE;
! %fortranconst SQL_PACKET_SIZE;
! %fortranconst SQL_ATTR_ACCESS_MODE;
! %fortranconst SQL_ATTR_AUTOCOMMIT;
! %fortranconst SQL_ATTR_CONNECTION_TIMEOUT;
! %fortranconst SQL_ATTR_CURRENT_CATALOG;
! %fortranconst SQL_ATTR_DISCONNECT_BEHAVIOR;
! %fortranconst SQL_ATTR_ENLIST_IN_DTC;
! %fortranconst SQL_ATTR_ENLIST_IN_XA;
! %fortranconst SQL_ATTR_LOGIN_TIMEOUT;
! %fortranconst SQL_ATTR_ODBC_CURSORS;
! %fortranconst SQL_ATTR_PACKET_SIZE;
! %fortranconst SQL_ATTR_QUIET_MODE;
! %fortranconst SQL_ATTR_TRACE;
! %fortranconst SQL_ATTR_TRACEFILE;
! %fortranconst SQL_ATTR_TRANSLATE_LIB;
! %fortranconst SQL_ATTR_TRANSLATE_OPTION;
! %fortranconst SQL_ATTR_TXN_ISOLATION;
! %fortranconst SQL_ATTR_CONNECTION_DEAD;
! %fortranconst SQL_ATTR_DRIVER_THREADING;
! %fortranconst SQL_ATTR_ANSI_APP;
! %fortranconst SQL_ATTR_RESET_CONNECTION;
! %fortranconst SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE;
! %fortranconst SQL_MODE_READ_WRITE;
! %fortranconst SQL_MODE_READ_ONLY;
! %fortranconst SQL_MODE_DEFAULT;
! %fortranconst SQL_AUTOCOMMIT_OFF;
! %fortranconst SQL_AUTOCOMMIT_ON;
! %fortranconst SQL_AUTOCOMMIT_DEFAULT;
! %fortranconst SQL_LOGIN_TIMEOUT_DEFAULT;
! %fortranconst SQL_OPT_TRACE_OFF;
! %fortranconst SQL_OPT_TRACE_ON;
! %fortranconst SQL_OPT_TRACE_DEFAULT;
! %fortranconst SQL_OPT_TRACE_FILE_DEFAULT;
! %fortranconst SQL_CUR_USE_IF_NEEDED;
! %fortranconst SQL_CUR_USE_ODBC;
! %fortranconst SQL_CUR_USE_DRIVER;
! %fortranconst SQL_CUR_DEFAULT;
! %fortranconst SQL_DB_RETURN_TO_POOL;
! %fortranconst SQL_DB_DISCONNECT;
! %fortranconst SQL_DB_DEFAULT;
! %fortranconst SQL_DTC_DONE;
! %fortranconst SQL_CD_TRUE;
! %fortranconst SQL_CD_FALSE;
! %fortranconst SQL_AA_TRUE;
! %fortranconst SQL_AA_FALSE;
! %fortranconst SQL_RESET_CONNECTION_YES;
! %fortranconst SQL_ASYNC_DBC_ENABLE_ON;
! %fortranconst SQL_ASYNC_DBC_ENABLE_OFF;
! %fortranconst SQL_ASYNC_DBC_ENABLE_DEFAULT;
! %fortranconst SQL_QUERY_TIMEOUT;
! %fortranconst SQL_MAX_ROWS;
! %fortranconst SQL_NOSCAN;
! %fortranconst SQL_MAX_LENGTH;
! %fortranconst SQL_ASYNC_ENABLE;
! %fortranconst SQL_BIND_TYPE;
! %fortranconst SQL_CURSOR_TYPE;
! %fortranconst SQL_CONCURRENCY;
! %fortranconst SQL_KEYSET_SIZE;
! %fortranconst SQL_ROWSET_SIZE;
! %fortranconst SQL_SIMULATE_CURSOR;
! %fortranconst SQL_RETRIEVE_DATA;
! %fortranconst SQL_USE_BOOKMARKS;
! %fortranconst SQL_GET_BOOKMARK;
! %fortranconst SQL_ROW_NUMBER;
! %fortranconst SQL_ATTR_ASYNC_ENABLE;
! %fortranconst SQL_ATTR_CONCURRENCY;
! %fortranconst SQL_ATTR_CURSOR_TYPE;
! %fortranconst SQL_ATTR_ENABLE_AUTO_IPD;
! %fortranconst SQL_ATTR_FETCH_BOOKMARK_PTR;
! %fortranconst SQL_ATTR_KEYSET_SIZE;
! %fortranconst SQL_ATTR_MAX_LENGTH;
! %fortranconst SQL_ATTR_MAX_ROWS;
! %fortranconst SQL_ATTR_NOSCAN;
! %fortranconst SQL_ATTR_PARAM_BIND_OFFSET_PTR;
! %fortranconst SQL_ATTR_PARAM_BIND_TYPE;
! %fortranconst SQL_ATTR_PARAM_OPERATION_PTR;
! %fortranconst SQL_ATTR_PARAM_STATUS_PTR;
! %fortranconst SQL_ATTR_PARAMS_PROCESSED_PTR;
! %fortranconst SQL_ATTR_PARAMSET_SIZE;
! %fortranconst SQL_ATTR_QUERY_TIMEOUT;
! %fortranconst SQL_ATTR_RETRIEVE_DATA;
! %fortranconst SQL_ATTR_ROW_BIND_OFFSET_PTR;
! %fortranconst SQL_ATTR_ROW_BIND_TYPE;
! %fortranconst SQL_ATTR_ROW_NUMBER;
! %fortranconst SQL_ATTR_ROW_OPERATION_PTR;
! %fortranconst SQL_ATTR_ROW_STATUS_PTR;
! %fortranconst SQL_ATTR_ROWS_FETCHED_PTR;
! %fortranconst SQL_ATTR_ROW_ARRAY_SIZE;
! %fortranconst SQL_ATTR_SIMULATE_CURSOR;
! %fortranconst SQL_ATTR_USE_BOOKMARKS;
! %fortranconst SQL_ATTR_ASYNC_STMT_EVENT;
! %fortranconst SQL_IS_POINTER;
! %fortranconst SQL_IS_UINTEGER;
! %fortranconst SQL_IS_INTEGER;
! %fortranconst SQL_IS_USMALLINT;
! %fortranconst SQL_IS_SMALLINT;
! %fortranconst SQL_PARAM_BIND_BY_COLUMN;
! %fortranconst SQL_PARAM_BIND_TYPE_DEFAULT;
! %fortranconst SQL_QUERY_TIMEOUT_DEFAULT;
! %fortranconst SQL_MAX_ROWS_DEFAULT;
! %fortranconst SQL_NOSCAN_OFF;
! %fortranconst SQL_NOSCAN_ON;
! %fortranconst SQL_NOSCAN_DEFAULT;
! %fortranconst SQL_MAX_LENGTH_DEFAULT;
! %fortranconst SQL_ASYNC_ENABLE_OFF;
! %fortranconst SQL_ASYNC_ENABLE_ON;
! %fortranconst SQL_ASYNC_ENABLE_DEFAULT;
! %fortranconst SQL_BIND_BY_COLUMN;
! %fortranconst SQL_BIND_TYPE_DEFAULT;
! %fortranconst SQL_CONCUR_READ_ONLY;
! %fortranconst SQL_CONCUR_LOCK;
! %fortranconst SQL_CONCUR_ROWVER;
! %fortranconst SQL_CONCUR_VALUES;
! %fortranconst SQL_CONCUR_DEFAULT;
! %fortranconst SQL_CURSOR_FORWARD_ONLY;
! %fortranconst SQL_CURSOR_KEYSET_DRIVEN;
! %fortranconst SQL_CURSOR_DYNAMIC;
! %fortranconst SQL_CURSOR_STATIC;
! %fortranconst SQL_CURSOR_TYPE_DEFAULT;
! %fortranconst SQL_ROWSET_SIZE_DEFAULT;
! %fortranconst SQL_KEYSET_SIZE_DEFAULT;
! %fortranconst SQL_SC_NON_UNIQUE;
! %fortranconst SQL_SC_TRY_UNIQUE;
! %fortranconst SQL_SC_UNIQUE;
! %fortranconst SQL_RD_OFF;
! %fortranconst SQL_RD_ON;
! %fortranconst SQL_RD_DEFAULT;
! %fortranconst SQL_UB_OFF;
! %fortranconst SQL_UB_ON;
! %fortranconst SQL_UB_DEFAULT;
! %fortranconst SQL_UB_FIXED;
! %fortranconst SQL_UB_VARIABLE;
! %fortranconst SQL_DESC_ARRAY_SIZE;
! %fortranconst SQL_DESC_ARRAY_STATUS_PTR;
! %fortranconst SQL_DESC_BASE_COLUMN_NAME;
! %fortranconst SQL_DESC_BASE_TABLE_NAME;
! %fortranconst SQL_DESC_BIND_OFFSET_PTR;
! %fortranconst SQL_DESC_BIND_TYPE;
! %fortranconst SQL_DESC_DATETIME_INTERVAL_PRECISION;
! %fortranconst SQL_DESC_LITERAL_PREFIX;
! %fortranconst SQL_DESC_LITERAL_SUFFIX;
! %fortranconst SQL_DESC_LOCAL_TYPE_NAME;
! %fortranconst SQL_DESC_MAXIMUM_SCALE;
! %fortranconst SQL_DESC_MINIMUM_SCALE;
! %fortranconst SQL_DESC_NUM_PREC_RADIX;
! %fortranconst SQL_DESC_PARAMETER_TYPE;
! %fortranconst SQL_DESC_ROWS_PROCESSED_PTR;
! %fortranconst SQL_DESC_ROWVER;
! %fortranconst SQL_DIAG_CURSOR_ROW_COUNT;
! %fortranconst SQL_DIAG_ROW_NUMBER;
! %fortranconst SQL_DIAG_COLUMN_NUMBER;
! %fortranconst SQL_DATE;
! %fortranconst SQL_INTERVAL;
! %fortranconst SQL_TIME;
! %fortranconst SQL_TIMESTAMP;
! %fortranconst SQL_LONGVARCHAR;
! %fortranconst SQL_BINARY;
! %fortranconst SQL_VARBINARY;
! %fortranconst SQL_LONGVARBINARY;
! %fortranconst SQL_BIGINT;
! %fortranconst SQL_TINYINT;
! %fortranconst SQL_BIT;
! %fortranconst SQL_GUID;
! %fortranconst SQL_CODE_YEAR;
! %fortranconst SQL_CODE_MONTH;
! %fortranconst SQL_CODE_DAY;
! %fortranconst SQL_CODE_HOUR;
! %fortranconst SQL_CODE_MINUTE;
! %fortranconst SQL_CODE_SECOND;
! %fortranconst SQL_CODE_YEAR_TO_MONTH;
! %fortranconst SQL_CODE_DAY_TO_HOUR;
! %fortranconst SQL_CODE_DAY_TO_MINUTE;
! %fortranconst SQL_CODE_DAY_TO_SECOND;
! %fortranconst SQL_CODE_HOUR_TO_MINUTE;
! %fortranconst SQL_CODE_HOUR_TO_SECOND;
! %fortranconst SQL_CODE_MINUTE_TO_SECOND;
! %fortranconst SQL_INTERVAL_YEAR;
! %fortranconst SQL_INTERVAL_MONTH;
! %fortranconst SQL_INTERVAL_DAY;
! %fortranconst SQL_INTERVAL_HOUR;
! %fortranconst SQL_INTERVAL_MINUTE;
! %fortranconst SQL_INTERVAL_SECOND;
! %fortranconst SQL_INTERVAL_YEAR_TO_MONTH;
! %fortranconst SQL_INTERVAL_DAY_TO_HOUR;
! %fortranconst SQL_INTERVAL_DAY_TO_MINUTE;
! %fortranconst SQL_INTERVAL_DAY_TO_SECOND;
! %fortranconst SQL_INTERVAL_HOUR_TO_MINUTE;
! %fortranconst SQL_INTERVAL_HOUR_TO_SECOND;
! %fortranconst SQL_INTERVAL_MINUTE_TO_SECOND;
! %fortranconst SQL_C_DEFAULT;
! %fortranconst SQL_SIGNED_OFFSET;
! %fortranconst SQL_UNSIGNED_OFFSET;
! %fortranconst SQL_C_DATE;
! %fortranconst SQL_C_TIME;
! %fortranconst SQL_C_TIMESTAMP;
! %fortranconst SQL_C_INTERVAL_YEAR;
! %fortranconst SQL_C_INTERVAL_MONTH;
! %fortranconst SQL_C_INTERVAL_DAY;
! %fortranconst SQL_C_INTERVAL_HOUR;
! %fortranconst SQL_C_INTERVAL_MINUTE;
! %fortranconst SQL_C_INTERVAL_SECOND;
! %fortranconst SQL_C_INTERVAL_YEAR_TO_MONTH;
! %fortranconst SQL_C_INTERVAL_DAY_TO_HOUR;
! %fortranconst SQL_C_INTERVAL_DAY_TO_MINUTE;
! %fortranconst SQL_C_INTERVAL_DAY_TO_SECOND;
! %fortranconst SQL_C_INTERVAL_HOUR_TO_MINUTE;
! %fortranconst SQL_C_INTERVAL_HOUR_TO_SECOND;
! %fortranconst SQL_C_INTERVAL_MINUTE_TO_SECOND;
! %fortranconst SQL_C_BINARY;
! %fortranconst SQL_C_BIT;
! %fortranconst SQL_C_SBIGINT;
! %fortranconst SQL_C_UBIGINT;
! %fortranconst SQL_C_TINYINT;
! %fortranconst SQL_C_STINYINT;
! %fortranconst SQL_C_UTINYINT;
! %fortranconst SQL_C_GUID;
! %fortranconst SQL_TYPE_NULL;
! %fortranconst SQL_DRIVER_C_TYPE_BASE;
! %fortranconst SQL_DRIVER_SQL_TYPE_BASE;
! %fortranconst SQL_DRIVER_DESC_FIELD_BASE;
! %fortranconst SQL_DRIVER_DIAG_FIELD_BASE;
! %fortranconst SQL_DRIVER_INFO_TYPE_BASE;
! %fortranconst SQL_DRIVER_CONN_ATTR_BASE;
! %fortranconst SQL_DRIVER_STMT_ATTR_BASE;
! %fortranconst SQL_C_VARBOOKMARK;
! %fortranconst SQL_NO_ROW_NUMBER;
! %fortranconst SQL_NO_COLUMN_NUMBER;
! %fortranconst SQL_ROW_NUMBER_UNKNOWN;
! %fortranconst SQL_COLUMN_NUMBER_UNKNOWN;
! %fortranconst SQL_DEFAULT_PARAM;
! %fortranconst SQL_IGNORE;
! %fortranconst SQL_COLUMN_IGNORE;
! %fortranconst SQL_LEN_DATA_AT_EXEC_OFFSET;
! %fortranconst SQL_LEN_BINARY_ATTR_OFFSET;
! %fortranconst SQL_SETPARAM_VALUE_MAX;
! %fortranconst SQL_COLUMN_COUNT;
! %fortranconst SQL_COLUMN_NAME;
! %fortranconst SQL_COLUMN_TYPE;
! %fortranconst SQL_COLUMN_LENGTH;
! %fortranconst SQL_COLUMN_PRECISION;
! %fortranconst SQL_COLUMN_SCALE;
! %fortranconst SQL_COLUMN_DISPLAY_SIZE;
! %fortranconst SQL_COLUMN_NULLABLE;
! %fortranconst SQL_COLUMN_UNSIGNED;
! %fortranconst SQL_COLUMN_MONEY;
! %fortranconst SQL_COLUMN_UPDATABLE;
! %fortranconst SQL_COLUMN_AUTO_INCREMENT;
! %fortranconst SQL_COLUMN_CASE_SENSITIVE;
! %fortranconst SQL_COLUMN_SEARCHABLE;
! %fortranconst SQL_COLUMN_TYPE_NAME;
! %fortranconst SQL_COLUMN_TABLE_NAME;
! %fortranconst SQL_COLUMN_OWNER_NAME;
! %fortranconst SQL_COLUMN_QUALIFIER_NAME;
! %fortranconst SQL_COLUMN_LABEL;
! %fortranconst SQL_COLATT_OPT_MAX;
! %fortranconst SQL_COLATT_OPT_MIN;
! %fortranconst SQL_ATTR_READONLY;
! %fortranconst SQL_ATTR_WRITE;
! %fortranconst SQL_ATTR_READWRITE_UNKNOWN;
! %fortranconst SQL_UNSEARCHABLE;
! %fortranconst SQL_LIKE_ONLY;
! %fortranconst SQL_ALL_EXCEPT_LIKE;
! %fortranconst SQL_SEARCHABLE;
! %fortranconst SQL_PRED_SEARCHABLE;
! %fortranconst SQL_NO_TOTAL;
! %fortranconst SQL_API_SQLALLOCHANDLESTD;
! %fortranconst SQL_API_SQLBULKOPERATIONS;
! %fortranconst SQL_API_SQLBINDPARAMETER;
! %fortranconst SQL_API_SQLBROWSECONNECT;
! %fortranconst SQL_API_SQLCOLATTRIBUTES;
! %fortranconst SQL_API_SQLCOLUMNPRIVILEGES;
! %fortranconst SQL_API_SQLDESCRIBEPARAM;
! %fortranconst SQL_API_SQLDRIVERCONNECT;
! %fortranconst SQL_API_SQLDRIVERS;
! %fortranconst SQL_API_SQLEXTENDEDFETCH;
! %fortranconst SQL_API_SQLFOREIGNKEYS;
! %fortranconst SQL_API_SQLMORERESULTS;
! %fortranconst SQL_API_SQLNATIVESQL;
! %fortranconst SQL_API_SQLNUMPARAMS;
! %fortranconst SQL_API_SQLPARAMOPTIONS;
! %fortranconst SQL_API_SQLPRIMARYKEYS;
! %fortranconst SQL_API_SQLPROCEDURECOLUMNS;
! %fortranconst SQL_API_SQLPROCEDURES;
! %fortranconst SQL_API_SQLSETPOS;
! %fortranconst SQL_API_SQLSETSCROLLOPTIONS;
! %fortranconst SQL_API_SQLTABLEPRIVILEGES;
! %fortranconst SQL_API_ALL_FUNCTIONS;
! %fortranconst SQL_API_LOADBYORDINAL;
! %fortranconst SQL_API_ODBC3_ALL_FUNCTIONS;
! %fortranconst SQL_API_ODBC3_ALL_FUNCTIONS_SIZE;
! %fortranconst SQL_INFO_FIRST;
! %fortranconst SQL_ACTIVE_CONNECTIONS;
! %fortranconst SQL_ACTIVE_STATEMENTS;
! %fortranconst SQL_DRIVER_HDBC;
! %fortranconst SQL_DRIVER_HENV;
! %fortranconst SQL_DRIVER_HSTMT;
! %fortranconst SQL_DRIVER_NAME;
! %fortranconst SQL_DRIVER_VER;
! %fortranconst SQL_ODBC_API_CONFORMANCE;
! %fortranconst SQL_ODBC_VER;
! %fortranconst SQL_ROW_UPDATES;
! %fortranconst SQL_ODBC_SAG_CLI_CONFORMANCE;
! %fortranconst SQL_ODBC_SQL_CONFORMANCE;
! %fortranconst SQL_PROCEDURES;
! %fortranconst SQL_CONCAT_NULL_BEHAVIOR;
! %fortranconst SQL_CURSOR_ROLLBACK_BEHAVIOR;
! %fortranconst SQL_EXPRESSIONS_IN_ORDERBY;
! %fortranconst SQL_MAX_OWNER_NAME_LEN;
! %fortranconst SQL_MAX_PROCEDURE_NAME_LEN;
! %fortranconst SQL_MAX_QUALIFIER_NAME_LEN;
! %fortranconst SQL_MULT_RESULT_SETS;
! %fortranconst SQL_MULTIPLE_ACTIVE_TXN;
! %fortranconst SQL_OUTER_JOINS;
! %fortranconst SQL_OWNER_TERM;
! %fortranconst SQL_PROCEDURE_TERM;
! %fortranconst SQL_QUALIFIER_NAME_SEPARATOR;
! %fortranconst SQL_QUALIFIER_TERM;
! %fortranconst SQL_SCROLL_OPTIONS;
! %fortranconst SQL_TABLE_TERM;
! %fortranconst SQL_CONVERT_FUNCTIONS;
! %fortranconst SQL_NUMERIC_FUNCTIONS;
! %fortranconst SQL_STRING_FUNCTIONS;
! %fortranconst SQL_SYSTEM_FUNCTIONS;
! %fortranconst SQL_TIMEDATE_FUNCTIONS;
! %fortranconst SQL_CONVERT_BIGINT;
! %fortranconst SQL_CONVERT_BINARY;
! %fortranconst SQL_CONVERT_BIT;
! %fortranconst SQL_CONVERT_CHAR;
! %fortranconst SQL_CONVERT_DATE;
! %fortranconst SQL_CONVERT_DECIMAL;
! %fortranconst SQL_CONVERT_DOUBLE;
! %fortranconst SQL_CONVERT_FLOAT;
! %fortranconst SQL_CONVERT_INTEGER;
! %fortranconst SQL_CONVERT_LONGVARCHAR;
! %fortranconst SQL_CONVERT_NUMERIC;
! %fortranconst SQL_CONVERT_REAL;
! %fortranconst SQL_CONVERT_SMALLINT;
! %fortranconst SQL_CONVERT_TIME;
! %fortranconst SQL_CONVERT_TIMESTAMP;
! %fortranconst SQL_CONVERT_TINYINT;
! %fortranconst SQL_CONVERT_VARBINARY;
! %fortranconst SQL_CONVERT_VARCHAR;
! %fortranconst SQL_CONVERT_LONGVARBINARY;
! %fortranconst SQL_CONVERT_GUID;
! %fortranconst SQL_ODBC_SQL_OPT_IEF;
! %fortranconst SQL_CORRELATION_NAME;
! %fortranconst SQL_NON_NULLABLE_COLUMNS;
! %fortranconst SQL_DRIVER_HLIB;
! %fortranconst SQL_DRIVER_ODBC_VER;
! %fortranconst SQL_LOCK_TYPES;
! %fortranconst SQL_POS_OPERATIONS;
! %fortranconst SQL_POSITIONED_STATEMENTS;
! %fortranconst SQL_BOOKMARK_PERSISTENCE;
! %fortranconst SQL_STATIC_SENSITIVITY;
! %fortranconst SQL_FILE_USAGE;
! %fortranconst SQL_COLUMN_ALIAS;
! %fortranconst SQL_GROUP_BY;
! %fortranconst SQL_KEYWORDS;
! %fortranconst SQL_OWNER_USAGE;
! %fortranconst SQL_QUALIFIER_USAGE;
! %fortranconst SQL_QUOTED_IDENTIFIER_CASE;
! %fortranconst SQL_SUBQUERIES;
! %fortranconst SQL_UNION;
! %fortranconst SQL_MAX_ROW_SIZE_INCLUDES_LONG;
! %fortranconst SQL_MAX_CHAR_LITERAL_LEN;
! %fortranconst SQL_TIMEDATE_ADD_INTERVALS;
! %fortranconst SQL_TIMEDATE_DIFF_INTERVALS;
! %fortranconst SQL_NEED_LONG_DATA_LEN;
! %fortranconst SQL_MAX_BINARY_LITERAL_LEN;
! %fortranconst SQL_LIKE_ESCAPE_CLAUSE;
! %fortranconst SQL_QUALIFIER_LOCATION;
! %fortranconst SQL_ACTIVE_ENVIRONMENTS;
! %fortranconst SQL_ALTER_DOMAIN;
! %fortranconst SQL_SQL_CONFORMANCE;
! %fortranconst SQL_DATETIME_LITERALS;
! %fortranconst SQL_ASYNC_MODE;
! %fortranconst SQL_BATCH_ROW_COUNT;
! %fortranconst SQL_BATCH_SUPPORT;
! %fortranconst SQL_CATALOG_LOCATION;
! %fortranconst SQL_CATALOG_NAME_SEPARATOR;
! %fortranconst SQL_CATALOG_TERM;
! %fortranconst SQL_CATALOG_USAGE;
! %fortranconst SQL_CONVERT_WCHAR;
! %fortranconst SQL_CONVERT_INTERVAL_DAY_TIME;
! %fortranconst SQL_CONVERT_INTERVAL_YEAR_MONTH;
! %fortranconst SQL_CONVERT_WLONGVARCHAR;
! %fortranconst SQL_CONVERT_WVARCHAR;
! %fortranconst SQL_CREATE_ASSERTION;
! %fortranconst SQL_CREATE_CHARACTER_SET;
! %fortranconst SQL_CREATE_COLLATION;
! %fortranconst SQL_CREATE_DOMAIN;
! %fortranconst SQL_CREATE_SCHEMA;
! %fortranconst SQL_CREATE_TABLE;
! %fortranconst SQL_CREATE_TRANSLATION;
! %fortranconst SQL_CREATE_VIEW;
! %fortranconst SQL_DRIVER_HDESC;
! %fortranconst SQL_DROP_ASSERTION;
! %fortranconst SQL_DROP_CHARACTER_SET;
! %fortranconst SQL_DROP_COLLATION;
! %fortranconst SQL_DROP_DOMAIN;
! %fortranconst SQL_DROP_SCHEMA;
! %fortranconst SQL_DROP_TABLE;
! %fortranconst SQL_DROP_TRANSLATION;
! %fortranconst SQL_DROP_VIEW;
! %fortranconst SQL_DYNAMIC_CURSOR_ATTRIBUTES1;
! %fortranconst SQL_DYNAMIC_CURSOR_ATTRIBUTES2;
! %fortranconst SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES1;
! %fortranconst SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES2;
! %fortranconst SQL_INDEX_KEYWORDS;
! %fortranconst SQL_INFO_SCHEMA_VIEWS;
! %fortranconst SQL_KEYSET_CURSOR_ATTRIBUTES1;
! %fortranconst SQL_KEYSET_CURSOR_ATTRIBUTES2;
! %fortranconst SQL_MAX_ASYNC_CONCURRENT_STATEMENTS;
! %fortranconst SQL_ODBC_INTERFACE_CONFORMANCE;
! %fortranconst SQL_PARAM_ARRAY_ROW_COUNTS;
! %fortranconst SQL_PARAM_ARRAY_SELECTS;
! %fortranconst SQL_SCHEMA_TERM;
! %fortranconst SQL_SCHEMA_USAGE;
! %fortranconst SQL_SQL92_DATETIME_FUNCTIONS;
! %fortranconst SQL_SQL92_FOREIGN_KEY_DELETE_RULE;
! %fortranconst SQL_SQL92_FOREIGN_KEY_UPDATE_RULE;
! %fortranconst SQL_SQL92_GRANT;
! %fortranconst SQL_SQL92_NUMERIC_VALUE_FUNCTIONS;
! %fortranconst SQL_SQL92_PREDICATES;
! %fortranconst SQL_SQL92_RELATIONAL_JOIN_OPERATORS;
! %fortranconst SQL_SQL92_REVOKE;
! %fortranconst SQL_SQL92_ROW_VALUE_CONSTRUCTOR;
! %fortranconst SQL_SQL92_STRING_FUNCTIONS;
! %fortranconst SQL_SQL92_VALUE_EXPRESSIONS;
! %fortranconst SQL_STANDARD_CLI_CONFORMANCE;
! %fortranconst SQL_STATIC_CURSOR_ATTRIBUTES1;
! %fortranconst SQL_STATIC_CURSOR_ATTRIBUTES2;
! %fortranconst SQL_AGGREGATE_FUNCTIONS;
! %fortranconst SQL_DDL_INDEX;
! %fortranconst SQL_DM_VER;
! %fortranconst SQL_INSERT_STATEMENT;
! %fortranconst SQL_UNION_STATEMENT;
! %fortranconst SQL_ASYNC_DBC_FUNCTIONS;
! %fortranconst SQL_DRIVER_AWARE_POOLING_SUPPORTED;
! %fortranconst SQL_ASYNC_NOTIFICATION;
! %fortranconst SQL_ASYNC_NOTIFICATION_NOT_CAPABLE;
! %fortranconst SQL_ASYNC_NOTIFICATION_CAPABLE;
! %fortranconst SQL_DTC_TRANSITION_COST;
! %fortranconst SQL_AT_ADD_COLUMN_SINGLE;
! %fortranconst SQL_AT_ADD_COLUMN_DEFAULT;
! %fortranconst SQL_AT_ADD_COLUMN_COLLATION;
! %fortranconst SQL_AT_SET_COLUMN_DEFAULT;
! %fortranconst SQL_AT_DROP_COLUMN_DEFAULT;
! %fortranconst SQL_AT_DROP_COLUMN_CASCADE;
! %fortranconst SQL_AT_DROP_COLUMN_RESTRICT;
! %fortranconst SQL_AT_ADD_TABLE_CONSTRAINT;
! %fortranconst SQL_AT_DROP_TABLE_CONSTRAINT_CASCADE;
! %fortranconst SQL_AT_DROP_TABLE_CONSTRAINT_RESTRICT;
! %fortranconst SQL_AT_CONSTRAINT_NAME_DEFINITION;
! %fortranconst SQL_AT_CONSTRAINT_INITIALLY_DEFERRED;
! %fortranconst SQL_AT_CONSTRAINT_INITIALLY_IMMEDIATE;
! %fortranconst SQL_AT_CONSTRAINT_DEFERRABLE;
! %fortranconst SQL_AT_CONSTRAINT_NON_DEFERRABLE;
! %fortranconst SQL_CVT_CHAR;
! %fortranconst SQL_CVT_NUMERIC;
! %fortranconst SQL_CVT_DECIMAL;
! %fortranconst SQL_CVT_INTEGER;
! %fortranconst SQL_CVT_SMALLINT;
! %fortranconst SQL_CVT_FLOAT;
! %fortranconst SQL_CVT_REAL;
! %fortranconst SQL_CVT_DOUBLE;
! %fortranconst SQL_CVT_VARCHAR;
! %fortranconst SQL_CVT_LONGVARCHAR;
! %fortranconst SQL_CVT_BINARY;
! %fortranconst SQL_CVT_VARBINARY;
! %fortranconst SQL_CVT_BIT;
! %fortranconst SQL_CVT_TINYINT;
! %fortranconst SQL_CVT_BIGINT;
! %fortranconst SQL_CVT_DATE;
! %fortranconst SQL_CVT_TIME;
! %fortranconst SQL_CVT_TIMESTAMP;
! %fortranconst SQL_CVT_LONGVARBINARY;
! %fortranconst SQL_CVT_INTERVAL_YEAR_MONTH;
! %fortranconst SQL_CVT_INTERVAL_DAY_TIME;
! %fortranconst SQL_CVT_WCHAR;
! %fortranconst SQL_CVT_WLONGVARCHAR;
! %fortranconst SQL_CVT_WVARCHAR;
! %fortranconst SQL_CVT_GUID;
! %fortranconst SQL_FN_CVT_CONVERT;
! %fortranconst SQL_FN_CVT_CAST;
! %fortranconst SQL_FN_STR_CONCAT;
! %fortranconst SQL_FN_STR_INSERT;
! %fortranconst SQL_FN_STR_LEFT;
! %fortranconst SQL_FN_STR_LTRIM;
! %fortranconst SQL_FN_STR_LENGTH;
! %fortranconst SQL_FN_STR_LOCATE;
! %fortranconst SQL_FN_STR_LCASE;
! %fortranconst SQL_FN_STR_REPEAT;
! %fortranconst SQL_FN_STR_REPLACE;
! %fortranconst SQL_FN_STR_RIGHT;
! %fortranconst SQL_FN_STR_RTRIM;
! %fortranconst SQL_FN_STR_SUBSTRING;
! %fortranconst SQL_FN_STR_UCASE;
! %fortranconst SQL_FN_STR_ASCII;
! %fortranconst SQL_FN_STR_CHAR;
! %fortranconst SQL_FN_STR_DIFFERENCE;
! %fortranconst SQL_FN_STR_LOCATE_2;
! %fortranconst SQL_FN_STR_SOUNDEX;
! %fortranconst SQL_FN_STR_SPACE;
! %fortranconst SQL_FN_STR_BIT_LENGTH;
! %fortranconst SQL_FN_STR_CHAR_LENGTH;
! %fortranconst SQL_FN_STR_CHARACTER_LENGTH;
! %fortranconst SQL_FN_STR_OCTET_LENGTH;
! %fortranconst SQL_FN_STR_POSITION;
! %fortranconst SQL_SSF_CONVERT;
! %fortranconst SQL_SSF_LOWER;
! %fortranconst SQL_SSF_UPPER;
! %fortranconst SQL_SSF_SUBSTRING;
! %fortranconst SQL_SSF_TRANSLATE;
! %fortranconst SQL_SSF_TRIM_BOTH;
! %fortranconst SQL_SSF_TRIM_LEADING;
! %fortranconst SQL_SSF_TRIM_TRAILING;
! %fortranconst SQL_FN_NUM_ABS;
! %fortranconst SQL_FN_NUM_ACOS;
! %fortranconst SQL_FN_NUM_ASIN;
! %fortranconst SQL_FN_NUM_ATAN;
! %fortranconst SQL_FN_NUM_ATAN2;
! %fortranconst SQL_FN_NUM_CEILING;
! %fortranconst SQL_FN_NUM_COS;
! %fortranconst SQL_FN_NUM_COT;
! %fortranconst SQL_FN_NUM_EXP;
! %fortranconst SQL_FN_NUM_FLOOR;
! %fortranconst SQL_FN_NUM_LOG;
! %fortranconst SQL_FN_NUM_MOD;
! %fortranconst SQL_FN_NUM_SIGN;
! %fortranconst SQL_FN_NUM_SIN;
! %fortranconst SQL_FN_NUM_SQRT;
! %fortranconst SQL_FN_NUM_TAN;
! %fortranconst SQL_FN_NUM_PI;
! %fortranconst SQL_FN_NUM_RAND;
! %fortranconst SQL_FN_NUM_DEGREES;
! %fortranconst SQL_FN_NUM_LOG10;
! %fortranconst SQL_FN_NUM_POWER;
! %fortranconst SQL_FN_NUM_RADIANS;
! %fortranconst SQL_FN_NUM_ROUND;
! %fortranconst SQL_FN_NUM_TRUNCATE;
! %fortranconst SQL_SNVF_BIT_LENGTH;
! %fortranconst SQL_SNVF_CHAR_LENGTH;
! %fortranconst SQL_SNVF_CHARACTER_LENGTH;
! %fortranconst SQL_SNVF_EXTRACT;
! %fortranconst SQL_SNVF_OCTET_LENGTH;
! %fortranconst SQL_SNVF_POSITION;
! %fortranconst SQL_FN_TD_NOW;
! %fortranconst SQL_FN_TD_CURDATE;
! %fortranconst SQL_FN_TD_DAYOFMONTH;
! %fortranconst SQL_FN_TD_DAYOFWEEK;
! %fortranconst SQL_FN_TD_DAYOFYEAR;
! %fortranconst SQL_FN_TD_MONTH;
! %fortranconst SQL_FN_TD_QUARTER;
! %fortranconst SQL_FN_TD_WEEK;
! %fortranconst SQL_FN_TD_YEAR;
! %fortranconst SQL_FN_TD_CURTIME;
! %fortranconst SQL_FN_TD_HOUR;
! %fortranconst SQL_FN_TD_MINUTE;
! %fortranconst SQL_FN_TD_SECOND;
! %fortranconst SQL_FN_TD_TIMESTAMPADD;
! %fortranconst SQL_FN_TD_TIMESTAMPDIFF;
! %fortranconst SQL_FN_TD_DAYNAME;
! %fortranconst SQL_FN_TD_MONTHNAME;
! %fortranconst SQL_FN_TD_CURRENT_DATE;
! %fortranconst SQL_FN_TD_CURRENT_TIME;
! %fortranconst SQL_FN_TD_CURRENT_TIMESTAMP;
! %fortranconst SQL_FN_TD_EXTRACT;
! %fortranconst SQL_SDF_CURRENT_DATE;
! %fortranconst SQL_SDF_CURRENT_TIME;
! %fortranconst SQL_SDF_CURRENT_TIMESTAMP;
! %fortranconst SQL_FN_SYS_USERNAME;
! %fortranconst SQL_FN_SYS_DBNAME;
! %fortranconst SQL_FN_SYS_IFNULL;
! %fortranconst SQL_FN_TSI_FRAC_SECOND;
! %fortranconst SQL_FN_TSI_SECOND;
! %fortranconst SQL_FN_TSI_MINUTE;
! %fortranconst SQL_FN_TSI_HOUR;
! %fortranconst SQL_FN_TSI_DAY;
! %fortranconst SQL_FN_TSI_WEEK;
! %fortranconst SQL_FN_TSI_MONTH;
! %fortranconst SQL_FN_TSI_QUARTER;
! %fortranconst SQL_FN_TSI_YEAR;
! %fortranconst SQL_CA1_NEXT;
! %fortranconst SQL_CA1_ABSOLUTE;
! %fortranconst SQL_CA1_RELATIVE;
! %fortranconst SQL_CA1_BOOKMARK;
! %fortranconst SQL_CA1_LOCK_NO_CHANGE;
! %fortranconst SQL_CA1_LOCK_EXCLUSIVE;
! %fortranconst SQL_CA1_LOCK_UNLOCK;
! %fortranconst SQL_CA1_POS_POSITION;
! %fortranconst SQL_CA1_POS_UPDATE;
! %fortranconst SQL_CA1_POS_DELETE;
! %fortranconst SQL_CA1_POS_REFRESH;
! %fortranconst SQL_CA1_POSITIONED_UPDATE;
! %fortranconst SQL_CA1_POSITIONED_DELETE;
! %fortranconst SQL_CA1_SELECT_FOR_UPDATE;
! %fortranconst SQL_CA1_BULK_ADD;
! %fortranconst SQL_CA1_BULK_UPDATE_BY_BOOKMARK;
! %fortranconst SQL_CA1_BULK_DELETE_BY_BOOKMARK;
! %fortranconst SQL_CA1_BULK_FETCH_BY_BOOKMARK;
! %fortranconst SQL_CA2_READ_ONLY_CONCURRENCY;
! %fortranconst SQL_CA2_LOCK_CONCURRENCY;
! %fortranconst SQL_CA2_OPT_ROWVER_CONCURRENCY;
! %fortranconst SQL_CA2_OPT_VALUES_CONCURRENCY;
! %fortranconst SQL_CA2_SENSITIVITY_ADDITIONS;
! %fortranconst SQL_CA2_SENSITIVITY_DELETIONS;
! %fortranconst SQL_CA2_SENSITIVITY_UPDATES;
! %fortranconst SQL_CA2_MAX_ROWS_SELECT;
! %fortranconst SQL_CA2_MAX_ROWS_INSERT;
! %fortranconst SQL_CA2_MAX_ROWS_DELETE;
! %fortranconst SQL_CA2_MAX_ROWS_UPDATE;
! %fortranconst SQL_CA2_MAX_ROWS_CATALOG;
! %fortranconst SQL_CA2_MAX_ROWS_AFFECTS_ALL;
! %fortranconst SQL_CA2_CRC_EXACT;
! %fortranconst SQL_CA2_CRC_APPROXIMATE;
! %fortranconst SQL_CA2_SIMULATE_NON_UNIQUE;
! %fortranconst SQL_CA2_SIMULATE_TRY_UNIQUE;
! %fortranconst SQL_CA2_SIMULATE_UNIQUE;
! %fortranconst SQL_OAC_NONE;
! %fortranconst SQL_OAC_LEVEL1;
! %fortranconst SQL_OAC_LEVEL2;
! %fortranconst SQL_OSCC_NOT_COMPLIANT;
! %fortranconst SQL_OSCC_COMPLIANT;
! %fortranconst SQL_OSC_MINIMUM;
! %fortranconst SQL_OSC_CORE;
! %fortranconst SQL_OSC_EXTENDED;
! %fortranconst SQL_CB_NULL;
! %fortranconst SQL_CB_NON_NULL;
! %fortranconst SQL_SO_FORWARD_ONLY;
! %fortranconst SQL_SO_KEYSET_DRIVEN;
! %fortranconst SQL_SO_DYNAMIC;
! %fortranconst SQL_SO_MIXED;
! %fortranconst SQL_SO_STATIC;
! %fortranconst SQL_FD_FETCH_BOOKMARK;
! %fortranconst SQL_CN_NONE;
! %fortranconst SQL_CN_DIFFERENT;
! %fortranconst SQL_CN_ANY;
! %fortranconst SQL_NNC_NULL;
! %fortranconst SQL_NNC_NON_NULL;
! %fortranconst SQL_NC_START;
! %fortranconst SQL_NC_END;
! %fortranconst SQL_FILE_NOT_SUPPORTED;
! %fortranconst SQL_FILE_TABLE;
! %fortranconst SQL_FILE_QUALIFIER;
! %fortranconst SQL_FILE_CATALOG;
! %fortranconst SQL_GD_BLOCK;
! %fortranconst SQL_GD_BOUND;
! %fortranconst SQL_GD_OUTPUT_PARAMS;
! %fortranconst SQL_PS_POSITIONED_DELETE;
! %fortranconst SQL_PS_POSITIONED_UPDATE;
! %fortranconst SQL_PS_SELECT_FOR_UPDATE;
! %fortranconst SQL_GB_NOT_SUPPORTED;
! %fortranconst SQL_GB_GROUP_BY_EQUALS_SELECT;
! %fortranconst SQL_GB_GROUP_BY_CONTAINS_SELECT;
! %fortranconst SQL_GB_NO_RELATION;
! %fortranconst SQL_GB_COLLATE;
! %fortranconst SQL_OU_DML_STATEMENTS;
! %fortranconst SQL_OU_PROCEDURE_INVOCATION;
! %fortranconst SQL_OU_TABLE_DEFINITION;
! %fortranconst SQL_OU_INDEX_DEFINITION;
! %fortranconst SQL_OU_PRIVILEGE_DEFINITION;
! %fortranconst SQL_SU_DML_STATEMENTS;
! %fortranconst SQL_SU_PROCEDURE_INVOCATION;
! %fortranconst SQL_SU_TABLE_DEFINITION;
! %fortranconst SQL_SU_INDEX_DEFINITION;
! %fortranconst SQL_SU_PRIVILEGE_DEFINITION;
! %fortranconst SQL_QU_DML_STATEMENTS;
! %fortranconst SQL_QU_PROCEDURE_INVOCATION;
! %fortranconst SQL_QU_TABLE_DEFINITION;
! %fortranconst SQL_QU_INDEX_DEFINITION;
! %fortranconst SQL_QU_PRIVILEGE_DEFINITION;
! %fortranconst SQL_CU_DML_STATEMENTS;
! %fortranconst SQL_CU_PROCEDURE_INVOCATION;
! %fortranconst SQL_CU_TABLE_DEFINITION;
! %fortranconst SQL_CU_INDEX_DEFINITION;
! %fortranconst SQL_CU_PRIVILEGE_DEFINITION;
! %fortranconst SQL_SQ_COMPARISON;
! %fortranconst SQL_SQ_EXISTS;
! %fortranconst SQL_SQ_IN;
! %fortranconst SQL_SQ_QUANTIFIED;
! %fortranconst SQL_SQ_CORRELATED_SUBQUERIES;
! %fortranconst SQL_U_UNION;
! %fortranconst SQL_U_UNION_ALL;
! %fortranconst SQL_BP_CLOSE;
! %fortranconst SQL_BP_DELETE;
! %fortranconst SQL_BP_DROP;
! %fortranconst SQL_BP_TRANSACTION;
! %fortranconst SQL_BP_UPDATE;
! %fortranconst SQL_BP_OTHER_HSTMT;
! %fortranconst SQL_BP_SCROLL;
! %fortranconst SQL_SS_ADDITIONS;
! %fortranconst SQL_SS_DELETIONS;
! %fortranconst SQL_SS_UPDATES;
! %fortranconst SQL_CV_CREATE_VIEW;
! %fortranconst SQL_CV_CHECK_OPTION;
! %fortranconst SQL_CV_CASCADED;
! %fortranconst SQL_CV_LOCAL;
! %fortranconst SQL_LCK_NO_CHANGE;
! %fortranconst SQL_LCK_EXCLUSIVE;
! %fortranconst SQL_LCK_UNLOCK;
! %fortranconst SQL_POS_POSITION;
! %fortranconst SQL_POS_REFRESH;
! %fortranconst SQL_POS_UPDATE;
! %fortranconst SQL_POS_DELETE;
! %fortranconst SQL_POS_ADD;
! %fortranconst SQL_QL_START;
! %fortranconst SQL_QL_END;
! %fortranconst SQL_AF_AVG;
! %fortranconst SQL_AF_COUNT;
! %fortranconst SQL_AF_MAX;
! %fortranconst SQL_AF_MIN;
! %fortranconst SQL_AF_SUM;
! %fortranconst SQL_AF_DISTINCT;
! %fortranconst SQL_AF_ALL;
! %fortranconst SQL_SC_SQL92_ENTRY;
! %fortranconst SQL_SC_FIPS127_2_TRANSITIONAL;
! %fortranconst SQL_SC_SQL92_INTERMEDIATE;
! %fortranconst SQL_SC_SQL92_FULL;
! %fortranconst SQL_DL_SQL92_DATE;
! %fortranconst SQL_DL_SQL92_TIME;
! %fortranconst SQL_DL_SQL92_TIMESTAMP;
! %fortranconst SQL_DL_SQL92_INTERVAL_YEAR;
! %fortranconst SQL_DL_SQL92_INTERVAL_MONTH;
! %fortranconst SQL_DL_SQL92_INTERVAL_DAY;
! %fortranconst SQL_DL_SQL92_INTERVAL_HOUR;
! %fortranconst SQL_DL_SQL92_INTERVAL_MINUTE;
! %fortranconst SQL_DL_SQL92_INTERVAL_SECOND;
! %fortranconst SQL_DL_SQL92_INTERVAL_YEAR_TO_MONTH;
! %fortranconst SQL_DL_SQL92_INTERVAL_DAY_TO_HOUR;
! %fortranconst SQL_DL_SQL92_INTERVAL_DAY_TO_MINUTE;
! %fortranconst SQL_DL_SQL92_INTERVAL_DAY_TO_SECOND;
! %fortranconst SQL_DL_SQL92_INTERVAL_HOUR_TO_MINUTE;
! %fortranconst SQL_DL_SQL92_INTERVAL_HOUR_TO_SECOND;
! %fortranconst SQL_DL_SQL92_INTERVAL_MINUTE_TO_SECOND;
! %fortranconst SQL_CL_START;
! %fortranconst SQL_CL_END;
! %fortranconst SQL_BRC_PROCEDURES;
! %fortranconst SQL_BRC_EXPLICIT;
! %fortranconst SQL_BRC_ROLLED_UP;
! %fortranconst SQL_BS_SELECT_EXPLICIT;
! %fortranconst SQL_BS_ROW_COUNT_EXPLICIT;
! %fortranconst SQL_BS_SELECT_PROC;
! %fortranconst SQL_BS_ROW_COUNT_PROC;
! %fortranconst SQL_PARC_BATCH;
! %fortranconst SQL_PARC_NO_BATCH;
! %fortranconst SQL_PAS_BATCH;
! %fortranconst SQL_PAS_NO_BATCH;
! %fortranconst SQL_PAS_NO_SELECT;
! %fortranconst SQL_IK_NONE;
! %fortranconst SQL_IK_ASC;
! %fortranconst SQL_IK_DESC;
! %fortranconst SQL_IK_ALL;
! %fortranconst SQL_ISV_ASSERTIONS;
! %fortranconst SQL_ISV_CHARACTER_SETS;
! %fortranconst SQL_ISV_CHECK_CONSTRAINTS;
! %fortranconst SQL_ISV_COLLATIONS;
! %fortranconst SQL_ISV_COLUMN_DOMAIN_USAGE;
! %fortranconst SQL_ISV_COLUMN_PRIVILEGES;
! %fortranconst SQL_ISV_COLUMNS;
! %fortranconst SQL_ISV_CONSTRAINT_COLUMN_USAGE;
! %fortranconst SQL_ISV_CONSTRAINT_TABLE_USAGE;
! %fortranconst SQL_ISV_DOMAIN_CONSTRAINTS;
! %fortranconst SQL_ISV_DOMAINS;
! %fortranconst SQL_ISV_KEY_COLUMN_USAGE;
! %fortranconst SQL_ISV_REFERENTIAL_CONSTRAINTS;
! %fortranconst SQL_ISV_SCHEMATA;
! %fortranconst SQL_ISV_SQL_LANGUAGES;
! %fortranconst SQL_ISV_TABLE_CONSTRAINTS;
! %fortranconst SQL_ISV_TABLE_PRIVILEGES;
! %fortranconst SQL_ISV_TABLES;
! %fortranconst SQL_ISV_TRANSLATIONS;
! %fortranconst SQL_ISV_USAGE_PRIVILEGES;
! %fortranconst SQL_ISV_VIEW_COLUMN_USAGE;
! %fortranconst SQL_ISV_VIEW_TABLE_USAGE;
! %fortranconst SQL_ISV_VIEWS;
! %fortranconst SQL_AM_NONE;
! %fortranconst SQL_AM_CONNECTION;
! %fortranconst SQL_AM_STATEMENT;
! %fortranconst SQL_AD_CONSTRAINT_NAME_DEFINITION;
! %fortranconst SQL_AD_ADD_DOMAIN_CONSTRAINT;
! %fortranconst SQL_AD_DROP_DOMAIN_CONSTRAINT;
! %fortranconst SQL_AD_ADD_DOMAIN_DEFAULT;
! %fortranconst SQL_AD_DROP_DOMAIN_DEFAULT;
! %fortranconst SQL_AD_ADD_CONSTRAINT_INITIALLY_DEFERRED;
! %fortranconst SQL_AD_ADD_CONSTRAINT_INITIALLY_IMMEDIATE;
! %fortranconst SQL_AD_ADD_CONSTRAINT_DEFERRABLE;
! %fortranconst SQL_AD_ADD_CONSTRAINT_NON_DEFERRABLE;
! %fortranconst SQL_CS_CREATE_SCHEMA;
! %fortranconst SQL_CS_AUTHORIZATION;
! %fortranconst SQL_CS_DEFAULT_CHARACTER_SET;
! %fortranconst SQL_CTR_CREATE_TRANSLATION;
! %fortranconst SQL_CA_CREATE_ASSERTION;
! %fortranconst SQL_CA_CONSTRAINT_INITIALLY_DEFERRED;
! %fortranconst SQL_CA_CONSTRAINT_INITIALLY_IMMEDIATE;
! %fortranconst SQL_CA_CONSTRAINT_DEFERRABLE;
! %fortranconst SQL_CA_CONSTRAINT_NON_DEFERRABLE;
! %fortranconst SQL_CCS_CREATE_CHARACTER_SET;
! %fortranconst SQL_CCS_COLLATE_CLAUSE;
! %fortranconst SQL_CCS_LIMITED_COLLATION;
! %fortranconst SQL_CCOL_CREATE_COLLATION;
! %fortranconst SQL_CDO_CREATE_DOMAIN;
! %fortranconst SQL_CDO_DEFAULT;
! %fortranconst SQL_CDO_CONSTRAINT;
! %fortranconst SQL_CDO_COLLATION;
! %fortranconst SQL_CDO_CONSTRAINT_NAME_DEFINITION;
! %fortranconst SQL_CDO_CONSTRAINT_INITIALLY_DEFERRED;
! %fortranconst SQL_CDO_CONSTRAINT_INITIALLY_IMMEDIATE;
! %fortranconst SQL_CDO_CONSTRAINT_DEFERRABLE;
! %fortranconst SQL_CDO_CONSTRAINT_NON_DEFERRABLE;
! %fortranconst SQL_CT_CREATE_TABLE;
! %fortranconst SQL_CT_COMMIT_PRESERVE;
! %fortranconst SQL_CT_COMMIT_DELETE;
! %fortranconst SQL_CT_GLOBAL_TEMPORARY;
! %fortranconst SQL_CT_LOCAL_TEMPORARY;
! %fortranconst SQL_CT_CONSTRAINT_INITIALLY_DEFERRED;
! %fortranconst SQL_CT_CONSTRAINT_INITIALLY_IMMEDIATE;
! %fortranconst SQL_CT_CONSTRAINT_DEFERRABLE;
! %fortranconst SQL_CT_CONSTRAINT_NON_DEFERRABLE;
! %fortranconst SQL_CT_COLUMN_CONSTRAINT;
! %fortranconst SQL_CT_COLUMN_DEFAULT;
! %fortranconst SQL_CT_COLUMN_COLLATION;
! %fortranconst SQL_CT_TABLE_CONSTRAINT;
! %fortranconst SQL_CT_CONSTRAINT_NAME_DEFINITION;
! %fortranconst SQL_DI_CREATE_INDEX;
! %fortranconst SQL_DI_DROP_INDEX;
! %fortranconst SQL_DC_DROP_COLLATION;
! %fortranconst SQL_DD_DROP_DOMAIN;
! %fortranconst SQL_DD_RESTRICT;
! %fortranconst SQL_DD_CASCADE;
! %fortranconst SQL_DS_DROP_SCHEMA;
! %fortranconst SQL_DS_RESTRICT;
! %fortranconst SQL_DS_CASCADE;
! %fortranconst SQL_DCS_DROP_CHARACTER_SET;
! %fortranconst SQL_DA_DROP_ASSERTION;
! %fortranconst SQL_DT_DROP_TABLE;
! %fortranconst SQL_DT_RESTRICT;
! %fortranconst SQL_DT_CASCADE;
! %fortranconst SQL_DTR_DROP_TRANSLATION;
! %fortranconst SQL_DV_DROP_VIEW;
! %fortranconst SQL_DV_RESTRICT;
! %fortranconst SQL_DV_CASCADE;
! %fortranconst SQL_IS_INSERT_LITERALS;
! %fortranconst SQL_IS_INSERT_SEARCHED;
! %fortranconst SQL_IS_SELECT_INTO;
! %fortranconst SQL_OIC_CORE;
! %fortranconst SQL_OIC_LEVEL1;
! %fortranconst SQL_OIC_LEVEL2;
! %fortranconst SQL_SFKD_CASCADE;
! %fortranconst SQL_SFKD_NO_ACTION;
! %fortranconst SQL_SFKD_SET_DEFAULT;
! %fortranconst SQL_SFKD_SET_NULL;
! %fortranconst SQL_SFKU_CASCADE;
! %fortranconst SQL_SFKU_NO_ACTION;
! %fortranconst SQL_SFKU_SET_DEFAULT;
! %fortranconst SQL_SFKU_SET_NULL;
! %fortranconst SQL_SG_USAGE_ON_DOMAIN;
! %fortranconst SQL_SG_USAGE_ON_CHARACTER_SET;
! %fortranconst SQL_SG_USAGE_ON_COLLATION;
! %fortranconst SQL_SG_USAGE_ON_TRANSLATION;
! %fortranconst SQL_SG_WITH_GRANT_OPTION;
! %fortranconst SQL_SG_DELETE_TABLE;
! %fortranconst SQL_SG_INSERT_TABLE;
! %fortranconst SQL_SG_INSERT_COLUMN;
! %fortranconst SQL_SG_REFERENCES_TABLE;
! %fortranconst SQL_SG_REFERENCES_COLUMN;
! %fortranconst SQL_SG_SELECT_TABLE;
! %fortranconst SQL_SG_UPDATE_TABLE;
! %fortranconst SQL_SG_UPDATE_COLUMN;
! %fortranconst SQL_SP_EXISTS;
! %fortranconst SQL_SP_ISNOTNULL;
! %fortranconst SQL_SP_ISNULL;
! %fortranconst SQL_SP_MATCH_FULL;
! %fortranconst SQL_SP_MATCH_PARTIAL;
! %fortranconst SQL_SP_MATCH_UNIQUE_FULL;
! %fortranconst SQL_SP_MATCH_UNIQUE_PARTIAL;
! %fortranconst SQL_SP_OVERLAPS;
! %fortranconst SQL_SP_UNIQUE;
! %fortranconst SQL_SP_LIKE;
! %fortranconst SQL_SP_IN;
! %fortranconst SQL_SP_BETWEEN;
! %fortranconst SQL_SP_COMPARISON;
! %fortranconst SQL_SP_QUANTIFIED_COMPARISON;
! %fortranconst SQL_SRJO_CORRESPONDING_CLAUSE;
! %fortranconst SQL_SRJO_CROSS_JOIN;
! %fortranconst SQL_SRJO_EXCEPT_JOIN;
! %fortranconst SQL_SRJO_FULL_OUTER_JOIN;
! %fortranconst SQL_SRJO_INNER_JOIN;
! %fortranconst SQL_SRJO_INTERSECT_JOIN;
! %fortranconst SQL_SRJO_LEFT_OUTER_JOIN;
! %fortranconst SQL_SRJO_NATURAL_JOIN;
! %fortranconst SQL_SRJO_RIGHT_OUTER_JOIN;
! %fortranconst SQL_SRJO_UNION_JOIN;
! %fortranconst SQL_SR_USAGE_ON_DOMAIN;
! %fortranconst SQL_SR_USAGE_ON_CHARACTER_SET;
! %fortranconst SQL_SR_USAGE_ON_COLLATION;
! %fortranconst SQL_SR_USAGE_ON_TRANSLATION;
! %fortranconst SQL_SR_GRANT_OPTION_FOR;
! %fortranconst SQL_SR_CASCADE;
! %fortranconst SQL_SR_RESTRICT;
! %fortranconst SQL_SR_DELETE_TABLE;
! %fortranconst SQL_SR_INSERT_TABLE;
! %fortranconst SQL_SR_INSERT_COLUMN;
! %fortranconst SQL_SR_REFERENCES_TABLE;
! %fortranconst SQL_SR_REFERENCES_COLUMN;
! %fortranconst SQL_SR_SELECT_TABLE;
! %fortranconst SQL_SR_UPDATE_TABLE;
! %fortranconst SQL_SR_UPDATE_COLUMN;
! %fortranconst SQL_SRVC_VALUE_EXPRESSION;
! %fortranconst SQL_SRVC_NULL;
! %fortranconst SQL_SRVC_DEFAULT;
! %fortranconst SQL_SRVC_ROW_SUBQUERY;
! %fortranconst SQL_SVE_CASE;
! %fortranconst SQL_SVE_CAST;
! %fortranconst SQL_SVE_COALESCE;
! %fortranconst SQL_SVE_NULLIF;
! %fortranconst SQL_SCC_XOPEN_CLI_VERSION1;
! %fortranconst SQL_SCC_ISO92_CLI;
! %fortranconst SQL_US_UNION;
! %fortranconst SQL_US_UNION_ALL;
! %fortranconst SQL_DRIVER_AWARE_POOLING_NOT_CAPABLE;
! %fortranconst SQL_DRIVER_AWARE_POOLING_CAPABLE;
! %fortranconst SQL_DTC_ENLIST_EXPENSIVE;
! %fortranconst SQL_DTC_UNENLIST_EXPENSIVE;
! %fortranconst SQL_ASYNC_DBC_NOT_CAPABLE;
! %fortranconst SQL_ASYNC_DBC_CAPABLE;
! %fortranconst SQL_FETCH_FIRST_USER;
! %fortranconst SQL_FETCH_FIRST_SYSTEM;
! %fortranconst SQL_ENTIRE_ROWSET;
! %fortranconst SQL_POSITION;
! %fortranconst SQL_REFRESH;
! %fortranconst SQL_UPDATE;
! %fortranconst SQL_DELETE;
! %fortranconst SQL_ADD;
! %fortranconst SQL_SETPOS_MAX_OPTION_VALUE;
! %fortranconst SQL_UPDATE_BY_BOOKMARK;
! %fortranconst SQL_DELETE_BY_BOOKMARK;
! %fortranconst SQL_FETCH_BY_BOOKMARK;
! %fortranconst SQL_LOCK_NO_CHANGE;
! %fortranconst SQL_LOCK_EXCLUSIVE;
! %fortranconst SQL_LOCK_UNLOCK;
! %fortranconst SQL_SETPOS_MAX_LOCK_VALUE;
! %fortranconst SQL_BEST_ROWID;
! %fortranconst SQL_ROWVER;
! %fortranconst SQL_PC_NOT_PSEUDO;
! %fortranconst SQL_QUICK;
! %fortranconst SQL_ENSURE;
! %fortranconst SQL_TABLE_STAT;
! %fortranconst SQL_ALL_CATALOGS;
! %fortranconst SQL_ALL_SCHEMAS;
! %fortranconst SQL_ALL_TABLE_TYPES;
! %fortranconst SQL_DRIVER_NOPROMPT;
! %fortranconst SQL_DRIVER_COMPLETE;
! %fortranconst SQL_DRIVER_PROMPT;
! %fortranconst SQL_DRIVER_COMPLETE_REQUIRED;
! %fortranconst SQL_FETCH_BOOKMARK;
! %fortranconst SQL_ROW_SUCCESS;
! %fortranconst SQL_ROW_DELETED;
! %fortranconst SQL_ROW_UPDATED;
! %fortranconst SQL_ROW_NOROW;
! %fortranconst SQL_ROW_ADDED;
! %fortranconst SQL_ROW_ERROR;
! %fortranconst SQL_ROW_SUCCESS_WITH_INFO;
! %fortranconst SQL_ROW_PROCEED;
! %fortranconst SQL_ROW_IGNORE;
! %fortranconst SQL_PARAM_SUCCESS;
! %fortranconst SQL_PARAM_SUCCESS_WITH_INFO;
! %fortranconst SQL_PARAM_ERROR;
! %fortranconst SQL_PARAM_UNUSED;
! %fortranconst SQL_PARAM_DIAG_UNAVAILABLE;
! %fortranconst SQL_PARAM_PROCEED;
! %fortranconst SQL_PARAM_IGNORE;
! %fortranconst SQL_CASCADE;
! %fortranconst SQL_RESTRICT;
! %fortranconst SQL_SET_NULL;
! %fortranconst SQL_NO_ACTION;
! %fortranconst SQL_SET_DEFAULT;
! %fortranconst SQL_INITIALLY_DEFERRED;
! %fortranconst SQL_INITIALLY_IMMEDIATE;
! %fortranconst SQL_NOT_DEFERRABLE;
! %fortranconst SQL_PARAM_TYPE_UNKNOWN;
! %fortranconst SQL_PARAM_INPUT;
! %fortranconst SQL_PARAM_INPUT_OUTPUT;
! %fortranconst SQL_RESULT_COL;
! %fortranconst SQL_PARAM_OUTPUT;
! %fortranconst SQL_RETURN_VALUE;
! %fortranconst SQL_PARAM_INPUT_OUTPUT_STREAM;
! %fortranconst SQL_PARAM_OUTPUT_STREAM;
! %fortranconst SQL_PT_UNKNOWN;
! %fortranconst SQL_PT_PROCEDURE;
! %fortranconst SQL_PT_FUNCTION;
! %fortranconst SQL_ODBC_KEYWORDS;
! %fortranconst SQL_DATABASE_NAME;
! %fortranconst SQL_CONCUR_TIMESTAMP;
! %fortranconst SQL_SCROLL_FORWARD_ONLY;
! %fortranconst SQL_SCROLL_KEYSET_DRIVEN;
! %fortranconst SQL_SCROLL_DYNAMIC;
! %fortranconst SQL_SCROLL_STATIC;
! %fortranconst TRACE_VERSION;
! %fortranconst TRACE_ON;
! %fortranconst TRACE_VS_EVENT_ON;
! %fortranconst ODBC_VS_FLAG_UNICODE_ARG;
! %fortranconst ODBC_VS_FLAG_UNICODE_COR;
! %fortranconst ODBC_VS_FLAG_RETCODE;
! %fortranconst ODBC_VS_FLAG_STOP;