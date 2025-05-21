## Overview

The `odbc_columnset` module provides a modern Fortran interface for managing column metadata and data in ODBC query results. It is designed to work with the `odbc_resultset` and `odbc_connection` modules, encapsulating the complexity of handling column information in an object-oriented manner. The module defines a `column` type to store metadata for individual columns and a `columnset` type to manage a collection of columns, including binding them to ODBC statement handles for data retrieval.

This documentation describes the `column` and `columnset` types, their methods, and how to use them to handle column metadata and data in ODBC query results.

## Prerequisites

- A working ODBC driver for your database.
- Fortran compiler supporting modern Fortran (e.g., gfortran, Intel Fortran).
- The `odbc_connection`, `odbc_resultset`, `sql`, `odbc_constants`, and `iso_c_binding` modules.
- An active database connection and result set created using the `odbc_connection` and `odbc_resultset` modules.

## Module Components

### Type: `column`

The `column` type represents metadata and data for a single column in a query result set. It contains the following fields:

- `name`: The column name (character string, allocated).
- `type`: The SQL data type of the column (e.g., `SQL_CHAR`, `SQL_INTEGER`).
- `size`: The column size (e.g., maximum length for strings).
- `decim_size`: The number of decimal digits (for numeric types).
- `nullable`: Indicates if the column allows null values (`0` for NOT NULL, `1` for NULL, `2` for unknown).
- `content`: The column's data as a character string (allocated).

### Type: `columnset`

The `columnset` type manages a collection of `column` objects, representing all columns in a query result set. It contains a private integer (`ncols`) for the number of columns and a public array of `column` objects (`items`).

### Public Methods of `columnset`

- `add(col)`: Adds a single `column` object to the set.
- `addrange(cols)`: Adds an array of `column` objects to the set.
- `bind(stmt, col_no)`: Binds the specified column (by index) to an ODBC statement handle for data retrieval.
- `count()`: Returns the number of columns in the set.
- `get(n)`: Retrieves a pointer to the `column` object at the specified index (1-based).
- `get(name)`: Retrieves a pointer to the `column` object with the specified name.

### Finalizer

- `columnset_finalize`: Automatically deallocates the `items` array when a `columnset` object goes out of scope.

## Usage

The `columnset` type is typically used internally by the `odbc_resultset` module to manage column metadata and data binding for query results. Users interact with it indirectly through the `resultset` type's methods (e.g., `get_string`, `get_integer`). However, understanding its functionality is useful for advanced use cases or debugging.

### Creating a Columnset

A `columnset` object is created and populated by the `resultset_get_metadata` subroutine in the `odbc_resultset` module, which calls `addrange` to add columns based on the query's metadata. Direct creation of a `columnset` is rare but can be done as follows:

```fortran
use odbc_columnset

type(columnset) :: cols
type(column) :: col

allocate(character(51) :: col%name)
col%name = 'name'
col%type = SQL_CHAR
col%size = 50
col%decim_size = 0
col%nullable = 0
allocate(character(4096) :: col%content)

call cols%add(col)
print *, 'Number of columns:', cols%count()  ! Prints 1
```

### Adding Columns

Add a single column with `add` or multiple columns with `addrange`:

```fortran
type(column), allocatable :: col_array(:)

allocate(col_array(2))
allocate(character(51) :: col_array(1)%name, col_array(2)%name)
col_array(1)%name = 'id'
col_array(1)%type = SQL_INTEGER
col_array(2)%name = 'name'
col_array(2)%type = SQL_CHAR
call cols%addrange(col_array)
print *, 'Number of columns:', cols%count()  ! Prints 2 (or 3 if add was called earlier)
```

### Binding Columns

The `bind` method binds a column's data buffer to an ODBC statement handle, enabling data retrieval. This is typically called by the `resultset` module:

```fortran
use sql
type(SQLHSTMT) :: stmt
integer :: res

res = cols%bind(stmt, 1)  ! Bind first column
```

### Accessing Columns

Retrieve a column by index or name using the `get` method, which returns a pointer to a `column` object:

```fortran
type(column), pointer :: col_ptr

col_ptr => cols%get(1)  ! Get first column
if (associated(col_ptr)) print *, 'Column name:', col_ptr%name

col_ptr => cols%get('name')  ! Get column by name
if (associated(col_ptr)) print *, 'Column type:', col_ptr%type
```

## Example Program

The `columnset` type is typically used within the context of the `odbc_resultset` and `odbc_connection` modules. Below is an example showing how it integrates with a query:

```fortran
    type(connection) :: conn
    type(resultset) :: rslt
    type(columnset) :: cols
    type(column), pointer :: col_ptr
    character(len=1024) :: connstr
    logical :: has_rows
    integer :: i

    ! Initialize connection
    connstr = 'DRIVER={SQL Server};SERVER=localhost;DATABASE=mydb;Trusted_Connection=yes;'
    conn = connection(connstr)
    call conn%open()

    ! Execute query
    call conn%execute_query('SELECT id, name FROM users', rslt)

    ! Access columnset (internal to resultset)
    cols = rslt%columns
    print *,  'Number of columns:', cols%count()

    ! Print column metadata
    do i = 1, cols%count()
        col_ptr => cols%get(i)
        if (associated(col_ptr)) then
            print *, 'Column:', trim(col_ptr%name), 'Type:', col_ptr%type, &
                     'Size:', col_ptr%size, 'Nullable:', col_ptr%nullable
        end if
    end do

    ! Iterate over rows
    has_rows = rslt%next()
    do while (has_rows)
        col_ptr => cols%get('name')
        if (associated(col_ptr)) print *, 'Name:', trim(col_ptr%content)
        has_rows = rslt%next()
    end do

    ! Close connection
    call conn%close()
```