<!--! @mainpage -->
<h1 class="title">
    <span class="name">ODBC.f</span>
    <br>
    <span class="text">Fortran ODBC</span>
    <br>
    <span class="tagline">
    ODBC (Open Database Connectivity) bindings for modern Fortran.
    </span>
</h1>
<br>

<div class="actions">
    <div class="action">
        <a class="button medium brand" href="index.html#autotoc_md2">Get Started</a>
    </div>
    <div class="action">
        <a class="button medium alt" href="topics.html">API</a>
    </div>
    <div class="action">
        <a class="button medium alt" href="https://github.com/davidpfister/odbc.f" target="_blank" rel="noreferrer">View on GitHub</a>
    </div>
</div>

# Introduction
<!-- ABOUT THE PROJECT -->
The Fortran ODBC Library (_odbc.f_) is a modern, lightweight, and robust interface designed to enable seamless interaction between Fortran applications and relational databases through the Open Database Connectivity (ODBC) standard. This library provides a set of Fortran modules and procedures that allow developers to connect to ODBC-compliant databases, execute SQL queries, and manage data directly from Fortran programs.

## About the Project
<center>
<p align="center">
  <img src="https://github.com/davidpfister/odbc.f/blob/master/.dox/images/icon.jpg?raw=true" width="512" height="512">
</p>
 </center>

 ### Purpose and scope

 The primary goal of _odbc.f_ is to bridge the gap between Fortran applications and database systems, enabling scientific, engineering, and data-intensive applications to integrate with databases such as PostgreSQL, MySQL, SQL Server, and others that support ODBC drivers. The library is designed with modern Fortran practices in mind, emphasizing type safety, modularity, and ease of use while maintaining compatibility with the ODBC API. The binding is nearly complete meaning that it implements all functions present in the ODBC v3.8 standard but the ones related to `intervals`. The underlying C-structure contains a `union` that is not (yet) compatible with the `iso_c_binding` introduced in modern Fortran. 

_odbc.f_ supports essential database operations, including:
- Establishing and managing database connections
- Executing SQL statements (queries, updates, and stored procedures)
- Fetching and processing result sets
- Handling errors and diagnostics

This documentation provides comprehensive guidance on installing, configuring, and using the _odbc.f_ library, along with examples and best practices for integrating database functionality into Fortran applications.

### Key Features

- Modern Fortran Interface: Built using Fortran 2003/2008 features, including object-oriented programming, derived types, and robust error handling.
- Cross-Platform Compatibility: Works with ODBC drivers on Windows, Linux, and macOS, ensuring portability across major operating systems.
- Simplified API: Provides a high-level, Fortran-centric interface that abstracts low-level ODBC complexities while maintaining flexibility on top of the raw API.
- Extensive Error Handling: Includes detailed diagnostic tools to help developers troubleshoot database issues.
- Open Source: Distributed under a permissive license, encouraging community contributions and adoption.

<!-- GETTING STARTED -->
## Installation

### Requirements
* [![fpm][fpm]][fpm-url]
* [![ifort][ifort]][ifort-url]
* [![gfortran][gfortran]][gfortran-url]

To build the library you need

- a Fortran 2008 compliant compiler, or better, a Fortran 2018 compliant compiler.
The following compilers are tested on the default branch of _odbc.f_:

<center>

| Name |	Version	| Platform	| Architecture |
|:--:|:--:|:--:|:--:|
| GCC Fortran (MinGW) | 14 | Windows 10 | x86_64 |
| Intel oneAPI classic	| 2021.5	| Windows 10 |	x86_64 |

</center>

- a preprocessor. Unit tests rely on the the header file [`assertion.inc`](https://github.com/davidpfister/fortiche/tree/master/src/assertion). It uses quite some preprocessor macros. It is known to work both with intel `fpp` and gnu `cpp`. Since the whole framework fits in a single file, it has been added directly to the repo. 

Linting, indentation, and styling are done with [fprettify](https://github.com/fortran-lang/fprettify) with the following settings
```bash
fprettify .\src\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
```
### Building

#### Get the code
```bash
git clone https://github.com/davidpfister/odbc.f
cd odbc.f
```

### Generate the interface with swig
One of the particularity of _odbc.f_ is that the interface for the c-binding is automatically generated with [swig-fortran](https://github.com/swig-fortran/swig.git) using the ODBC header files. The headers have **not** been included in the `include/` folder. They can be downloaded directly from the original [repo](https://github.com/lurcher/unixODBC/tree/master/include). Make sure to place the files [sql.h](https://github.com/lurcher/unixODBC/blob/master/include/sql.h), [sqlext.h](https://github.com/lurcher/unixODBC/blob/master/include/sqlext.h) and [sqltypes.h](https://github.com/lurcher/unixODBC/blob/master/include/sqltypes.h) in the include folder before using `swig`.

The following code will generate the file `sql.f90`, `sqlext.f90` and `sqltypes.f90`.

```cmd
swig -fortran -outdir src/ swig/sqltypes.i
swig -fortran -outdir src/ swig/sql.i
swig -fortran -outdir src/ swig/sqlext.i
sed -i "s/, intent(in), value :: fresult/:: fresult/g" src/sqlext.f90 
```

[!Note]
swig does not differentiate return value and will add as spurious `intent(in)` on the return argument. The `sed` line corrects that and generate the proper code.

#### Build with fpm

The repo can be build using _fpm_
```bash
fpm build
```
For convenience, the  repo also contains a response file that can be invoked as follows: 
```bash
fpm @build
```
(For the Windows users, that command does not work in Powershell since '@' is a reserved symbol. One should use the '--%' as follows: `fpm --% @build`.
This is linked to the following [issue](https://github.com/urbanjost/M_CLI2/issues/19))

Building with ifort requires to specify the compiler name (gfortran by default)
```bash
fpm @build --compiler ifort
```
Alternatively, the compiler can be set using fpm environment variables.
```bash
set FPM_FC=ifort
```

Besides the build command, several commands are also available:
```bash
@prettify
system codee format ./src
system fortitude check ./src --fix
option run --list

@clean
option clean --all

@rebuild
system rmdir /s /q build
option build

@build
option build

@test
options test 

@doc
system cd ./.dox & doxygen ./Doxyfile.in & cd ..
system powershell ./tools/Fix-Doxygen.ps1 -Path "./docs"
option run --list
```

#### Build with Visual Studio 2019

The project was originally developed on Windows with Visual Studio 2019. The repo contains the solution file (_Odbc.f.sln_) to get you started with Visual Studio 2019. 

<!-- USAGE EXAMPLES -->
## Usage

To open a connection to an ODBC data source, you have to create an object of type `connection` and call its `open()` member function:
```fortran
type(connection) :: conn

conn = connection('connection_string')
call conn%open()
```
For retrieving data from the database, you have to use the `resultset` type:
```fortran
type(resulset) :: rslt
rslt = conn%execute_query("SELECT * FROM test")
```
The `resultset` contains information about the columns like their types, names and number. Each column is bound by default to a string variable when executing the query. Now, whenever data is returned by the `resultset`, the first column's data will be stored in the variable strName. Data can be pulled out of the `resultset` object by calling either the `first()`, `next()`, `previous()` or `last()` member functions. For e.g., the following code prints out the value of the first column in the `resultset`:
```fortran
do while(rslt%next())
   i = rslt%get_integer(1)
   j = rslt%get_integer(3)
   name = rslt%get_string(2)
end do
```

For executing any other SQL statements, you have to call the `execute()` member function of `connection`:
```fortran
integer :: nrows
nrows = conn%execute("DELETE FROM emp")
```
The `execute()` function will return the number of rows affected by the statement. After database operations are over, the resources occupied by ODBC are automatically released by the connection `finalizer`.

<!-- CONTRIBUTING -->
### Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. So, thank you for considering contributing to _odbc.f_.
Please review and follow these [guidelines](https://github.com/davidpfister/odbc.f/tree/master?tab=contributing-ov-file) to make the contribution process simple and effective for all involved. In return, the developers will help address your problem, evaluate changes, and guide you through your pull requests.

By contributing to _odbc.f_, you certify that you own or are allowed to share the content of your contribution under the same license.

<!-- LICENSE -->
## License

Distributed under the MIT License.

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/davidpfister/odbc.f.svg?style=for-the-badge
[contributors-url]: https://github.com/davidpfister/odbc.f/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/davidpfister/odbc.f.svg?style=for-the-badge
[forks-url]: https://github.com/davidpfister/odbc.f/network/members
[stars-shield]: https://img.shields.io/github/stars/davidpfister/odbc.f.svg?style=for-the-badge
[stars-url]: https://github.com/davidpfister/odbc.f/stargazers
[issues-shield]: https://img.shields.io/github/issues/davidpfister/odbc.f.svg?style=for-the-badge
[issues-url]: https://github.com/davidpfister/odbc.f/issues
[license-shield]: https://img.shields.io/github/license/davidpfister/odbc.f.svg?style=for-the-badge
[license-url]: https://github.com/davidpfister/odbc.f/master/LICENSE
[gfortran]: https://img.shields.io/badge/gfortran-000000?style=for-the-badge&logo=gnu&logoColor=white
[gfortran-url]: https://gcc.gnu.org/wiki/GFortran
[ifort]: https://img.shields.io/badge/ifort-000000?style=for-the-badge&logo=Intel&logoColor=61DAFB
[ifort-url]: https://www.intel.com/content/www/us/en/developer/tools/oneapi/fortran-compiler.html
[fpm]: https://img.shields.io/badge/fpm-000000?style=for-the-badge&logo=Fortran&logoColor=734F96
[fpm-url]: https://fpm.fortran-lang.org/

