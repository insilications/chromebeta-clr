message(STATUS "cmake version ${CMAKE_VERSION}")
project (chromebeta)
cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8

set(LIB_INSTALL_DIR lib64 CACHE STRING "Install location of libraries")
set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")
set(SHARE_INSTALL_DIR share CACHE STRING "Install location of executables")
set(OPT_INSTALL_DIR /opt/google/ CACHE STRING "Install location of /opt files")

install(DIRECTORY ${PROJECT_SOURCE_DIR}/usr/bin/ DESTINATION ${BIN_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/usr/share/ DESTINATION ${SHARE_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/opt/google/ DESTINATION ${OPT_INSTALL_DIR} USE_SOURCE_PERMISSIONS)
