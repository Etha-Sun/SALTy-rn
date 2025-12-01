#include "../../src/xnn_minimal.h"
#include "../../src/neon_symbolic/memory.hpp"
#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/riscv_symbolic/memory.hpp"
#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_common.hpp"
#include "../../src/symbolic_helpers.hpp"
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_qs8_rsum_ukernel__neon_u16(
    size_t batch, const int8_t* input, int32_t* output,
    const struct xnn_qs8_rsum_params* params);

void xnn_qs8_rsum_ukernel__rvv_u1v(
    size_t batch, const int8_t* input, int32_t* output,
    const struct xnn_qs8_rsum_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters
  const size_t batch = 3;  // Test with various batch sizes

  // Allocate arrays
  int8_t input[batch] = {0};
  int32_t output_neon = 4;
  int32_t output_riscv = 4;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs
  std::vector<Term> symbolic_input = createSymbolicArray(tm, batch, "input", 8);

  // Populate NEON memory
  SymbolicNEONHelpers::populateMemory8(input, symbolic_input);

  // Populate RISC-V memory
  SymbolicRISCVHelpers::populateMemory8(input, symbolic_input);

  // Setup params struct (empty for rsum)
  struct xnn_qs8_rsum_params params;

  std::cout << "Testing XNNPACK NEON vs RISC-V reduction sum equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;

  // Run NEON implementation
  xnn_qs8_rsum_ukernel__neon_u16(batch, input, &output_neon, &params);

  // Run RISC-V implementation
  xnn_qs8_rsum_ukernel__rvv_u1v(batch, input, &output_riscv, &params);

  // Retrieve the symbolic results from memory tracking
  uintptr_t neon_addr = reinterpret_cast<uintptr_t>(&output_neon);
  uintptr_t riscv_addr = reinterpret_cast<uintptr_t>(&output_riscv);
  
  Term neon_result = g_neon_scalar_memory[neon_addr];
  Term riscv_result = g_riscv_scalar_memory[riscv_addr];

  std::cout << "NEON result captured from output memory" << std::endl;
  std::cout << "RISC-V result captured from output memory" << std::endl;

  // Check if both results are valid
  if (neon_result.isNull()) {
    std::cerr << "ERROR: NEON result is null!" << std::endl;
    return 1;
  }

  if (riscv_result.isNull()) {
    std::cerr << "ERROR: RISC-V result is null!" << std::endl;
    return 1;
  }

  // Create equivalence assertion: NEON_result == RISC-V_result
  Term equivalence = tm.mkTerm(Kind::EQUAL, {neon_result, riscv_result});

  // Assert the negation to find counterexamples
  Term not_equal = tm.mkTerm(Kind::NOT, {equivalence});

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
    
    // Print some input values that cause the difference
    std::cout << "\nCounterexample inputs:" << std::endl;
    for (size_t i = 0; i < std::min(size_t(8), symbolic_input.size()); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }
    if (symbolic_input.size() > 8) {
      std::cout << "  ... (" << symbolic_input.size() << " total)" << std::endl;
    }
    
    std::cout << "\nOutput values:" << std::endl;
    std::cout << "  NEON:   " << solver.getValue(neon_result) << std::endl;
    std::cout << "  RISC-V: " << solver.getValue(riscv_result) << std::endl;
    
    return 1;
  } else {
    std::cout << "? UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}

