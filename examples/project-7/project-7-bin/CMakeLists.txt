cmake_minimum_required(VERSION 2.8.12.2)
project(project7bin)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake_modules/")
find_package(project7lib REQUIRED)

include_directories(${project7lib_INCLUDE_DIR})

add_executable(program src/code.cpp)
target_link_libraries(program ${project7lib_LIBRARIES})

install(TARGETS program DESTINATION bin)
