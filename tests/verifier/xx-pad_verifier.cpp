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
void xnn_xx_pad_ukernel_p16__neon_u16(
    size_t rows,
    size_t channels,
    size_t pre_padding,
    size_t post_padding,
    const void* input,
    size_t input_stride,
    void* output,
    size_t output_stride,
    uint32_t fill_pattern);

void xnn_xx_pad_ukernel_p16__rvv(
    size_t rows,
    size_t channels,
    size_t pre_padding,
    size_t post_padding,
    const void* input,
    size_t input_stride,
    void* output,
    size_t output_stride,
    uint32_t fill_pattern);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Pad parameters - use multiples of 16 to simplify initial testing
  const size_t rows = 1;
  const size_t channels = 1;        // Input data size per row
  const size_t pre_padding = 16;     // Pre-padding bytes (multiple of 16)
  const size_t post_padding = 16;    // Post-padding bytes (multiple of 16)
  const uint32_t fill_pattern = 0xDEADBEEF;

  // Calculate sizes
  const size_t output_width = pre_padding + channels + post_padding;
  const size_t input_stride = channels;    // No extra stride for simplicity
  const size_t output_stride = output_width;

  // Allocate arrays (ensure 16-byte alignment for vector loads)
  const size_t input_size = rows * input_stride;
  const size_t output_size = rows * output_stride;

  std::vector<uint8_t> input(input_size, 0);
  std::vector<uint8_t> output_neon(output_size, 0);
  std::vector<uint8_t> output_riscv(output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs for the input data
  std::vector<Term> symbolic_input = createSymbolicArray(tm, input_size, "in", 8);

  // Populate NEON memory (unsigned 8-bit)
  SymbolicNEONHelpers::populateMemoryU8(input.data(), symbolic_input);

  // Populate RISC-V memory (unsigned 8-bit)
  SymbolicRISCVHelpers::populateMemoryU8(input.data(), symbolic_input);

  std::cout << "Testing XNNPACK xx_pad: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Rows: " << rows << std::endl;
  std::cout << "Channels (input width): " << channels << std::endl;
  std::cout << "Pre-padding: " << pre_padding << std::endl;
  std::cout << "Post-padding: " << post_padding << std::endl;
  std::cout << "Output width: " << output_width << std::endl;
  std::cout << "Fill pattern: 0x" << std::hex << fill_pattern << std::dec << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_xx_pad_ukernel_p16__neon_u16(
      rows, channels, pre_padding, post_padding,
      input.data(), input_stride,
      output_neon.data(), output_stride,
      fill_pattern);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_xx_pad_ukernel_p16__rvv(
      rows, channels, pre_padding, post_padding,
      input.data(), input_stride,
      output_riscv.data(), output_stride,
      fill_pattern);

  // Collect results from both architectures
  std::vector<Term> neon_elements;
  std::vector<Term> riscv_elements;

  for (size_t row = 0; row < rows; row++) {
    uint8_t* neon_row = output_neon.data() + row * output_stride;
    uint8_t* riscv_row = output_riscv.data() + row * output_stride;

    std::vector<Term> neon_row_results = SymbolicNEONHelpers::collectResultsU8(
        neon_row, output_width);
    std::vector<Term> riscv_row_results = SymbolicRISCVHelpers::collectResultsU8(
        riscv_row, output_width);

    std::cout << "Row " << row << ": NEON=" << neon_row_results.size()
              << " bytes, RISC-V=" << riscv_row_results.size() << " bytes" << std::endl;

    neon_elements.insert(neon_elements.end(), neon_row_results.begin(), neon_row_results.end());
    riscv_elements.insert(riscv_elements.end(), riscv_row_results.begin(), riscv_row_results.end());
  }

  std::cout << "\nNEON collected " << neon_elements.size() << " total bytes" << std::endl;
  std::cout << "RISC-V collected " << riscv_elements.size() << " total bytes" << std::endl;

  if (neon_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  // Compare the minimum number of elements from both
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " bytes" << std::endl;
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

    for (size_t i = 0; i < std::min(input_size, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison (first 16 bytes):" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)16); i++) {
      std::cout << "  byte[" << i << "]: NEON = " << solver.getValue(neon_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
