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
void xnn_qs8_dwconv_minmax_fp32_ukernel_9p8c__neon_mul16(
    size_t channels,
    size_t output_width,
    const int8_t** input,
    const void* weights,
    int8_t* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const int8_t* zero,
    const union xnn_qs8_conv_minmax_params* params);

void xnn_qs8_dwconv_minmax_fp32_ukernel_9p8c__rvv(
    size_t channels,
    size_t output_width,
    const int8_t** input,
    const void* weights,
    int8_t* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const int8_t* zero,
    const union xnn_qs8_conv_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters for depthwise convolution
  // 9p8c means: 9-tap filter (3x3 kernel), processing 8 channels at a time
  const size_t channels = 17;      // Number of output channels - testing remainder path (11 = 8 + 3)
  const size_t output_width = 1;  // Process one output pixel
  const size_t kernel_size = 9;   // 3x3 kernel = 9 taps

  // Calculate weights size dynamically
  // XNNPACK packed weights layout for 9p8c dwconv:
  // For each block of 8 channels:
  //   - 8 biases (32 bytes)
  //   - 8 kernel weights for tap 0 (8 bytes)
  //   - 8 kernel weights for tap 1 (8 bytes)
  //   - ...
  //   - 8 kernel weights for tap 8 (8 bytes)
  // Total per block: 32 + kernel_size*8 = 104 bytes for 9-tap
  const size_t block_size = 8;  // 8 channels per block
  const size_t num_blocks = (channels + block_size - 1) / block_size;
  const size_t bytes_per_block = block_size * sizeof(int32_t) + kernel_size * block_size;
  const size_t weights_size = num_blocks * bytes_per_block;

  // Dynamically allocate input arrays (kernel_size input rows)
  std::vector<std::vector<int8_t>> input_data(kernel_size, std::vector<int8_t>(channels, 0));
  std::vector<const int8_t*> input_ptrs(kernel_size);
  for (size_t i = 0; i < kernel_size; i++) {
    input_ptrs[i] = input_data[i].data();
  }

  // Dynamically allocate weights
  std::vector<int8_t> weights(weights_size, 0);

  // Dynamically allocate output buffers
  std::vector<int8_t> output_neon(channels, 0);
  std::vector<int8_t> output_riscv(channels, 0);

  // Zero buffer for padding detection
  std::vector<int8_t> zero_buffer(channels, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs for all kernel_size input rows
  std::vector<std::vector<Term>> symbolic_inputs(kernel_size);
  for (size_t k = 0; k < kernel_size; k++) {
    symbolic_inputs[k] = createSymbolicArray(tm, channels, "in" + std::to_string(k) + "_", 8);
  }

  // Create symbolic weights for bias (32-bit) and kernel (8-bit)
  std::vector<Term> symbolic_bias = createSymbolicArray(tm, channels, "bias_", 32);
  std::vector<std::vector<Term>> symbolic_kernel(kernel_size);
  for (size_t k = 0; k < kernel_size; k++) {
    symbolic_kernel[k] = createSymbolicArray(tm, channels, "k" + std::to_string(k) + "_", 8);
  }

  // Populate NEON memory with symbolic inputs
  for (size_t k = 0; k < kernel_size; k++) {
    SymbolicNEONHelpers::populateMemory8(input_data[k].data(), symbolic_inputs[k]);
  }

  // Populate NEON memory with weights using packed layout
  // For each block of 8 channels: biases, then kernel weights for all taps
  for (size_t block = 0; block < num_blocks; block++) {
    size_t block_offset = block * bytes_per_block;
    size_t ch_start = block * block_size;
    size_t ch_end = std::min(ch_start + block_size, channels);
    (void)ch_end; // unused but kept for clarity

    // Biases for this block (always populate 8, even if fewer channels remain)
    std::vector<Term> block_biases;
    for (size_t c = 0; c < block_size; c++) {
      if (ch_start + c < channels) {
        block_biases.push_back(symbolic_bias[ch_start + c]);
      } else {
        // Padding - use zero
        block_biases.push_back(g_symbolic_tm->mkBitVector(32, 0));
      }
    }
    SymbolicNEONHelpers::populateMemory32(
        reinterpret_cast<int32_t*>(weights.data() + block_offset), block_biases);

    // Kernel weights for each tap
    for (size_t k = 0; k < kernel_size; k++) {
      size_t tap_offset = block_offset + block_size * sizeof(int32_t) + k * block_size;
      std::vector<Term> block_kernel;
      for (size_t c = 0; c < block_size; c++) {
        if (ch_start + c < channels) {
          block_kernel.push_back(symbolic_kernel[k][ch_start + c]);
        } else {
          block_kernel.push_back(g_symbolic_tm->mkBitVector(8, 0));
        }
      }
      SymbolicNEONHelpers::populateMemory8(weights.data() + tap_offset, block_kernel);
    }
  }

  // Populate RISC-V memory with same symbolic inputs
  for (size_t k = 0; k < kernel_size; k++) {
    SymbolicRISCVHelpers::populateMemory8(input_data[k].data(), symbolic_inputs[k]);
  }

  // Populate RISC-V memory with weights using ITERATION-BASED layout
  // RVV kernel processes channels in a loop with variable vl:
  //   - First iteration: vl = min(VLMAX, channels) = 8 for 11 channels
  //   - Second iteration: vl = remaining = 3
  // Each iteration reads: vl biases (4 bytes each), then 9 taps * vl weights (1 byte each)
  //
  // Layout per iteration: [vl biases][vl k0][vl k1]...[vl k8]
  // Bytes per iteration: vl * 4 + 9 * vl = vl * 13

  // Calculate total size needed for iteration-based layout
  const size_t vlmax = 8;  // Simulated VLMAX for e32m1
  size_t rvv_weights_size = 0;
  size_t remaining = channels;
  while (remaining > 0) {
    size_t vl = std::min(remaining, vlmax);
    rvv_weights_size += vl * sizeof(int32_t) + kernel_size * vl;
    remaining -= vl;
  }

  std::vector<int8_t> weights_rvv(rvv_weights_size, 0);

  // Populate RVV weights in iteration order
  size_t offset = 0;
  size_t ch_idx = 0;
  while (ch_idx < channels) {
    size_t vl = std::min(channels - ch_idx, vlmax);

    // Biases for this iteration
    std::vector<Term> iter_biases;
    for (size_t c = 0; c < vl; c++) {
      iter_biases.push_back(symbolic_bias[ch_idx + c]);
    }
    SymbolicRISCVHelpers::populateMemory32(
        reinterpret_cast<int32_t*>(weights_rvv.data() + offset), iter_biases);
    offset += vl * sizeof(int32_t);

    // Kernel weights for each tap
    for (size_t k = 0; k < kernel_size; k++) {
      std::vector<Term> iter_kernel;
      for (size_t c = 0; c < vl; c++) {
        iter_kernel.push_back(symbolic_kernel[k][ch_idx + c]);
      }
      SymbolicRISCVHelpers::populateMemory8(weights_rvv.data() + offset, iter_kernel);
      offset += vl;
    }

    ch_idx += vl;
  }

  // Setup params struct with concrete test values
  // Uses magic bias technique for float-to-int conversion
  union xnn_qs8_conv_minmax_params params;
  params.fp32_neon.scale = 1.0f;
  params.fp32_neon.magic_bias = 12582912.0f;  // 1.5 * 2^23
  params.fp32_neon.magic_bias_less_output_zero_point = 12582912 - 0;  // magic_bias - output_zero_point
  params.fp32_neon.output_min = -128;
  params.fp32_neon.output_max = 127;

  std::cout << "Testing XNNPACK qs8_dwconv: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Kernel: " << kernel_size << "p" << channels << "c ("
            << kernel_size << "-tap depthwise convolution, " << channels << " channels)" << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Kernel size: " << kernel_size << std::endl;
  std::cout << "Output width: " << output_width << std::endl;
  std::cout << "Weights size: " << weights_size << " bytes" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  scale: " << params.fp32_neon.scale << std::endl;
  std::cout << "  magic_bias: " << params.fp32_neon.magic_bias << std::endl;
  std::cout << "  magic_bias_less_output_zero_point: " << params.fp32_neon.magic_bias_less_output_zero_point << std::endl;
  std::cout << "  output_min: " << (int)params.fp32_neon.output_min << std::endl;
  std::cout << "  output_max: " << (int)params.fp32_neon.output_max << std::endl;

  g_current_params_ptr = nullptr;

  // Kernel parameters
  const intptr_t input_stride = kernel_size * sizeof(int8_t*);  // Stride between input pointer arrays
  const size_t output_increment = 0;  // No additional increment after output_width
  const size_t input_offset = 0;      // No input offset
  const size_t input_pixel_stride = channels;  // Stride between input pixels

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qs8_dwconv_minmax_fp32_ukernel_9p8c__neon_mul16(
      channels,
      output_width,
      input_ptrs.data(),
      weights.data(),
      output_neon.data(),
      input_stride,
      output_increment,
      input_offset,
      input_pixel_stride,
      zero_buffer.data(),
      &params);

  // Run RISC-V implementation (uses linear weight layout)
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qs8_dwconv_minmax_fp32_ukernel_9p8c__rvv(
      channels,
      output_width,
      input_ptrs.data(),
      weights_rvv.data(),  // Use linear layout weights for RVV
      output_riscv.data(),
      input_stride,
      output_increment,
      input_offset,
      input_pixel_stride,
      zero_buffer.data(),
      &params);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(output_neon.data(), channels);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(output_riscv.data());

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

    // Print first few inputs from each kernel tap
    for (size_t k = 0; k < std::min(kernel_size, (size_t)3); k++) {
      std::cout << "  Input row " << k << ":" << std::endl;
      for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
        std::cout << "    in" << k << "[" << i << "] = " << solver.getValue(symbolic_inputs[k][i]) << std::endl;
      }
    }

    std::cout << "\n  Bias values:" << std::endl;
    for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
      std::cout << "    bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }
    // Also print bias[8] if it exists (for remainder path debugging)
    if (channels > 8) {
      std::cout << "    bias[8] = " << solver.getValue(symbolic_bias[8]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, channels); i++) {
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
