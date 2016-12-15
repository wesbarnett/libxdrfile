cmake_minimum_required ( VERSION 2.8.8 )
enable_language (C)

project ( xdrfile NONE )

set ( PROJECT_DESCRIPTION "Reads/writes compressed trajectory files" )
set ( PROJECT_URL "https://github.com/wesbarnett/libxdrfile" )
set ( LIBDIR "lib")
set ( INCLUDEDIR "include")

file ( STRINGS "${CMAKE_SOURCE_DIR}/.VERSION" VERSION )
string( REPLACE "." ";" VERSION_LIST ${VERSION} )
list(GET VERSION_LIST 0 VERSION_MAJOR)
list(GET VERSION_LIST 1 VERSION_MINOR)
list(GET VERSION_LIST 2 VERSION_PATCH)
set(PROJECT_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
message ( STATUS "CMake build configuration for ${CMAKE_PROJECT_NAME} ${PROJECT_VERSION}" )

file ( GLOB SRCS "src/*.c" )
add_library ( ${CMAKE_PROJECT_NAME} SHARED ${SRCS} )

set_target_properties ( ${CMAKE_PROJECT_NAME}
  PROPERTIES
  OUTPUT_NAME ${CMAKE_PROJECT_NAME}
  PREFIX lib
  SOVERSION ${VERSION_MAJOR}.${VERSION_MINOR}
  VERSION ${VERSION}
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${LIBDIR}"
)

install ( TARGETS ${CMAKE_PROJECT_NAME} LIBRARY DESTINATION ${LIBDIR} )
install ( DIRECTORY include/ DESTINATION ${INCLUDEDIR} FILES_MATCHING PATTERN "*.h")

# pkg-config
configure_file(
   "${CMAKE_CURRENT_SOURCE_DIR}/lib${CMAKE_PROJECT_NAME}.pc.cmake.in"
   "${CMAKE_CURRENT_BINARY_DIR}/lib${CMAKE_PROJECT_NAME}.pc"
   @ONLY
)
install ( FILES
   "${CMAKE_CURRENT_BINARY_DIR}/lib${CMAKE_PROJECT_NAME}.pc"
   DESTINATION "${LIBDIR}/pkgconfig"
)

# Tests
enable_testing ()
include_directories ( include )
set ( TEST_NAME "${CMAKE_PROJECT_NAME}_test")
add_executable ( ${TEST_NAME} src/tests/test.c )
target_link_libraries ( ${TEST_NAME} m )
target_link_libraries ( ${TEST_NAME} ${CMAKE_PROJECT_NAME} )
add_test ( ${CMAKE_PROJECT_NAME} ${TEST_NAME} )
