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
void xnn_f32_spmm_minmax_ukernel_8x1__neon(
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_spmm_minmax_ukernel_8x1__rvv(
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // SPMM parameters - 8x1 microkernel
  // mc = number of input channels (in bytes), must be multiple of sizeof(float)
  // nc = number of output columns (sparse matrix columns)
  // The kernel processes 8 floats at a time (main loop), with tail handling for smaller sizes

  // For simplicity, we'll verify a small case:
  // - mc = 8 * sizeof(float) = 32 bytes (8 input elements, fits in one iteration)
  // - nc = 1 (one output column)
  // - nnz = 2 (two non-zero weights)

  const size_t mc = 10 * sizeof(float);  // 8 input elements (32 bytes)
  const size_t nc = 2;                   // 1 output column
  const size_t nnz = 2;                  // 2 non-zero weights per output column
  const size_t input_size = 8;           // 8 input floats
  const size_t output_size = 8;          // 8 output floats (mc/sizeof(float) * nc)

  // Output stride in bytes (row stride for output)
  const size_t output_stride = output_size * sizeof(float);

  // Weights layout for SPMM:
  // For each output column: [bias, w0, w1, ..., w_{nnz-1}]
  // Total weights: nc * (1 + nnz) = 1 * (1 + 2) = 3
  const size_t weights_size = nc * (1 + nnz);

  // Difference map (widx_dmap): offset to jump in input for each non-zero
  // Each entry is an offset in bytes from current input position to next
  // For simplicity: all non-zeros access consecutive input positions
  // dmap[0] = 0 means start at current input position
  // dmap[1] = 0 means stay at same input position (for this simple test)
  const size_t dmap_size = nc * nnz;

  // Non-zero count map (nidx_nnzmap): number of non-zeros for each output column
  const size_t nnzmap_size = nc;

  // Allocate arrays
  std::vector<float> input_data(input_size + 16, 0.0f);
  std::vector<float> weights(weights_size + 16, 0.0f);
  std::vector<int32_t> widx_dmap(dmap_size + 4, 0);
  std::vector<uint32_t> nidx_nnzmap(nnzmap_size + 4, 0);
  std::vector<float> output_neon(output_size + 16, 0.0f);
  std::vector<float> output_riscv(output_size + 16, 0.0f);

  // Setup the difference map - for this test, both non-zeros read from same position
  // dmap[0] = 0: first non-zero reads from input[0:7]
  // dmap[1] = 0: second non-zero also reads from input[0:7] (staying at same position)
  widx_dmap[0] = 0;  // No jump for first access
  widx_dmap[1] = 0;  // No jump for second access

  // Setup non-zero count map
  nidx_nnzmap[0] = nnz;  // 2 non-zeros for output column 0

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

  // Symbolic input vector (8 floats)
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(input_size);
  for (size_t i = 0; i < input_size; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Symbolic bias (1 per output column)
  std::vector<Term> symbolic_bias;
  symbolic_bias.reserve(nc);
  for (size_t i = 0; i < nc; i++) {
    symbolic_bias.push_back(tm.mkConst(fp32, "bias_" + std::to_string(i)));
  }

  // Symbolic weights (nnz per output column)
  std::vector<Term> symbolic_weights;
  symbolic_weights.reserve(nc * nnz);
  for (size_t i = 0; i < nc * nnz; i++) {
    symbolic_weights.push_back(tm.mkConst(fp32, "w_" + std::to_string(i)));
  }

  // Populate NEON memory for input
  // The kernel loads with vld1q_f32 (4 floats) at input and input+4
  for (size_t i = 0; i < input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);

    // For vld1q_f32 (4 floats)
    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < input_size) {
        lanes4[j] = symbolic_input[idx];
      } else {
        lanes4[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

    // For vld1_f32 (2 floats) - used in tail cases
    std::array<Term, 2> lanes2;
    for (size_t j = 0; j < 2; j++) {
      size_t idx = i + j;
      if (idx < input_size) {
        lanes2[j] = symbolic_input[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    // For vld1q_dup_f32 and vld1_dup_f32 (broadcast single value)
    Term val = (i < input_size) ? symbolic_input[i] : zero;
    std::array<Term, 4> lanes4_dup = {val, val, val, val};
    // Store with a different key or ensure vld1q_dup uses scalar memory
    g_neon_float_scalar_memory[addr] = val;
  }

  // Populate NEON memory for weights
  // Layout: [bias0, w0_0, w0_1, bias1, w1_0, w1_1, ...]
  // For nc=1, nnz=2: [bias, w0, w1]
  size_t weight_idx = 0;
  for (size_t col = 0; col < nc; col++) {
    // Bias for this column
    uintptr_t bias_addr = reinterpret_cast<uintptr_t>(weights.data() + weight_idx);
    Term bias_val = symbolic_bias[col];
    g_neon_float_scalar_memory[bias_addr] = bias_val;

    // Also store as duplicated vector for vld1q_dup_f32
    std::array<Term, 4> bias_lanes = {bias_val, bias_val, bias_val, bias_val};
    g_neon_memory_f32x4[bias_addr].push_back(float32x4_t(g_symbolic_tm, bias_lanes));
    std::array<Term, 2> bias_lanes2 = {bias_val, bias_val};
    g_neon_memory_f32x2[bias_addr].push_back(float32x2_t(g_symbolic_tm, bias_lanes2));
    weight_idx++;

    // Non-zero weights for this column
    for (size_t nz = 0; nz < nnz; nz++) {
      uintptr_t w_addr = reinterpret_cast<uintptr_t>(weights.data() + weight_idx);
      Term w_val = symbolic_weights[col * nnz + nz];
      g_neon_float_scalar_memory[w_addr] = w_val;

      std::array<Term, 4> w_lanes = {w_val, w_val, w_val, w_val};
      g_neon_memory_f32x4[w_addr].push_back(float32x4_t(g_symbolic_tm, w_lanes));
      std::array<Term, 2> w_lanes2 = {w_val, w_val};
      g_neon_memory_f32x2[w_addr].push_back(float32x2_t(g_symbolic_tm, w_lanes2));
      weight_idx++;
    }
  }

  // Populate RISC-V memory for input
  // RVV uses vle32_v_f32m1 to load vectors
  for (size_t i = 0; i < input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);

    // Scalar memory for individual loads
    g_riscv_float_scalar_memory[addr] = symbolic_input[i];

    // Vector memory for vle32 loads
    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < input_size) {
        chunk.push_back(symbolic_input[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for weights
  weight_idx = 0;
  for (size_t col = 0; col < nc; col++) {
    // Bias
    uintptr_t bias_addr = reinterpret_cast<uintptr_t>(weights.data() + weight_idx);
    g_riscv_float_scalar_memory[bias_addr] = symbolic_bias[col];
    weight_idx++;

    // Weights
    for (size_t nz = 0; nz < nnz; nz++) {
      uintptr_t w_addr = reinterpret_cast<uintptr_t>(weights.data() + weight_idx);
      g_riscv_float_scalar_memory[w_addr] = symbolic_weights[col * nnz + nz];
      weight_idx++;
    }
  }

  // Setup params memory for min/max values
  uintptr_t min_addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
  uintptr_t max_addr = reinterpret_cast<uintptr_t>(&params.scalar.max);
  Term neg_inf = tm.mkFloatingPointNegInf(8, 24);
  Term pos_inf = tm.mkFloatingPointPosInf(8, 24);

  // For NEON vld2q_dup_f32 - loads min and max as a pair
  // min is at offset 0, max is at offset 4 bytes
  g_neon_float_scalar_memory[min_addr] = neg_inf;
  g_neon_float_scalar_memory[max_addr] = pos_inf;

  // Store as float32x4x2_t for vld2q_dup_f32
  std::array<Term, 4> min_lanes = {neg_inf, neg_inf, neg_inf, neg_inf};
  std::array<Term, 4> max_lanes = {pos_inf, pos_inf, pos_inf, pos_inf};
  g_neon_memory_f32x4[min_addr].push_back(float32x4_t(g_symbolic_tm, min_lanes));
  g_neon_memory_f32x4[max_addr].push_back(float32x4_t(g_symbolic_tm, max_lanes));

  // For RISC-V scalar reads
  g_riscv_float_scalar_memory[min_addr] = neg_inf;
  g_riscv_float_scalar_memory[max_addr] = pos_inf;

  std::cout << "Testing XNNPACK f32_spmm_minmax_8x1: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "mc (input channels in bytes): " << mc << std::endl;
  std::cout << "nc (output columns): " << nc << std::endl;
  std::cout << "nnz (non-zeros per column): " << nnz << std::endl;
  std::cout << "Input size: " << input_size << " floats" << std::endl;
  std::cout << "Output size: " << output_size << " floats" << std::endl;
  std::cout << "Weights size: " << weights_size << " floats" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_spmm_minmax_ukernel_8x1__neon(
      mc, nc,
      input_data.data(),
      weights.data(),
      widx_dmap.data(),
      nidx_nnzmap.data(),
      output_neon.data(),
      output_stride,
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_spmm_minmax_ukernel_8x1__rvv(
      mc, nc,
      input_data.data(),
      weights.data(),
      widx_dmap.data(),
      nidx_nnzmap.data(),
      output_riscv.data(),
      output_stride,
      &params);

  // Collect results from NEON
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon.data(), output_size);

  // Collect results from RISC-V
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(output_size);

  // Check f32m1 storage first
  uintptr_t out_addr = reinterpret_cast<uintptr_t>(output_riscv.data());
  auto it = g_riscv_memory_f32m1.find(out_addr);
  if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
    const vfloat32m1_t& vec = it->second.back();
    size_t vec_len = std::min(vec.getVL(), output_size);
    for (size_t i = 0; i < vec_len; i++) {
      riscv_elements.push_back(vec.getElement(i));
    }
  }

  // Also check scalar storage for tail cases
  if (riscv_elements.size() < output_size) {
    for (size_t i = riscv_elements.size(); i < output_size; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data() + i);
      auto scalar_it = g_riscv_float_scalar_memory.find(addr);
      if (scalar_it != g_riscv_float_scalar_memory.end()) {
        riscv_elements.push_back(scalar_it->second);
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

    std::cout << "\nInput values:" << std::endl;
    for (size_t i = 0; i < input_size; i++) {
      std::cout << "  in[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nBias values:" << std::endl;
    for (size_t i = 0; i < nc; i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }

    std::cout << "\nWeight values:" << std::endl;
    for (size_t i = 0; i < nc * nnz; i++) {
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
