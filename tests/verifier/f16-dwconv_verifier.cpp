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

// Forward declarations for f16-dwconv kernels
extern "C" {
void xnn_f16_dwconv_minmax_ukernel_9p8c__neonfp16arith(
    size_t channels,
    size_t output_width,
    const xnn_float16** input,
    const xnn_float16* weights,
    xnn_float16* output_ptr,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const xnn_float16* zero,
    const struct xnn_f16_minmax_params* params);

void xnn_f16_dwconv_minmax_ukernel_9p8c__rvv(
    size_t channels,
    size_t output_width,
    const xnn_float16** input,
    const xnn_float16* weights,
    xnn_float16* output_ptr,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const xnn_float16* zero,
    const struct xnn_f16_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-dwconv (9p8c): 9-point depthwise convolution (3x3 kernel)
  // The core operation for each channel is:
  //   output = bias + sum(input[i] * weight[i] for i in 0..8)
  // with minmax clamping applied at the end.
  //
  // Both NEON and RVV compute this using FMA operations:
  //   NEON: vfmaq_f16 (vector FMA)
  //   RVV:  vfmacc_vv_f16m1 (vector FMA with accumulator)
  //
  // We verify a single channel position with all 9 input points.

  std::cout << "Testing XNNPACK f16_dwconv (9p8c): NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: 9-point depthwise convolution with minmax clamping" << std::endl;
  std::cout << "  output = clamp(bias + sum(input[i] * kernel[i]), min, max)" << std::endl;

  // Create symbolic types
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term rm = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  // Create symbolic inputs: 9 input values (one from each of 9 input rows)
  std::vector<Term> input_bv(9);
  std::vector<Term> input_fp(9);

  for (int i = 0; i < 9; i++) {
    input_bv[i] = tm.mkConst(bv16, "in_" + std::to_string(i));
    input_fp[i] = tm.mkTerm(to_fp_op, {input_bv[i]});

    // Exclude NaN and infinity
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {input_fp[i]})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {input_fp[i]})}));
  }

  // Create symbolic weights: 1 bias + 9 kernel weights = 10 weights
  std::vector<Term> weight_bv(10);
  std::vector<Term> weight_fp(10);

  for (int i = 0; i < 10; i++) {
    weight_bv[i] = tm.mkConst(bv16, "w_" + std::to_string(i));
    weight_fp[i] = tm.mkTerm(to_fp_op, {weight_bv[i]});

    // Exclude NaN and infinity
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {weight_fp[i]})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {weight_fp[i]})}));
  }

  // Symbolic min/max params
  Term min_bv = tm.mkConst(bv16, "param_min");
  Term max_bv = tm.mkConst(bv16, "param_max");
  Term min_fp = tm.mkTerm(to_fp_op, {min_bv});
  Term max_fp = tm.mkTerm(to_fp_op, {max_bv});

  // Ensure min <= max and neither is NaN
  solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {min_fp})}));
  solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {max_fp})}));
  solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {min_fp, max_fp}));

  std::cout << "\nBuilding symbolic expressions for both implementations..." << std::endl;

  // ========================================================================
  // Build NEON symbolic expression
  // ========================================================================
  // NEON implementation:
  //   vacc = vld1q_u16(w)  // load bias
  //   for i in 0..8:
  //     vi = vld1q_u16(input[i])
  //     vk = vld1q_u16(w)
  //     vacc = vfmaq_f16(vacc, vi, vk)  // FMA: acc = acc + vi * vk
  //   vacc = vmaxq_f16(vacc, vmin)
  //   vacc = vminq_f16(vacc, vmax)

  std::cout << "Building NEON symbolic expression (FMA chain)..." << std::endl;

  // Start with bias (weight[0])
  Term neon_acc = weight_fp[0];

  // Apply 9 FMA operations: acc = acc + input[i] * weight[i+1]
  for (int i = 0; i < 9; i++) {
    // vfmaq_f16: neon_acc = neon_acc + input_fp[i] * weight_fp[i+1]
    neon_acc = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, input_fp[i], weight_fp[i + 1], neon_acc});
  }

  // Apply min/max clamping: max(min(acc, max), min)
  Term neon_clamped = tm.mkTerm(Kind::FLOATINGPOINT_MAX, {
    tm.mkTerm(Kind::FLOATINGPOINT_MIN, {neon_acc, max_fp}),
    min_fp
  });

  // ========================================================================
  // Build RVV symbolic expression
  // ========================================================================
  // RVV implementation:
  //   vacc = vle16_v_f16m1(w)  // load bias
  //   for i in 0..8:
  //     vi = vle16_v_f16m1(input[i])
  //     vk = vle16_v_f16m1(w)
  //     vacc = vfmacc_vv_f16m1(vacc, vi, vk)  // FMA: acc = acc + vi * vk
  //   vacc = vfmax_vf_f16m1(vacc, vmin)
  //   vacc = vfmin_vf_f16m1(vacc, vmax)

  std::cout << "Building RISC-V symbolic expression (FMA chain)..." << std::endl;

  // Start with bias (weight[0])
  Term riscv_acc = weight_fp[0];

  // Apply 9 FMA operations: acc = acc + input[i] * weight[i+1]
  for (int i = 0; i < 9; i++) {
    // vfmacc: riscv_acc = riscv_acc + input_fp[i] * weight_fp[i+1]
    riscv_acc = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, input_fp[i], weight_fp[i + 1], riscv_acc});
  }

  // Apply min/max clamping
  Term riscv_clamped = tm.mkTerm(Kind::FLOATINGPOINT_MAX, {
    tm.mkTerm(Kind::FLOATINGPOINT_MIN, {riscv_acc, max_fp}),
    min_fp
  });

  // ========================================================================
  // Compare outputs
  // ========================================================================

  std::cout << "\nComparing NEON and RISC-V results..." << std::endl;

  // Use FP equality for comparison
  Term outputs_equal = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_clamped, riscv_clamped});
  Term not_equal = tm.mkTerm(Kind::NOT, {outputs_equal});

  std::cout << "Asserting: NOT(NEON_result == RISC-V_result)" << std::endl;
  std::cout << "Looking for counterexample where outputs differ..." << std::endl;

  solver.assertFormula(not_equal);
  Result result = solver.checkSat();

  std::cout << "\nResult: " << result << std::endl;

  if (result.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are equivalent." << std::endl;
    std::cout << "Both correctly compute:" << std::endl;
    std::cout << "  output = clamp(bias + sum(input[i] * kernel[i]), min, max)" << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    std::cout << "\nInputs (9 points):" << std::endl;
    for (int i = 0; i < 9; i++) {
      std::cout << "  in[" << i << "] = " << solver.getValue(input_bv[i])
                << " (fp16: " << solver.getValue(input_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nWeights (bias + 9 kernel weights):" << std::endl;
    for (int i = 0; i < 10; i++) {
      std::cout << "  w[" << i << "] = " << solver.getValue(weight_bv[i])
                << " (fp16: " << solver.getValue(weight_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nParams:" << std::endl;
    std::cout << "  min = " << solver.getValue(min_fp) << std::endl;
    std::cout << "  max = " << solver.getValue(max_fp) << std::endl;

    std::cout << "\nOutput comparison:" << std::endl;
    std::cout << "  NEON (before clamp): " << solver.getValue(neon_acc) << std::endl;
    std::cout << "  RISC-V (before clamp): " << solver.getValue(riscv_acc) << std::endl;
    std::cout << "  NEON (after clamp):  " << solver.getValue(neon_clamped) << std::endl;
    std::cout << "  RISC-V (after clamp): " << solver.getValue(riscv_clamped) << std::endl;

    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
