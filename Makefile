# Makefile for Vector SIMD Verification
# Organized into three main components:
#   1. NEON code (tests/XNN_1_neon.cpp)
#   2. RISC-V code (tests/XNN_1_rvv.cpp)
#   3. Symbolic checking code (test_xnn_symbolic.cpp)

# Compiler settings
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2 -Isrc -IBenchmark/XNNPACK/src -IBenchmark/XNNPACK -I/usr/local/bin/cvc6/include

# Solver-specific settings
CVC5_LDFLAGS = -L/usr/local/bin/cvc6/lib -lcvc5 -lpicpolyxx -lpicpoly -lcadical -lgmp

# Default to CVC5
LDFLAGS = $(CVC5_LDFLAGS)

# Build directory for object files
BUILD_DIR = build
$(shell mkdir -p $(BUILD_DIR))

# Detect architecture and add appropriate flags
ARCH := $(shell uname -m)
ifeq ($(ARCH),aarch64)
    CXXFLAGS += -march=armv8-a+simd
else ifeq ($(ARCH),arm64)
    CXXFLAGS += -march=armv8-a+simd
else ifeq ($(ARCH),riscv64)
    CXXFLAGS += -march=rv64gcv
endif

# ============================================================================
# Component 1: NEON Code
# ============================================================================
NEON_SRC = tests/XNN_1_neon.cpp
NEON_OBJ = $(BUILD_DIR)/XNN_1_neon.o

# ============================================================================
# Component 2: RISC-V Code
# ============================================================================
RISCV_SRC = tests/XNN_1_rvv.cpp
RISCV_OBJ = $(BUILD_DIR)/XNN_1_rvv.o

# ============================================================================
# Component 3: Symbolic Checking Code (CVC5)
# ============================================================================
SYMBOLIC_SRC = test_xnn_symbolic.cpp
SYMBOLIC_OBJ = $(BUILD_DIR)/test_xnn_symbolic.o

# ============================================================================
# Main Test Executables
# ============================================================================
SYMBOLIC_TEST_OBJS = $(SYMBOLIC_OBJ) $(NEON_OBJ) $(RISCV_OBJ)
SYMBOLIC_TEST_TARGET = test_xnn_symbolic

# ============================================================================
# Legacy targets (if they exist)
# ============================================================================
LEGACY_SRCS = vector_verify.cpp neon_impl.cpp riscv_impl.cpp verification.cpp
LEGACY_OBJS = $(LEGACY_SRCS:%.cpp=$(BUILD_DIR)/%.o)
LEGACY_TARGET = vector_verify

# ============================================================================
# Build Rules
# ============================================================================

# Default target - build the symbolic test (CVC5)
all: $(SYMBOLIC_TEST_TARGET)

# Build individual components
neon: $(NEON_OBJ)
	@echo "Built NEON code: $(NEON_OBJ)"

riscv: $(RISCV_OBJ)
	@echo "Built RISC-V code: $(RISCV_OBJ)"

symbolic: $(SYMBOLIC_OBJ)
	@echo "Built symbolic checking code: $(SYMBOLIC_OBJ)"

# Build the main symbolic test executable (CVC5)
$(SYMBOLIC_TEST_TARGET): $(SYMBOLIC_TEST_OBJS)
	@echo "Linking $(SYMBOLIC_TEST_TARGET) (CVC5)..."
	$(CXX) $(CXXFLAGS) -o $@ $^ $(CVC5_LDFLAGS)
	@echo "Built $(SYMBOLIC_TEST_TARGET)"

# Compile NEON code
$(NEON_OBJ): $(NEON_SRC)
	@echo "Compiling NEON code: $(NEON_SRC)"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile RISC-V code
$(RISCV_OBJ): $(RISCV_SRC)
	@echo "Compiling RISC-V code: $(RISCV_SRC)"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile symbolic checking code (CVC5)
$(SYMBOLIC_OBJ): $(SYMBOLIC_SRC)
	@echo "Compiling symbolic checking code (CVC5): $(SYMBOLIC_SRC)"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Generic rule for building object files in build directory
$(BUILD_DIR)/%.o: %.cpp
	@echo "Compiling: $<"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Legacy target (if files exist)
$(LEGACY_TARGET): $(LEGACY_OBJS)
	@echo "Linking $(LEGACY_TARGET)..."
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "Built $(LEGACY_TARGET)"

# ============================================================================
# Run Targets
# ============================================================================

# Run the symbolic test (CVC5 - main test)
run: $(SYMBOLIC_TEST_TARGET)
	@echo "Running symbolic equivalence test (CVC5)..."
	./$(SYMBOLIC_TEST_TARGET)


# ============================================================================
# Clean Targets
# ============================================================================

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
	rm -f $(SYMBOLIC_TEST_TARGET) $(LEGACY_TARGET)
	rm -f tests/*.o
	@echo "Cleaned"

# Clean only object files, keep executables
clean-objs:
	@echo "Cleaning object files..."
	rm -rf $(BUILD_DIR)
	@echo "Cleaned object files"

# ============================================================================
# Info Targets
# ============================================================================

info:
	@echo "=== Build Configuration ==="
	@echo "Compiler: $(CXX)"
	@echo "Architecture: $(ARCH)"
	@echo "Build Directory: $(BUILD_DIR)"
	@echo ""
	@echo "=== Components ==="
	@echo "NEON Code: $(NEON_SRC)"
	@echo "RISC-V Code: $(RISCV_SRC)"
	@echo "Symbolic Checking (CVC5): $(SYMBOLIC_SRC)"
	@echo ""
	@echo "=== Targets ==="
	@echo "  make all              - Build symbolic test with CVC5 (default)"
	@echo "  make neon             - Build NEON code only"
	@echo "  make riscv            - Build RISC-V code only"
	@echo "  make symbolic         - Build symbolic checking code only"
	@echo "  make run              - Build and run symbolic test (CVC5)"
	@echo "  make clean            - Remove all build artifacts"
	@echo "  make info             - Show this information"

# Phony targets
.PHONY: all neon riscv symbolic run clean clean-objs info
