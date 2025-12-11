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
void xnn_f32_ppmm_minmax_ukernel_4x8__neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* a,
    const float* w,
    float* c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_ppmm_minmax_ukernel_4x8__rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* a,
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

  // PPMM parameters - 4x8 microkernel
  // mr = number of rows processed (up to 4)
  // nc = number of columns of output C (8 at a time)
  // kc = inner dimension in bytes
  // In PPMM, A is packed: 4 values (one per row) per k iteration
  const size_t mr = 4;           // Process 4 rows at a time
  const size_t nc = 77;            // Process 8 columns of output at a time
  const size_t k = 2;            // Inner dimension (small for verification)
  const size_t kc = k * sizeof(float);  // In bytes

  // Strides (in bytes)
  // cm_stride: stride between rows (in bytes) - for row-major, this is nc * sizeof(float)
  // cn_stride: stride between column blocks (in bytes) - for row-major contiguous, this is 8 * sizeof(float)
  const size_t cm_stride = nc * sizeof(float);   // Row stride for C
  const size_t cn_stride = 8 * sizeof(float);    // Column block stride (tile width)

  // Memory sizes
  // A is packed: for each k iteration, 4 floats (one per row)
  const size_t a_size = k * 4;          // k iterations x 4 rows packed
  const size_t c_size = mr * nc;        // 4 rows x nc columns

  // Number of column blocks (tiles)
  const size_t num_col_blocks = (nc + 7) / 8;  // Ceiling division

  // Weight layout per column block:
  // - Bias: 8 floats (one per output column in tile)
  // - Then for each k: 8 floats (one weight per output column in tile)
  // Total per block: 8 + k * 8 floats
  // Total: num_col_blocks * (8 + k * 8) floats
  const size_t weights_per_block = 8 + k * 8;
  const size_t weights_size = num_col_blocks * weights_per_block;

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

  // Symbolic A matrix (packed: k iterations x 4 rows)
  // A[i] corresponds to row (i % 4), k iteration (i / 4)
  std::vector<Term> symbolic_a;
  symbolic_a.reserve(a_size);
  for (size_t i = 0; i < a_size; i++) {
    symbolic_a.push_back(tm.mkConst(fp32, "a_" + std::to_string(i)));
  }

  // Symbolic weights (all biases and B matrices for all column blocks)
  // Layout: [block0: bias0..7, b_k0_0..7, b_k1_0..7, ...][block1: ...][...]
  std::vector<Term> symbolic_weights;
  symbolic_weights.reserve(weights_size);
  for (size_t i = 0; i < weights_size; i++) {
    symbolic_weights.push_back(tm.mkConst(fp32, "w_" + std::to_string(i)));
  }

  // Populate NEON memory for A matrix
  // NEON loads 4 floats at a time with vld1q_f32
  for (size_t i = 0; i < a_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(a_data.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < a_size) {
        lanes[j] = symbolic_a[idx];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate NEON memory for weights
  // Format: [block0: bias0..7, b_k0_0..7, b_k1_0..7, ...][block1: ...]
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < weights_size) {
        lanes[j] = symbolic_weights[idx];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory for A matrix
  // RVV loads scalars directly for the va0, va1, va2, va3 values
  for (size_t i = 0; i < a_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(a_data.data() + i);
    g_riscv_float_scalar_memory[addr] = symbolic_a[i];
  }

  // Populate RISC-V memory for weights
  // RVV loads 4 floats at a time with vle32_v_f32m1
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < weights_size) {
        chunk.push_back(symbolic_weights[idx]);
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

  // For NEON vld2q_dup_f32 (loads min and max from scalar memory)
  g_neon_float_scalar_memory[min_addr] = neg_inf;
  g_neon_float_scalar_memory[max_addr] = pos_inf;

  // For RISC-V scalar reads
  g_riscv_float_scalar_memory[min_addr] = neg_inf;
  g_riscv_float_scalar_memory[max_addr] = pos_inf;

  std::cout << "Testing XNNPACK f32_ppmm_minmax_4x8: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "mr (rows): " << mr << std::endl;
  std::cout << "nc (columns): " << nc << std::endl;
  std::cout << "k (inner dim): " << k << std::endl;
  std::cout << "A packed: " << a_size << " floats (" << k << " x 4)" << std::endl;
  std::cout << "Weights: " << weights_size << " floats (8 bias + " << k*8 << " B matrix)" << std::endl;
  std::cout << "Output: " << mr << "x" << nc << " (" << c_size << " floats)" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_ppmm_minmax_ukernel_4x8__neon(
      mr, nc, kc,
      a_data.data(),
      weights.data(),
      output_neon.data(),
      cm_stride, cn_stride,
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_ppmm_minmax_ukernel_4x8__rvv(
      mr, nc, kc,
      a_data.data(),
      weights.data(),
      output_riscv.data(),
      cm_stride, cn_stride,
      &params);

  // Collect results from NEON
  // The kernel stores output row by row at c0, c1, c2, c3 addresses
  // For nc >= 8: vst1q_f32 (4 floats) twice per row
  // For tail: vst1q_f32, vst1_f32, vst1_lane_f32 as needed
  std::vector<Term> neon_elements;
  neon_elements.reserve(c_size);

  for (size_t row = 0; row < mr; row++) {
    size_t col = 0;
    while (col < nc) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data() + row * nc + col);

      // Try f32x4 first (4 floats from vst1q_f32)
      auto it4 = g_neon_memory_f32x4.find(addr);
      if (it4 != g_neon_memory_f32x4.end() && !it4->second.empty()) {
        const float32x4_t& vec = it4->second.back();
        size_t len = std::min(static_cast<size_t>(4), nc - col);
        for (size_t i = 0; i < len; i++) {
          neon_elements.push_back(vec.getLane(i));
        }
        col += 4;
        continue;
      }

      // Try f32x2 (2 floats from vst1_f32 or 1 float from vst1_lane_f32)
      auto it2 = g_neon_memory_f32x2.find(addr);
      if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
        const float32x2_t& vec = it2->second.back();
        size_t len = std::min(static_cast<size_t>(2), nc - col);
        for (size_t i = 0; i < len; i++) {
          neon_elements.push_back(vec.getLane(i));
        }
        col += 2;
        continue;
      }

      // No more data at this offset
      break;
    }
  }

  // Collect results from RISC-V
  // The kernel stores 4 rows at c0, c1, c2, c3 addresses
  // Each row is stored with vse32_v_f32m1
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(c_size);

  for (size_t row = 0; row < mr; row++) {
    size_t col = 0;
    while (col < nc) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data() + row * nc + col);

      auto it = g_riscv_memory_f32m1.find(addr);
      if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
        const vfloat32m1_t& vec = it->second.back();
        size_t vec_len = std::min(vec.getVL(), nc - col);
        for (size_t elem = 0; elem < vec_len; elem++) {
          riscv_elements.push_back(vec.getElement(elem));
        }
        col += vec_len;
        continue;
      }

      // No more data at this offset
      break;
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

    std::cout << "\nA (packed) values:" << std::endl;
    for (size_t i = 0; i < a_size; i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
    }

    std::cout << "\nWeights values (first 32):" << std::endl;
    for (size_t i = 0; i < std::min(weights_size, static_cast<size_t>(32)); i++) {
      std::cout << "  w[" << i << "] = " << solver.getValue(symbolic_weights[i]) << std::endl;
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
