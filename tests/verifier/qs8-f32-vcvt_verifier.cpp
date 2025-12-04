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
void xnn_qs8_f32_vcvt_ukernel__neon_u16(
    size_t batch, const int8_t *input, float *output,
    const struct xnn_qs8_f32_cvt_params *params);

void xnn_qs8_f32_vcvt_ukernel__rvv(
    size_t batch, const int8_t *input, float *output,
    const struct xnn_qs8_f32_cvt_params *params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters - using 17 to test both main loop (16) and remainder
  const size_t batch = 39;

  // Allocate arrays
  int8_t input[batch] = {0};
  float output_neon[batch] = {0};
  float output_riscv[batch] = {0};

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs using the common helper
  std::vector<Term> symbolic_input = createSymbolicArray(tm, batch, "x", 8);

  // Populate NEON memory (signed 8-bit)
  SymbolicNEONHelpers::populateMemory8(input, symbolic_input);

  // Populate RISC-V memory (signed 8-bit)
  SymbolicRISCVHelpers::populateMemory8(input, symbolic_input);

  // Setup params struct with concrete test values
  // Based on XNNPACK: uses zero_point and scale for quantization
  struct xnn_qs8_f32_cvt_params params;
  params.scalar.zero_point = 0;
  params.scalar.scale = 1.0f;

  std::cout << "Testing XNNPACK qs8_f32_vcvt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  zero_point: " << params.scalar.zero_point << std::endl;
  std::cout << "  scale: " << params.scalar.scale << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qs8_f32_vcvt_ukernel__neon_u16(batch * sizeof(int8_t), input,
                                      output_neon, &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_f32_vcvt_ukernel__rvv(batch * sizeof(int8_t), input,
                                 output_riscv, &params);

  // Collect results from both architectures using helper functions
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon, batch);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsF32(output_riscv);

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

    for (size_t i = 0; i < std::min(batch, (size_t)4); i++) {
      std::cout << "  x[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)4); i++) {
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
