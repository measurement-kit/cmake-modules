# Useful CMake Modules

This repository contains CMake modules used within Measurement Kit.

## Usage

1. embed it as a git submodule into your sources tree:

```
git submodule add https://github.com/measurement-kit/cmake-modules cmake/Modules
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
function(MkDownloadCaBundle)
```

Download CURL's CA bundle.

```cmake
function(MkDownloadMMDBDatabases)
```

Download MaxMind's MMDB GeoLite2 databases.

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
function(MkDownloadMeasurementKitMkData)
```

Downloads the [github.com/measurement-kit/mkdata](
https://github.com/measurement-kit/mkdata) header only library.

```cmake
function(MkDownloadMeasurementKitMkCurl)
```

Downloads the [github.com/measurement-kit/mkcurl](
https://github.com/measurement-kit/mkcurl) header only library.

```cmake
function(MkDownloadMeasurementKitPrebuiltWindowsCurl)
```

Downloads the latest version of [github.com/curl/curl](
https://github.com/curl/curl) precompiled by us for the MSVC compiler. As
such, this code should only be executed when compiling for MSVC.

The archive will be downloaded and extracted in the current binary directory
creating a `MK_DIST/windows/curl/$version/$arch` tree.

Sets the following variables:

- `MK_WINDOWS_CURL_INCLUDE_PATH`, to be added to `CMAKE_INCLUDE_PATH`;

- `MK_WINDOWS_CURL_LIBRARY_PATH`, to be added to `CMAKE_LIBRARY_PATH`;

- `MK_WINDOWS_CURL_DEFINITIONS`, to be passed to `add_definitions()`;

- `MK_WINDOWS_CURL_EXTRA_LINK_LIBS`, extra libraries to be linked when
  linking with cURL, which is static, hence we need to specify these
  required libraries explicitly.

```cmake
function(MkDownloadMeasurementKitPrebuiltWindowsLibmaxminddb)
```

Downloads the latest version of [github.com/maxmind/libmaxminddb](
https://github.com/maxmind/libmaxminddb) precompiled by us for the MSVC
compiler. As such, this code should only be executed when compiling
for MSVC.

The archive will be downloaded and extracted in the current binary directory
creating a `MK_DIST/windows/libmaxminddb/$version/$arch` tree.

Sets the following variables:

- `MK_WINDOWS_LIBMAXMINDDB_INCLUDE_PATH`, to be added to `CMAKE_INCLUDE_PATH`;

- `MK_WINDOWS_LIBMAXMINDDB_LIBRARY_PATH`, to be added to `CMAKE_LIBRARY_PATH`;

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
