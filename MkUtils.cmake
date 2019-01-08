function(MkDownloadAdishavitArgh)
  message(STATUS "Downloading adishavit/argh")
  file(DOWNLOAD https://raw.githubusercontent.com/adishavit/argh/v1.3.0/argh.h
       "${CMAKE_CURRENT_BINARY_DIR}/argh.h" EXPECTED_HASH
       SHA256=ddb7dfc18dcf90149735b76fb2cff101067453a1df1943a6911233cb7085980c
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadCaBundle)
  message(STATUS "Downloading CA bundle")
  file(DOWNLOAD https://curl.haxx.se/ca/cacert-2018-12-05.pem
       "${CMAKE_CURRENT_BINARY_DIR}/ca-bundle.pem" EXPECTED_HASH
       SHA256=4d89992b90f3e177ab1d895c00e8cded6c9009bec9d56981ff4f0a59e9cc56d6
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMMDBDatabases)
  message(STATUS "Downloading MMDB databases")
  # Variables (you should change them when a new version is available)
  set(COUNTRY_SHA 77385129da78c3efce33f924f4d8bffa1436c8ab3e831f6dffda39f76b4c0daa)
  set(COUNTRY_DIRNAME "GeoLite2-Country_20190101")
  set(ASN_SHA 5f4ef8c8ae2bdf3037dba4a5255760cc6ccc63a8498e2236f7eff007d0d91316)
  set(ASN_DIRNAME "GeoLite2-ASN_20190101")
  # Country
  file(DOWNLOAD https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
       "${CMAKE_CURRENT_BINARY_DIR}/geolite2-country.tar.gz" EXPECTED_HASH
       SHA256=${COUNTRY_SHA}
       TLS_VERIFY ON SHOW_PROGRESS)
  execute_process(COMMAND ${CMAKE_COMMAND} -E tar xf "geolite2-country.tar.gz"
          WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
          RESULT_VARIABLE TAR_FAILURE)
  if("${TAR_FAILURE}")
    message(FATAL_ERROR "Cannot unpack GeoIP country: ${TAR_FAILURE}")
  endif()
  execute_process(COMMAND ${CMAKE_COMMAND} -E rename
          "${COUNTRY_DIRNAME}/GeoLite2-Country.mmdb"
          "country.mmdb"
          WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
          RESULT_VARIABLE MOVE_FAILURE)
  if("${MOVE_FAILURE}")
    message(FATAL_ERROR "Cannot move GeoIP country: ${MOVE_FAILURE}")
  endif()
  # ASN
  file(DOWNLOAD https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz
       "${CMAKE_CURRENT_BINARY_DIR}/geolite2-asn.tar.gz" EXPECTED_HASH
       SHA256=${ASN_SHA}
       TLS_VERIFY ON SHOW_PROGRESS)
  execute_process(COMMAND ${CMAKE_COMMAND} -E tar xf "geolite2-asn.tar.gz"
          WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
          RESULT_VARIABLE TAR_FAILURE)
  if("${TAR_FAILURE}")
    message(FATAL_ERROR "Cannot unpack GeoIP ASN: ${TAR_FAILURE}")
  endif()
  execute_process(COMMAND ${CMAKE_COMMAND} -E rename
          "${ASN_DIRNAME}/GeoLite2-ASN.mmdb"
          "asn.mmdb"
          WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
          RESULT_VARIABLE MOVE_FAILURE)
  if("${MOVE_FAILURE}")
    message(FATAL_ERROR "Cannot move GeoIP ASN: ${MOVE_FAILURE}")
  endif()
endfunction()

function(MkDownloadNlohmannJson)
  message(STATUS "Downloading nlohmann/json")
  file(DOWNLOAD https://raw.githubusercontent.com/nlohmann/json/v3.5.0/single_include/nlohmann/json.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/json.hpp" EXPECTED_HASH
       SHA256=8a6dbf3bf01156f438d0ca7e78c2971bca50eec4ca6f0cf59adf3464c43bb9d5
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadCatchorgCatch2)
  message(STATUS "Downloading catchorg/Catch2")
  file(DOWNLOAD https://github.com/catchorg/Catch2/releases/download/v2.5.0/catch.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/catch.hpp" EXPECTED_HASH
       SHA256=a87d5c0417aaf1c3d16565244a1b643e1999d5838d842823731bc18560268f94
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkData)
  message(STATUS "Downloading measurement-kit/mkdata")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkdata/v0.3.0/mkdata.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/mkdata.hpp" EXPECTED_HASH
       SHA256=96bb0384ecd7231a861111d8818a560b7d5ca83316cf7946a4f1a352db6ecfe3
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkMock)
  message(STATUS "Downloading measurement-kit/mkmock")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkmock/v0.1.4/mkmock.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/mkmock.hpp" EXPECTED_HASH
       SHA256=49a67f0235bc9ec246f3d30e1e610a03fcd4f1de11cb098edc5127a4c2245210
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkCurl)
  message(STATUS "Downloading measurement-kit/mkcurl")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkcurl/v0.9.1/mkcurl.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/mkcurl.hpp" EXPECTED_HASH
       SHA256=25cedc7b79bd4e5fbc87bc909f3e32f0f9f29d377d438cf246636025fbd6f991
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkIPLookup)
  message(STATUS "Downloading measurement-kit/mkiplookup")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkiplookup/v0.1.3/mkiplookup.h
       "${CMAKE_CURRENT_BINARY_DIR}/mkiplookup.h" EXPECTED_HASH
       SHA256=8c93056e53985586c5c8f44eb9523b6dc24221f26e5fe49f54d8b2c3c1f1bd6c
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkMMDB)
  message(STATUS "Downloading measurement-kit/mkmmdb")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkmmdb/v0.3.0/mkmmdb.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/mkmmdb.hpp" EXPECTED_HASH
       SHA256=39c0b6192a01bc58df49d08299ae47b492f4c113d86d525f2e73ece954daa116
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitPrebuiltWindows_ NAME VERSION HASH)
  set(BASEURL "https://github.com/measurement-kit/prebuilt/releases/download")
  set(CHANNEL "testing")
  set(TARBALLNAME "windows-${NAME}-${VERSION}.tar.gz")
  set(TARBALL "${CMAKE_CURRENT_BINARY_DIR}/${TARBALLNAME}")
  set(URL "${BASEURL}/${CHANNEL}/${TARBALLNAME}")
  message(STATUS "Downloading ${TARBALLNAME} from ${URL}")
  file(DOWNLOAD "${URL}" "${TARBALL}" EXPECTED_HASH SHA256=${HASH}
       TLS_VERIFY ON SHOW_PROGRESS)
  execute_process(COMMAND ${CMAKE_COMMAND} -E tar xf "${TARBALLNAME}"
                  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
                  RESULT_VARIABLE FAILURE)
  if("${FAILURE}")
    message(FATAL_ERROR "Cannot unpack ${TARBALLNAME}: ${FAILURE}")
  endif()
  if("${CMAKE_SIZEOF_VOID_P}" EQUAL 8)
    set(ARCH x64)
  elseif("${CMAKE_SIZEOF_VOID_P}" EQUAL 4)
    set(ARCH x86)
  else()
    message(FATAL_ERROR "Your architecture is unknown")
  endif()
  set(BASEPREFIX "${CMAKE_CURRENT_BINARY_DIR}/MK_DIST/windows")
  set(PREFIX_ "${BASEPREFIX}/${NAME}/${VERSION}/${ARCH}" PARENT_SCOPE)
endfunction()

function(MkDownloadMeasurementKitPrebuiltWindowsCurl)
  MkDownloadMeasurementKitPrebuiltWindows_("curl" "7.61.0-1"
    "c4321f05ac238d42f2487536c4fdd8e55af68a3f364008271fe3b6741c6b855f")
  set(MK_WINDOWS_CURL_INCLUDE_PATH "${PREFIX_}/include" PARENT_SCOPE)
  set(MK_WINDOWS_CURL_LIBRARY_PATH "${PREFIX_}/lib" PARENT_SCOPE)
  set(MK_WINDOWS_CURL_DEFINITIONS "-DCURL_STATICLIB" PARENT_SCOPE)
  set(MK_WINDOWS_CURL_EXTRA_LINK_LIBS Crypt32 PARENT_SCOPE)
endfunction()

function(MkDownloadMeasurementKitPrebuiltWindowsLibmaxminddb)
  MkDownloadMeasurementKitPrebuiltWindows_("libmaxminddb" "1.3.2-2"
    "542933912814ac518037bd26083d0bba9daf68084f43c5cf2d7ec944d62b9ebb")
  set(MK_WINDOWS_LIBMAXMINDDB_INCLUDE_PATH "${PREFIX_}/include" PARENT_SCOPE)
  set(MK_WINDOWS_LIBMAXMINDDB_LIBRARY_PATH "${PREFIX_}/lib" PARENT_SCOPE)
endfunction()

macro(MkSetCompilerFlags)
  set(THREADS_PREFER_PTHREAD_FLAG ON)
  find_package(Threads REQUIRED)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_C_STANDARD 11)
  set(CMAKE_C_STANDARD_REQUIRED ON)
  if(("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU") OR
     ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang"))
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Werror")
    # https://www.owasp.org/index.php/C-Based_Toolchain_Hardening_Cheat_Sheet
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wall")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wextra")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wconversion")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wcast-align")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wformat=2")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wformat-security")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -fno-common")
    # Some options are only supported by GCC when we're compiling C code:
    if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
      set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wmissing-prototypes")
      set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wstrict-prototypes")
    else()
      set(MK_C_FLAGS "${MK_C_FLAGS} -Wmissing-prototypes")
      set(MK_C_FLAGS "${MK_C_FLAGS} -Wstrict-prototypes")
    endif()
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wmissing-declarations")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wstrict-overflow")
    if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
      set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wtrampolines")
    endif()
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Woverloaded-virtual")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wreorder")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wsign-promo")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -Wnon-virtual-dtor")
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} -fstack-protector-all")
    if(NOT "${APPLE}")
      set(MK_LD_FLAGS "${MK_LD_FLAGS} -Wl,-z,noexecstack")
      set(MK_LD_FLAGS "${MK_LD_FLAGS} -Wl,-z,now")
      set(MK_LD_FLAGS "${MK_LD_FLAGS} -Wl,-z,relro")
      set(MK_LD_FLAGS "${MK_LD_FLAGS} -Wl,-z,nodlopen")
      set(MK_LD_FLAGS "${MK_LD_FLAGS} -Wl,-z,nodump")
    endif()
    add_definitions(-D_FORTIFY_SOURCES=2)
  elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # TODO(bassosimone): add support for /Wall and /analyze
    set(MK_COMMON_FLAGS "${MK_COMMON_FLAGS} /WX /W4")
    set(MK_LD_FLAGS "${MK_LD_FLAGS} /WX")
  else()
    message(FATAL_ERROR "Compiler not supported: ${CMAKE_CXX_COMPILER_ID}")
  endif()
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MK_COMMON_FLAGS} ${MK_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MK_COMMON_FLAGS} ${MK_CXX_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${MK_LD_FLAGS}")
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${MK_LD_FLAGS}")
  if("${WIN32}")
    add_definitions(-D_WIN32_WINNT=0x0600) # for NI_NUMERICSERV and WSAPoll
  endif()
endmacro()
