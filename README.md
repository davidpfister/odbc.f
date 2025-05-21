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
    ODBC (Open Database Connectivity) bindings for modern Fortran.
    <br />
    <a href="https://github.com/davidpfister/odbc.f"><strong>Explore the project</strong></a>
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
[TOC]

# Introduction
<!-- ABOUT THE PROJECT -->
The Fortran ODBC Library (_odbc.f_) is a modern, lightweight, and robust interface designed to enable seamless interaction between Fortran applications and relational databases through the Open Database Connectivity (ODBC) standard. This library provides a set of Fortran modules and procedures that allow developers to connect to ODBC-compliant databases, execute SQL queries, and manage data directly from Fortran programs.

## About the Project
<p align="center">
  <img src="https://github.com/davidpfister/odbc.f/blob/master/.dox/images/icon.jpg?raw=true">
</p>
 
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
## Getting Started

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

## Installation

#### Get the code
```bash
git clone https://github.com/davidpfister/odbc.f
cd odbc.f
```

### Generate the interface with swig
One of the particularity of _odbc.f_ is that the interface for the c-binding is automatically generated with [swig-fortran](https://github.com/swig-fortran/swig.git) using the ODBC header files. In the present case, the unixODBC headers have been used. 

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
system fprettify .\src\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
system fprettify .\tests\ -r --case 1 1 1 1 -i 4 --strict-indent --enable-replacements --strip-comments --c-relations
option clean --all

@clean
option clean --all

@rebuild
system rmdir /s /q build
option build --flag '-ffree-line-length-none'

@build
option build --flag '-ffree-line-length-none'

@test
options test --flag '-ffree-line-length-none' '-D_QUIET' 

@doc
option clean --all
system cd ./.dox & doxygen ./Doxyfile.in & cd ..
```

#### Build with Visual Studio 2019

The project was originally developed on Windows with Visual Studio 2019. The repo contains the solution file (_Odbc.f.sln_) to get you started with Visual Studio 2019. 

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

