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
void xnn_qs8_vaddc_minmax_ukernel__neon_ld128_u16(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params);

void xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters
  const size_t batch = 67;  // Use prime number to test edge cases

  // Allocate arrays
  int8_t input_a[batch] = {0};
  int8_t input_b[batch] = {0};
  int8_t output_neon[batch] = {0};
  int8_t output_riscv[batch] = {0};

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs using the common helper
  std::vector<Term> symbolic_a = createSymbolicArray(tm, batch, "a", 8);
  std::vector<Term> symbolic_b = createSymbolicArray(tm, batch, "b", 8);

  // Populate NEON memory
  SymbolicNEONHelpers::populateMemory8(input_a, symbolic_a);
  SymbolicNEONHelpers::populateMemory8(input_b, symbolic_b);

  // Populate RISC-V memory
  SymbolicRISCVHelpers::populateMemory8(input_a, symbolic_a);
  SymbolicRISCVHelpers::populateMemory8(input_b, symbolic_b);


  // Setup params struct with concrete test values
  struct xnn_qs8_add_minmax_params params;
  params.scalar.a_zero_point = -7;
  params.scalar.b_zero_point = -1;
  params.scalar.bias = 7559896;
  params.scalar.a_multiplier = 811801;
  params.scalar.b_multiplier = 1353001;
  params.scalar.shift = 20;
  params.scalar.output_zero_point = 5;
  params.scalar.output_min = -128;
  params.scalar.output_max = 127;

  std::cout << "Testing XNNPACK qs8vaddc: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "Running NEON implementation..." << std::endl;
  xnn_qs8_vaddc_minmax_ukernel__neon_ld128_u16(batch * sizeof(int8_t), input_a,
                        input_b, output_neon, &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(batch * sizeof(int8_t), input_a,
                      input_b, output_riscv, &params);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(output_neon, batch);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(output_riscv);

  std::cout << "NEON collected " << neon_elements.size() << " elements" << std::endl;

  if (neon_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

  // Compare minimum number of elements from both
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  // Build equality assertions
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
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
    }
    
    for (size_t i = 0; i < std::min(batch, (size_t)4); i++) {
      std::cout << "  b[" << i << "] = " << solver.getValue(symbolic_b[i]) << std::endl;
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
