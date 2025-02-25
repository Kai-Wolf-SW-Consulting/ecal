# ========================= eCAL LICENSE =================================
#
# Copyright (C) 2016 - 2019 Continental Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ========================= eCAL LICENSE =================================

#######################
#  Unfortunately these install functions cannot be used to install the headers
#  Each target will have to install it by themselves (e.g. install(DIRECTORY ...))
######################

# this appends the 64 / 32 suffix (required for the eCAL Core libraries)
function(ecal_install_ecal_library TARGET_NAME)
  if(BUILD_SHARED_LIBS)
    ecal_install_ecal_shared_library(${TARGET_NAME})
  else()
    ecal_install_ecal_static_library(${TARGET_NAME})
  endif()
endfunction()

# this appends the 64 / 32 suffix (required for the eCAL Core libraries)
function(ecal_install_ecal_static_library TARGET_NAME)
  
  install(TARGETS ${TARGET_NAME}
  # IMPORTANT: Add the library to the "export-set"
    EXPORT eCALCoreTargets
    ARCHIVE       DESTINATION "${eCAL_install_archive_dir}" COMPONENT sdk
    LIBRARY       DESTINATION "${eCAL_install_lib_dir}"     COMPONENT sdk
  )
endfunction()

# installing shared libraries is a li
# this appends the 64 / 32 suffix (required for the eCAL Core libraries)
function(ecal_install_ecal_shared_library TARGET_NAME)
  
# Windows, RUNTIME -> .dll, ARCHIVE -> .lib, Unix: LIBRARY -> .so
  install(TARGETS ${TARGET_NAME}
  # IMPORTANT: Add the library to the "export-set"
    EXPORT eCALCoreTargets
    RUNTIME       DESTINATION "${eCAL_install_bin_dir}"         COMPONENT runtime
    LIBRARY       DESTINATION "${eCAL_install_lib_dir}"         COMPONENT sdk
    ARCHIVE       DESTINATION "${eCAL_install_archive_dyn_dir}" COMPONENT sdk
  )
endfunction()

function(ecal_install_library TARGET_NAME)
  if(BUILD_SHARED_LIBS)
    ecal_install_shared_library(${TARGET_NAME})
  else ()
    ecal_install_static_library(${TARGET_NAME})
  endif()
endfunction()

function(ecal_install_static_library TARGET_NAME)
  install(TARGETS ${TARGET_NAME}
  # IMPORTANT: Add the library to the "export-set"
    EXPORT eCALCoreTargets
    ARCHIVE       DESTINATION "${eCAL_install_archive_dir}" COMPONENT sdk
    LIBRARY       DESTINATION "${eCAL_install_lib_dir}"     COMPONENT sdk
  )
endfunction()

# installing shared libraries is a li
function(ecal_install_shared_library TARGET_NAME)
# Windows, RUNTIME -> .dll, ARCHIVE -> .lib, Unix: LIBRARY -> .so
  install(TARGETS ${TARGET_NAME}
  # IMPORTANT: Add the library to the "export-set"
    RUNTIME       DESTINATION "${eCAL_install_bin_dir}"         COMPONENT runtime
    LIBRARY       DESTINATION "${eCAL_install_lib_dir}"         COMPONENT sdk
    ARCHIVE       DESTINATION "${eCAL_install_archive_dyn_dir}" COMPONENT sdk
  )
endfunction()

# These are libraries used by application (e.g. on Unix)
# but they are not supposed to be used by other Applications
# Hence they are not added to the export list.
function(ecal_install_private_shared_library TARGET_NAME)
  install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION "${eCAL_install_bin_dir}" COMPONENT runtime  # applies to windows .dll
    LIBRARY DESTINATION "${eCAL_install_lib_dir}" COMPONENT sdk  # applies to unix .so
  )
endfunction()

# Applications are all APPS that come with the eCAL Installation
# e.g. the eCAL Monitor, eCAL Player, eCAL recorder
#
function(ecal_install_app TARGET_NAME)
  set(oneValueArgs START_MENU_NAME)
  cmake_parse_arguments(ECAL_INSTALL_APP "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )
  install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_app_dir}" COMPONENT app
  )
  set_property(INSTALL "${eCAL_install_app_dir}/$<TARGET_FILE_NAME:${TARGET_NAME}>"
    PROPERTY CPACK_START_MENU_SHORTCUTS "${ECAL_INSTALL_APP_START_MENU_NAME}"
  )
endfunction()

function(ecal_install_gtest TARGET_NAME)
  install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_tests_dir}" COMPONENT testing
  )
endfunction()


# Samples are sample applications that demonstrate eCAL capability
# They will be installed to "${INSTALL_BIN_DIR}/ecal_samples"
function(ecal_install_sample TARGET_NAME)
  install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_samples_dir}" COMPONENT samples
  )
endfunction()

# Use this function to install time plugins
# We need to provide a similar function for installing custom build plugins.
function(ecal_install_time_plugin TARGET_NAME)
install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_bin_dir}/${ECAL_TIME_PLUGIN_DIR}" COMPONENT app
    LIBRARY DESTINATION  "${eCAL_install_lib_dir}/${ECAL_TIME_PLUGIN_DIR}" COMPONENT app
  )
endfunction()

# Use this function to install converter plugins
# We need to provide a similar function for installing custom build plugins.
function(ecal_install_conv_plugin TARGET_NAME)
install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_bin_dir}/${ECAL_CONV_PLUGIN_DIR}" COMPONENT app
    LIBRARY DESTINATION  "${eCAL_install_lib_dir}/${ECAL_CONV_PLUGIN_DIR}" COMPONENT app
  )
endfunction()

# Use this function to install monitor plugins
# We need to provide a similar function for installing custom build plugins.
function(ecal_install_mon_plugin TARGET_NAME)
install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION  "${eCAL_install_bin_dir}/${ECAL_MON_PLUGIN_DIR}" COMPONENT app
    LIBRARY DESTINATION  "${eCAL_install_lib_dir}/${ECAL_MON_PLUGIN_DIR}" COMPONENT app
  )
endfunction()