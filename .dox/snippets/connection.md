## Overview

The `odbc_connection` module provides a modern Fortran interface for interacting with ODBC (Open Database Connectivity) databases in an object-oriented manner. It encapsulates the complexity of the ODBC API, offering a simplified and intuitive way to establish database connections, execute SQL statements, and manage transactions. The module is designed to work with the `odbc_resultset` module for handling query results.

This documentation describes the `connection` type, its methods, and how to use it to connect to a database, execute queries, and manage transactions.

## Prerequisites

- A working ODBC driver for your database.
- Fortran compiler supporting modern Fortran (e.g., gfortran, Intel Fortran).
- The `odbc_resultset`, `sql`, `sqlext`, and `odbc_constants` modules, as well as the `c_interop.inc` include file.
- The `iso_c_binding` and `iso_fortran_env` intrinsic modules.

## Module Components

### Type: `connection`

The `connection` type represents a database connection and provides methods for managing the connection, executing SQL statements, and handling transactions. The type contains private data members for ODBC handles (`env`, `dbc`, `stmt`), connection state, and error handling.

### Public Methods

The `connection` type provides the following public methods:

- `open(connstring)`: Opens a database connection using the provided connection string.
- `set_timeout(n)`: Sets the connection timeout in seconds.
- `get_timeout()`: Returns the current connection timeout.
- `is_open()`: Returns `.true.` if the connection is open, `.false.` otherwise.
- `execute(sql)`: Executes a non-query SQL statement (e.g., INSERT, UPDATE, DELETE) and returns the number of affected rows.
- `execute_query(sql, rslt)`: Executes a query and stores the results in a `resultset` object.
- `execute_query(sql, cursor_type, scrollable, rslt)`: Executes a query with a specified cursor type and scrollable option, storing results in a `resultset` object.
- `commit()`: Commits the current transaction.
- `rollback()`: Rolls back the current transaction.
- `close()`: Closes the database connection and frees resources.

### Constructor

- `new(this, connstring)`: Creates a new `connection` object with the specified ODBC connection string.

### Error Handling

Errors are handled by the `handle_error` subroutine, which retrieves diagnostic information from the ODBC API and throws an error with a message and error code using the `throw` interface. Errors are written to the standard error unit (`stderr`) and terminate the program with the error code.

## Usage

### Creating a Connection

To create a new connection, use the `connection` constructor with an ODBC connection string. Then, call the `open` method to establish the connection.

```fortran
use odbc_connection

type(connection) :: conn
character(len=1024) :: connstr

connstr = "DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;Trusted_Connection=yes;"
conn = connection(connstr)
call conn%open()
```

### Setting Timeout

Set the connection timeout (in seconds) using `set_timeout`. Retrieve the current timeout with `get_timeout`.

```fortran
call conn%set_timeout(30)  ! Set timeout to 30 seconds
print *, conn%get_timeout()  ! Prints 30
```

### Executing Non-Query SQL Statements

Use the `execute` method to run SQL statements that do not return results (e.g., INSERT, UPDATE, DELETE). The method returns the number of affected rows.

```fortran
integer :: nrows

nrows = conn%execute('INSERT INTO users (name, age) VALUES (''Alice'', 30)')
print *, "Rows inserted:", nrows
```

### Executing Queries

Use `execute_query` to run SELECT queries and retrieve results in a `resultset` object. Two variants are available:

1. **Basic Query**:
```fortran
use odbc_resultset
type(resultset) :: rslt

call conn%execute_query('SELECT name, age FROM users', rslt)
! Process rslt (see odbc_resultset documentation)
```

2. **Query with Cursor**:
Specify a cursor type and scrollable option for advanced query handling.
```fortran
use odbc_resultset
use odbc_constants
type(resultset) :: rslt

call conn%execute_query('SELECT name, age FROM users', SQL_CURSOR_STATIC, .true., rslt)
! Process rslt with scrollable cursor
```

   Supported cursor types:
   - `SQL_CURSOR_DYNAMIC`
   - `SQL_CURSOR_FORWARD_ONLY`
   - `SQL_CURSOR_KEYSET_DRIVEN`
   - `SQL_CURSOR_STATIC`

### Managing Transactions

Use `commit` and `rollback` to manage transactions.

```fortran
logical :: success

success = conn%commit()    ! Commit transaction
if (.not. success) print *, "Commit failed"

success = conn%rollback()  ! Roll back transaction
if (.not. success) print *, "Rollback failed"
```

### Closing the Connection

Close the connection to free resources when done.

```fortran
call conn%close()
```

The connection is automatically closed when the `connection` object is finalized (e.g., goes out of scope).

## Error Handling

The module includes robust error handling. If an ODBC operation fails, the `handle_error` subroutine retrieves diagnostic information and calls `throw` to report the error. For example:

> ! If SQLDriverConnect fails, an error like this may be printed:
> 
> ! connection error: [Microsoft][ODBC SQL Server Driver]Login failed for user. Error code: -1


Ensure your connection string and database configuration are correct to avoid errors.

## Example Program

Here is a complete example demonstrating the usage of the `odbc_connection` module:

```fortran
program test_odbc
    use odbc_connection

    implicit none

    type(connection) :: conn
    type(resultset) :: rslt
    character(len=1024) :: connstr
    integer :: rows

    ! Initialize connection
    connstr = "DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;Trusted_Connection=yes;"
    conn = connection_new(connstr)
    call conn%open()

    ! Set timeout
    call conn%set_timeout(20)

    ! Execute non-query
    rows = conn%execute('INSERT INTO users (name, age) VALUES (''Bob'', 25)')
    print *, "Inserted", rows, "rows"

    ! Execute query
    call conn%execute_query('SELECT name, age FROM users', rslt)

    ! Commit transaction
    if (conn%commit()) print *, "Transaction committed"

    ! Close connection
    call conn%close()
end program
```

@note
- The `connstring` must be a valid ODBC connection string compatible with your database driver (e.g., SQL Server, PostgreSQL, MySQL).
- Ensure the ODBC driver and database server are properly configured on your system.