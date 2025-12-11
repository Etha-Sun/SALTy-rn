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
void xnn_f32_f16_vcvt_ukernel__neon_u16(
    size_t batch,
    const float* input,
    xnn_float16* output,
    const void* params);

void xnn_f32_f16_vcvt_ukernel__rvv_u16(
    size_t batch,
    const float* input,
    xnn_float16* output,
    const void* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  // Enable experimental FP solver for float16 support
  solver.setOption("fp-exp", "true");

  // Use 16 floats to match the u16 kernel variant
  const size_t batch = 57;

  // Allocate arrays
  std::vector<float> input(batch, 0.0f);
  std::vector<xnn_float16> output_neon(batch);
  std::vector<xnn_float16> output_riscv(batch);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic float32 inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(batch);
  for (size_t i = 0; i < batch; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Populate NEON memory with symbolic float32 values
  for (size_t i = 0; i < batch; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < batch) {
        lanes[j] = symbolic_input[i + j];
      } else {
        lanes[j] = tm.mkFloatingPointPosZero(8, 24);
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory with symbolic float32 values (vfloat32m2_t for LMUL=2)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data());
    g_riscv_memory_f32m2[addr].push_back(vfloat32m2_t(g_symbolic_tm, symbolic_input));
  }

  std::cout << "Testing XNNPACK f32_f16_vcvt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_f16_vcvt_ukernel__neon_u16(
      batch * sizeof(float),
      input.data(),
      output_neon.data(),
      nullptr);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_f16_vcvt_ukernel__rvv_u16(
      batch * sizeof(float),
      input.data(),
      output_riscv.data(),
      nullptr);

  // Collect NEON results (stored as uint16x8 or uint16x4)
  // The NEON implementation stores results as uint16 vectors
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU16(
      reinterpret_cast<uint16_t*>(output_neon.data()), batch);

  // Collect RISC-V results (stored as vfloat16m1_t)
  // Pass batch size to handle multiple loop iterations storing at different addresses
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsF16m1(output_riscv.data(), batch);

  std::cout << "\nNEON collected " << neon_elements.size() << " elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

  if (neon_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  // Compare outputs
  // NEON stores as bitvectors (uint16), RISC-V stores as FP16
  // We need to convert for comparison
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  // Build equality assertions
  // NEON results are bitvector (IEEE representation), RISC-V are FP16
  // Convert NEON bitvector to FP16 for comparison
  std::vector<Term> all_equalities;
  Op to_fp16_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  for (size_t i = 0; i < compare_count; i++) {
    Term neon_bv = neon_elements[i];  // Already bitvector (16-bit)

    // Convert NEON bitvector to FP16
    Term neon_fp16 = tm.mkTerm(to_fp16_op, {neon_bv});
    Term riscv_fp16 = riscv_elements[i];

    // Compare using FP equality (handles -0 == +0) with NaN check
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_fp16, riscv_fp16});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_fp16});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_fp16});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});
    Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan});
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
    std::cout << "The NEON and RISC-V implementations are equivalent for f32->f16 conversion." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    for (size_t i = 0; i < std::min(batch, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison (NEON as BV16, RISC-V as FP16):" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
      Term neon_fp16 = tm.mkTerm(to_fp16_op, {neon_elements[i]});
      std::cout << "  NEON[" << i << "] = " << solver.getValue(neon_fp16)
                << ", RISC-V[" << i << "] = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
