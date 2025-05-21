# SWIG-Fortran {#swig}

## Introduction

The SWIG-Fortran project is an extension of the Simplified Wrapper and Interface Generator (SWIG) tool, specifically designed to generate Fortran 2003 bindings for C and C++ libraries. This allows Fortran applications to seamlessly interface with existing C/C++ codebases, which is particularly valuable for scientific computing, high-performance computing (HPC), and engineering applications where Fortran remains prevalent. Below are summarized key details about the project based on the provided references and additional context from the web results.

SWIG-Fortran automates the creation of native Fortran 2003 interfaces to C and C++ libraries, enabling Fortran developers to leverage robust and efficient C/C++ libraries without manual wrapper coding. It addresses the challenge of integrating modern Fortran with C/C++ codebases, which often contain optimized algorithms or standard library components. The tool parses C/C++ header files and generates Fortran wrapper code (glue code) that provides a natural Fortran interface to the underlying C/C++ functionality. This includes support for:
- Calling C/C++ functions from Fortran.
- Handling C++ classes via Fortran derived types and proxy classes.
- Managing memory and data transfer between Fortran and C/C++.

## Installation
```bash
git clone https://github.com/swig-fortran/swig.git
cd swig
./autogen.sh
./configure
make
sudo make install
```
@note
Run `swig -fortran -help` to confirm Fortran support.

## Cheatsheet 

 Quick reference for generating Fortran 2003 bindings to C/C++ libraries using SWIG-Fortran, based on the [SWIG+Fortran User Manual](https://info.ornl.gov/sites/publications/Files/Pub158443.pdf).

### Generating Bindings
- **Basic Workflow**:
  1. Write a SWIG interface file (`.i`) for your C/C++ library.
  2. Run SWIG to generate Fortran and C wrapper code.
  3. Compile and link the generated code with your Fortran application.
- **Example Interface File** (`example.i`):
```swig
%module example
%{
#include "example.h"
%}
%include "example.h"
```
- **Generate Bindings**:
```bash
swig -fortran example.i
```
Swig generate various files: `example_wrap.c` (C wrapper), `example.f90` (Fortran module).
- **Compile and Link**:
```bash
gfortran -c example.f90 example_wrap.c
gfortran example.o example_wrap.o -o myprogram
```

### Interface File Syntax
- **Include Headers**:
```swig
%include "myheader.h"
```

- **Rename Functions** (for Fortran-friendly names):
```swig
%rename(fortran_name) c_function_name;
```

- **Ignore Functions**:
```swig
%ignore unwanted_function;
```

### Changing types

- **Change type**
One can use the `%apply` macro to change the constant type
```
%apply short {int SQL_HANDLE_ENV};
%apply short {int SQL_HANDLE_DBC};
%apply short {int SQL_HANDLE_STMT};
%apply short {int SQL_HANDLE_DESC};
```

- **Generate constant parameter**
The `%fortranconst` directive can be used to explicitly enable the native compile-time constant. Values are rendered as named constants
```swig
%fortranconst SQL_HANDLE_ENV;
%constant short SQL_HANDLE_ENV = 1;
```
That will generate the following code
```fortran
integer(C_SHORT), parameter, public :: SQL_HANDLE_ENV = 1_C_SHORT
```

### Struct and explicit Typemaps
Standard layout C-struct can be shared with Fortran code natively using `bind(c)` derived types. By doing so, the struct
```c
struct mystruct {
int foo;
double bar;
};
```
becomes 
```fortran
type, bind(C) :: mystruct
    integer(C_INT), public :: foo
    real(C_DOUBLE), public :: bar
end type
```
This can be obtained by using the macro 
```swig
%fortran_struct(mystruct);
```

Every member of the struct must be `bind(c)` compatible. This is enforced with a separate `%typemap(bindc)`
that translates the member data to Fortran type members
```swig
%typemap(bindc) int * "type(C_PTR)"
```
Finally, the `%fortranbindc` feature allows natively interoperable types to be directly accessed in the
Fortran code.

### Resources
- **User Manual**: [osti.gov/servlets/purl/1833959](https://www.osti.gov/servlets/purl/1833959)
- **SWIG Docs**: [swig.org/doc.html](https://www.swig.org/doc.html)
- **SWIG-Fortran**: [github.com/swig-fortran/swig](https://github.com/swig-fortran/swig)
- **Examples**: [github.com/swig-fortran/sample](https://github.com/swig-fortran/sample)