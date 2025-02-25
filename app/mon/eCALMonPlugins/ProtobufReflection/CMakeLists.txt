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

project(mon_plugin_protobuf_reflection)

find_package(Qt5 COMPONENTS
    Core
    Widgets
REQUIRED)

find_package(Protobuf REQUIRED)

if(POLICY CMP0071)
  cmake_policy(SET CMP0071 OLD)
endif()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC OFF) # Reason for being turned off: AutoUIC will prevent VS from detecting changes in .ui files
set(CMAKE_AUTORCC OFF) # Reason for being turned off: AutoRCC will create an entirely new project in VS which clutters the solution appearance. Additionally, we cannot assign a source group to the generated .cpp files which will clutter the project.
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(${PROJECT_NAME}_src
  src/PluginWidget.cpp
  src/Plugin.cpp
  src/ProtobufTreeBuilder.cpp
)

set(${PROJECT_NAME}_header
  src/PluginWidget.h
  src/Plugin.h
  src/ProtobufTreeBuilder.h
)

set(${PROJECT_NAME}_ui
  src/PluginWidget.ui
)

qt5_wrap_ui(autogen_ui ${${PROJECT_NAME}_ui})

ecal_add_mon_plugin(${PROJECT_NAME} SHARED ${${PROJECT_NAME}_src} ${${PROJECT_NAME}_header} ${${PROJECT_NAME}_ui} ${autogen_ui})

create_targets_protobuf()
target_link_libraries (${PROJECT_NAME} Qt5::Widgets eCAL::core eCAL::pb protobuf::libprotobuf MonitorTreeView eCAL::mon_plugin_lib)

if(MSVC)
  set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_FLAGS "/wd4127")
ENDIF(MSVC)

target_include_directories(${PROJECT_NAME} PRIVATE src)
target_include_directories(${PROJECT_NAME} PRIVATE $<TARGET_PROPERTY:eCAL::core,INCLUDE_DIRECTORIES>)

ecal_install_mon_plugin(${PROJECT_NAME})

if (TARGET mon)
add_dependencies(mon ${PROJECT_NAME})
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIGURATION>/${ECAL_MON_PLUGIN_DIR}
  FOLDER app/mon/plugins
)
