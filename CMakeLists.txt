cmake_minimum_required(VERSION 3.10)
project(VectorVerify)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add CVC5 include and library paths
set(CVC5_INCLUDE_DIR "/usr/local/bin/cvc6/include")
set(CVC5_LIB_DIR "/usr/local/bin/cvc6/lib")

# Add Bitwuzla include and library paths
set(BITWUZLA_INCLUDE_DIR "/usr/local/include/bitwuzla")
set(BITWUZLA_LIB_DIR "/usr/local/lib")

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CVC5_INCLUDE_DIR})

# Link directories
link_directories(${CVC5_LIB_DIR})
link_directories(${BITWUZLA_LIB_DIR})

# Header-only libraries (neon_symbolic.hpp and riscv_symbolic.hpp)
# No compilation needed - just include the headers

# Equivalence testing (NEON vs RISC-V) with CVC5
add_executable(test_symbolic test_symbolic.cpp)
target_link_libraries(test_symbolic cvc5 cvc5parser picpoly picpolyxx gmp gmpxx cadical)

# Equivalence testing (NEON vs RISC-V) with Bitwuzla
add_executable(test_symbolic_bitwuzla test_xnn_symbolic_bitwuzla.cpp)
target_include_directories(test_symbolic_bitwuzla PRIVATE ${BITWUZLA_INCLUDE_DIR})
target_link_libraries(test_symbolic_bitwuzla bitwuzla)

# Platform-specific flags for SIMD
if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|arm64")
    # ARM NEON is enabled by default on ARM64
    message(STATUS "Building for ARM64 with NEON support")
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv")
    # Enable RISC-V Vector extension if available
    target_compile_options(riscv_symbolic PRIVATE -march=rv64gcv)
    message(STATUS "Building for RISC-V with Vector extension")
endif()

# Optional: Add debug symbols
set(CMAKE_BUILD_TYPE Debug)
