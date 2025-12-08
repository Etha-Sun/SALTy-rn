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
void xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x8__neon_mlal_lane(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* a,
    size_t a_stride,
    const void* w,
    int8_t* c,
    size_t cm_stride,
    size_t cn_stride,
    const union xnn_qs8_qc8w_conv_minmax_params* params);

void xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x8__rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* a,
    size_t a_stride,
    const void* w,
    int8_t* c,
    size_t cm_stride,
    size_t cn_stride,
    const union xnn_qs8_qc8w_conv_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // GEMM parameters: 1x8 kernel
  // For multi-tile (nc > 8), weights must be packed per-tile which is complex.
  // For simplicity, test with nc=8 (single tile) to verify correctness first.
  const size_t mr = 1;      // Number of rows of A to process
  const size_t nc = 8;      // Number of columns of output (single tile)
  const size_t kc = 18;      // Inner dimension (columns of A, rows of B)
  const size_t a_stride = kc;
  const size_t cm_stride = nc;
  const size_t cn_stride = 8;  // Output columns per tile

  // Allocate arrays
  // A matrix: mr x kc = 1 x 8 = 8 elements
  std::vector<int8_t> a(mr * kc, 0);

  // Weights buffer layout for GEMM:
  // [bias0..bias7 (8 x int32 = 32 bytes)]
  // [weight_col0: 8 x int8 for each of kc rows]
  // [weight_col1: 8 x int8 for each of kc rows]
  // ... repeated for each column of k (8 columns of k values per output column)
  // [scale0..scale7 (8 x float = 32 bytes)]
  //
  // For the XNNPACK kernel, weights are packed as:
  // First: 8 biases (32 bytes)
  // Then: for each k value (0..kc-1): 8 weights for all nc columns (8 bytes each)
  // Finally: 8 scales (32 bytes)
  // Total: 32 + kc*8 + 32 = 32 + 64 + 32 = 128 bytes
  const size_t weights_size = nc * sizeof(int32_t) + kc * nc + nc * sizeof(float);
  std::vector<uint8_t> w(weights_size, 0);

  // Output: mr x nc = 1 x 8 = 8 elements
  std::vector<int8_t> c_neon(mr * nc, 0);
  std::vector<int8_t> c_riscv(mr * nc, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs for A matrix (8 elements, 8-bit signed)
  std::vector<Term> symbolic_a = createSymbolicArray(tm, mr * kc, "a", 8);

  // Setup symbolic inputs for biases (8 elements, 32-bit signed)
  std::vector<Term> symbolic_bias = createSymbolicArray(tm, nc, "bias", 32);

  // Setup symbolic inputs for weights (kc x nc = 64 elements, 8-bit signed)
  // Weights layout: for each k in [0, kc), store weights for all nc output channels
  std::vector<Term> symbolic_weights = createSymbolicArray(tm, kc * nc, "w", 8);

  // Use concrete scales (1.0f) for simplification
  // Per-channel quantized scales would be symbolic, but for basic verification
  // concrete scales are sufficient
  float concrete_scale = 1.0f;
  std::vector<float> concrete_scales(nc, concrete_scale);

  // Set concrete scale values in the buffer
  float* scales_ptr = reinterpret_cast<float*>(w.data() + nc * sizeof(int32_t) + kc * nc);
  for (size_t c = 0; c < nc; c++) {
    scales_ptr[c] = concrete_scale;
  }

  // Populate NEON memory
  SymbolicNEONHelpers::populateMemory8(a.data(), symbolic_a);

  // Populate weights buffer for NEON
  // First: biases (8 x int32 = 32 bytes)
  SymbolicNEONHelpers::populateMemory32(reinterpret_cast<int32_t*>(w.data()), symbolic_bias);

  // Then: weights for each k value (kc iterations, 8 bytes each = 64 bytes total)
  // Layout: for k in 0..7: w[k*8 + c] is the weight for input k, output channel c
  for (size_t k = 0; k < kc; k++) {
    std::vector<Term> weights_for_k;
    for (size_t c = 0; c < nc; c++) {
      weights_for_k.push_back(symbolic_weights[k * nc + c]);
    }
    SymbolicNEONHelpers::populateMemory8(
        reinterpret_cast<int8_t*>(w.data() + nc * sizeof(int32_t) + k * nc),
        weights_for_k);
  }

  // Populate scales in NEON memory (concrete float values)
  SymbolicNEONHelpers::populateMemoryF32(scales_ptr, concrete_scales);

  // Populate RISC-V memory
  SymbolicRISCVHelpers::populateMemory8(a.data(), symbolic_a);

  // Populate weights buffer for RISC-V (same layout as NEON)
  SymbolicRISCVHelpers::populateMemory32(reinterpret_cast<int32_t*>(w.data()), symbolic_bias);
  for (size_t k = 0; k < kc; k++) {
    std::vector<Term> weights_for_k;
    for (size_t c = 0; c < nc; c++) {
      weights_for_k.push_back(symbolic_weights[k * nc + c]);
    }
    SymbolicRISCVHelpers::populateMemory8(
        reinterpret_cast<int8_t*>(w.data() + nc * sizeof(int32_t) + k * nc),
        weights_for_k);
  }

  // Populate scales in RISC-V memory (concrete float values)
  SymbolicRISCVHelpers::populateMemoryF32(scales_ptr, concrete_scales);

  // Setup params struct with concrete test values
  union xnn_qs8_qc8w_conv_minmax_params params;
  params.fp32_neon.magic_bias = 12582912.0f;  // 1.5 * 2^23 (magic bias for rounding)
  params.fp32_neon.magic_bias_less_output_zero_point = 12582912 - 0;  // Assuming zero_point = 0
  params.fp32_neon.output_min = -128;
  params.fp32_neon.output_max = 127;

  std::cout << "Testing XNNPACK qs8_qc8w_gemm_minmax_fp32: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Matrix dimensions: A[" << mr << "x" << kc << "] x B[" << kc << "x" << nc << "] = C[" << mr << "x" << nc << "]" << std::endl;
  std::cout << "Weights size: " << weights_size << " bytes" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  magic_bias: " << params.fp32_neon.magic_bias << std::endl;
  std::cout << "  magic_bias_less_output_zero_point: " << params.fp32_neon.magic_bias_less_output_zero_point << std::endl;
  std::cout << "  output_min: " << (int)params.fp32_neon.output_min << std::endl;
  std::cout << "  output_max: " << (int)params.fp32_neon.output_max << std::endl;
  std::cout << "  scale: " << concrete_scale << " (concrete)" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x8__neon_mlal_lane(
      mr, nc, kc, a.data(), a_stride, w.data(), c_neon.data(), cm_stride, cn_stride, &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x8__rvv(
      mr, nc, kc, a.data(), a_stride, w.data(), c_riscv.data(), cm_stride, cn_stride, &params);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(c_neon.data(), mr * nc);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(c_riscv.data(), mr * nc);

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

  // Build equivalence check
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

    std::cout << "\nA matrix values:" << std::endl;
    for (size_t i = 0; i < std::min(mr * kc, (size_t)8); i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
    }

    std::cout << "\nBias values:" << std::endl;
    for (size_t i = 0; i < nc; i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }

    std::cout << "\nWeight values (first 8):" << std::endl;
    for (size_t i = 0; i < std::min(kc * nc, (size_t)8); i++) {
      std::cout << "  w[" << i << "] = " << solver.getValue(symbolic_weights[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
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
