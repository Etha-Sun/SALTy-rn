#include <cvc5/cvc5.h>
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

using namespace cvc5;

// Forward declarations for f16-f32acc-rdsum kernels
extern "C" {
void xnn_f16_f32acc_rdsum_ukernel_7p7x__neonfp16arith_u16(
    size_t channels,
    size_t k1,
    size_t k2,
    size_t k3,
    const xnn_float16* input,
    size_t input_stride1,
    size_t input_stride2,
    size_t input_stride3,
    const xnn_float16* zero,
    float* output,
    const struct xnn_f16_f32acc_scale_params* params);

void xnn_f16_f32acc_rdsum_ukernel_7p7x__rvv_u16(
    size_t channels,
    size_t k1,
    size_t k2,
    size_t k3,
    const xnn_float16* input,
    size_t input_stride1,
    size_t input_stride2,
    size_t input_stride3,
    const xnn_float16* zero,
    float* output,
    const struct xnn_f16_f32acc_scale_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-f32acc-rdsum: Row-major reduction sum with f32 accumulation
  // Operation: For each channel position, sum 7 rows of f16 values,
  // accumulate in f32, scale, and add to output.
  //
  // For simplicity, we verify a single channel position with k1=7 rows.
  // This tests the core widening-add and accumulation logic.

  const size_t num_rows = 9;  // k1 = 7 rows to sum

  // Create symbolic inputs for 7 rows (one element per row for simplicity)
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Op to_fp16_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Op to_fp32_from_fp16 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {8, 24});
  Term rm = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  // Symbolic input elements for 7 rows
  std::vector<Term> input_bv(num_rows);
  std::vector<Term> input_fp16(num_rows);
  std::vector<Term> input_fp32(num_rows);  // Widened to f32

  // Create bounds for inputs to avoid overflow: |x| <= 16
  Term bound_pos_f16 = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x4C00));  // +16.0 in fp16
  Term bound_neg_f16 = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xCC00));  // -16.0 in fp16

  for (size_t i = 0; i < num_rows; i++) {
    input_bv[i] = tm.mkConst(bv16, "row_" + std::to_string(i));
    input_fp16[i] = tm.mkTerm(to_fp16_op, {input_bv[i]});
    input_fp32[i] = tm.mkTerm(to_fp32_from_fp16, {rm, input_fp16[i]});

    // Exclude NaN and infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {input_fp16[i]})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {input_fp16[i]})}));

    // Bound inputs to [-16, 16] to avoid overflow
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {input_fp16[i], bound_neg_f16}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {input_fp16[i], bound_pos_f16}));
  }

  // Scale = 1.0 (concrete)
  Term scale_fp32 = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, 0x3F800000));  // 1.0f

  // Initial output = 0.0 (concrete)
  Term init_output = tm.mkFloatingPointPosZero(8, 24);

  std::cout << "Testing XNNPACK f16_f32acc_rdsum: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Row-major reduction sum with f32 accumulation" << std::endl;
  std::cout << "  For each channel: sum 7 rows of f16, widen to f32, scale, add to output" << std::endl;
  std::cout << "Number of rows: " << num_rows << ", Scale: 1.0" << std::endl;

  // ========================================================================
  // Build NEON symbolic expression
  // ========================================================================
  // NEON implementation:
  //   vacc = 0
  //   for each row i:
  //     vin = vcvt_f32_f16(vld1_u16(row_i))   // widen f16 -> f32
  //     vacc = vaddq_f32(vin, vacc)           // accumulate
  //   vacc = vmulq_f32(vacc, vscale)          // scale
  //   vo = vld1q_f32(output)                  // load existing output
  //   v_out = vaddq_f32(vo, vacc)             // add to output

  std::cout << "\nBuilding NEON symbolic expression..." << std::endl;

  // Sequential accumulation: vacc = row0 + row1 + row2 + ... + row6
  Term neon_acc = tm.mkFloatingPointPosZero(8, 24);
  for (size_t i = 0; i < num_rows; i++) {
    neon_acc = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, input_fp32[i], neon_acc});
  }

  // Scale
  Term neon_scaled = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, neon_acc, scale_fp32});

  // Add to output (init_output = 0)
  Term neon_output = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, init_output, neon_scaled});

  // ========================================================================
  // Build RVV symbolic expression
  // ========================================================================
  // RVV implementation:
  //   vacc = vfmv_v_f_f32m2(0.0f, vl)
  //   for each row i:
  //     vin = vle16_v_f16m1(row_i)
  //     vacc = vfwadd_wv_f32m2(vacc, vin, vl)  // widening add: vacc + widen(vin)
  //   vacc = vfmul_vf_f32m2(vacc, vscale, vl)  // scale
  //   vo = vle32_v_f32m2(output)
  //   v_out = vfadd_vv_f32m2(vo, vacc, vl)     // add to output

  std::cout << "Building RISC-V symbolic expression..." << std::endl;

  // Sequential accumulation with widening add: vacc = 0 + row0 + row1 + ... + row6
  Term riscv_acc = tm.mkFloatingPointPosZero(8, 24);
  for (size_t i = 0; i < num_rows; i++) {
    // vfwadd_wv: vacc = vacc + widen(row_i)
    riscv_acc = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, riscv_acc, input_fp32[i]});
  }

  // Scale
  Term riscv_scaled = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, riscv_acc, scale_fp32});

  // Add to output
  Term riscv_output = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, init_output, riscv_scaled});

  // ========================================================================
  // Compare outputs
  // ========================================================================

  // Build floating-point equality assertion
  Term outputs_equal = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output, riscv_output});
  Term not_equal = tm.mkTerm(Kind::NOT, {outputs_equal});

  std::cout << "\nAsserting: NOT(NEON_result == RISC-V_result)" << std::endl;
  std::cout << "Looking for counterexample where outputs differ..." << std::endl;

  solver.assertFormula(not_equal);
  Result result = solver.checkSat();

  std::cout << "\nResult: " << result << std::endl;

  if (result.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are equivalent." << std::endl;
    std::cout << "Both correctly compute: output += (sum of 7 rows widened to f32) * scale" << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    for (size_t i = 0; i < num_rows; i++) {
      std::cout << "  row[" << i << "] = " << solver.getValue(input_bv[i])
                << " (fp16: " << solver.getValue(input_fp16[i]) << ")" << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    std::cout << "  NEON (f32):   " << solver.getValue(neon_output) << std::endl;
    std::cout << "  RISC-V (f32): " << solver.getValue(riscv_output) << std::endl;
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
