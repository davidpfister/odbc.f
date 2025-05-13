<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">odbc.f</h3>

  <p align="center">
    ODBC (Open Database Connectivity) bindings for Fortran.
    <br />
    <a href="https://github.com/davidpfister/odbc.f"><strong>Explore the project »</strong></a>
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
[TOC]

# Introduction
<!-- ABOUT THE PROJECT -->
## About the Project
<p align="center">
  <img src="https://github.com/davidpfister/odbc.f/blob/master/.dox/images/screenshot.png?raw=true">
</p>
Fortran is the fastest language on earth, so they say. But can we prove it? <br><br>
Despite its legendary speed when crunching numbers, Fortran is no exception when it comes to writing code: it's also very possible to write terribly slow pieces of code. This is where benchmarking different implementations of the same function can help developing better and faster algorithms.  

This project aims at providing an easy interface to benchmark functions and subroutines while taking care of warming up the machine, collecting system information, computing statistics and reporting results. 

* [![fpm][fpm]][fpm-url]
* [![ifort][ifort]][ifort-url]
* [![gfortran][gfortran]][gfortran-url]

<!-- GETTING STARTED -->
## Getting Started

### Requirements

To build that library you need

- a Fortran 2008 compliant compiler, or better, a Fortran 2018 compliant compiler (Intel Fortran compiler is known to work well for _odbc.f_. gfortran has some limitations when using implicit procedures and unlimited polymorphic arguments. Please refer to the [documentation](https://davidpfister.github.io/odbc.f/compiler_differences.html) to see the difference between compilers).

The following compilers are tested on the default branch of _odbc.f_:

<center>

| Name |	Version	| Platform	| Architecture |
|:--:|:--:|:--:|:--:|
| GCC Fortran (MinGW) | 14 | Windows 10 | x86_64 |
| Intel oneAPI classic	| 2021.5	| Windows 10 |	x86_64 |

</center>

- a preprocessor. _odbc.f_ uses quite some preprocessor macros. It is known to work both with intel `fpp` and `cpp`.  

Unit test rely on the the header file [`assertion.inc`](https://github.com/davidpfister/fortiche/tree/master/src/assertion). Since the whole framework fits in a single file, it has been added directly to the repo. 

Linting, indentation, and styling is done with [fprettify](https://github.com/fortran-lang/fprettify) with the following settings
```bash
fprettify .\src\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
```

<!-- USAGE EXAMPLES -->
## Usage

Running the benchmark could not be simpler. 

1. Start by including the file `benchmark.inc` into your code
2. Instantiate a benchmark runner 
3. Run the benchmark

The first step is to create a test function. It can be a function or a subroutine (gfortran only handles subroutine. For more issues related to gfortran, see [this article](https://davidpfister.github.io/odbc.f/compiler_differences.html) ) with any number of arguments between 0 and 7. 
```fortran
!the funcion to be benchmarked
subroutine test_function()
...
end subroutine
```
And then simply call the `benchmark` macro.
```fortran
#include <benchmark.inc>
program test
use benchmark_library

type(runner) :: br

benchmark(br, run(test_function))
```
This will generate this kind of table: 

     |         Method Name      |          Mean          |    Standard Deviation  |
     |__________________________|________________________|________________________|
     |test_function()           |           217350.000 us|          +/- 161306.626|

_For more examples, please refer to the [Documentation](https://davidpfister.github.io/odbc.f/examples_toc.html)_

The library takes care of everything else for you
- Collection of system information
- Collection of compiler information
- Collection of compilation options
- Reporting

### Installation

#### Get the code
```bash
git clone https://github.com/davidpfister/odbc.f
cd odbc.f
```

#### Build with fpm

The repo can be build using _fpm_
```bash
fpm build --flag '-ffree-line-length-none'
```
For convenience, the  repo also contains a response file that can be invoked as follows: 
```
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
@pretiffy
system fprettify .\examples\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
system fprettify .\src\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
system fprettify .\tests\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations

@clean
option clean --all

@rebuild
system rmdir /s /q build
option build --flag '-ffree-line-length-none'

@build
option build --flag '-ffree-line-length-none'

@test
options test --flag '-ffree-line-length-none'

@doc
option clean --all
system cd ./.dox & doxygen ./Doxyfile.in & cd ..
```

The toml files contains two items that are worth commenting: 
1. The settings to the cpp preprocessor are specified in the file. 

```toml
[preprocess]
cpp.suffixes = ["F90", "f90"]
cpp.macros = ["_FPM"]
```
The `_FPM` macro is used to differentiate the build when compiling with _fpm_ or _Visual Studio_. This is mostly present to adapt the hard coded paths that differs in both cases.

2. The code must also be compiled allowing implicit procedures. This is reflected in the following option. 
```toml
[fortran]
implicit-external = true
```
In order to be able to benchmark functions AND subroutines with any number of dummy arguments (0 to 7 at the moment) of any types (intrinsic or derived types), implicit procedures are a must. While this may be considered as bad practice and a remainder from F77 and the good old external, there would be no other way to provide a generic library without this option. 

#### Build with Visual Studio 2019

The project was originally developed on Windows with Visual Studio 2019. The repo contains the solution file (_odbc.f.sln_) to get you started with Visual Studio 2019. 

<!-- CONTRIBUTING -->
### Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. So, thank you for considering contributing to _odbc.f_.
Please review and follow these guidelines to make the contribution process simple and effective for all involved. In return, the developers will help address your problem, evaluate changes, and guide you through your pull requests.

By contributing to _odbc.f_, you certify that you own or are allowed to share the content of your contribution under the same license.

### Style

Please follow the style used in this repository for any Fortran code that you contribute. This allows focusing on substance rather than style.

### Reporting a bug

A bug is a *demonstrable problem* caused by the code in this repository.
Good bug reports are extremely valuable to us—thank you!

Before opening a bug report:

1. Check if the issue has already been reported
   ([issues](https://github.com/davidpfister/odbc.f/issues)).
2. Check if it is still an issue or it has been fixed?
   Try to reproduce it with the latest version from the default branch.
3. Isolate the problem and create a minimal test case.

A good bug report should include all information needed to reproduce the bug.
Please be as detailed as possible:

1. Which version of _odbc.f_ are you using? Please be specific.
2. What are the steps to reproduce the issue?
3. What is the expected outcome?
4. What happens instead?

This information will help the developers diagnose the issue quickly and with
minimal back-and-forth.

### Pull request

If you have a suggestion that would make this project better, please create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
1. Open a [new issue](https://github.com/davidpfister/odbc.f/issues/new) to
   describe a bug or propose a new feature.
   Refer to the earlier sections on how to write a good bug report or feature    request.
2. Discuss with the developers and reach consensus about what should be done about the bug or feature request.
   **When actively working on code towards a PR, please assign yourself to the
   issue on GitHub.**
   This is good collaborative practice to avoid duplicated effort and also inform others what you are currently working on.
3. Create your Feature Branch (```git checkout -b feature/AmazingFeature```)
4. Commit your Changes (```git commit -m 'Add some AmazingFeature'```)
5. Push to the Branch (```git push origin feature/AmazingFeature```)
6. Open a Pull Request with your contribution.
   The body of the PR should at least include a bullet-point summary of the
   changes, and a detailed description is encouraged.
   If the PR completely addresses the issue you opened in step 1, include in
   the PR description the following line: ```Fixes #<issue-number>```. If your PR implements a feature that adds or changes the behavior of _odbc.f_,
   your PR must also include appropriate changes to the documentation and associated units tests.

In brief, 
* A PR should implement *only one* feature or bug fix.
* Do not commit changes to files that are irrelevant to your feature or bug fix.
* Smaller PRs are better than large PRs, and will lead to a shorter review and
  merge cycle
* Add tests for your feature or bug fix to be sure that it stays functional and useful
* Be open to constructive criticism and requests for improving your code.


<!-- LICENSE -->
## License

Distributed under the MIT License.

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

 
```cmd
swig -fortran -outdir src/ swig/sqltypes.i
swig -fortran -outdir src/ swig/sql.i
swig -fortran -outdir src/ swig/sqlext.i
sed -i "s/, intent(in), value :: fresult/:: fresult/g" src/sqlext.f90 
```

## Redefine constant

### Change type
%apply short {int SQL_HANDLE_ENV};
%apply short {int SQL_HANDLE_DBC};
%apply short {int SQL_HANDLE_STMT};
%apply short {int SQL_HANDLE_DESC};

### Make is constant parameter
%fortranconst SQL_HANDLE_ENV;
%constant short SQL_HANDLE_ENV = 1;
%fortranconst SQL_HANDLE_DBC;
%constant short SQL_HANDLE_DBC = 2;
%fortranconst SQL_HANDLE_STMT;
%constant short SQL_HANDLE_STMT = 3;
%fortranconst SQL_HANDLE_DESC;
%constant short SQL_HANDLE_DESC = 4;

## Connection string

see [ConnectionString.com](https://www.connectionstrings.com/)

### Access
Driver={Microsoft Access Driver (*.mdb)};Dbq=C:\mydatabase.mdb;Uid=Admin;Pwd=;
### Excel
Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ=C:\MyExcel.xls;
### PostgreSQL
Driver={PostgreSQL};Server=IP address;Port=5432;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
### MySQL
- local
Driver={mySQL};Server=localhost;Option=16834;Database=myDataBase;
- remote
Driver={mySQL};Server=myServerAddress;Port=3306;Option=131072;Stmt=;Database=myDataBase;User=myUsername;Password=myPassword;
### SQLite
DRIVER=SQLite3 ODBC Driver;Database=c:\mydb.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;
### SQLServer
Driver={SQL Server};Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;
### HDF5
DRIVER={HDF5 ODBC Connector BASIC};DBF=/home/user/HDF5_ODBC_Basic/HDF5/tickdata.h5
### CSV
Driver={Microsoft Access Text Driver (*.txt, *.csv)};Dbq="";Extensions=csv;

## Using the code
To open a connection to an ODBC data source, you have to create an object of type `connection` and call its `open()` member function:
```fortran
type(connection) :: db
call db%open("MY_ODBC","username","password")
```
For retrieving data from the database, you have to use the `resultset` type:
```fortran
type(resulset) :: rslt
rslt = db%execute_query("SELECT * FROM emp")
```
Information about the `resultset`, like the number of columns in it, can be obtained by calling the `get_metadata()` function, which returns an object of `resultsetmetadata`.
```fortran
type(resultsetmetadata) :: mtdt
integer :: column_count

mtdt = rslt%get_metadata()
column_count = mtdt%count()
print *, "Columns returned", column_count
```
For getting information about a particular column, call the `get_column` member function of `resultsetmetadata`:
```fortran
type(column) :: col
call mtdt%get_column(1, col)
```

Data stored in a `resultset` has to be bound to memory buffers for retrieval. This is done using the `bind()` function of `resultset`:
```fortran
character(kind=c_char, len=1) :: strName(26)
call rslt%bind(1,strName,25) // arguments: column number, buffer, maximum length of buffer
```

The above code binds the first column in the table with the buffer strName. Now, whenever data is returned by the `resultset`, the first column's data will be stored in the variable strName. Data can be pulled out of the `resultset` object by calling either the `movefirst()`, `movenext()`, `moveprevious()` or `movelast()` member functions. For e.g., the following code prints out the value of the first column in the `resultset`:
```fortran
do while(rslt%movenext())
    print*,strName
end do
```

For executing any other SQL statements, you have to call the `execute()` member function of `connection`:
```fortran
integer :: nrows
nrows = db%Execute("DELETE FROM emp")
```
The `exceute()` function will return the number of rows affected by the statement. After database operations are over, you must release the resources occupied by ODBC by calling the `close()` function of the class `connection`.
