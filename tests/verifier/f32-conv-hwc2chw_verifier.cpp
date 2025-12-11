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
void xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__neon_2x2(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__rvv_2x2(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Conv parameters - use small values to keep verification tractable
  // This is a 3x3 stride 2, padding 1 convolution
  // Input: HWC format with 3 channels
  // Output: CHW format with output_channels channels
  const size_t input_height = 5;     // Small input height
  const size_t input_width = 5;      // Small input width (must be >= 4 for main loop)
  const size_t input_channels = 3;   // Fixed at 3 for this kernel
  const size_t output_channels = 4;  // Process 4 output channels at a time
  const size_t output_y_start = 0;
  const size_t output_y_end = 2;     // Process 2 output rows
  const size_t input_padding_top = 1;

  // Calculate derived sizes
  const size_t output_width = (input_width + 1) / 2;  // stride 2
  const size_t output_height = (input_height + 1) / 2;
  const size_t input_size = input_height * input_width * input_channels;
  // Only count outputs that the kernel actually produces (based on output_y_start/end)
  const size_t actual_output_rows = output_y_end - output_y_start;
  const size_t output_buffer_size = output_channels * output_height * output_width;

  // Weight size: 3x3 kernel, 3 input channels, output_channels outputs
  // Layout: bias (4) + 27 kernel weights per output channel group
  // For this kernel: 4 (bias) + 3*3*3*4 = 4 + 108 = 112 floats per output channel block
  const size_t weights_size = 112;

  // Strides
  const size_t output_height_stride = output_width * sizeof(float);
  const size_t output_channel_stride = output_height * output_width * sizeof(float);

  // Calculate extra memory needed for OOB reads
  // The kernel loads 4 floats at a time, so we need to round up each row to multiple of 4
  // Plus extra padding for any OOB reads in the tail path
  const size_t row_stride = input_width * input_channels;
  const size_t padded_row_size = ((row_stride + 15) / 4) * 4;  // Round up to next 16-byte boundary + extra
  const size_t padded_input_size = input_height * padded_row_size + 16;  // Extra padding at end

  // Allocate arrays with extra space for OOB reads
  std::vector<float> input(padded_input_size, 0.0f);
  std::vector<float> zero_buffer(input_width * input_channels, 0.0f);
  std::vector<float> weights(weights_size, 0.0f);
  std::vector<float> output_neon(output_buffer_size, 0.0f);
  std::vector<float> output_riscv(output_buffer_size, 0.0f);

  // Setup min/max params
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
  std::vector<Term> symbolic_weights;
  symbolic_weights.reserve(weights_size);
  for (size_t i = 0; i < weights_size; i++) {
    symbolic_weights.push_back(tm.mkConst(fp32, "w_" + std::to_string(i)));
  }

  // Populate NEON memory with symbolic input values
  // Input is in HWC format: input[h][w][c]
  // The kernel loads 4 floats at a time (vld1q_f32), and advances pointer by 4
  // CRITICAL: The kernel can start loads at ANY offset, not just multiples of 4!
  // With input_width=5, input_channels=3, row_stride=15:
  //   Row 0 starts at offset 0, Row 1 at offset 15, Row 2 at offset 30...
  // The kernel reads from row-based offsets, so we must populate memory at
  // EVERY possible starting offset the kernel might use.
  Term zero = tm.mkFloatingPointPosZero(8, 24);


  for (size_t i = 0; i < padded_input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < input_size) {
        lanes[j] = symbolic_input[i + j];
      } else {
        lanes[j] = zero;  // OOB reads get zero
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate NEON memory for weights
  for (size_t i = 0; i < weights_size; i += 4) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4 && (i + j) < weights_size; j++) {
      lanes[j] = symbolic_weights[i + j];
    }
    // Pad with zeros if needed
    for (size_t j = std::min((size_t)4, weights_size - i); j < 4; j++) {
      lanes[j] = zero;
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory with same symbolic values - at EVERY possible offset
  // Same as NEON: kernel can start loads at any offset, not just multiples of 4
  for (size_t i = 0; i < padded_input_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < input_size) {
        chunk.push_back(symbolic_input[i + j]);
      } else {
        chunk.push_back(zero);  // OOB reads get zero
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for weights
  for (size_t i = 0; i < weights_size; i += 4) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights.data() + i);
    std::vector<Term> chunk;
    for (size_t j = 0; j < 4 && (i + j) < weights_size; j++) {
      chunk.push_back(symbolic_weights[i + j]);
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate zero buffer for both NEON and RISC-V (used for padding)
  // Populate at EVERY offset since kernel can start loads anywhere
  const size_t zero_buffer_size = input_width * input_channels;
  for (size_t i = 0; i < zero_buffer_size; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(zero_buffer.data() + i);
    std::array<Term, 4> zero_lanes = {zero, zero, zero, zero};
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, zero_lanes));
    std::vector<Term> zero_chunk = {zero, zero, zero, zero};
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, zero_chunk));
  }

  // Setup params memory for vld1q_dup_f32
  uintptr_t min_addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
  uintptr_t max_addr = reinterpret_cast<uintptr_t>(&params.scalar.max);
  Term neg_inf = tm.mkFloatingPointNegInf(8, 24);
  Term pos_inf = tm.mkFloatingPointPosInf(8, 24);
  std::array<Term, 4> min_lanes = {neg_inf, neg_inf, neg_inf, neg_inf};
  std::array<Term, 4> max_lanes = {pos_inf, pos_inf, pos_inf, pos_inf};
  g_neon_memory_f32x4[min_addr].push_back(float32x4_t(g_symbolic_tm, min_lanes));
  g_neon_memory_f32x4[max_addr].push_back(float32x4_t(g_symbolic_tm, max_lanes));

  std::cout << "Testing XNNPACK f32_conv_hwc2chw: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Input: " << input_height << "x" << input_width << "x" << input_channels << std::endl;
  std::cout << "Output: " << output_channels << "x" << output_height << "x" << output_width << std::endl;
  std::cout << "Weights: " << weights_size << " floats" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__neon_2x2(
      input_height, input_width,
      output_y_start, output_y_end,
      input.data(), zero_buffer.data(), weights.data(),
      output_neon.data(),
      input_padding_top, output_channels,
      output_height_stride, output_channel_stride,
      &params);

  // Run RISC-V implementation
  xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__rvv_2x2(
      input_height, input_width,
      output_y_start, output_y_end,
      input.data(), zero_buffer.data(), weights.data(),
      output_riscv.data(),
      input_padding_top, output_channels,
      output_height_stride, output_channel_stride,
      &params);

  // Collect float32 results from NEON
  // Output is in CHW format: output[channel][height][width]
  // The kernel stores 2 output rows at a time (output_y_start to output_y_end)
  // For each channel, outputs are at: base + channel * channel_stride_floats + row * row_stride_floats + col
  std::vector<Term> neon_output_elements;
  const size_t channel_stride_floats = output_channel_stride / sizeof(float);  // floats per channel
  const size_t row_stride_floats = output_height_stride / sizeof(float);       // floats per row

  // Iterate in logical order: for each row, for each column, for each channel
  for (size_t row = 0; row < actual_output_rows; row++) {
    for (size_t col = 0; col < output_width; col++) {
      for (size_t ch = 0; ch < output_channels; ch++) {
        size_t idx = ch * channel_stride_floats + row * row_stride_floats + col;
        uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data() + idx);

        // Check scalar float memory first (for tail path)
        auto it_scalar = g_neon_float_scalar_memory.find(addr);
        if (it_scalar != g_neon_float_scalar_memory.end()) {
          neon_output_elements.push_back(it_scalar->second);
          continue;
        }

        // Try f32x2 - stores 2 consecutive elements
        bool found = false;
        auto it2 = g_neon_memory_f32x2.find(addr);
        if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
          neon_output_elements.push_back(it2->second.back().getLane(0));
          found = true;
        }
        if (!found) {
          // Check if previous address has a f32x2 that covers us
          uintptr_t prev_addr = reinterpret_cast<uintptr_t>(output_neon.data() + idx - 1);
          auto it2_prev = g_neon_memory_f32x2.find(prev_addr);
          if (idx > 0 && it2_prev != g_neon_memory_f32x2.end() && !it2_prev->second.empty()) {
            neon_output_elements.push_back(it2_prev->second.back().getLane(1));
          }
        }
      }
    }
  }

  // Collect float32 results from RISC-V (scalar stores)
  std::vector<Term> riscv_output_elements;
  for (size_t row = 0; row < actual_output_rows; row++) {
    for (size_t col = 0; col < output_width; col++) {
      for (size_t ch = 0; ch < output_channels; ch++) {
        size_t idx = ch * channel_stride_floats + row * row_stride_floats + col;
        uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data() + idx);

        auto it_scalar = g_riscv_float_scalar_memory.find(addr);
        if (it_scalar != g_riscv_float_scalar_memory.end()) {
          riscv_output_elements.push_back(it_scalar->second);
        }
      }
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

    for (size_t i = 0; i < std::min(input_size, (size_t)12); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nWeight values:" << std::endl;
    for (size_t i = 0; i < std::min(weights_size, (size_t)8); i++) {
      std::cout << "  weight[" << i << "] = " << solver.getValue(symbolic_weights[i]) << std::endl;
    }

    std::cout << "\nOutput comparison (first 16 floats):" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)16); i++) {
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
