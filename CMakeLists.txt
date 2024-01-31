cmake_minimum_required (VERSION 3.19)

project(foo)

set (CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

add_library(foo SHARED "${CMAKE_CURRENT_LIST_DIR}/lib/foo.cpp")
target_include_directories(foo PUBLIC "${CMAKE_CURRENT_LIST_DIR}/include")
