#include "../src/xnn_minimal.h"
#include "../src/neon_symbolic/memory.hpp"
#include "../src/neon_symbolic/neon_symbolic.hpp"
#include "../src/riscv_symbolic/memory.hpp"
#include "../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../src/symbolic_common.hpp"
#include "../src/symbolic_helpers.hpp"
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_qs8_vmulc_minmax_fp32_ukernel__neon_ld128_u16(
    size_t batch, const int8_t *input_a, const int8_t *input_b, int8_t *output,
    const union xnn_qs8_mul_minmax_params *params);

void xnn_qs8_vmulc_minmax_fp32_ukernel__rvv(
    size_t batch, const int8_t *input_a, const int8_t *input_b, int8_t *output,
    const union xnn_qs8_mul_minmax_params *params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  const size_t batch = 67;

  // Allocate arrays
  int8_t input_a[batch] = {0};
  int8_t input_b = 0;  // Note: vmulc uses a single scalar value for b
  int8_t output_neon[batch] = {0};
  int8_t output_riscv[batch] = {0};

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs using the common helper
  std::vector<Term> symbolic_a = createSymbolicArray(tm, batch, "a", 8);
  Term symbolic_b = tm.mkConst(tm.mkBitVectorSort(8), "b");  // Single symbolic constant

  // Populate NEON memory (signed 8-bit)
  SymbolicNEONHelpers::populateMemory8(input_a, symbolic_a);
  SymbolicNEONHelpers::populateMemory8(&input_b, {symbolic_b});

  // Populate RISC-V memory (signed 8-bit)
  SymbolicRISCVHelpers::populateMemory8(input_a, symbolic_a);
  SymbolicRISCVHelpers::populateMemory8(&input_b, {symbolic_b});

  // Setup params struct with concrete test values
  // Based on XNNPACK benchmark: uses xnn_init_qs8_mul_minmax_scalar_params
  // with quantization {zero_point=0, scale=1.0f} for all inputs/output
  union xnn_qs8_mul_minmax_params params;
  params.scalar.a_zero_point = 0;
  params.scalar.b_zero_point = 0;
  params.scalar.scale = 1.0f;  // Benchmark uses scale=1.0f (from quantization.scale)
  params.scalar.output_zero_point = 0;
  params.scalar.output_min = -128;
  params.scalar.output_max = 127;

  std::cout << "Testing XNNPACK qs8_vmulc: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;
  std::cout << "Note: vmulc multiplies vector A by constant scalar B" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  a_zero_point: " << (int)params.scalar.a_zero_point << std::endl;
  std::cout << "  b_zero_point: " << (int)params.scalar.b_zero_point << std::endl;
  std::cout << "  scale: " << params.scalar.scale << std::endl;
  std::cout << "  output_zero_point: " << params.scalar.output_zero_point << std::endl;
  std::cout << "  output_min: " << (int)params.scalar.output_min << std::endl;
  std::cout << "  output_max: " << (int)params.scalar.output_max << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qs8_vmulc_minmax_fp32_ukernel__neon_ld128_u16(batch * sizeof(int8_t), input_a,
                                                     &input_b, output_neon, &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_vmulc_minmax_fp32_ukernel__rvv(batch * sizeof(int8_t), input_a, &input_b,
                                         output_riscv, &params);

  // Collect results from both architectures using helper functions
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(output_neon, batch);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(output_riscv);

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

    std::cout << "  b (constant) = " << solver.getValue(symbolic_b) << std::endl;
    for (size_t i = 0; i < std::min(batch, (size_t)4); i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
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
