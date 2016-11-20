cmake_minimum_required(VERSION 2.8.12.2)
project(project7lib)

include_directories(include)

add_library(baz STATIC src/baz.cpp)
add_library(qux STATIC src/qux.cpp)

install(DIRECTORY include/project7lib DESTINATION include)
install(TARGETS baz qux DESTINATION lib)
