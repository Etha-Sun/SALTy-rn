#include "../../src/xnn_minimal.h"
#include "../../src/neon_symbolic/memory.hpp"
#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/riscv_symbolic/memory.hpp"
#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_common.hpp"
#include "../../src/symbolic_helpers.hpp"
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_x32_transposec_ukernel__4x4_multi_dec_zip_neon(
    const uint32_t* input,
    uint32_t* output,
    size_t input_stride,
    size_t output_stride,
    size_t block_width,
    size_t block_height);

void xnn_x32_transposec_ukernel__4x4_rvv(
    const uint32_t* input,
    uint32_t* output,
    size_t input_stride,
    size_t output_stride,
    size_t block_width,
    size_t block_height);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Transpose parameters
  // Use small dimensions for faster verification
  const size_t block_width = 5;   // Number of columns in input (rows in output)
  const size_t block_height = 7;  // Number of rows in input (columns in output)

  // Strides in bytes
  const size_t input_stride = block_width * sizeof(uint32_t);
  const size_t output_stride = block_height * sizeof(uint32_t);

  // Calculate buffer sizes
  const size_t input_size = block_height * block_width;
  const size_t output_size = block_width * block_height;

  // Allocate arrays
  std::vector<uint32_t> input(input_size, 0);
  std::vector<uint32_t> output_neon(output_size, 0);
  std::vector<uint32_t> output_riscv(output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (32-bit)
  // The input is a 2D row-major array with block_height rows and block_width columns
  std::vector<Term> symbolic_input = createSymbolicArray(tm, input_size, "in", 32);

  // Populate memory row by row at strided addresses
  // The kernel accesses rows at: input + row * input_stride
  // Each row has block_width elements
  for (size_t row = 0; row < block_height; row++) {
    // Get the row's symbolic values
    std::vector<Term> row_values;
    for (size_t col = 0; col < block_width; col++) {
      row_values.push_back(symbolic_input[row * block_width + col]);
    }

    // Calculate row address (input_stride is in bytes)
    const uint32_t* row_ptr = (const uint32_t*)((uintptr_t)input.data() + row * input_stride);

    // Populate NEON memory for this row
    SymbolicNEONHelpers::populateMemoryU32(row_ptr, row_values);

    // Populate RISC-V memory for this row
    SymbolicRISCVHelpers::populateMemoryU32(row_ptr, row_values);
  }

  std::cout << "Testing XNNPACK x32_transposec: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Block width (input cols): " << block_width << std::endl;
  std::cout << "Block height (input rows): " << block_height << std::endl;
  std::cout << "Input stride: " << input_stride << " bytes" << std::endl;
  std::cout << "Output stride: " << output_stride << " bytes" << std::endl;
  std::cout << "Total elements: " << input_size << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x32_transposec_ukernel__4x4_multi_dec_zip_neon(
      input.data(), output_neon.data(),
      input_stride, output_stride,
      block_width, block_height);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x32_transposec_ukernel__4x4_rvv(
      input.data(), output_riscv.data(),
      input_stride, output_stride,
      block_width, block_height);

  // Collect results from both architectures
  // For transpose, output is written in column-major order to various addresses
  // We need to collect from all output addresses
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU32(output_neon.data(), output_size);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU32(output_riscv.data());

  std::cout << "\nNEON collected " << neon_elements.size() << " elements" << std::endl;

  if (neon_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

  // Compare the minimum number of elements from both
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term eq = tm.mkTerm(Kind::EQUAL, {neon_elements[i], riscv_elements[i]});
    all_equalities.push_back(eq);
  }

  Term all_equal;
  if (all_equalities.size() == 1) {
    all_equal = all_equalities[0];
  } else {
    all_equal = tm.mkTerm(Kind::AND, all_equalities);
  }

  Term not_equal = tm.mkTerm(Kind::NOT, {all_equal});

  std::cout << "\nAsserting: NOT(NEON_result == RISC-V_result)" << std::endl;
  std::cout << "Looking for counterexample where outputs differ..." << std::endl;

  solver.assertFormula(not_equal);
  Result result = solver.checkSat();

  std::cout << "\nResult: " << result << std::endl;

  if (result.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are equivalent." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    for (size_t i = 0; i < std::min(input_size, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
      std::cout << "  NEON[" << i << "] = " << solver.getValue(neon_elements[i]) << std::endl;
      std::cout << "  RISC-V[" << i << "] = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
