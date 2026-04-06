cmake_minimum_required(VERSION 3.14)
project(salt_verification CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find bitwuzla — check third_party first, then system
set(BITWUZLA_SEARCH_PATHS
    ${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/bitwuzla/install
    /usr/local /usr /opt/homebrew
)

find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
    # Add local pkgconfig path
    set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/bitwuzla/install/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
    pkg_check_modules(BITWUZLA bitwuzla)
endif()

if(NOT BITWUZLA_FOUND)
    find_path(BITWUZLA_INCLUDE_DIR bitwuzla/cpp/bitwuzla.h
        PATHS ${BITWUZLA_SEARCH_PATHS}
        PATH_SUFFIXES include
        ENV BITWUZLA_DIR
        NO_DEFAULT_PATH)
    find_library(BITWUZLA_LIBRARY
        NAMES bitwuzla
        PATHS ${BITWUZLA_SEARCH_PATHS}
        PATH_SUFFIXES lib lib64
        ENV BITWUZLA_DIR
        NO_DEFAULT_PATH)
    if(BITWUZLA_INCLUDE_DIR AND BITWUZLA_LIBRARY)
        set(BITWUZLA_FOUND TRUE)
        set(BITWUZLA_INCLUDE_DIRS ${BITWUZLA_INCLUDE_DIR})
        set(BITWUZLA_LIBRARIES ${BITWUZLA_LIBRARY})
        # Also need to set the link directory for transitive deps
        get_filename_component(BITWUZLA_LIB_DIR ${BITWUZLA_LIBRARY} DIRECTORY)
        link_directories(${BITWUZLA_LIB_DIR})
    else()
        message(FATAL_ERROR "bitwuzla not found. Set BITWUZLA_DIR or install bitwuzla.\n"
                "Searched: /usr/local, /usr, /opt/homebrew")
    endif()
endif()

# Salt verification library (header-only, but we set up includes)
add_library(salt_headers INTERFACE)
target_include_directories(salt_headers INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${BITWUZLA_INCLUDE_DIRS}
)
# Link bitwuzla — use LDFLAGS from pkg-config if available (includes -L path)
if(BITWUZLA_LDFLAGS)
    target_link_libraries(salt_headers INTERFACE ${BITWUZLA_LDFLAGS})
else()
    target_link_libraries(salt_headers INTERFACE ${BITWUZLA_LIBRARIES})
    if(BITWUZLA_LIB_DIR)
        target_link_directories(salt_headers INTERFACE ${BITWUZLA_LIB_DIR})
    endif()
endif()
target_compile_options(salt_headers INTERFACE
    -Wno-unused-parameter
    -Wno-unused-private-field
    -Wno-format
)

# Build a verification harness from a source file
# Usage: cmake --build . --target verify -- HARNESS_SRC=path/to/harness.cpp
if(HARNESS_SRC)
    get_filename_component(HARNESS_NAME ${HARNESS_SRC} NAME_WE)
    add_executable(${HARNESS_NAME} ${HARNESS_SRC})
    target_link_libraries(${HARNESS_NAME} PRIVATE salt_headers)
endif()

# Pre-built test target for qs8-vaddc
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/harness/test_qs8_vaddc.cpp")
    add_executable(test_qs8_vaddc harness/test_qs8_vaddc.cpp)
    target_link_libraries(test_qs8_vaddc PRIVATE salt_headers)
endif()
