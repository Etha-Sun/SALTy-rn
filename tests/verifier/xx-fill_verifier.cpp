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
void xnn_xx_fill_ukernel__neon_u64(
    size_t rows,
    size_t channels,
    void* output,
    size_t output_stride,
    const uint32_t fill_pattern);

void xnn_xx_fill_ukernel__rvv(
    size_t rows,
    size_t channels,
    void* output,
    size_t output_stride,
    const uint32_t fill_pattern);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Fill parameters - test various sizes
  const size_t rows = 3;
  const size_t channels = 67;  // Odd size to test tail handling
  const size_t output_stride = channels + 8;  // Add some padding between rows
  const uint32_t fill_pattern = 0xDEADBEEF;

  // Calculate buffer size (rows * output_stride to account for stride)
  const size_t buffer_size = rows * output_stride;

  // Allocate output buffers for NEON and RISC-V
  // Use uint8_t since the kernel operates on bytes
  std::vector<uint8_t> output_neon(buffer_size, 0);
  std::vector<uint8_t> output_riscv(buffer_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic fill pattern
  Term symbolic_fill = tm.mkConst(tm.mkBitVectorSort(32), "fill_pattern");

  // Constrain fill_pattern to a specific value for deterministic testing
  // Or leave unconstrained for full symbolic verification
  Term fill_constraint = tm.mkTerm(Kind::EQUAL, 
      {symbolic_fill, tm.mkBitVector(32, fill_pattern)});
  solver.assertFormula(fill_constraint);

  std::cout << "Testing XNNPACK xx_fill: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Rows: " << rows << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Output stride: " << output_stride << std::endl;
  std::cout << "Fill pattern: 0x" << std::hex << fill_pattern << std::dec << std::endl;
  std::cout << "Buffer size: " << buffer_size << " bytes" << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_xx_fill_ukernel__neon_u64(
      rows, channels, output_neon.data(), output_stride, fill_pattern);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_xx_fill_ukernel__rvv(
      rows, channels, output_riscv.data(), output_stride, fill_pattern);

  // Collect results from both architectures
  // NEON stores U8, RISC-V stores U32 (main loop) + U8 (tail)
  std::vector<Term> neon_elements;
  std::vector<Term> riscv_elements;

  for (size_t row = 0; row < rows; row++) {
    uint8_t* neon_row = output_neon.data() + row * output_stride;
    uint8_t* riscv_row_u8 = output_riscv.data() + row * output_stride;
    uint32_t* riscv_row_u32 = reinterpret_cast<uint32_t*>(riscv_row_u8);

    // Collect NEON U8 results
    std::vector<Term> neon_row_results = SymbolicNEONHelpers::collectResultsU8(
        neon_row, channels);

    std::vector<Term> riscv_row_results;
    
    // Calculate how many full U32 words vs tail bytes
    size_t num_full_words = channels / 4;  // Full 4-byte words
    size_t tail_bytes = channels % 4;       // Remaining 0-3 bytes
    
    // Collect U32 results from main loop and extract bytes
    if (num_full_words > 0) {
      std::vector<Term> riscv_u32_results = SymbolicRISCVHelpers::collectResultsU32(
          riscv_row_u32, num_full_words);
      
      for (size_t w = 0; w < riscv_u32_results.size(); w++) {
        Term word = riscv_u32_results[w];
        for (int byte_idx = 0; byte_idx < 4; byte_idx++) {
          // Extract byte from word: word[8*(byte_idx+1)-1 : 8*byte_idx]
          Op extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT,
              {static_cast<uint32_t>(8 * (byte_idx + 1) - 1), static_cast<uint32_t>(8 * byte_idx)});
          Term byte_term = tm.mkTerm(extract_op, {word});
          riscv_row_results.push_back(byte_term);
        }
      }
    }
    
    // Collect tail U8 results (stored via U8m1 vector stores)
    if (tail_bytes > 0) {
      uint8_t* tail_ptr = riscv_row_u8 + num_full_words * 4;
      std::vector<Term> riscv_tail_results = SymbolicRISCVHelpers::collectResultsU8(
          tail_ptr, tail_bytes);
      riscv_row_results.insert(riscv_row_results.end(), 
          riscv_tail_results.begin(), riscv_tail_results.end());
    }

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
    std::cout << "Fill pattern value that causes different outputs:" << std::endl;
    std::cout << "  fill_pattern = " << solver.getValue(symbolic_fill) << std::endl;

    std::cout << "\nOutput comparison (first 32 bytes):" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)32); i++) {
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
