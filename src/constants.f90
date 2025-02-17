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
                                           SQLINTEGER   => c_int, &
                                           SQLUINTEGER   => c_int, &
                                           SQLLEN   => c_long, &
                                           SQLULEN   => c_long, &
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

    public ::   SQLNUMERIC,     &
                SQLPOINTER,     &
                SQLREAL,        &
                SQLSMALLINT,    &
                SQLUSMALLINT,   &
                SQLINTEGER,     &
                SQLUINTEGER,    &
                SQLLEN,         &
                SQLULEN,        &
                SQLSETPOSIROW,  &
                SQLTIME,        &
                SQLTIMESTAMP,   &
                SQLVARCHAR,     &
                SQLRETURN,      &
                SQLHANDLE,      &
                SQLHENV,        &
                SQLHDBC,        &
                SQLHSTMT,       &
                SQLHDESC,       &
                HENV,           &
                HDBC,           &
                HSTMT,          &
                SQLCHAR,        &
                SQLTCHAR

    public :: trim

    integer(C_SHORT), parameter, public :: SQL_NULL_DATA = (-1)
    integer(C_SHORT), parameter, public :: SQL_DATA_AT_EXEC = (-2)
    integer(C_SHORT), parameter, public :: SQL_SUCCESS = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SUCCESS_WITH_INFO = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NO_DATA = 100_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ERROR = (-1)
    integer(C_SHORT), parameter, public :: SQL_INVALID_HANDLE = (-2)
    integer(C_SHORT), parameter, public :: SQL_STILL_EXECUTING = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NEED_DATA = 99_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PARAM_DATA_AVAILABLE = 101_C_SHORT
    integer(C_INT), parameter, public :: SQL_NTS = (-3)
    integer(C_LONG), parameter, public :: SQL_NTSL = (-3)
    integer(C_SHORT), parameter, public :: SQL_MAX_MESSAGE_LENGTH = 512_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DATE_LEN = 10_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TIME_LEN = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TIMESTAMP_LEN = 19_C_SHORT
    integer(C_INT), parameter, public :: SQL_ATTR_OUTPUT_NTS = 10001_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_AUTO_IPD = 10001_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_METADATA_ID = 10014_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_APP_ROW_DESC = 10010_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_APP_PARAM_DESC = 10011_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_IMP_ROW_DESC = 10012_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_IMP_PARAM_DESC = 10013_C_INT
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_SCROLLABLE = (-1)
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_SENSITIVITY = (-2)
    integer(C_INT), parameter, public :: SQL_NONSCROLLABLE = 0_C_INT
    integer(C_INT), parameter, public :: SQL_SCROLLABLE = 1_C_INT
    integer(C_SHORT), parameter, public :: SQL_DESC_COUNT = 1001_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_TYPE = 1002_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_LENGTH = 1003_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_OCTET_LENGTH_PTR = 1004_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_PRECISION = 1005_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_SCALE = 1006_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_DATETIME_INTERVAL_CODE = 1007_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_NULLABLE = 1008_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_INDICATOR_PTR = 1009_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_DATA_PTR = 1010_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_NAME = 1011_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_UNNAMED = 1012_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_OCTET_LENGTH = 1013_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_TYPE = 1099_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_RETURNCODE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_NUMBER = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_ROW_COUNT = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_SQLSTATE = 4_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_NATIVE = 5_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_MESSAGE_TEXT = 6_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_FUNCTION = 7_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CLASS_ORIGIN = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_SUBCLASS_ORIGIN = 9_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CONNECTION_NAME = 10_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_SERVER_NAME = 11_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_FUNCTION_CODE = 12_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_ALTER_DOMAIN = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_ALTER_TABLE = 4_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CALL = 7_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_ASSERTION = 6_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_CHARACTER_SET = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_COLLATION = 10_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_DOMAIN = 23_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_INDEX = (-1)
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_SCHEMA = 64_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_TABLE = 77_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_TRANSLATION = 79_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_CREATE_VIEW = 84_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DELETE_WHERE = 19_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_ASSERTION = 24_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_CHARACTER_SET = 25_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_COLLATION = 26_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_DOMAIN = 27_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_INDEX = (-2)
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_SCHEMA = 31_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_TABLE = 32_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_TRANSLATION = 33_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DROP_VIEW = 36_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_DELETE_CURSOR = 38_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_DYNAMIC_UPDATE_CURSOR = 81_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_GRANT = 48_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_INSERT = 50_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_REVOKE = 59_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_SELECT_CURSOR = 85_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_UNKNOWN_STATEMENT = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DIAG_UPDATE_WHERE = 82_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_UNKNOWN_TYPE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CHAR = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NUMERIC = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DECIMAL = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INTEGER = 4_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SMALLINT = 5_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FLOAT = 6_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_REAL = 7_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DOUBLE = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DATETIME = 9_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_VARCHAR = 12_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TYPE_DATE = 91_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TYPE_TIME = 92_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TYPE_TIMESTAMP = 93_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_UNSPECIFIED = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INSENSITIVE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SENSITIVE = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ALL_TYPES = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DEFAULT = 99_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ARD_TYPE = (-99)
    integer(C_SHORT), parameter, public :: SQL_CODE_DATE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CODE_TIME = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CODE_TIMESTAMP = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FALSE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TRUE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NO_NULLS = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULLABLE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULLABLE_UNKNOWN = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PRED_NONE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PRED_CHAR = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PRED_BASIC = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NAMED = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_UNNAMED = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_AUTO = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESC_ALLOC_USER = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CLOSE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DROP = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_UNBIND = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_RESET_PARAMS = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_NEXT = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_FIRST = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_LAST = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_PRIOR = 4_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_ABSOLUTE = 5_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_RELATIVE = 6_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_COMMIT = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ROLLBACK = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_HENV = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_HDBC = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_HSTMT = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_HDESC = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_DESC = 0_C_SHORT
    integer(C_LONG), parameter, public :: SQL_NULL_HANDLE = 0_C_LONG
    integer(C_SHORT), parameter, public :: SQL_SCOPE_CURROW = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SCOPE_TRANSACTION = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SCOPE_SESSION = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PC_UNKNOWN = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PC_NON_PSEUDO = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_PC_PSEUDO = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ROW_IDENTIFIER = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INDEX_UNIQUE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INDEX_ALL = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INDEX_CLUSTERED = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INDEX_HASHED = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INDEX_OTHER = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCCONNECT = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCENV = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCHANDLE = 1001_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLALLOCSTMT = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLBINDCOL = 4_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLBINDPARAM = 1002_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCANCEL = 5_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCLOSECURSOR = 1003_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLATTRIBUTE = 6_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOLUMNS = 40_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCONNECT = 7_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCOPYDESC = 1004_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLDATASOURCES = 57_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLDESCRIBECOL = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLDISCONNECT = 9_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLENDTRAN = 1005_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLERROR = 10_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLEXECDIRECT = 11_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLEXECUTE = 12_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFETCH = 13_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFETCHSCROLL = 1021_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREECONNECT = 14_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREEENV = 15_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREEHANDLE = 1006_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLFREESTMT = 16_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCONNECTATTR = 1007_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCONNECTOPTION = 42_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETCURSORNAME = 17_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDATA = 43_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDESCFIELD = 1008_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDESCREC = 1009_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDIAGFIELD = 1010_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETDIAGREC = 1011_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETENVATTR = 1012_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETFUNCTIONS = 44_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETINFO = 45_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETSTMTATTR = 1014_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETSTMTOPTION = 46_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLGETTYPEINFO = 47_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLNUMRESULTCOLS = 18_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLPARAMDATA = 48_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLPREPARE = 19_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLPUTDATA = 49_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLROWCOUNT = 20_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCONNECTATTR = 1016_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCONNECTOPTION = 50_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETCURSORNAME = 21_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETDESCFIELD = 1017_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETDESCREC = 1018_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETENVATTR = 1019_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETPARAM = 22_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETSTMTATTR = 1020_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSETSTMTOPTION = 51_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSPECIALCOLUMNS = 52_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLSTATISTICS = 53_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLTABLES = 54_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLTRANSACT = 23_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_API_SQLCANCELHANDLE = 1022_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_DRIVER_CONNECTIONS = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_DRIVER_CONNECTIONS = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_CONCURRENT_ACTIVITIES = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CONCURRENT_ACTIVITIES = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DATA_SOURCE_NAME = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_FETCH_DIRECTION = 8_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SERVER_NAME = 13_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SEARCH_PATTERN_ESCAPE = 14_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DBMS_NAME = 17_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DBMS_VER = 18_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ACCESSIBLE_TABLES = 19_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ACCESSIBLE_PROCEDURES = 20_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CURSOR_COMMIT_BEHAVIOR = 23_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DATA_SOURCE_READ_ONLY = 25_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DEFAULT_TXN_ISOLATION = 26_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_IDENTIFIER_CASE = 28_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_IDENTIFIER_QUOTE_CHAR = 29_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMN_NAME_LEN = 30_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMN_NAME_LENGTH = 30_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_CURSOR_NAME_LEN = 31_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CURSOR_NAME_LENGTH = 31_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_SCHEMA_NAME_LEN = 32_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_SCHEMA_NAME_LENGTH = 32_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_CATALOG_NAME_LEN = 34_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_CATALOG_NAME_LENGTH = 34_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_TABLE_NAME_LEN = 35_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SCROLL_CONCURRENCY = 43_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TXN_CAPABLE = 46_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TRANSACTION_CAPABLE = 46_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_USER_NAME = 47_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TXN_ISOLATION_OPTION = 72_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TRANSACTION_ISOLATION_OPTION = 72_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_INTEGRITY = 73_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_GETDATA_EXTENSIONS = 81_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NULL_COLLATION = 85_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ALTER_TABLE = 86_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_ORDER_BY_COLUMNS_IN_SELECT = 90_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_SPECIAL_CHARACTERS = 94_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_GROUP_BY = 97_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_GROUP_BY = 97_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_INDEX = 98_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_INDEX = 98_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_ORDER_BY = 99_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_ORDER_BY = 99_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_SELECT = 100_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_COLUMNS_IN_SELECT = 100_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_COLUMNS_IN_TABLE = 101_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_INDEX_SIZE = 102_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_INDEX_SIZE = 102_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_ROW_SIZE = 104_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_ROW_SIZE = 104_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_STATEMENT_LEN = 105_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_STATEMENT_LENGTH = 105_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_TABLES_IN_SELECT = 106_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_TABLES_IN_SELECT = 106_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_USER_NAME_LEN = 107_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_USER_NAME_LENGTH = 107_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_OJ_CAPABILITIES = 115_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_OUTER_JOIN_CAPABILITIES = 115_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_XOPEN_CLI_YEAR = 10000_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CURSOR_SENSITIVITY = 10001_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_DESCRIBE_PARAMETER = 10002_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CATALOG_NAME = 10003_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_COLLATION_SEQ = 10004_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAX_IDENTIFIER_LEN = 10005_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_MAXIMUM_IDENTIFIER_LENGTH = 10005_C_SHORT
    integer(C_LONG), parameter, public :: SQL_AT_ADD_COLUMN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_DROP_COLUMN = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_AT_ADD_CONSTRAINT = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_AM_NONE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_AM_CONNECTION = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_AM_STATEMENT = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CB_DELETE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CB_CLOSE = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_CB_PRESERVE = 2_C_SHORT
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_NEXT = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_FIRST = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_LAST = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_PRIOR = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_ABSOLUTE = int(z'00000010', C_LONG)
    integer(C_LONG), parameter, public :: SQL_FD_FETCH_RELATIVE = int(z'00000020', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_ANY_COLUMN = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_GD_ANY_ORDER = int(z'00000002', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_IC_UPPER = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_IC_LOWER = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_IC_SENSITIVE = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_IC_MIXED = 4_C_SHORT
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
    integer(C_SHORT), parameter, public :: SQL_TC_NONE = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TC_DML = 1_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TC_ALL = 2_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TC_DDL_COMMIT = 3_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_TC_DDL_IGNORE = 4_C_SHORT
    integer(C_LONG), parameter, public :: SQL_TXN_READ_UNCOMMITTED = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_READ_UNCOMMITTED = int(z'00000001', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_READ_COMMITTED = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_READ_COMMITTED = int(z'00000002', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_REPEATABLE_READ = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_REPEATABLE_READ = int(z'00000004', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TXN_SERIALIZABLE = int(z'00000008', C_LONG)
    integer(C_LONG), parameter, public :: SQL_TRANSACTION_SERIALIZABLE = int(z'00000008', C_LONG)
    integer(C_SHORT), parameter, public :: SQL_NC_HIGH = 0_C_SHORT
    integer(C_SHORT), parameter, public :: SQL_NC_LOW = 1_C_SHORT

    integer(C_INT), parameter, public :: SQL_QUERY_TIMEOUT = 0
    integer(C_INT), parameter, public :: SQL_MAX_ROWS = 1
    integer(C_INT), parameter, public :: SQL_NOSCAN = 2
    integer(C_INT), parameter, public :: SQL_MAX_LENGTH = 3
    integer(C_INT), parameter, public :: SQL_ASYNC_ENABLE = 4
    integer(C_INT), parameter, public :: SQL_BIND_TYPE = 5
    integer(C_INT), parameter, public :: SQL_CURSOR_TYPE = 6
    integer(C_INT), parameter, public :: SQL_CONCURRENCY = 7
    integer(C_INT), parameter, public :: SQL_KEYSET_SIZE = 8
    integer(C_INT), parameter, public :: SQL_ROWSET_SIZE = 9
    integer(C_INT), parameter, public :: SQL_SIMULATE_CURSOR = 10
    integer(C_INT), parameter, public :: SQL_RETRIEVE_DATA = 11
    integer(C_INT), parameter, public :: SQL_USE_BOOKMARKS = 12
    integer(C_INT), parameter, public :: SQL_GET_BOOKMARK = 13
    integer(C_INT), parameter, public :: SQL_ROW_NUMBER = 14
    integer(C_INT), parameter, public :: SQL_ATTR_ASYNC_ENABLE = 4
    integer(C_INT), parameter, public :: SQL_ATTR_CONCURRENCY = SQL_CONCURRENCY
    integer(C_INT), parameter, public :: SQL_ATTR_CURSOR_TYPE = SQL_CURSOR_TYPE
    integer(C_INT), parameter, public :: SQL_ATTR_ENABLE_AUTO_IPD = 15
    integer(C_INT), parameter, public :: SQL_ATTR_FETCH_BOOKMARK_PTR = 16
    integer(C_INT), parameter, public :: SQL_ATTR_KEYSET_SIZE = SQL_KEYSET_SIZE
    integer(C_INT), parameter, public :: SQL_ATTR_MAX_LENGTH = SQL_MAX_LENGTH
    integer(C_INT), parameter, public :: SQL_ATTR_MAX_ROWS = SQL_MAX_ROWS
    integer(C_INT), parameter, public :: SQL_ATTR_NOSCAN = SQL_NOSCAN
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_BIND_OFFSET_PTR = 17
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_BIND_TYPE = 18
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_OPERATION_PTR = 19
    integer(C_INT), parameter, public :: SQL_ATTR_PARAM_STATUS_PTR = 20
    integer(C_INT), parameter, public :: SQL_ATTR_PARAMS_PROCESSED_PTR = 21
    integer(C_INT), parameter, public :: SQL_ATTR_PARAMSET_SIZE = 22
    integer(C_INT), parameter, public :: SQL_ATTR_QUERY_TIMEOUT = SQL_QUERY_TIMEOUT
    integer(C_INT), parameter, public :: SQL_ATTR_RETRIEVE_DATA = SQL_RETRIEVE_DATA
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_BIND_OFFSET_PTR = 23
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_BIND_TYPE = SQL_BIND_TYPE
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_NUMBER = SQL_ROW_NUMBER
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_OPERATION_PTR = 24
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_STATUS_PTR = 25
    integer(C_INT), parameter, public :: SQL_ATTR_ROWS_FETCHED_PTR = 26
    integer(C_INT), parameter, public :: SQL_ATTR_ROW_ARRAY_SIZE = 27
    integer(C_INT), parameter, public :: SQL_ATTR_SIMULATE_CURSOR = SQL_SIMULATE_CURSOR
    integer(C_INT), parameter, public :: SQL_ATTR_USE_BOOKMARKS = SQL_USE_BOOKMARKS
    integer(C_INT), parameter, public :: SQL_ATTR_ASYNC_STMT_EVENT = 29
    integer(C_INT), parameter, public :: SQL_COL_PRED_CHAR = 1
    integer(C_INT), parameter, public :: SQL_COL_PRED_BASIC = 2
    integer(C_INT), parameter, public :: SQL_IS_POINTER = (-4)
    integer(C_INT), parameter, public :: SQL_IS_UINTEGER = (-5)
    integer(C_INT), parameter, public :: SQL_IS_INTEGER = (-6)
    integer(C_INT), parameter, public :: SQL_IS_USMALLINT = (-7)
    integer(C_INT), parameter, public :: SQL_IS_SMALLINT = (-8)

    interface trim  
        module procedure :: trim_c_char
    end interface 


    contains

    function trim_c_char(cchar) result(fchar)
        character(kind=c_char, len=1), intent(in) :: cchar(:)
        character(:), allocatable :: fchar
        !private
        integer :: i

        allocate(character(size(cchar)) :: fchar)
        do i = 1, size(cchar)
            fchar(i:i) = cchar(i)
        end do
        fchar = trim(fchar)
    end function
end module