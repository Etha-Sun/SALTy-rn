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
void xnn_qu8_dwconv_minmax_fp32_ukernel_9p32c__neon_mul16(
    size_t channels,
    size_t output_width,
    const uint8_t** input,
    const void* weights,
    uint8_t* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const uint8_t* zero,
    const union xnn_qu8_conv_minmax_params* params);

void xnn_qu8_dwconv_minmax_fp32_ukernel_9p32c__rvv_mul16(
    size_t channels,
    size_t output_width,
    const uint8_t** input,
    const void* weights,
    uint8_t* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const uint8_t* zero,
    const union xnn_qu8_conv_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Test parameters - 32 channels to match the kernel's processing size
  // Using small values to keep symbolic execution tractable
  constexpr size_t channels = 32;
  constexpr size_t output_width = 1;
  constexpr size_t kernel_size = 9;  // 3x3 depthwise convolution

  // Allocate input arrays (9 input rows for 3x3 kernel)
  uint8_t input_data[kernel_size][channels];
  const uint8_t* input_ptrs[kernel_size];
  for (size_t i = 0; i < kernel_size; i++) {
    std::fill(input_data[i], input_data[i] + channels, 0);
    input_ptrs[i] = input_data[i];
  }

  // Weight layout: 32 biases (int32) + 9 * 32 kernel weights (uint8)
  // Total: 32 * 4 + 9 * 32 = 128 + 288 = 416 bytes
  const size_t bias_count = 32;
  const size_t kernel_weights = kernel_size * channels;
  alignas(16) uint8_t weights_storage[bias_count * sizeof(int32_t) + kernel_weights];
  std::fill(weights_storage, weights_storage + sizeof(weights_storage), 0);

  // Output arrays
  uint8_t output_neon[channels] = {0};
  uint8_t output_riscv[channels] = {0};

  // Zero buffer for padding
  uint8_t zero_buffer[channels] = {0};

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs for all 9 input rows
  std::vector<std::vector<Term>> symbolic_inputs(kernel_size);
  for (size_t row = 0; row < kernel_size; row++) {
    symbolic_inputs[row] = createSymbolicArray(tm, channels, "in" + std::to_string(row), 8);
  }

  // Create symbolic weights (biases + kernel weights)
  std::vector<Term> symbolic_biases = createSymbolicArray(tm, bias_count, "bias", 32);
  std::vector<Term> symbolic_kernel_weights = createSymbolicArray(tm, kernel_weights, "kw", 8);

  // Populate NEON memory
  for (size_t row = 0; row < kernel_size; row++) {
    SymbolicNEONHelpers::populateMemoryU8(input_data[row], symbolic_inputs[row]);
  }
  SymbolicNEONHelpers::populateMemory32(reinterpret_cast<int32_t*>(weights_storage), symbolic_biases);
  SymbolicNEONHelpers::populateMemoryU8(weights_storage + bias_count * sizeof(int32_t), symbolic_kernel_weights);

  // Populate RISC-V memory
  for (size_t row = 0; row < kernel_size; row++) {
    SymbolicRISCVHelpers::populateMemoryU8(input_data[row], symbolic_inputs[row]);
  }
  SymbolicRISCVHelpers::populateMemory32(reinterpret_cast<int32_t*>(weights_storage), symbolic_biases);
  SymbolicRISCVHelpers::populateMemoryU8(weights_storage + bias_count * sizeof(int32_t), symbolic_kernel_weights);

  // Setup params struct with concrete test values
  union xnn_qu8_conv_minmax_params params;
  params.fp32_neon.kernel_zero_point = 128;  // Typical zero point for unsigned
  params.fp32_neon.scale = 1.0f;
  params.fp32_neon.magic_bias = 12582912.0f;  // 0x4B400000
  params.fp32_neon.magic_bias_less_output_zero_point = 12582912 - 128;  // magic_bias - output_zero_point
  params.fp32_neon.output_min = 0;
  params.fp32_neon.output_max = 255;

  std::cout << "Testing XNNPACK qu8_dwconv: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Kernel size: " << kernel_size << " (3x3 depthwise)" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  kernel_zero_point: " << (int)params.fp32_neon.kernel_zero_point << std::endl;
  std::cout << "  scale: " << params.fp32_neon.scale << std::endl;
  std::cout << "  output_min: " << (int)params.fp32_neon.output_min << std::endl;
  std::cout << "  output_max: " << (int)params.fp32_neon.output_max << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_qu8_dwconv_minmax_fp32_ukernel_9p32c__neon_mul16(
      channels,
      output_width,
      input_ptrs,
      weights_storage,
      output_neon,
      kernel_size * sizeof(uint8_t*),  // input_stride
      0,                                // output_increment
      0,                                // input_offset
      channels,                         // input_pixel_stride
      zero_buffer,
      &params);

  // Clear RISC-V memory and re-populate for fresh run
  SymbolicRISCVHelpers::clearMemory();
  for (size_t row = 0; row < kernel_size; row++) {
    SymbolicRISCVHelpers::populateMemoryU8(input_data[row], symbolic_inputs[row]);
  }
  SymbolicRISCVHelpers::populateMemory32(reinterpret_cast<int32_t*>(weights_storage), symbolic_biases);
  SymbolicRISCVHelpers::populateMemoryU8(weights_storage + bias_count * sizeof(int32_t), symbolic_kernel_weights);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_qu8_dwconv_minmax_fp32_ukernel_9p32c__rvv_mul16(
      channels,
      output_width,
      input_ptrs,
      weights_storage,
      output_riscv,
      kernel_size * sizeof(uint8_t*),  // input_stride
      0,                                // output_increment
      0,                                // input_offset
      channels,                         // input_pixel_stride
      zero_buffer,
      &params);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU8(output_neon, channels);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU8(output_riscv);

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

    // Print first few inputs from first row
    std::cout << "\nFirst input row (in0):" << std::endl;
    for (size_t i = 0; i < std::min((size_t)4, channels); i++) {
      std::cout << "  in0[" << i << "] = " << solver.getValue(symbolic_inputs[0][i]) << std::endl;
    }

    std::cout << "\nFirst few kernel weights:" << std::endl;
    for (size_t i = 0; i < std::min((size_t)4, kernel_weights); i++) {
      std::cout << "  kw[" << i << "] = " << solver.getValue(symbolic_kernel_weights[i]) << std::endl;
    }

    std::cout << "\nOutput comparison (first 8 elements):" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
      std::cout << "  NEON[" << i << "] = " << solver.getValue(neon_elements[i]) << std::endl;
      std::cout << "  RISC-V[" << i << "] = " << solver.getValue(riscv_elements[i]) << std::endl;
    }

    // Find which elements differ
    std::cout << "\nElements that differ:" << std::endl;
    for (size_t i = 0; i < compare_count; i++) {
      Term neon_val = solver.getValue(neon_elements[i]);
      Term riscv_val = solver.getValue(riscv_elements[i]);
      if (neon_val.toString() != riscv_val.toString()) {
        std::cout << "  [" << i << "] NEON=" << neon_val << " RISC-V=" << riscv_val << std::endl;
      }
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
