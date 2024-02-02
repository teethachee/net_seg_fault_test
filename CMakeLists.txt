cmake_minimum_required (VERSION 3.10)

project(foo)

set (CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set (CMAKE_PDB_OUTPUT_DIRECTORY     "${CMAKE_BINARY_DIR}/bin")

include(FetchContent)

# third_party: glog
FetchContent_Declare(
    glog
    URL      https://github.com/google/glog/archive/v0.4.0.zip
    URL_HASH SHA256=9e1b54eb2782f53cd8af107ecf08d2ab64b8d0dc2b7f5594472f3bd63ca85cdc
)
FetchContent_MakeAvailable(glog)

add_library(foo SHARED "${CMAKE_CURRENT_LIST_DIR}/lib/foo.cpp")
target_include_directories(foo PUBLIC "${CMAKE_CURRENT_LIST_DIR}/include")
target_include_directories(foo PRIVATE "${glog_BINARY_DIR}")
target_link_libraries(foo PRIVATE glog)

add_executable(foo_test "${CMAKE_CURRENT_LIST_DIR}/lib/main.cpp")
target_link_libraries(foo_test PRIVATE foo)
