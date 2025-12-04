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
void xnn_qs8_vaddc_minmax_ukernel__neon_ld128_u16(
    size_t batch, const int8_t *input_a, const int8_t *input_b, int8_t *output,
    const struct xnn_qs8_add_minmax_params *params);

void xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(
    size_t batch, const int8_t *input_a, const int8_t *input_b, int8_t *output,
    const struct xnn_qs8_add_minmax_params *params);
}

// Helper to populate RISC-V memory with int8 symbolic inputs
int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters
  const size_t batch = 67;

  // Allocate arrays - both using int8_t now
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

  // Populate NEON memory (signed 8-bit)
  SymbolicNEONHelpers::populateMemory8(input_a, symbolic_a);
  SymbolicNEONHelpers::populateMemory8(input_b, symbolic_b);

  // Populate RISC-V memory (signed 8-bit)
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

  std::cout << "Testing XNNPACK NEON (qs8) vs RISC-V (qs8) equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;

  g_current_params_ptr = nullptr;

  xnn_qs8_vaddc_minmax_ukernel__neon_ld128_u16(batch * sizeof(int8_t), input_a,
                                              input_b, output_neon, &params);

  xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(batch * sizeof(int8_t), input_a, input_b,
                                       output_riscv, &params);

  // Collect results from both architectures using helper functions
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(output_neon, batch);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(output_riscv);

  std::cout << "NEON collected " << neon_elements.size() << " elements" << std::endl;
  
  
  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "RISC-V collected " << riscv_elements.size() << " elements"
            << std::endl;

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "ERROR: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    return 1;
  }

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
  std::cout << "Looking for counterexample where outputs differ..."
            << std::endl;

  solver.assertFormula(not_equal);
  Result result = solver.checkSat();

  std::cout << "\nResult: " << result << std::endl;

  if (result.isUnsat()) {
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "SAT: Found a counterexample!" << std::endl;
    if (!symbolic_a.empty()) {
      std::cout << "a_0 = " << solver.getValue(symbolic_a[0]) << std::endl;
    }
    if (!symbolic_b.empty()) {
      std::cout << "b_0 = " << solver.getValue(symbolic_b[0]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "UNKNOWN: Solver could not determine" << std::endl;
    return 2;
  }
}

