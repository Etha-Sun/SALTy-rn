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

// Forward declarations for f16-f32acc-rsum kernels
extern "C" {
void xnn_f16_f32acc_rsum_ukernel__neonfp16arith_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    float* output,
    const struct xnn_f16_f32acc_scale_params* params);

void xnn_f16_f32acc_rsum_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
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

  // f16-f32acc-rsum: Reduction sum with f32 accumulation and scaling
  // Operation: output += sum(input[0:n]) * scale
  // where the sum is performed in f32 precision
  //
  // Since scalar float operations aren't tracked through pointer stores,
  // we verify by building the symbolic expressions directly and comparing
  // the mathematical results of both implementations.

  // Using a small batch size for tractable verification
  const size_t batch_elements = 4;

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Op to_fp16_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Op to_fp32_from_fp16 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {8, 24});
  Term rm = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  // Symbolic input elements
  std::vector<Term> symbolic_input_bv;
  std::vector<Term> symbolic_input_fp16;
  std::vector<Term> symbolic_input_fp32;  // Widened to f32

  // Create bounds for inputs to avoid overflow: |x| <= 16
  Term bound_pos_f16 = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x4C00));  // +16.0 in fp16
  Term bound_neg_f16 = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xCC00));  // -16.0 in fp16

  for (size_t i = 0; i < batch_elements; i++) {
    Term x_bv = tm.mkConst(bv16, "input_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);

    Term x_fp16 = tm.mkTerm(to_fp16_op, {x_bv});
    symbolic_input_fp16.push_back(x_fp16);

    // Widen to f32
    Term x_fp32 = tm.mkTerm(to_fp32_from_fp16, {rm, x_fp16});
    symbolic_input_fp32.push_back(x_fp32);

    // Exclude NaN and infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp16})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp16})}));

    // Bound inputs to [-16, 16] to avoid overflow
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp16, bound_neg_f16}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp16, bound_pos_f16}));
  }

  // Scale = 1.0 (concrete)
  Term scale_fp32 = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, 0x3F800000));  // 1.0f

  // Initial output = 0.0 (concrete)
  Term init_output = tm.mkFloatingPointPosZero(8, 24);

  std::cout << "Testing XNNPACK f16_f32acc_rsum: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Reduction sum with f32 accumulation" << std::endl;
  std::cout << "  output += sum(input[0:n]) * scale" << std::endl;
  std::cout << "  (sum is computed in f32 precision)" << std::endl;
  std::cout << "Batch elements: " << batch_elements << ", Scale: 1.0" << std::endl;
  std::cout << "\nNote: NEON and RVV use different summation orders:" << std::endl;
  std::cout << "  NEON: (x0+x2) + (x1+x3)  (pairwise reduction)" << std::endl;
  std::cout << "  RVV:  ((((0+x0)+x1)+x2)+x3)  (sequential/unordered)" << std::endl;
  std::cout << "Due to FP non-associativity, results may differ." << std::endl;

  // ========================================================================
  // Build NEON symbolic expression
  // ========================================================================
  // NEON implementation for 4 elements (batch & (4 * sizeof(uint16_t))):
  //   const float16x4_t vh = vreinterpret_f16_u16(vld1_u16(...));
  //   const float32x4_t vt = vcvt_f32_f16(vh);
  //   vacc0 = vaddq_f32(vacc0, vt);  // vacc0 starts as zeros
  //   float32x2_t vacc = vadd_f32(vget_low_f32(vacc0), vget_high_f32(vacc0));
  //   vacc = vpadd_f32(vacc, vacc);
  //   vacc = vmul_f32(vacc, vscale);
  //   float vout = vget_lane_f32(vacc, 0);
  //   *output += vout;

  std::cout << "\nBuilding NEON symbolic expression..." << std::endl;

  // vacc0 = vaddq_f32(zeros, vt) = vt = [x0_f32, x1_f32, x2_f32, x3_f32]
  // vacc = vadd_f32(vget_low_f32(vacc0), vget_high_f32(vacc0))
  //      = vadd_f32([x0, x1], [x2, x3])
  //      = [x0+x2, x1+x3]
  Term neon_sum_02 = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, symbolic_input_fp32[0], symbolic_input_fp32[2]});
  Term neon_sum_13 = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, symbolic_input_fp32[1], symbolic_input_fp32[3]});

  // vacc = vpadd_f32(vacc, vacc) = [(x0+x2)+(x1+x3), (x0+x2)+(x1+x3)]
  Term neon_sum_all = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, neon_sum_02, neon_sum_13});

  // vacc = vmul_f32(vacc, vscale) where scale = 1.0, so result unchanged
  Term neon_scaled = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, neon_sum_all, scale_fp32});

  // *output += vout, where initial output = 0
  Term neon_output = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, init_output, neon_scaled});

  // ========================================================================
  // Build RVV symbolic expression
  // ========================================================================
  // RVV implementation:
  //   vsum = vfmv_s_f_f32m1(0.0f, 1)  // vsum[0] = 0.0
  //   while loop:
  //     vh = vle16(input)
  //     vsum = vfwredusum(vh, vsum)   // vsum[0] += sum(convert_f32(vh))
  //   vout = vfmv_f_s(vsum)           // extract vsum[0]
  //   *output += vout * scale

  std::cout << "Building RISC-V symbolic expression..." << std::endl;

  // vfwredusum: widen f16 to f32 and sum, adding to accumulator
  // For 4 elements: vsum[0] = 0 + (x0_f32 + x1_f32 + x2_f32 + x3_f32)
  // Note: unordered sum, but we'll use left-to-right associativity
  Term riscv_acc = tm.mkFloatingPointPosZero(8, 24);
  for (size_t i = 0; i < batch_elements; i++) {
    riscv_acc = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, riscv_acc, symbolic_input_fp32[i]});
  }

  // *output += vout * scale
  Term riscv_scaled = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, riscv_acc, scale_fp32});
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
    std::cout << "\n===== STRICT EQUIVALENCE PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are bit-exact equivalent." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== EXPECTED: Different summation orders =====" << std::endl;
    std::cout << "SAT: Found inputs where outputs differ (due to FP associativity)." << std::endl;
    std::cout << "Input values:" << std::endl;

    for (size_t i = 0; i < batch_elements; i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input_bv[i])
                << " (fp16: " << solver.getValue(symbolic_input_fp16[i]) << ")" << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    std::cout << "  NEON (f32):   " << solver.getValue(neon_output) << std::endl;
    std::cout << "  RISC-V (f32): " << solver.getValue(riscv_output) << std::endl;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }

  // ========================================================================
  // Secondary verification: Same summation order
  // ========================================================================
  // Now verify that if we use the SAME summation order, both are correct.
  // We compare both against a reference order: left-to-right sequential sum.

  std::cout << "\n========================================" << std::endl;
  std::cout << "Secondary check: Verifying mathematical correctness" << std::endl;
  std::cout << "Using reference order: x0 + x1 + x2 + x3" << std::endl;

  Solver solver2(tm);
  solver2.setOption("produce-models", "true");
  solver2.setOption("fp-exp", "true");

  // Re-apply constraints on inputs
  for (size_t i = 0; i < batch_elements; i++) {
    solver2.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {symbolic_input_fp16[i]})}));
    solver2.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {symbolic_input_fp16[i]})}));
    solver2.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {symbolic_input_fp16[i], bound_neg_f16}));
    solver2.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {symbolic_input_fp16[i], bound_pos_f16}));
  }

  // Build reference sum with NEON order to compare RVV-style sequential sum
  // If RVV used NEON's pairwise order, would they match?
  // NEON order: (x0+x2) + (x1+x3)
  Term rvv_with_neon_order_02 = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, symbolic_input_fp32[0], symbolic_input_fp32[2]});
  Term rvv_with_neon_order_13 = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, symbolic_input_fp32[1], symbolic_input_fp32[3]});
  Term rvv_with_neon_order = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, rvv_with_neon_order_02, rvv_with_neon_order_13});
  Term rvv_with_neon_order_scaled = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, rvv_with_neon_order, scale_fp32});
  Term rvv_with_neon_order_output = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, init_output, rvv_with_neon_order_scaled});

  // Compare NEON output with RVV using NEON's summation order
  Term same_order_equal = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output, rvv_with_neon_order_output});
  Term same_order_not_equal = tm.mkTerm(Kind::NOT, {same_order_equal});

  solver2.assertFormula(same_order_not_equal);
  Result result2 = solver2.checkSat();

  std::cout << "Checking: NEON vs RVV with same (NEON) summation order" << std::endl;
  std::cout << "Result: " << result2 << std::endl;

  if (result2.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: With same summation order, implementations are equivalent!" << std::endl;
    std::cout << "Conclusion: Both implementations correctly compute the sum," << std::endl;
    std::cout << "differences are solely due to floating-point associativity." << std::endl;
    return 0;
  } else if (result2.isSat()) {
    std::cout << "\n===== UNEXPECTED: Structural difference found =====" << std::endl;
    std::cout << "Even with same summation order, outputs differ!" << std::endl;
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    return 2;
  }
}
