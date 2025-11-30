# Makefile for Vector SIMD Verification
# Automatically discovers and builds all test combinations from:
#   - NEON implementations (tests/Neon/ or tests/*_neon.cpp)
#   - RISC-V implementations (tests/RISCVV/, tests/rdefault/, or tests/*_rvv.cpp)
#   - Verifier tests (tests/verifier/ or tests/*_verifier.cpp)

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



# Find all verifier files (these define the test executables)
VERIFIER_FILES := $(wildcard tests/verifier/*_verifier.cpp) $(wildcard tests/*_verifier.cpp)

# Find all NEON implementation files
NEON_FILES := $(wildcard tests/Neon/*_neon.cpp) $(wildcard tests/*_neon.cpp)

# Find all RISC-V implementation files
RISCV_FILES := $(wildcard tests/RISCVV/*_riscvv.cpp) $(wildcard tests/RISCVV/*_rvv.cpp) $(wildcard tests/RISCVV/*.rvv.cpp) \
               $(wildcard tests/rdefault/*.rvv.cpp) $(wildcard tests/*_rvv.cpp)

# Extract base names from verifier files (e.g., qsadd8 from qsadd8_verifier.cpp)
# This function extracts the test name from a verifier file path
define get_test_name
$(basename $(notdir $(1:_verifier.cpp=)))
endef

# Function to find matching NEON file for a test
define find_neon_file
$(firstword $(filter %/$(1)_neon.cpp,$(NEON_FILES)))
endef

# Function to find matching RISC-V file for a test
define find_riscv_file
$(firstword $(filter %/$(1)_riscvv.cpp %/$(1).rvv.cpp %/$(1)_rvv.cpp,$(RISCV_FILES)))
endef

# Generate list of test executables
TEST_NAMES := $(foreach v,$(VERIFIER_FILES),$(call get_test_name,$(v)))
TEST_TARGETS := $(addprefix test_,$(TEST_NAMES))

# ============================================================================
# Per-Test Build Rules (Generated Dynamically)
# ============================================================================

# Define a template for building each test
define TEST_template
# Test: $(1)
# Verifier: $(2)
# NEON: $(3)
# RISC-V: $(4)

$(1)_VERIFIER := $(2)
$(1)_NEON := $(3)
$(1)_RISCV := $(4)

$(1)_VERIFIER_OBJ := $(BUILD_DIR)/$(1)_verifier.o
$(1)_NEON_OBJ := $(BUILD_DIR)/$(1)_neon.o
$(1)_RISCV_OBJ := $(BUILD_DIR)/$(1)_rvv.o

# Compile verifier
$$($(1)_VERIFIER_OBJ): $$($(1)_VERIFIER)
	@echo "Compiling verifier for $(1): $$($(1)_VERIFIER)"
	$(CXX) $(CXXFLAGS) -c $$< -o $$@

# Compile NEON
$$($(1)_NEON_OBJ): $$($(1)_NEON)
	@echo "Compiling NEON for $(1): $$($(1)_NEON)"
	$(CXX) $(CXXFLAGS) -c $$< -o $$@

# Compile RISC-V
$$($(1)_RISCV_OBJ): $$($(1)_RISCV)
	@echo "Compiling RISC-V for $(1): $$($(1)_RISCV)"
	$(CXX) $(CXXFLAGS) -c $$< -o $$@

# Link test executable
test_$(1): $$($(1)_VERIFIER_OBJ) $$($(1)_NEON_OBJ) $$($(1)_RISCV_OBJ)
	@echo "Linking test_$(1)..."
	$(CXX) $(CXXFLAGS) -o $$@ $$^ $(CVC5_LDFLAGS)
	@echo "Built test_$(1)"

# Individual component targets
$(1)_verifier: $$($(1)_VERIFIER_OBJ)
$(1)_neon: $$($(1)_NEON_OBJ)
$(1)_riscv: $$($(1)_RISCV_OBJ)

endef

# Generate rules for each test by matching verifier with NEON and RISC-V files
$(foreach v,$(VERIFIER_FILES),\
  $(eval TEST_NAME := $(call get_test_name,$(v)))\
  $(eval NEON_FILE := $(call find_neon_file,$(TEST_NAME)))\
  $(eval RISCV_FILE := $(call find_riscv_file,$(TEST_NAME)))\
  $(if $(and $(NEON_FILE),$(RISCV_FILE)),\
    $(eval $(call TEST_template,$(TEST_NAME),$(v),$(NEON_FILE),$(RISCV_FILE))),\
    $(info ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━)\
    $(info Skipping test '$(TEST_NAME)' - Missing components:)\
    $(info   Verifier: $(v))\
    $(if $(NEON_FILE),\
      $(info   NEON:     $(NEON_FILE) ✓),\
      $(info   NEON:     NOT FOUND ✗ (looking for %/$(TEST_NAME)_neon.cpp))\
    )\
    $(if $(RISCV_FILE),\
      $(info   RISC-V:   $(RISCV_FILE) ✓),\
      $(info   RISC-V:   NOT FOUND ✗ (looking for %/$(TEST_NAME)_riscvv.cpp, %/$(TEST_NAME).rvv.cpp, or %/$(TEST_NAME)_rvv.cpp))\
    )\
    $(info ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━)\
  )\
)

# ============================================================================
# Build Rules
# ============================================================================

# Default target - build all discovered tests
all: $(TEST_TARGETS)
	@echo ""
	@echo "Built all tests: $(TEST_TARGETS)"

# Build all tests
tests: all

# Generic rule for building object files in build directory
$(BUILD_DIR)/%.o: %.cpp
	@echo "Compiling: $<"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# ============================================================================
# Run Targets
# ============================================================================

# Run all tests
run-all: $(TEST_TARGETS)
	@echo "Running all tests..."
	@for test in $(TEST_TARGETS); do \
		echo ""; \
		echo "======================================"; \
		echo "Running $$test"; \
		echo "======================================"; \
		./$$test || true; \
	done

# Run a specific test (usage: make run TEST=qsadd8)
run:
ifdef TEST
	@if [ -f "test_$(TEST)" ]; then \
		echo "Running test_$(TEST)..."; \
		./test_$(TEST); \
	else \
		echo "Error: test_$(TEST) not found. Available tests: $(TEST_NAMES)"; \
		exit 1; \
	fi
else
	@echo "Usage: make run TEST=<testname>"
	@echo "Available tests: $(TEST_NAMES)"
	@echo "Or use 'make run-all' to run all tests"
endif


# ============================================================================
# Clean Targets
# ============================================================================

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
	rm -f $(TEST_TARGETS)
	rm -f tests/*.o
	@echo "Cleaned"

# Clean only object files, keep executables
clean-objs:
	@echo "Cleaning object files..."
	rm -rf $(BUILD_DIR)
	@echo "Cleaned object files"

# ============================================================================
# Info/Help Targets
# ============================================================================

list:
	@echo "=== Discovered Tests ==="
	@echo "Test executables: $(TEST_TARGETS)"
	@echo ""
	@echo "Test names: $(TEST_NAMES)"
	@echo ""
	@echo "=== Source Files ==="
	@echo "Verifiers: $(VERIFIER_FILES)"
	@echo "NEON implementations: $(NEON_FILES)"
	@echo "RISC-V implementations: $(RISCV_FILES)"

info:
	@echo "=== Build Configuration ==="
	@echo "Compiler: $(CXX)"
	@echo "Architecture: $(ARCH)"
	@echo "Build Directory: $(BUILD_DIR)"
	@echo ""
	@echo "=== Auto-Discovered Tests ==="
	@echo "Found $(words $(TEST_TARGETS)) test(s): $(TEST_NAMES)"
	@echo ""
	@echo "=== Build Targets ==="
	@echo "  make all              - Build all discovered tests (default)"
	@echo "  make test_<name>      - Build a specific test (e.g., make test_qsadd8)"
	@echo "  make list             - List all discovered tests and source files"
	@echo ""
	@echo "=== Run Targets ==="
	@echo "  make run TEST=<name>  - Run a specific test (e.g., make run TEST=qsadd8)"
	@echo "  make run-all          - Run all tests"
	@echo ""
	@echo "=== Utility Targets ==="
	@echo "  make clean            - Remove all build artifacts"
	@echo "  make clean-objs       - Remove only object files"
	@echo "  make info             - Show this information"
	@echo ""
	@echo "=== Per-Test Component Targets ==="
	@echo "  make <test>_verifier  - Build verifier component only"
	@echo "  make <test>_neon      - Build NEON component only"
	@echo "  make <test>_riscv     - Build RISC-V component only"

help: info

# Phony targets
.PHONY: all tests run run-all clean clean-objs info list help
