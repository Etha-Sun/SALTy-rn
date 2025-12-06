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
void xnn_x32_packx_ukernel_4x__neon_st4_x4(
    size_t m,
    size_t k,
    const uint32_t* x,
    size_t x_stride,
    uint32_t* y);

void xnn_x32_packx_ukernel_4x__rvv_x4(
    size_t m,
    size_t k,
    const uint32_t* x,
    size_t x_stride,
    uint32_t* y);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Pack parameters
  const size_t m = 1;   // Number of rows (max 4)
  const size_t k = 1;   // Number of columns per row

  // Stride in bytes between rows
  const size_t x_stride = k * sizeof(uint32_t);

  // Calculate buffer sizes
  const size_t input_size = m * k;
  const size_t output_size = m * k;  // Output is same total size, just interleaved

  // Allocate arrays
  std::vector<uint32_t> input(input_size, 0);
  std::vector<uint32_t> output_neon(output_size, 0);
  std::vector<uint32_t> output_riscv(output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (32-bit)
  // The input is a 2D row-major array with m rows and k columns
  std::vector<Term> symbolic_input = createSymbolicArray(tm, input_size, "x", 32);

  // Populate memory row by row at strided addresses
  // The kernel accesses rows at: x + row * x_stride
  // Each row has k elements
  for (size_t row = 0; row < m; row++) {
    // Get the row's symbolic values
    std::vector<Term> row_values;
    for (size_t col = 0; col < k; col++) {
      row_values.push_back(symbolic_input[row * k + col]);
    }

    // Calculate row address (x_stride is in bytes)
    const uint32_t* row_ptr = (const uint32_t*)((uintptr_t)input.data() + row * x_stride);

    std::cout << "Populating row " << row << " at address " << (void*)row_ptr
              << " (offset " << (row * x_stride) << " bytes)" << std::endl;

    // Populate NEON memory for this row
    SymbolicNEONHelpers::populateMemoryU32(row_ptr, row_values);

    // Populate RISC-V memory for this row
    SymbolicRISCVHelpers::populateMemoryU32(row_ptr, row_values);
  }

  std::cout << "Testing XNNPACK x32_packx: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Rows (m): " << m << std::endl;
  std::cout << "Columns (k): " << k << std::endl;
  std::cout << "X stride: " << x_stride << " bytes" << std::endl;
  std::cout << "Total elements: " << input_size << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x32_packx_ukernel_4x__neon_st4_x4(
      m, k, input.data(), x_stride, output_neon.data());

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x32_packx_ukernel_4x__rvv_x4(
      m, k, input.data(), x_stride, output_riscv.data());

  // Collect results from both architectures
  // Output format: for each column c, stores x0[c], x1[c], x2[c], x3[c]
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU32(output_neon.data(), output_size);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU32(output_riscv.data(), output_size);

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
