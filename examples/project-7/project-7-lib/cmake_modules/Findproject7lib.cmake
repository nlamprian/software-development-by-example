# Try to find project7lib
# Once done, this will define:
#   project7lib_FOUND        - system has project7lib
#   project7lib_INCLUDE_DIR  - the project7lib include directory
#   project7lib_LIBRARIES    - link these to use project7lib

find_path( 
  project7lib_INCLUDE_DIR
  NAMES project7lib/baz.h project7lib/qux.h
  HINTS ~/sdbe-output/include 
        /usr/local/include 
        /usr/include
  DOC "The directory where the project7lib headers reside"
)

find_library( 
  project7lib_baz_LIBRARY 
  NAMES baz
  PATHS ~/sdbe-output/lib
        /usr/local/lib
        /usr/lib
  DOC "The project7lib baz library"
)

find_library( 
  project7lib_qux_LIBRARY 
  NAMES qux
  PATHS ~/sdbe-output/lib
        /usr/local/lib
        /usr/lib
  DOC "The project7lib qux library"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
  project7lib
  FOUND_VAR project7lib_FOUND
  REQUIRED_VARS project7lib_INCLUDE_DIR project7lib_baz_LIBRARY project7lib_qux_LIBRARY
)

if(project7lib_FOUND)
  set(project7lib_LIBRARIES ${project7lib_baz_LIBRARY} ${project7lib_qux_LIBRARY})
  message(STATUS "Found project7lib:")
  message(STATUS " - Includes: ${project7lib_INCLUDE_DIR}")
  message(STATUS " - Libraries: ${project7lib_LIBRARIES}")
else(project7lib_FOUND)
  set(project7lib_LIBRARIES)
endif(project7lib_FOUND)

mark_as_advanced(
  project7lib_INCLUDE_DIR
  project7lib_baz_LIBRARY
  project7lib_qux_LIBRARY
)
