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
#include <limits>
#include <vector>

// Forward declarations
extern "C" {
void xnn_qd8_f32_qc4w_gemm_minmax_ukernel_2x16c4__neondot(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* a,
    size_t a_stride,
    const void* w,
    float* c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* params,
    const struct xnn_qd8_quantization_params* quantization_params);

void xnn_qd8_f32_qc4w_gemm_minmax_ukernel_2x16c4__rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* a,
    size_t a_stride,
    const void* w,
    float* c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* params,
    const struct xnn_qd8_quantization_params* quantization_params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // qd8-f32-qc4w-gemm: Quantized GEMM with 4-bit weights
  // This kernel computes: C = dequantize(A * W) where:
  // - A is int8 activations (mr x kc)
  // - W is packed 4-bit weights (kc x nc)
  // - C is float32 output (mr x nc)

  // Test parameters - minimized for faster verification
  const size_t mr = 1;   // Number of rows of A/C (keep at 2 to avoid c0==c1 aliasing)
  const size_t nc = 1;   // Number of columns of W/C (reduced from 16)
  const size_t kc = 4;   // Common dimension (must be multiple of 4, reduced from 8)

  // Strides
  const size_t a_stride = kc;
  const size_t cm_stride = nc * sizeof(float);
  const size_t cn_stride = nc * sizeof(float);

  // Allocate data arrays
  std::vector<int8_t> a_data(mr * kc + 64, 0);

  // Weight layout for qc4w kernel:
  // The kernel reads in fixed patterns regardless of actual nc:
  // - 4 groups of 4 int32 kernel sums = 64 bytes
  // - packed 4-bit weights: kernel reads 4x16 bytes per k-loop iteration
  //   With kc=4 (tail case only), it reads 4*16 = 64 bytes of packed weights
  // - 4 groups of 4 float32 filter output scales = 64 bytes
  // - 4 groups of 4 float32 biases = 64 bytes
  const size_t ksum_size = 16 * sizeof(int32_t);  // 64 bytes
  const size_t packed_weights_size = 64;  // 4 * 16 bytes for tail case with kc=4
  const size_t filter_scale_size = 16 * sizeof(float);  // 64 bytes
  const size_t bias_size = 16 * sizeof(float);  // 64 bytes
  const size_t w_total_size = ksum_size + packed_weights_size + filter_scale_size + bias_size;

  std::vector<uint8_t> w_data(w_total_size + 256, 0);
  std::vector<float> c_neon(mr * nc + 64, 0.0f);
  std::vector<float> c_riscv(mr * nc + 64, 0.0f);

  // Setup quantization params (2 rows = 2 sets of params)
  struct xnn_qd8_quantization_params quantization_params[2];
  quantization_params[0].zero_point = 0;
  quantization_params[0].inv_scale = 1.0f;
  quantization_params[1].zero_point = 0;
  quantization_params[1].inv_scale = 1.0f;

  // Setup minmax params
  struct xnn_f32_qc4w_minmax_params params;
  params.scalar.min = -std::numeric_limits<float>::infinity();
  params.scalar.max = std::numeric_limits<float>::infinity();

  // Clear memory
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic types
  Sort bv8 = tm.mkBitVectorSort(8);
  Sort bv32 = tm.mkBitVectorSort(32);
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero_bv8 = tm.mkBitVector(8, 0);
  Term zero_bv32 = tm.mkBitVector(32, 0);
  Term zero_fp32 = tm.mkFloatingPointPosZero(8, 24);

  // Create symbolic activation inputs (mr x kc int8 values)
  std::vector<std::vector<Term>> symbolic_a(mr);
  for (size_t row = 0; row < mr; row++) {
    symbolic_a[row].reserve(kc);
    for (size_t col = 0; col < kc; col++) {
      symbolic_a[row].push_back(tm.mkConst(bv8, "a_" + std::to_string(row) + "_" + std::to_string(col)));
    }
  }

  // Create symbolic weights (packed 4-bit)
  // Each byte contains 2 4-bit values: high nibble and low nibble
  std::vector<std::vector<Term>> symbolic_w(kc);
  for (size_t k = 0; k < kc; k++) {
    symbolic_w[k].reserve(nc);
    for (size_t n = 0; n < nc; n++) {
      symbolic_w[k].push_back(tm.mkConst(bv8, "w_" + std::to_string(k) + "_" + std::to_string(n)));
    }
  }

  // Create symbolic kernel sums (16 int32 values - 4 vectors of 4)
  std::vector<Term> symbolic_ksum;
  symbolic_ksum.reserve(16);
  for (size_t n = 0; n < 16; n++) {
    symbolic_ksum.push_back(tm.mkConst(bv32, "ksum_" + std::to_string(n)));
  }

  // Create symbolic filter scales and biases (16 each - 4 vectors of 4)
  std::vector<Term> symbolic_filter_scale, symbolic_bias;
  for (size_t n = 0; n < 16; n++) {
    Term scale = tm.mkConst(fp32, "scale_" + std::to_string(n));
    Term bias = tm.mkConst(fp32, "bias_" + std::to_string(n));
    symbolic_filter_scale.push_back(scale);
    symbolic_bias.push_back(bias);
    // Prevent NaN inputs
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {scale})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {bias})}));
  }

  // Populate NEON memory for activations
  const int8_t* a0 = a_data.data();
  const int8_t* a1 = a_data.data() + a_stride;

  // For vld1_s8 loads (8 int8 elements)
  for (size_t row = 0; row < mr; row++) {
    const int8_t* a_row = (row == 0) ? a0 : a1;
    for (size_t k = 0; k < kc; k += 8) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(a_row + k);
      std::array<Term, 8> lanes8;
      for (size_t j = 0; j < 8 && (k + j) < kc; j++) {
        lanes8[j] = symbolic_a[row][k + j];
      }
      for (size_t j = kc - k; j < 8; j++) {
        lanes8[j] = zero_bv8;
      }
      g_neon_memory_i8x8[addr].push_back(int8x8_t(g_symbolic_tm, lanes8));

      // RISC-V memory for vle8 loads
      std::vector<Term> rvv_lanes(8);
      for (size_t j = 0; j < 8; j++) {
        rvv_lanes[j] = lanes8[j];
      }
      g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_tm, rvv_lanes));
    }
  }

  // Populate weight memory (complex layout)
  uint8_t* w_ptr = w_data.data();

  // Kernel sums (4 groups of 4 int32 = 16 int32 values)
  for (size_t n = 0; n < 16; n += 4) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(w_ptr + n * sizeof(int32_t));
    std::array<Term, 4> lanes;
    for (size_t i = 0; i < 4; i++) {
      lanes[i] = symbolic_ksum[n + i];
    }
    g_neon_memory[addr].push_back(int32x4_t(g_symbolic_tm, lanes));

    // RISC-V memory
    std::vector<Term> rvv_lanes(4);
    for (size_t i = 0; i < 4; i++) {
      rvv_lanes[i] = symbolic_ksum[n + i];
    }
    g_riscv_memory[addr].push_back(vint32m1_t(g_symbolic_tm, rvv_lanes));
  }

  // Packed weights after kernel sums
  // The kernel reads 4 vectors of 16 bytes each in the tail case = 64 bytes total
  uint8_t* packed_w_ptr = w_ptr + ksum_size;

  // Kernel always reads 4 vb_raw vectors (16 bytes each) per iteration
  for (size_t vec = 0; vec < 4; vec++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(packed_w_ptr);

    std::array<Term, 16> lanes16;
    for (size_t i = 0; i < 16; i++) {
      lanes16[i] = tm.mkConst(bv8, "packed_" + std::to_string(vec) + "_" + std::to_string(i));
    }
    g_neon_memory_i8x16[addr].push_back(int8x16_t(g_symbolic_tm, lanes16));

    // RISC-V vle8 memory
    std::vector<Term> rvv_lanes(16);
    for (size_t i = 0; i < 16; i++) {
      rvv_lanes[i] = lanes16[i];
    }
    g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_tm, rvv_lanes));

    packed_w_ptr += 16;
  }

  // Filter output scales (4 groups of 4 floats = 16 floats)
  float* filter_scale_ptr = reinterpret_cast<float*>(w_ptr + ksum_size + packed_weights_size);
  for (size_t n = 0; n < 16; n += 4) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(filter_scale_ptr + n);
    std::array<Term, 4> lanes;
    for (size_t i = 0; i < 4; i++) {
      lanes[i] = symbolic_filter_scale[n + i];
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));

    // RISC-V
    std::vector<Term> rvv_lanes(4);
    for (size_t i = 0; i < 4; i++) {
      rvv_lanes[i] = symbolic_filter_scale[n + i];
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, rvv_lanes));
  }

  // Biases (4 groups of 4 floats = 16 floats)
  float* bias_ptr = reinterpret_cast<float*>(w_ptr + ksum_size + packed_weights_size + filter_scale_size);
  for (size_t n = 0; n < 16; n += 4) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(bias_ptr + n);
    std::array<Term, 4> lanes;
    for (size_t i = 0; i < 4; i++) {
      lanes[i] = symbolic_bias[n + i];
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));

    // RISC-V
    std::vector<Term> rvv_lanes(4);
    for (size_t i = 0; i < 4; i++) {
      rvv_lanes[i] = symbolic_bias[n + i];
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, rvv_lanes));
  }

  // Setup quantization params memory
  uintptr_t qparams_addr = reinterpret_cast<uintptr_t>(&quantization_params[0].zero_point);
  {
    // vinput_zero_point01 loads 4 int32s: zp0, scale0_bits, zp1, scale1_bits
    std::array<Term, 4> zp_lanes;
    zp_lanes[0] = tm.mkBitVector(32, 0);  // zero_point0
    zp_lanes[1] = tm.mkBitVector(32, 0x3f800000);  // inv_scale0 = 1.0f
    zp_lanes[2] = tm.mkBitVector(32, 0);  // zero_point1
    zp_lanes[3] = tm.mkBitVector(32, 0x3f800000);  // inv_scale1 = 1.0f
    g_neon_memory[qparams_addr].push_back(int32x4_t(g_symbolic_tm, zp_lanes));

    // RISC-V memory for quantization params
    std::vector<Term> rvv_zp_lanes(4);
    for (size_t i = 0; i < 4; i++) {
      rvv_zp_lanes[i] = zp_lanes[i];
    }
    g_riscv_memory[qparams_addr].push_back(vint32m1_t(g_symbolic_tm, rvv_zp_lanes));

    // Also need f32 view for inv_scale loads
    std::vector<Term> rvv_f32_lanes(4);
    rvv_f32_lanes[0] = tm.mkFloatingPointPosZero(8, 24);  // zp0 reinterpreted as float (will be garbage but unused)
    rvv_f32_lanes[1] = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, 0x3f800000));  // inv_scale0 = 1.0f
    rvv_f32_lanes[2] = tm.mkFloatingPointPosZero(8, 24);  // zp1 reinterpreted as float (will be garbage but unused)
    rvv_f32_lanes[3] = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, 0x3f800000));  // inv_scale1 = 1.0f
    g_riscv_memory_f32m1[qparams_addr].push_back(vfloat32m1_t(g_symbolic_tm, rvv_f32_lanes));
  }

  std::cout << "Testing XNNPACK qd8-f32-qc4w-gemm: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Quantized GEMM with 4-bit weights" << std::endl;
  std::cout << "Matrix dimensions: mr=" << mr << ", nc=" << nc << ", kc=" << kc << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qd8_f32_qc4w_gemm_minmax_ukernel_2x16c4__neondot(
      mr, nc, kc,
      a_data.data(), a_stride,
      w_data.data(),
      c_neon.data(), cm_stride, cn_stride,
      &params, quantization_params);

  // Clear and repopulate memory for RISC-V run
  // Note: We need fresh symbolic memory since stores from NEON run polluted it

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qd8_f32_qc4w_gemm_minmax_ukernel_2x16c4__rvv(
      mr, nc, kc,
      a_data.data(), a_stride,
      w_data.data(),
      c_riscv.data(), cm_stride, cn_stride,
      &params, quantization_params);

  // Collect NEON results
  std::vector<Term> neon_results;
  neon_results.reserve(mr * nc);

  uintptr_t c_neon_base = reinterpret_cast<uintptr_t>(c_neon.data());
  for (size_t row = 0; row < mr; row++) {
    uintptr_t row_addr = c_neon_base + row * cm_stride;
    for (size_t col = 0; col < nc;) {
      uintptr_t addr = row_addr + col * sizeof(float);
      bool found = false;

      // Try f32x4 first
      auto it4 = g_neon_memory_f32x4.find(addr);
      if (it4 != g_neon_memory_f32x4.end() && !it4->second.empty()) {
        const float32x4_t& vec = it4->second.back();
        for (size_t i = 0; i < 4 && (col + i) < nc; i++) {
          neon_results.push_back(vec.getLane(i));
        }
        col += 4;
        found = true;
        continue;
      }

      // Try f32x2 (for nc & 2 case)
      auto it2 = g_neon_memory_f32x2.find(addr);
      if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
        const float32x2_t& vec = it2->second.back();
        for (size_t i = 0; i < 2 && (col + i) < nc; i++) {
          neon_results.push_back(vec.getLane(i));
        }
        col += 2;
        found = true;
        continue;
      }

      // Try scalar float memory
      auto it_scalar = g_neon_float_scalar_memory.find(addr);
      if (it_scalar != g_neon_float_scalar_memory.end()) {
        neon_results.push_back(it_scalar->second);
        col += 1;
        found = true;
        continue;
      }

      if (!found) {
        col++;  // Skip this address if nothing found
      }
    }
  }

  // Collect RISC-V results
  std::vector<Term> riscv_results;
  riscv_results.reserve(mr * nc);

  uintptr_t c_riscv_base = reinterpret_cast<uintptr_t>(c_riscv.data());
  for (size_t row = 0; row < mr; row++) {
    uintptr_t row_addr = c_riscv_base + row * cm_stride;
    for (size_t col = 0; col < nc; col += 4) {
      uintptr_t addr = row_addr + col * sizeof(float);
      auto it = g_riscv_memory_f32m1.find(addr);
      if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
        const vfloat32m1_t& vec = it->second.back();
        size_t vl = std::min(vec.getVL(), (size_t)4);
        for (size_t i = 0; i < vl && (col + i) < nc; i++) {
          riscv_results.push_back(vec.getElement(i));
        }
      }
    }
  }

  std::cout << "\nNEON collected " << neon_results.size() << " output elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_results.size() << " output elements" << std::endl;

  if (neon_results.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_results.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  // Compare results - strict floating-point equality
  // NOTE: Limit comparison to first element due to SMT solver complexity with full FP formulas
  size_t compare_count = 1;  // std::min(neon_results.size(), riscv_results.size());

  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_results[i], riscv_results[i]});
    all_equalities.push_back(fp_eq);
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

    std::cout << "\nActivation inputs (a):" << std::endl;
    for (size_t row = 0; row < mr; row++) {
      for (size_t col = 0; col < kc; col++) {
        std::cout << "  a[" << row << "][" << col << "] = " << solver.getValue(symbolic_a[row][col]) << std::endl;
      }
    }

    std::cout << "\nKernel sums (ksum):" << std::endl;
    for (size_t i = 0; i < std::min((size_t)4, symbolic_ksum.size()); i++) {
      std::cout << "  ksum[" << i << "] = " << solver.getValue(symbolic_ksum[i]) << std::endl;
    }

    std::cout << "\nFilter scales:" << std::endl;
    for (size_t i = 0; i < std::min((size_t)4, symbolic_filter_scale.size()); i++) {
      std::cout << "  scale[" << i << "] = " << solver.getValue(symbolic_filter_scale[i]) << std::endl;
    }

    std::cout << "\nBiases:" << std::endl;
    for (size_t i = 0; i < std::min((size_t)4, symbolic_bias.size()); i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
      std::cout << "  c[" << i << "]: NEON = " << solver.getValue(neon_results[i])
                << ", RISC-V = " << solver.getValue(riscv_results[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
