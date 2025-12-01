#include "../../src/xnn_minimal.h"
#include "../../src/neon_symbolic/memory.hpp"
#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/riscv_symbolic/memory.hpp"
#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_common.hpp"
#include "../src/symbolic_helpers.hpp"
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_qs8_rdsum_ukernel_7p7x__neon_u16(
    size_t rows, size_t channels, const int8_t* input, size_t input_stride,
    const int8_t* zero, int32_t* output, const struct xnn_qs8_rsum_params* params);

void xnn_qs8_rdsum_ukernel_7p7x__rvv_u1v(
    size_t rows, size_t channels, const int8_t* input, size_t input_stride,
    const int8_t* zero, int32_t* output, const struct xnn_qs8_rsum_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters
  const size_t rows = 3;  
  const size_t channels = 12;
  const size_t input_stride = channels;

  // Allocate arrays
  int8_t input[rows * channels] = {0};
  int8_t zero[channels] = {0};
  int32_t output_neon[channels];
  int32_t output_riscv[channels];
  
  // Initialize outputs to zero  
  for (size_t i = 0; i < channels; i++) {
    output_neon[i] = 0;
    output_riscv[i] = 0;
  }

  // Clear memory maps before each run
  g_neon_memory.clear();
  g_neon_memory_i8x16.clear();
  g_neon_memory_i8x8.clear();
  g_riscv_memory.clear();
  g_riscv_memory_i8.clear();
  g_riscv_memory_i32m4.clear();

  // Setup symbolic inputs
  std::vector<Term> symbolic_input = createSymbolicArray(tm, rows * channels, "input", 8);
  
  // Initialize zero array as concrete zeros (not symbolic)
  std::vector<Term> symbolic_zero(channels);
  for (size_t i = 0; i < channels; i++) {
    symbolic_zero[i] = tm.mkBitVector(8, 0);
  }

  // Populate NEON memory
  SymbolicNEONHelpers::populateMemory8(input, symbolic_input);
  SymbolicNEONHelpers::populateMemory8(zero, symbolic_zero);
  
  // Initialize output memory for NEON (all zeros)
  std::vector<Term> zero_output_terms(channels);
  for (size_t i = 0; i < channels; i++) {
    zero_output_terms[i] = tm.mkBitVector(32, 0);
  }
  SymbolicNEONHelpers::populateMemory32(output_neon, zero_output_terms);

  // Populate RISC-V memory
  SymbolicRISCVHelpers::populateMemory8(input, symbolic_input);
  SymbolicRISCVHelpers::populateMemory8(zero, symbolic_zero);
  
  // Initialize output memory for RISC-V (all zeros)  
  SymbolicRISCVHelpers::populateMemory32(output_riscv, zero_output_terms);

  // Setup params struct (empty for rdsum)
  struct xnn_qs8_rsum_params params;

  std::cout << "Testing XNNPACK NEON vs RISC-V row-wise reduction sum equivalence" << std::endl;
  std::cout << "Rows: " << rows << ", Channels: " << channels << std::endl;

  // Run NEON implementation
  std::cout << "Running NEON implementation..." << std::endl;
  xnn_qs8_rdsum_ukernel_7p7x__neon_u16(rows, channels, input, input_stride, zero, output_neon, &params);
  std::cout << "NEON complete!" << std::endl;

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_rdsum_ukernel_7p7x__rvv_u1v(rows, channels, input, input_stride, zero, output_riscv, &params);
  std::cout << "RISC-V complete!" << std::endl;

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults32(output_neon, channels);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults32(output_riscv);

  std::cout << "NEON collected " << neon_elements.size() << " elements" << std::endl;
  
  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "ERROR: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    return 1;
  }

  // Create equivalence assertions
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < neon_elements.size(); i++) {
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
    std::cout << "✓ UNSAT: No counterexample found!" << std::endl;
    std::cout << "✓ NEON and RISC-V implementations are EQUIVALENT!" << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "✗ SAT: Found a counterexample where outputs differ!" << std::endl;
    
    std::cout << "\nCounterexample inputs:" << std::endl;
    for (size_t i = 0; i < std::min(size_t(8), symbolic_input.size()); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }
    if (symbolic_input.size() > 8) {
      std::cout << "  ... (" << symbolic_input.size() << " total)" << std::endl;
    }
    
    std::cout << "\nOutput values:" << std::endl;
    if (!neon_elements.empty() && !riscv_elements.empty()) {
      for (size_t i = 0; i < std::min(neon_elements.size(), size_t(12)); i++) {
        std::cout << "  [" << i << "] NEON: " << solver.getValue(neon_elements[i]) 
                  << " RISC-V: " << solver.getValue(riscv_elements[i]) << std::endl;
      }
    }
    
    return 1;
  } else {
    std::cout << "? UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}

