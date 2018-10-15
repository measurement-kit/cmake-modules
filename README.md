# Useful CMake Modules

This repository contains CMake modules used within Measurement Kit.

## Usage

1. embed it as a git submodule into your sources tree:

```
git submodule add git@github.com:measurement-kit/cmake-modules cmake/Modules
```

2. modify your `CMakeLists.txt` to use this submodule:

```cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
include(MkUtils)
```

3. use it whenever appropriate

## Synopsis

```cmake
function(MkDownloadAdishavitArgh)
```

Downloads the latest version of [github.com/adishavit/argh](
https://github.com/adishavit/argh).

```cmake
function(MkDownloadNlohmannJson)
```

Downloads the latest version of [github.com/nlohmann/json](
https://github.com/nlohmann/json).

```cmake
function(MkDownloadCatchorgCatch2)
```

Downloads the latest version of [github.com/catchorg/Catch2](
https://github.com/catchorg/Catch2).

```cmake
macro(MkSetCompilerFlags)
```

Tweaks the compiler flags (both for C++ and C) as follows:

- require a threading library

- set position independent code

- require C++11 and C11

- reject any compiler that is not GCC, Clang, or MSVC

- with GCC and Clang, set `-Wall -Wextra -Werror` as well as other
  useful warnings and hardening flags

- with MSVC, set `/WX /W4 /Wall /analyze` and require Windows >= Vista
