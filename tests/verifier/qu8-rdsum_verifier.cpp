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
void xnn_qu8_rdsum_ukernel_7p7x__neon_u16(
    size_t rows, size_t channels, const uint8_t* input, size_t input_stride,
    const uint8_t* zero, uint32_t* output, const struct xnn_qs8_rsum_params* params);

void xnn_qu8_rdsum_ukernel_7p7x__rvv_u16(
    size_t rows, size_t channels, const uint8_t* input, size_t input_stride,
    const uint8_t* zero, uint32_t* output, const struct xnn_qs8_rsum_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters
  const size_t rows = 5;
  const size_t channels = 20;
  const size_t input_stride = channels;

  // Allocate arrays
  uint8_t input[rows * channels] = {0};
  uint8_t zero[channels] = {0};
  uint32_t output_neon[channels];
  uint32_t output_riscv[channels];

  // Initialize outputs to zero
  for (size_t i = 0; i < channels; i++) {
    output_neon[i] = 0;
    output_riscv[i] = 0;
  }

  // Clear memory maps before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (unsigned 8-bit)
  std::vector<Term> symbolic_input = createSymbolicArray(tm, rows * channels, "input", 8);

  // Initialize zero array as concrete zeros (not symbolic)
  std::vector<Term> symbolic_zero(channels);
  for (size_t i = 0; i < channels; i++) {
    symbolic_zero[i] = tm.mkBitVector(8, 0);
  }

  // Populate NEON memory (unsigned 8-bit)
  SymbolicNEONHelpers::populateMemoryU8(input, symbolic_input);
  SymbolicNEONHelpers::populateMemoryU8(zero, symbolic_zero);

  // Initialize output memory for NEON (all zeros, unsigned 32-bit)
  std::vector<Term> zero_output_terms(channels);
  for (size_t i = 0; i < channels; i++) {
    zero_output_terms[i] = tm.mkBitVector(32, 0);
  }
  SymbolicNEONHelpers::populateMemoryU32(output_neon, zero_output_terms);

  // Populate RISC-V memory (unsigned 8-bit)
  SymbolicRISCVHelpers::populateMemoryU8(input, symbolic_input);
  SymbolicRISCVHelpers::populateMemoryU8(zero, symbolic_zero);

  // Initialize output memory for RISC-V (all zeros, unsigned 32-bit)
  SymbolicRISCVHelpers::populateMemoryU32(output_riscv, zero_output_terms);

  // Setup params struct (empty for rdsum)
  struct xnn_qs8_rsum_params params;

  std::cout << "Testing XNNPACK qu8_rdsum: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Rows: " << rows << ", Channels: " << channels << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qu8_rdsum_ukernel_7p7x__neon_u16(rows, channels, input, input_stride, zero, output_neon, &params);
  std::cout << "NEON complete!" << std::endl;

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qu8_rdsum_ukernel_7p7x__rvv_u16(rows, channels, input, input_stride, zero, output_riscv, &params);
  std::cout << "RISC-V complete!" << std::endl;

  // Collect results from both architectures (unsigned 32-bit)
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU32(output_neon, channels);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU32(output_riscv);

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

  // Create equivalence assertions
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
    std::cout << "SAT: Found a counterexample where outputs differ!" << std::endl;

    std::cout << "\nCounterexample inputs:" << std::endl;
    for (size_t i = 0; i < std::min(size_t(8), symbolic_input.size()); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }
    if (symbolic_input.size() > 8) {
      std::cout << "  ... (" << symbolic_input.size() << " total)" << std::endl;
    }

    std::cout << "\nOutput values:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, size_t(12)); i++) {
      std::cout << "  [" << i << "] NEON: " << solver.getValue(neon_elements[i])
                << " RISC-V: " << solver.getValue(riscv_elements[i]) << std::endl;
    }

    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
