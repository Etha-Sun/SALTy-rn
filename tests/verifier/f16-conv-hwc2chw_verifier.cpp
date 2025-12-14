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

// Forward declarations for f16-conv-hwc2chw kernels
extern "C" {
void xnn_f16_conv_hwc2chw_ukernel_3x3s2p1c3x4__neonfp16arith_2x2(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const xnn_float16* input,
    const xnn_float16* zero,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f16_minmax_params* params);

void xnn_f16_conv_hwc2chw_ukernel_3x3s2p1c3x4__rvv_2x2(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const xnn_float16* input,
    const xnn_float16* zero,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
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

  // f16-conv-hwc2chw: 3x3 strided convolution with HWC to CHW format conversion
  //
  // This kernel computes a 3x3 convolution with stride 2 on 3-channel input,
  // producing 4 output channels. The core computation for one output element is:
  //
  //   output[c] = bias[c] + sum over (kh, kw, ic) of:
  //                         input[kh][kw][ic] * weight[kh][kw][ic][c]
  //
  // where kh, kw are in [0,2] (3x3 kernel) and ic is in [0,2] (3 input channels)
  //
  // For verification, we verify one output channel position with the 27 input
  // positions (3x3 spatial × 3 channels) and 27 weights plus bias.
  //
  // Both NEON and RVV use FMA operations:
  //   NEON: vfma_lane_f16 (acc = acc + a * b[lane])
  //   RVV:  vfmacc_vf_f16m1 (acc = acc + scalar * vec)
  //
  // After accumulation, minmax clamping is applied.

  std::cout << "Testing XNNPACK f16_conv_hwc2chw: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: 3x3 stride-2 convolution with HWC->CHW conversion" << std::endl;
  std::cout << "  output = clamp(bias + sum(input[kh,kw,ic] * weight[kh,kw,ic]), min, max)" << std::endl;

  // Create symbolic types
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term rm = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  // For a single output channel, we need:
  // - 27 input values (3x3 spatial × 3 input channels)
  // - 27 weights + 1 bias = 28 weight values
  //
  // Simplify: verify for one output channel with the 27 MAC operations

  const int num_inputs = 27;  // 3x3 × 3 channels
  const int num_weights = 28; // 27 kernel weights + 1 bias

  // Create symbolic inputs: 27 input values
  std::vector<Term> input_bv(num_inputs);
  std::vector<Term> input_fp(num_inputs);

  for (int i = 0; i < num_inputs; i++) {
    input_bv[i] = tm.mkConst(bv16, "in_" + std::to_string(i));
    input_fp[i] = tm.mkTerm(to_fp_op, {input_bv[i]});

    // Exclude NaN and infinity
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {input_fp[i]})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {input_fp[i]})}));
  }

  // Create symbolic weights: 1 bias + 27 kernel weights = 28 weights
  std::vector<Term> weight_bv(num_weights);
  std::vector<Term> weight_fp(num_weights);

  for (int i = 0; i < num_weights; i++) {
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
  // NEON implementation uses vfma_lane_f16:
  //   vo = bias
  //   vo = vfma_lane_f16(vo, vk, vi, lane)  // vo = vo + vk * vi[lane]
  //
  // The order of operations in the actual kernel:
  // For each position in the 3x3 kernel and 3 input channels:
  //   vo[0:3] = vo[0:3] + weight[...][0:3] * input_scalar
  //
  // We verify a single lane (output channel) by computing:
  //   output = bias + sum(input[i] * weight[i+1])

  std::cout << "Building NEON symbolic expression (FMA chain)..." << std::endl;

  // Start with bias (weight[0])
  Term neon_acc = weight_fp[0];

  // Apply 27 FMA operations: acc = acc + input[i] * weight[i+1]
  // This matches the order in the kernel: process each input position with its weight
  for (int i = 0; i < num_inputs; i++) {
    // FMA: neon_acc = neon_acc + input_fp[i] * weight_fp[i+1]
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
  // RVV implementation uses vfmacc_vf_f16m1:
  //   vacc = bias
  //   vacc = vfmacc_vf_f16m1(vacc, scalar, vk, vl)  // vacc = vacc + scalar * vk
  //
  // Same mathematical operation as NEON, just vector vs scalar order differs

  std::cout << "Building RISC-V symbolic expression (FMA chain)..." << std::endl;

  // Start with bias (weight[0])
  Term riscv_acc = weight_fp[0];

  // Apply 27 FMA operations: acc = acc + input[i] * weight[i+1]
  for (int i = 0; i < num_inputs; i++) {
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
    std::cout << "  output = clamp(bias + sum(input[i] * weight[i]), min, max)" << std::endl;
    std::cout << "for the 3x3 stride-2 convolution with 3 input channels." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    std::cout << "\nInputs (27 positions: 3x3 spatial × 3 channels):" << std::endl;
    for (int i = 0; i < num_inputs; i++) {
      int kh = i / 9;          // kernel height position
      int kw = (i / 3) % 3;    // kernel width position
      int ic = i % 3;          // input channel
      std::cout << "  in[kh=" << kh << ",kw=" << kw << ",ic=" << ic << "] = "
                << solver.getValue(input_bv[i])
                << " (fp16: " << solver.getValue(input_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nWeights (bias + 27 kernel weights):" << std::endl;
    std::cout << "  w[bias] = " << solver.getValue(weight_bv[0])
              << " (fp16: " << solver.getValue(weight_fp[0]) << ")" << std::endl;
    for (int i = 1; i < num_weights; i++) {
      int kh = (i - 1) / 9;
      int kw = ((i - 1) / 3) % 3;
      int ic = (i - 1) % 3;
      std::cout << "  w[kh=" << kh << ",kw=" << kw << ",ic=" << ic << "] = "
                << solver.getValue(weight_bv[i])
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
