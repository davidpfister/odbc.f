## Overview

The `odbc_resultset` module provides a modern Fortran interface for handling ODBC query results in an object-oriented manner. It works in conjunction with the `odbc_connection` module to manage and navigate database query results, retrieve metadata, and access column data in various formats. The module encapsulates the complexity of the ODBC API, offering a simplified interface for iterating over rows and accessing column values by index or name.

This documentation describes the `resultset` type, its methods, and how to use it to process query results.

## Prerequisites

- A working ODBC driver for your database.
- Fortran compiler supporting modern Fortran (e.g., gfortran, Intel Fortran).
- The `odbc_connection`, `odbc_columnset`, `sql`, `odbc_constants`, and `iso_c_binding` modules, as well as the `iso_fortran_env` intrinsic module.
- An active database connection created using the `odbc_connection` module.

## Module Components

### Type: `resultset`

The `resultset` type represents a set of query results returned by an ODBC query. It contains private data members for the ODBC statement handle (`stmt`), row and column metadata, and error handling information. It also includes a `columnset` object to manage column metadata and data.

### Public Methods

The `resultset` type provides the following public methods:

- `next()`: Moves the cursor to the next row in the result set. Returns `.true.` if successful, `.false.` if no more rows are available.
- `previous()`: Moves the cursor to the previous row in the result set. Returns `.true.` if successful, `.false.` if no previous rows are available or if the cursor is not scrollable.
- `first()`: Moves the cursor to the first row in the result set. Returns `.true.` if successful, `.false.` if the result set is empty or not scrollable.
- `last()`: Moves the cursor to the last row in the result set. Returns `.true.` if successful, `.false.` if the result set is empty or not scrollable.
- `nrows()`: Returns the number of rows fetched in the current fetch operation.
- `ncolumns()`: Returns the number of columns in the result set.
- `get_integer(col)`: Retrieves the value of the specified column (by index) as an integer.
- `get_integer(name)`: Retrieves the value of the specified column (by name) as an integer.
- `get_real(col)`: Retrieves the value of the specified column (by index) as a 32-bit real.
- `get_real(name)`: Retrieves the value of the specified column (by name) as a 32-bit real.
- `get_double(col)`: Retrieves the value of the specified column (by index) as a 64-bit real.
- `get_double(name)`: Retrieves the value of the specified column (by name) as a 64-bit real.
- `get_string(col)`: Retrieves the value of the specified column (by index) as a character string.
- `get_string(name)`: Retrieves the value of the specified column (by name) as a character string.

### Constructor

- `new(resultset, stmt)`: Initializes a `resultset` object with an ODBC statement handle (`stmt`) obtained from a `connection` object after executing a query.

### Error Handling

Errors are handled by the `handle_errors` subroutine, which retrieves diagnostic information from the ODBC API and prints an error message to the standard output, terminating the program with the error code.

## Usage

### Creating a Resultset

A `resultset` object is created by calling the `execute_query` method of a `connection` object (from the `odbc_connection` module). The `new` subroutine is then called internally to initialize the `resultset` with the ODBC statement handle.

```fortran
use odbc_connection
use odbc_resultset

type(connection) :: conn
type(resultset) :: rslt
character(len=1024) :: connstr

connstr = 'DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;Trusted_Connection=yes;'
conn = connection_new(connstr)
call conn%open()
call conn%execute_query('SELECT name, age FROM users', rslt)
```

### Navigating Rows

Use the navigation methods (`next`, `previous`, `first`, `last`) to move through the result set. The `next` method is typically used in a loop to process rows sequentially.

```fortran
do while (rslt%next())
    ! Process row data (see below)
end do
```

For scrollable cursors (specified in `execute_query` with `scrollable=.true.`), you can use `previous`, `first`, or `last`:

```fortran
use odbc_constants

call conn%execute_query('SELECT name, age FROM users', SQL_CURSOR_STATIC, .true., rslt)
if (rslt%last()) then
    ! Process last row
end if
if (rslt%first()) then
    ! Process first row
end if
```

### Accessing Column Data

Retrieve column values using the `get_integer`, `get_real`, `get_double`, or `get_string` methods, either by column index (1-based) or column name. The module converts column data to the requested type by reading from a string representation.

```fortran
character(:), allocatable :: name
integer :: age

has_rows = rslt%next()
if (has_rows) then
    name = rslt%get_string('name')  ! By column name
    age = rslt%get_integer(2)       ! By column index (age is second column)
    print *, 'Name:', name, 'Age:', age
end if
```

### Getting Metadata

The `nrows` and `ncolumns` methods provide metadata about the result set:

```fortran
print *, 'Number of rows fetched:', rslt%nrows()
print *, 'Number of columns:', rslt%ncolumns()
```

Note that `nrows` returns the number of rows fetched in the current fetch operation, which may depend on the ODBC driver's buffering.

## Example Program

Here is a complete example demonstrating the usage of the `odbc_resultset` module with the `odbc_connection` module:

```fortran
    type(connection) :: conn
    type(resultset) :: rslt
    character(len=1024) :: connstr
    logical :: has_rows
    character(:), allocatable :: name
    integer :: age

    ! Initialize connection
    connstr = 'DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;Trusted_Connection=yes;'
    conn = connection_new(connstr)
    call conn%open()

    ! Execute query
    call conn%execute_query('SELECT name, age FROM users', SQL_CURSOR_STATIC, .true., rslt)
    print *, 'Columns in result set:', rslt%ncolumns()

    ! Iterate over rows
    has_rows = rslt%next()
    do while (has_rows)
        name = rslt%get_string('name')
        age = rslt%get_integer('age')
        print *, 'User:', name, 'Age:', age
        has_rows = rslt%next()
    end do

    ! Move to first row (scrollable cursor)
    if (rslt%first()) then
        name = rslt%get_string(1)
        print *, 'First user:', name
    end if

    ! Close connection
    call conn%close()
```

## Error Handling

If an ODBC operation fails, the `handle_errors` subroutine retrieves diagnostic information and prints an error message to the standard output, terminating the program. For example:

```
[Microsoft][ODBC SQL Server Driver]Invalid cursor state Error code: -1
```

Ensure your query and database configuration are correct to avoid errors. Common issues include invalid column names, unsupported cursor types, or attempting to navigate a non-scrollable result set.