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
void xnn_x24_transposec_ukernel__2x2_neon_tbl64(
    const void* input,
    void* output,
    size_t input_stride,
    size_t output_stride,
    size_t block_width,
    size_t block_height);

void xnn_x24_transposec_ukernel__2x2_rvv(
    const void* input,
    void* output,
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

  // Transposec parameters
  // x24 means 24-bit (3 bytes) per element
  // 2x2 tile means we process 2 elements in each dimension at a time
  const size_t block_width = 4;   // Number of columns (in 3-byte elements)
  const size_t block_height = 15;  // Number of rows (in 3-byte elements)
  const size_t bytes_per_element = 3;

  // Input stride: number of bytes per row of input
  // Must be >= block_width * 3
  const size_t input_stride = block_width * bytes_per_element;

  // Output stride: number of bytes per row of output (transposed)
  // Must be >= block_height * 3
  const size_t output_stride = block_height * bytes_per_element;

  // Calculate sizes
  // Input: block_height rows, each row has input_stride bytes
  const size_t input_size = block_height * input_stride;
  // Output: block_width rows (after transpose), each row has output_stride bytes
  const size_t output_size = block_width * output_stride;

  // Allocate arrays
  std::vector<uint8_t> input(input_size, 0);
  std::vector<uint8_t> output_neon(output_size, 0);
  std::vector<uint8_t> output_riscv(output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (8-bit)
  std::vector<Term> symbolic_input = createSymbolicArray(tm, input_size, "in", 8);

  // Populate NEON memory (unsigned 8-bit)
  SymbolicNEONHelpers::populateMemoryU8(input.data(), symbolic_input);

  // Populate RISC-V memory (unsigned 8-bit)
  SymbolicRISCVHelpers::populateMemoryU8(input.data(), symbolic_input);

  std::cout << "Testing XNNPACK x24_transposec: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  block_width: " << block_width << std::endl;
  std::cout << "  block_height: " << block_height << std::endl;
  std::cout << "  input_stride: " << input_stride << std::endl;
  std::cout << "  output_stride: " << output_stride << std::endl;
  std::cout << "  input_size: " << input_size << " bytes" << std::endl;
  std::cout << "  output_size: " << output_size << " bytes" << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x24_transposec_ukernel__2x2_neon_tbl64(
      input.data(), output_neon.data(),
      input_stride, output_stride,
      block_width, block_height);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x24_transposec_ukernel__2x2_rvv(
      input.data(), output_riscv.data(),
      input_stride, output_stride,
      block_width, block_height);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU8(output_neon.data(), output_size);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU8(output_riscv.data(), output_size);

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

    std::cout << "\nInput bytes:" << std::endl;
    for (size_t i = 0; i < std::min(input_size, (size_t)16); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)16); i++) {
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
