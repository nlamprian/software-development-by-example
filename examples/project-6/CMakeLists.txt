cmake_minimum_required(VERSION 2.8.12.2)
project(project6)

include_directories(include)

add_library(baz STATIC src/baz.cpp)
add_library(qux STATIC src/qux.cpp)

add_executable(program src/code.cpp)
add_dependencies(program baz qux)
target_link_libraries(program baz qux)
