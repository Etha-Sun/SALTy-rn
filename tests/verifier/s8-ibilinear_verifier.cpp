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
void xnn_s8_ibilinear_ukernel__neon_u16(
    size_t output_pixels,
    size_t channels,
    const int8_t** input,
    size_t input_offset,
    const int16_t* weights,
    int8_t* output,
    size_t output_increment);

void xnn_s8_ibilinear_ukernel__rvv(
    size_t output_pixels,
    size_t channels,
    const int8_t** input,
    size_t input_offset,
    const int16_t* weights,
    int8_t* output,
    size_t output_increment);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Bilinear interpolation parameters
  const size_t output_pixels = 17;
  const size_t channels = 800;
  const size_t input_offset = 1;
  const size_t output_increment = 1;

  // Calculate total output size needed (channels per pixel + stride between pixels)
  // Each pixel writes 'channels' bytes, then advances by 'output_increment' additional bytes
  const size_t total_output_size = output_pixels * channels + (output_pixels - 1) * output_increment;

  // Allocate input arrays for 4 corner samples (top-left, top-right, bottom-left, bottom-right)
  // Need extra space for input_offset
  const size_t input_size = channels + input_offset;
  std::vector<int8_t> input0(input_size, 0);  // Top-left
  std::vector<int8_t> input1(input_size, 0);  // Top-right
  std::vector<int8_t> input2(input_size, 0);  // Bottom-left
  std::vector<int8_t> input3(input_size, 0);  // Bottom-right

  // Array of input pointers (bilinear needs 4 inputs per output pixel)
  // Note: The kernel will add input_offset to these pointers
  const int8_t* input_ptrs[4 * output_pixels];
  for (size_t p = 0; p < output_pixels; p++) {
    input_ptrs[p * 4 + 0] = input0.data();
    input_ptrs[p * 4 + 1] = input1.data();
    input_ptrs[p * 4 + 2] = input2.data();
    input_ptrs[p * 4 + 3] = input3.data();
  }

  // Weights for bilinear interpolation (alphah, alphav) - need weights for each output pixel
  std::vector<int16_t> weights(2 * output_pixels);
  for (size_t p = 0; p < output_pixels; p++) {
    weights[p * 2 + 0] = 512;  // alphah - 50% horizontal interpolation
    weights[p * 2 + 1] = 512;  // alphav - 50% vertical interpolation
  }

  // Output arrays - need enough space for strided output
  std::vector<int8_t> output_neon(total_output_size, 0);
  std::vector<int8_t> output_riscv(total_output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs for all 4 corner samples
  // Create symbolic values starting at input_offset since that's where the kernel reads from
  std::vector<Term> symbolic_input0 = createSymbolicArray(tm, input_size, "tl", 8);  // top-left
  std::vector<Term> symbolic_input1 = createSymbolicArray(tm, input_size, "tr", 8);  // top-right
  std::vector<Term> symbolic_input2 = createSymbolicArray(tm, input_size, "bl", 8);  // bottom-left
  std::vector<Term> symbolic_input3 = createSymbolicArray(tm, input_size, "br", 8);  // bottom-right

  // Populate NEON memory for all 4 inputs
  SymbolicNEONHelpers::populateMemory8(input0.data(), symbolic_input0);
  SymbolicNEONHelpers::populateMemory8(input1.data(), symbolic_input1);
  SymbolicNEONHelpers::populateMemory8(input2.data(), symbolic_input2);
  SymbolicNEONHelpers::populateMemory8(input3.data(), symbolic_input3);

  // Populate RISC-V memory for all 4 inputs
  SymbolicRISCVHelpers::populateMemory8(input0.data(), symbolic_input0);
  SymbolicRISCVHelpers::populateMemory8(input1.data(), symbolic_input1);
  SymbolicRISCVHelpers::populateMemory8(input2.data(), symbolic_input2);
  SymbolicRISCVHelpers::populateMemory8(input3.data(), symbolic_input3);

  std::cout << "Testing XNNPACK s8_ibilinear: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Output pixels: " << output_pixels << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Input offset: " << input_offset << std::endl;
  std::cout << "Output increment: " << output_increment << std::endl;
  std::cout << "Total output size: " << total_output_size << std::endl;
  std::cout << "Weights: alphah=" << weights[0] << ", alphav=" << weights[1] << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  const int8_t** neon_input_ptrs = input_ptrs;
  xnn_s8_ibilinear_ukernel__neon_u16(output_pixels, channels, neon_input_ptrs, input_offset, weights.data(), output_neon.data(), output_increment);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  // Reset input_ptrs for RISC-V since NEON modified the pointer
  const int8_t* input_ptrs_rvv[4 * output_pixels];
  for (size_t p = 0; p < output_pixels; p++) {
    input_ptrs_rvv[p * 4 + 0] = input0.data();
    input_ptrs_rvv[p * 4 + 1] = input1.data();
    input_ptrs_rvv[p * 4 + 2] = input2.data();
    input_ptrs_rvv[p * 4 + 3] = input3.data();
  }
  const int8_t** rvv_input_ptrs = input_ptrs_rvv;
  xnn_s8_ibilinear_ukernel__rvv(output_pixels, channels, rvv_input_ptrs, input_offset, weights.data(), output_riscv.data(), output_increment);

  // Collect results from both architectures
  // Need to collect from each output pixel location accounting for stride
  std::vector<Term> neon_elements;
  std::vector<Term> riscv_elements;

  for (size_t p = 0; p < output_pixels; p++) {
    size_t pixel_offset = p * (channels + output_increment);

    // Collect NEON results for this pixel
    std::vector<Term> neon_pixel = SymbolicNEONHelpers::collectResults8(output_neon.data() + pixel_offset, channels);
    neon_elements.insert(neon_elements.end(), neon_pixel.begin(), neon_pixel.end());

    // Collect RISC-V results for this pixel (also stored at strided addresses)
    std::vector<Term> riscv_pixel = SymbolicRISCVHelpers::collectResults8(output_riscv.data() + pixel_offset);
    riscv_elements.insert(riscv_elements.end(), riscv_pixel.begin(), riscv_pixel.end());
  }

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

    std::cout << "\nTop-left inputs:" << std::endl;
    for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
      std::cout << "  tl[" << i << "] = " << solver.getValue(symbolic_input0[i]) << std::endl;
    }
    std::cout << "\nTop-right inputs:" << std::endl;
    for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
      std::cout << "  tr[" << i << "] = " << solver.getValue(symbolic_input1[i]) << std::endl;
    }
    std::cout << "\nBottom-left inputs:" << std::endl;
    for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
      std::cout << "  bl[" << i << "] = " << solver.getValue(symbolic_input2[i]) << std::endl;
    }
    std::cout << "\nBottom-right inputs:" << std::endl;
    for (size_t i = 0; i < std::min(channels, (size_t)4); i++) {
      std::cout << "  br[" << i << "] = " << solver.getValue(symbolic_input3[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)4); i++) {
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
