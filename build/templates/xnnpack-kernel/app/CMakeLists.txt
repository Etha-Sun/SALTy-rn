cmake_minimum_required(VERSION 3.20.0)

# Set XNNPACK directory
set(XNNPACK_DIR $ENV{ZEPHYR_BASE}/../../third-party/XNNPACK)

# Set XNNPACK build options
set(XNNPACK_ENABLE_RISCV_VECTOR ON CACHE BOOL "Build XNNPACK with RISC-V Vector micro-kernels")
set(XNNPACK_BUILD_TESTS OFF CACHE BOOL "Build XNNPack unit tests")
set(XNNPACK_BUILD_BENCHMARKS OFF CACHE BOOL "Build XNNPack benchmarks")

# Configuration files
set(CONF_FILE prj.conf riscv_vector.conf)

# Find Zephyr
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(rvv_bench)

# Create interface library to pass Zephyr's sysroot/includes to subprojects
add_library(compile_commands INTERFACE)
target_include_directories(compile_commands INTERFACE $<TARGET_PROPERTY:app,INTERFACE_INCLUDE_DIRECTORIES>)
target_compile_options(compile_commands INTERFACE $<TARGET_PROPERTY:app,INTERFACE_COMPILE_OPTIONS>)
target_compile_definitions(compile_commands INTERFACE $<TARGET_PROPERTY:app,INTERFACE_COMPILE_DEFINITIONS>)
add_dependencies(compile_commands zephyr_interface)
add_dependencies(compile_commands zephyr_property_target)

# Build XNNPACK as a subproject (this builds pthreadpool automatically)
add_subdirectory(${XNNPACK_DIR} xnnpack_build)
target_link_libraries(pthreadpool PUBLIC compile_commands)

# Add XNNPACK include directories
target_include_directories(app PRIVATE ${XNNPACK_DIR})
target_include_directories(app PRIVATE ${XNNPACK_DIR}/include)
target_include_directories(app PRIVATE ${XNNPACK_DIR}/src)

# Generated RVV kernels (so harness can #include "kernel.c")
target_include_directories(app PRIVATE ${CMAKE_SOURCE_DIR}/../../../../kernels/target)

# Link XNNPACK and pthreadpool
target_link_libraries(app PRIVATE XNNPACK pthreadpool)

# Add source files
target_sources(app PRIVATE src/main.c)

# Enable RVV intrinsics
target_compile_options(app PRIVATE
  -march=rv64gcv
  -mabi=lp64d
  -O2)
