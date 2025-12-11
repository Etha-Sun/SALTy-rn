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
void xnn_f32_dwconv_minmax_ukernel_4p8c__neon(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_dwconv_minmax_ukernel_4p8c__rvv(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Dwconv parameters - use small values to keep verification tractable
  // This is a depthwise convolution with:
  //   4p = 4 filter rows (kernel height)
  //   8c = processes 8 channels at a time
  const size_t channels = 8;        // Number of channels (must be >= 8 for main loop)
  const size_t output_width = 2;    // Single output column for simplicity
  const size_t kernel_height = 4;   // 4p means 4 filter rows
 
  // Calculate memory sizes
  // Weight layout for 4p8c: bias (8 floats) + 4 rows * 8 channels kernel weights
  // For c >= 8 path: w starts at bias, then:
  //   vk0 at w+8, vk1 at w+16, vk2 at w+24, vk3 at w+32
  // Total: 8 (bias) + 4*8 (kernels) = 40 floats per 8-channel block
  const size_t weights_size = 8 + kernel_height * 8;  // 40 floats
  const size_t input_size_per_row = channels;
  // For output_width > 1, we need kernel_height input rows per output pixel
  const size_t num_input_rows = kernel_height * output_width;
  const size_t total_input_size = num_input_rows * input_size_per_row;
  const size_t output_size = channels * output_width;

  // Allocate arrays
  std::vector<float> input_data(total_input_size + 16, 0.0f);  // Extra for OOB reads
  std::vector<float> zero_buffer(channels + 16, 0.0f);
  std::vector<float> weights(weights_size + 16, 0.0f);
  std::vector<float> output_neon(output_size, 0.0f);
  std::vector<float> output_riscv(output_size, 0.0f);

  // Input pointers array: need kernel_height pointers per output_width iteration
  // The kernel advances input by input_stride after each output pixel
  std::vector<const float*> input_ptrs(num_input_rows);
  for (size_t i = 0; i < num_input_rows; i++) {
    input_ptrs[i] = input_data.data() + i * input_size_per_row;
  }

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
  symbolic_input.reserve(total_input_size);
  for (size_t i = 0; i < total_input_size; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Create symbolic weights
  std::vector<Term> symbolic_weights;
  symbolic_weights.reserve(weights_size);
  for (size_t i = 0; i < weights_size; i++) {
    symbolic_weights.push_back(tm.mkConst(fp32, "w_" + std::to_string(i)));
  }

  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Populate NEON memory with symbolic input values
  // Each input row is contiguous in memory
  for (size_t row = 0; row < num_input_rows; row++) {
    const float* row_ptr = input_ptrs[row];
    for (size_t i = 0; i < input_size_per_row; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(row_ptr + i);
      std::array<Term, 4> lanes;
      for (size_t j = 0; j < 4; j++) {
        size_t global_idx = row * input_size_per_row + i + j;
        if (i + j < input_size_per_row && global_idx < total_input_size) {
          lanes[j] = symbolic_input[global_idx];
        } else {
          lanes[j] = zero;
        }
      }
      g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
    }
  }

  // Populate NEON memory for weights at every possible offset
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

  // Populate RISC-V memory with same symbolic values
  for (size_t row = 0; row < num_input_rows; row++) {
    const float* row_ptr = input_ptrs[row];
    for (size_t i = 0; i < input_size_per_row; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(row_ptr + i);
      std::vector<Term> chunk;
      for (size_t j = 0; j < 8; j++) {  // vl=8 for f32m1
        size_t global_idx = row * input_size_per_row + i + j;
        if (i + j < input_size_per_row && global_idx < total_input_size) {
          chunk.push_back(symbolic_input[global_idx]);
        } else {
          chunk.push_back(zero);
        }
      }
      g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
    }
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

  // Populate zero buffer for both NEON and RISC-V
  for (size_t i = 0; i < channels; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(zero_buffer.data() + i);
    std::array<Term, 4> zero_lanes = {zero, zero, zero, zero};
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, zero_lanes));
    std::vector<Term> zero_chunk(8, zero);
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, zero_chunk));
  }

  // Setup params memory for vld1q_dup_f32 (NEON uses vector min/max)
  uintptr_t min_addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
  uintptr_t max_addr = reinterpret_cast<uintptr_t>(&params.scalar.max);
  Term neg_inf = tm.mkFloatingPointNegInf(8, 24);
  Term pos_inf = tm.mkFloatingPointPosInf(8, 24);
  std::array<Term, 4> min_lanes = {neg_inf, neg_inf, neg_inf, neg_inf};
  std::array<Term, 4> max_lanes = {pos_inf, pos_inf, pos_inf, pos_inf};
  g_neon_memory_f32x4[min_addr].push_back(float32x4_t(g_symbolic_tm, min_lanes));
  g_neon_memory_f32x4[max_addr].push_back(float32x4_t(g_symbolic_tm, max_lanes));

  std::cout << "Testing XNNPACK f32_dwconv_minmax_4p8c: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Output width: " << output_width << std::endl;
  std::cout << "Kernel height: " << kernel_height << std::endl;
  std::cout << "Weights: " << weights_size << " floats" << std::endl;

  // Debug: verify memory is populated for all rows
  std::cout << "Verifying memory population:" << std::endl;
  for (size_t row = 0; row < num_input_rows; row++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_ptrs[row]);
    bool neon_found = g_neon_memory_f32x4.find(addr) != g_neon_memory_f32x4.end();
    bool riscv_found = g_riscv_memory_f32m1.find(addr) != g_riscv_memory_f32m1.end();
    std::cout << "  Row " << row << " at addr " << addr
              << ": NEON=" << neon_found << " RVV=" << riscv_found << std::endl;
  }

  // Kernel parameters
  const intptr_t input_stride = kernel_height * sizeof(float*);  // Advance by 4 pointers
  const size_t output_increment = 0;  // No gap between output rows
  const size_t input_offset = 0;      // No offset from input pointers
  // Set input_pixel_stride = 0 so each output pixel uses separate input rows (input_ptrs[0..3], then [4..7])
  // rather than the same rows with an offset
  const size_t input_pixel_stride = 0;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  const float** input_ptr = input_ptrs.data();
  xnn_f32_dwconv_minmax_ukernel_4p8c__neon(
      channels, output_width,
      input_ptr, weights.data(), output_neon.data(),
      input_stride, output_increment, input_offset, input_pixel_stride,
      zero_buffer.data(), &params);

  // Run RISC-V implementation
  input_ptr = input_ptrs.data();
  xnn_f32_dwconv_minmax_ukernel_4p8c__rvv(
      channels, output_width,
      input_ptr, weights.data(), output_riscv.data(),
      input_stride, output_increment, input_offset, input_pixel_stride,
      zero_buffer.data(), &params);

  // Collect float32 results from NEON
  // Output is stored as consecutive floats
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

    if (!found) {
      // Check scalar memory
      auto it_scalar = g_neon_float_scalar_memory.find(addr);
      if (it_scalar != g_neon_float_scalar_memory.end()) {
        neon_output_elements.push_back(it_scalar->second);
      }
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
      // Check scalar memory
      auto it_scalar = g_riscv_float_scalar_memory.find(addr);
      if (it_scalar != g_riscv_float_scalar_memory.end()) {
        riscv_output_elements.push_back(it_scalar->second);
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

    for (size_t i = 0; i < std::min(total_input_size, (size_t)16); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nWeight values:" << std::endl;
    for (size_t i = 0; i < std::min(weights_size, (size_t)16); i++) {
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
