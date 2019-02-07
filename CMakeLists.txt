# Simple CMakeLists.txt used for testing MkUtils.cmake

cmake_minimum_required(VERSION 3.1.0)
project(cmake_modules)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
include(MkUtils)

MkDownloadAdishavitArgh()
MkDownloadCaBundle()
MkDownloadHowardHinnantDate()
MkDownloadMMDBDatabases()
MkDownloadNlohmannJson()
MkDownloadCatchorgCatch2()

MkDownloadMeasurementKitMkCollector()
MkDownloadMeasurementKitMkData()
MkDownloadMeasurementKitMkMock()
MkDownloadMeasurementKitMkCurl()
MkDownloadMeasurementKitMkIPLookup()
MkDownloadMeasurementKitMkMMDB()

MkDownloadMeasurementKitPrebuiltWindowsCurl()
MkDownloadMeasurementKitPrebuiltWindowsLibmaxminddb()

MkSetCompilerFlags()
