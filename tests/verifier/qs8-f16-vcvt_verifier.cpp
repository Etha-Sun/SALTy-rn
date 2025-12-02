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
void xnn_qs8_f16_vcvt_ukernel__neonfp16arith_u24(
    size_t batch,
    const int8_t* input,
    xnn_float16* output,
    const struct xnn_qs8_f16_cvt_params* params);

void xnn_qs8_f16_vcvt_ukernel__rvv(
    size_t batch,
    const int8_t* input,
    xnn_float16* output,
    const struct xnn_qs8_f16_cvt_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  // Enable experimental FP support for Float16 (5/11) - required for half-precision
  solver.setOption("fp-exp", "true");

  const size_t batch = 39;

  // Allocate arrays
  int8_t input[batch] = {0};
  xnn_float16 output_neon[batch] = {};
  xnn_float16 output_riscv[batch] = {};

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs using the common helper
  std::vector<Term> symbolic_input = createSymbolicArray(tm, batch, "in", 8);

  // Populate NEON memory (signed 8-bit)
  SymbolicNEONHelpers::populateMemory8(input, symbolic_input);

  // Populate RISC-V memory (signed 8-bit)
  SymbolicRISCVHelpers::populateMemory8(input, symbolic_input);

  // Setup params struct with concrete test values
  struct xnn_qs8_f16_cvt_params params;
  params.scalar.zero_point = 0;
  params.scalar.scale = xnn_float16_from_float(1.0f);

  std::cout << "Testing XNNPACK qs8_f16_vcvt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  zero_point: " << (int)params.scalar.zero_point << std::endl;
  std::cout << "  scale: " << xnn_float16_to_float(params.scalar.scale) << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qs8_f16_vcvt_ukernel__neonfp16arith_u24(batch * sizeof(int8_t), input,
                                               output_neon, &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_f16_vcvt_ukernel__rvv(batch * sizeof(int8_t), input,
                                 output_riscv, &params);

  // Collect results from both architectures
  // NEON stores as uint16 (reinterpreted from float16)
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU16(
      reinterpret_cast<uint16_t*>(output_neon), batch);

  // RISC-V stores as vfloat16m2_t
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsF16(output_riscv);

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

  // NEON results are bitvector16 (uint16 reinterpret), RISC-V results are float16
  // We need to convert NEON bitvector16 to float16 for comparison
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    // Convert NEON bitvector16 to float16
    Op toFpOp = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term neon_fp16 = tm.mkTerm(toFpOp, {neon_elements[i]});

    Term eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_fp16, riscv_elements[i]});
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
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
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
