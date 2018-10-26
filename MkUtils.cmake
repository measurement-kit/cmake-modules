function(MkDownloadAdishavitArgh)
  message(STATUS "Downloading adishavit/argh")
  file(DOWNLOAD https://raw.githubusercontent.com/adishavit/argh/v1.2.1/argh.h
       "${CMAKE_CURRENT_BINARY_DIR}/argh.h" EXPECTED_HASH
       SHA256=ca14a63ea5be5b924019b4844218142936b6f4e3ef57dfe4c81ba35a7f07004e
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadCaBundle)
  message(STATUS "Downloading CA bundle")
  file(DOWNLOAD https://curl.haxx.se/ca/cacert-2018-06-20.pem
       "${CMAKE_CURRENT_BINARY_DIR}/ca-bundle.pem" EXPECTED_HASH
       SHA256=238823cd92d3bcdd67c1c278536d6c282dd6b526ee6ee97efbf00ef31d8c5d79
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadGeoIP)
  message(STATUS "Downloading GeoLite2 databases")
  # Variables (you should change them when a new version is available)
  set(COUNTRY_SHA 8d4e607ba81cedd0b39d354a5237484da58f33f91d336c5386a6beb334e1811c)
  set(COUNTRY_DIRNAME "GeoLite2-Country_20181023")
  set(ASN_SHA 5b696b431a2e41a519348bc6b5454bf186b97ceb23872a49c78d46449078597a)
  set(ASN_DIRNAME "GeoLite2-ASN_20181023")
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
  file(DOWNLOAD https://raw.githubusercontent.com/nlohmann/json/v3.1.2/single_include/nlohmann/json.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/json.hpp" EXPECTED_HASH
       SHA256=fbdfec4b4cf63b3b565d09f87e6c3c183bdd45c5be1864d3fcb338f6f02c1733
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadCatchorgCatch2)
  message(STATUS "Downloading catchorg/Catch2")
  file(DOWNLOAD https://github.com/catchorg/Catch2/releases/download/v2.3.0/catch.hpp
       "${CMAKE_CURRENT_BINARY_DIR}/catch.hpp" EXPECTED_HASH
       SHA256=5eb8532fd5ec0d28433eba8a749102fd1f98078c5ebf35ad607fb2455a000004
       TLS_VERIFY ON SHOW_PROGRESS)
endfunction()

function(MkDownloadMeasurementKitMkCurl)
  message(STATUS "Downloading measurement-kit/mkcurl")
  file(DOWNLOAD https://raw.githubusercontent.com/measurement-kit/mkcurl/v0.7.0/mkcurl.h
       "${CMAKE_CURRENT_BINARY_DIR}/mkcurl.h" EXPECTED_HASH
       SHA256=97187a6344a17476fa6d18a5cc6212d627172735cc2ccd8a75cdc58756c5085e
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
