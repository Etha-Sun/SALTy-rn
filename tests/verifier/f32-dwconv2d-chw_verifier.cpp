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
void xnn_f32_dwconv2d_chw_ukernel_3x3p1__neon_1x4(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_dwconv2d_chw_ukernel_3x3p1__rvv_1x4(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Dwconv2d-chw parameters for 3x3p1 kernel
  // This is a 3x3 depthwise convolution with padding=1 on CHW layout
  // - 3x3 kernel (9 weights + 1 bias = 10 total)
  // - padding_top = 1
  // - Processes 4 output pixels at a time (1x4 tile)

  // Keep dimensions small for tractable verification
  // input_width is in BYTES (not pixels) per XNNPACK convention
  const size_t input_height = 1;      // Single row for simplicity
  const size_t input_width_pixels = 2; // 2 pixels wide (minimum for fast solving)
  const size_t input_width = input_width_pixels * sizeof(float);  // Width in bytes = 8
  const uint32_t padding_top = 1;

  // Weight layout: bias (1) + 3x3 kernel (9) = 10 floats
  const size_t weights_size = 10;

  // Input/output sizes
  // For CHW layout with padding=1, output has same spatial dimensions as input
  const size_t input_size = input_height * input_width_pixels;
  const size_t output_size = input_height * input_width_pixels;

  // Allocate arrays (with extra space for OOB reads)
  std::vector<float> input_data(input_size + 16, 0.0f);
  std::vector<float> zero_buffer(input_width_pixels + 16, 0.0f);
  std::vector<float> weights(weights_size + 16, 0.0f);
  std::vector<float> output_neon(output_size + 16, 0.0f);
  std::vector<float> output_riscv(output_size + 16, 0.0f);

  // Setup min/max params (no clamping for verification)
  xnn_f32_minmax_params params;
  params.scalar.min = -std::numeric_limits<float>::infinity();
  params.scalar.max = std::numeric_limits<float>::infinity();

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(input_size);
  for (size_t i = 0; i < input_size; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Create symbolic weights
  // Layout: [bias, k00, k01, k02, k10, k11, k12, k20, k21, k22]
  std::vector<Term> symbolic_weights;
  symbolic_weights.reserve(weights_size);
  for (size_t i = 0; i < weights_size; i++) {
    symbolic_weights.push_back(tm.mkConst(fp32, "w_" + std::to_string(i)));
  }

  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Populate NEON memory with symbolic input values
  // The kernel loads 4 floats at a time using vld1q_f32
  for (size_t i = 0; i < input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < input_size) {
        lanes[j] = symbolic_input[i + j];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate NEON memory for weights
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < weights_size) {
        lanes[j] = symbolic_weights[i + j];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate NEON memory for zero buffer
  for (size_t i = 0; i < input_width_pixels + 8; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(zero_buffer.data() + i);
    std::array<Term, 4> zero_lanes = {zero, zero, zero, zero};
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, zero_lanes));
  }

  // Populate RISC-V memory with same symbolic values
  for (size_t i = 0; i < input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {  // vl can be up to 8 for f32m1
      if (i + j < input_size) {
        chunk.push_back(symbolic_input[i + j]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for weights
  for (size_t i = 0; i < weights_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      if (i + j < weights_size) {
        chunk.push_back(symbolic_weights[i + j]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for zero buffer
  for (size_t i = 0; i < input_width_pixels + 8; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(zero_buffer.data() + i);
    std::vector<Term> zero_chunk(8, zero);
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, zero_chunk));
  }

  // Populate NEON u32 memory for mask table access
  // The mask table is: {-1, -1, -1, -1, 0, 0, 0}
  // Kernel computes index as: 3 - (((input_width >> 2) - 1) & 3)
  // For input_width=16 bytes: index = 3 - ((4-1) & 3) = 3 - 3 = 0
  // So it loads from mask_table[0] = {-1, -1, -1, -1}
  static const int32_t mask_table[7] = {-1, -1, -1, -1, 0, 0, 0};
  for (size_t i = 0; i < 7; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&mask_table[i]);
    std::array<Term, 4> mask_lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < 7) {
        mask_lanes[j] = tm.mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(mask_table[i + j])));
      } else {
        mask_lanes[j] = tm.mkBitVector(32, 0);
      }
    }
    g_neon_memory_u32x4[addr].push_back(uint32x4_t(g_symbolic_tm, mask_lanes));
  }

  std::cout << "Testing XNNPACK f32_dwconv2d_chw_3x3p1: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Input height: " << input_height << std::endl;
  std::cout << "Input width (pixels): " << input_width_pixels << std::endl;
  std::cout << "Input width (bytes): " << input_width << std::endl;
  std::cout << "Weights: " << weights_size << " floats (bias + 3x3 kernel)" << std::endl;
  std::cout << "Output size: " << output_size << " floats" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  xnn_f32_dwconv2d_chw_ukernel_3x3p1__neon_1x4(
      input_height, input_width,
      input_data.data(), weights.data(), zero_buffer.data(),
      output_neon.data(), padding_top, &params);

  // Clear RISC-V output memory before running
  // (input memory is already populated)

  // Run RISC-V implementation
  xnn_f32_dwconv2d_chw_ukernel_3x3p1__rvv_1x4(
      input_height, input_width,
      input_data.data(), weights.data(), zero_buffer.data(),
      output_riscv.data(), padding_top, &params);

  // Collect float32 results from NEON
  std::vector<Term> neon_output_elements;
  for (size_t i = 0; i < output_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data() + i);

    // Check f32x4 memory (stores 4 floats at a time)
    auto it = g_neon_memory_f32x4.find(addr);
    if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
      neon_output_elements.push_back(it->second.back().getLane(0));
      continue;
    }

    // Check if we're within a previous f32x4 store
    bool found = false;
    for (size_t offset = 1; offset <= 3 && !found; offset++) {
      if (i >= offset) {
        uintptr_t prev_addr = reinterpret_cast<uintptr_t>(output_neon.data() + i - offset);
        auto it_prev = g_neon_memory_f32x4.find(prev_addr);
        if (it_prev != g_neon_memory_f32x4.end() && !it_prev->second.empty()) {
          neon_output_elements.push_back(it_prev->second.back().getLane(offset));
          found = true;
        }
      }
    }

    // Check f32x2 memory (stores 2 floats)
    if (!found) {
      auto it2 = g_neon_memory_f32x2.find(addr);
      if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
        neon_output_elements.push_back(it2->second.back().getLane(0));
        found = true;
      }
    }

    // Check if within previous f32x2 store
    if (!found && i >= 1) {
      uintptr_t prev_addr = reinterpret_cast<uintptr_t>(output_neon.data() + i - 1);
      auto it_prev = g_neon_memory_f32x2.find(prev_addr);
      if (it_prev != g_neon_memory_f32x2.end() && !it_prev->second.empty()) {
        neon_output_elements.push_back(it_prev->second.back().getLane(1));
        found = true;
      }
    }

    if (!found) {
      std::cerr << "WARNING: NEON output[" << i << "] not found in memory" << std::endl;
    }
  }

  // Collect float32 results from RISC-V
  std::vector<Term> riscv_output_elements;
  for (size_t i = 0; i < output_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data() + i);

    // Check vector memory (stores up to 8 floats at a time)
    auto it = g_riscv_memory_f32m1.find(addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
      riscv_output_elements.push_back(it->second.back().getElement(0));
      continue;
    }

    // Check if we're within a previous vector store
    bool found = false;
    for (size_t offset = 1; offset <= 7 && !found; offset++) {
      if (i >= offset) {
        uintptr_t prev_addr = reinterpret_cast<uintptr_t>(output_riscv.data() + i - offset);
        auto it_prev = g_riscv_memory_f32m1.find(prev_addr);
        if (it_prev != g_riscv_memory_f32m1.end() && !it_prev->second.empty()) {
          riscv_output_elements.push_back(it_prev->second.back().getElement(offset));
          found = true;
        }
      }
    }

    if (!found) {
      std::cerr << "WARNING: RISC-V output[" << i << "] not found in memory" << std::endl;
    }
  }

  if (neon_output_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_output_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "NEON outputs collected: " << neon_output_elements.size() << std::endl;
  std::cout << "RISC-V outputs collected: " << riscv_output_elements.size() << std::endl;

  // Compare outputs
  size_t compare_count = std::min(neon_output_elements.size(), riscv_output_elements.size());

  if (neon_output_elements.size() != riscv_output_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_output_elements.size() << ", RISC-V: " << riscv_output_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " floats" << std::endl;
  }

  // Build equality assertions (NaN-aware)
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_elements[i], riscv_output_elements[i]});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_output_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_output_elements[i]});
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

  solver.assertFormula(not_equal);
  Result result = solver.checkSat();

  if (result.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are equivalent." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    for (size_t i = 0; i < input_size; i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nWeight values:" << std::endl;
    for (size_t i = 0; i < weights_size; i++) {
      std::cout << "  weight[" << i << "] = " << solver.getValue(symbolic_weights[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < compare_count; i++) {
      std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_output_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_output_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
