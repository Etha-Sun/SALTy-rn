#include "../../src/xnn_minimal.h"
#include "../../src/neon_symbolic/memory.hpp"
#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/riscv_symbolic/memory.hpp"
#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_common.hpp"
#include "../../src/symbolic_helpers.hpp"
#include "../../src/symbolic_scalar_types.hpp"
#include <algorithm>
#include <array>
#include <cstdint>
#include <cmath>
#include <limits>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_f32_gemm_minmax_ukernel_4x8__neon_lane_ld64(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* a,
    size_t a_stride,
    const float* w,
    float* c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_gemm_minmax_ukernel_4x8__rvv_ld64(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* a,
    size_t a_stride,
    const float* w,
    float* c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // GEMM parameters - 4x8 microkernel
  // mr = number of rows of A and C (up to 4)
  // nc = number of columns of output C (8 at a time)
  // kc = inner dimension (number of columns of A / rows of B in bytes)
  const size_t mr = 1;           // Process 4 rows of A at a time
  const size_t nc = 9;           // Process 8 columns of output at a time
  const size_t k = 2;            // Inner dimension (small for verification)
  const size_t kc = k * sizeof(float);  // In bytes

  // Strides
  const size_t a_stride = k * sizeof(float);     // Row stride for A (in bytes)
  const size_t cm_stride = nc * sizeof(float);   // Row stride for C (in bytes)
  const size_t cn_stride = nc * sizeof(float);   // Column stride for C (in bytes)

  // Memory sizes
  const size_t a_size = mr * k;           // 4 rows x k columns
  const size_t c_size = mr * nc;          // 4 rows x 8 columns

  // Weight layout for NEON (ld64) and RVV:
  // Both use the same packed format:
  // - Bias: 8 floats (one per output column)
  // - Then for each k: 8 floats (one weight per output column)
  // Total: 8 + k * 8 floats
  const size_t weights_size = 8 + k * 8;

  // Allocate arrays
  std::vector<float> a_data(a_size + 16, 0.0f);
  std::vector<float> weights(weights_size + 16, 0.0f);
  std::vector<float> output_neon(c_size, 0.0f);
  std::vector<float> output_riscv(c_size, 0.0f);

  // Setup min/max params (no clamping for verification)
  xnn_f32_minmax_params params;
  params.scalar.min = -std::numeric_limits<float>::infinity();
  params.scalar.max = std::numeric_limits<float>::infinity();

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic A matrix (mr x k)
  std::vector<Term> symbolic_a;
  symbolic_a.reserve(a_size);
  for (size_t i = 0; i < a_size; i++) {
    symbolic_a.push_back(tm.mkConst(fp32, "a_" + std::to_string(i)));
  }

  // Symbolic bias (8 floats)
  std::vector<Term> symbolic_bias;
  symbolic_bias.reserve(8);
  for (size_t i = 0; i < 8; i++) {
    symbolic_bias.push_back(tm.mkConst(fp32, "bias_" + std::to_string(i)));
  }

  // Symbolic B weights (k x 8)
  std::vector<Term> symbolic_b;
  symbolic_b.reserve(k * 8);
  for (size_t i = 0; i < k * 8; i++) {
    symbolic_b.push_back(tm.mkConst(fp32, "b_" + std::to_string(i)));
  }

  // Populate NEON memory for A matrix
  // NEON loads using vld1_f32 (2 floats) from each row
  // Need to populate at every possible offset for vld1_f32
  for (size_t row = 0; row < mr; row++) {
    const float* row_ptr = a_data.data() + row * k;
    for (size_t col = 0; col < k; col++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(row_ptr + col);

      // For vld1_f32 (2 floats)
      std::array<Term, 2> lanes2;
      for (size_t j = 0; j < 2; j++) {
        size_t idx = row * k + col + j;
        if (col + j < k) {
          lanes2[j] = symbolic_a[idx];
        } else {
          lanes2[j] = zero;
        }
      }
      g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

      // For vld1q_dup_f32 (tail case - broadcast single float)
      Term val = symbolic_a[row * k + col];
      std::array<Term, 4> lanes4_dup = {val, val, val, val};
      g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4_dup));
    }
  }

  // Populate NEON memory for weights (bias + B matrix)
  // Format: [bias0..7][b_k0_0..7][b_k1_0..7]...
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < 8) {
        // Bias region
        lanes[j] = (idx < 8) ? symbolic_bias[idx] : zero;
      } else if (idx < weights_size) {
        // B matrix region
        lanes[j] = symbolic_b[idx - 8];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory for A matrix
  // RVV loads scalars directly using float loads
  for (size_t i = 0; i < a_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(a_data.data() + i);
    g_riscv_float_scalar_memory[addr] = symbolic_a[i];
  }

  // Populate RISC-V memory for weights
  // RVV loads 8 floats at a time with __riscv_vle32_v_f32m1
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < 8) {
        // Bias region
        chunk.push_back(symbolic_bias[idx]);
      } else if (idx < weights_size) {
        // B matrix region
        chunk.push_back(symbolic_b[idx - 8]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Setup params memory for min/max values
  uintptr_t min_addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
  uintptr_t max_addr = reinterpret_cast<uintptr_t>(&params.scalar.max);
  Term neg_inf = tm.mkFloatingPointNegInf(8, 24);
  Term pos_inf = tm.mkFloatingPointPosInf(8, 24);

  // For NEON vdupq_n_f32
  g_neon_float_scalar_memory[min_addr] = neg_inf;
  g_neon_float_scalar_memory[max_addr] = pos_inf;

  // For RISC-V scalar reads
  g_riscv_float_scalar_memory[min_addr] = neg_inf;
  g_riscv_float_scalar_memory[max_addr] = pos_inf;

  std::cout << "Testing XNNPACK f32_gemm_minmax_4x8: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "mr (rows): " << mr << std::endl;
  std::cout << "nc (columns): " << nc << std::endl;
  std::cout << "k (inner dim): " << k << std::endl;
  std::cout << "A matrix: " << mr << "x" << k << " (" << a_size << " floats)" << std::endl;
  std::cout << "Weights: " << weights_size << " floats (8 bias + " << k*8 << " B matrix)" << std::endl;
  std::cout << "Output: " << mr << "x" << nc << " (" << c_size << " floats)" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_gemm_minmax_ukernel_4x8__neon_lane_ld64(
      mr, nc, kc,
      a_data.data(), a_stride,
      weights.data(),
      output_neon.data(),
      cm_stride, cn_stride,
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_gemm_minmax_ukernel_4x8__rvv_ld64(
      mr, nc, kc,
      a_data.data(), a_stride,
      weights.data(),
      output_riscv.data(),
      cm_stride, cn_stride,
      &params);

  // Collect results from NEON
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon.data(), c_size);

  // Collect results from RISC-V (uses f32m1 stores)
  // The kernel stores 4 rows x 8 columns = 32 floats
  // Each row is stored with vse32_v_f32m1 at c0, c1, c2, c3
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(c_size);

  for (size_t row = 0; row < mr; row++) {
    uintptr_t row_addr = reinterpret_cast<uintptr_t>(output_riscv.data() + row * nc);
    auto it = g_riscv_memory_f32m1.find(row_addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
      const vfloat32m1_t& vec = it->second.back();
      size_t vec_len = std::min(vec.getVL(), nc);
      for (size_t elem = 0; elem < vec_len; elem++) {
        riscv_elements.push_back(vec.getElement(elem));
      }
    }
  }

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
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " floats" << std::endl;
  }

  // Build equality assertions (NaN-aware floating point comparison)
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_elements[i], riscv_elements[i]});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_elements[i]});
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
    std::cout << "The NEON and RISC-V implementations are equivalent." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    std::cout << "\nA matrix values:" << std::endl;
    for (size_t i = 0; i < a_size; i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
    }

    std::cout << "\nBias values:" << std::endl;
    for (size_t i = 0; i < 8; i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }

    std::cout << "\nB matrix values (first 16):" << std::endl;
    for (size_t i = 0; i < std::min(k * 8, (size_t)16); i++) {
      std::cout << "  b[" << i << "] = " << solver.getValue(symbolic_b[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < compare_count; i++) {
      std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
