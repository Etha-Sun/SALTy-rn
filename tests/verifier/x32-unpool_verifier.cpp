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
void xnn_x32_unpool_ukernel__neon(
    size_t kernel_elements,
    size_t channels,
    uint32_t fill,
    const uint32_t* input,
    const uint32_t* index,
    uint32_t** output);

void xnn_x32_unpool_ukernel__rvv(
    size_t kernel_elements,
    size_t channels,
    uint32_t fill,
    const uint32_t* input,
    const uint32_t* index,
    uint32_t** output);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Unpool parameters
  const size_t kernel_elements = 12;  
  const size_t channels = 17;         
  const uint32_t fill = 0xDEADBEEF;  

  // Calculate buffer sizes
  // Each output buffer has `channels` elements
  const size_t output_buffer_size = channels;

  // Allocate input array (channels elements)
  std::vector<uint32_t> input(channels, 0);

  // Allocate index array (channels elements, each index < kernel_elements)
  std::vector<uint32_t> index(channels);
  // Initialize indices to valid values (0 to kernel_elements-1)
  for (size_t i = 0; i < channels; i++) {
    index[i] = i % kernel_elements;
  }

  // Allocate output buffers for NEON (one per kernel element)
  std::vector<std::vector<uint32_t>> output_buffers_neon(kernel_elements);
  std::vector<uint32_t*> output_ptrs_neon(kernel_elements);
  for (size_t i = 0; i < kernel_elements; i++) {
    output_buffers_neon[i].resize(output_buffer_size, 0);
    output_ptrs_neon[i] = output_buffers_neon[i].data();
  }

  // Allocate output buffers for RISC-V (one per kernel element)
  std::vector<std::vector<uint32_t>> output_buffers_riscv(kernel_elements);
  std::vector<uint32_t*> output_ptrs_riscv(kernel_elements);
  for (size_t i = 0; i < kernel_elements; i++) {
    output_buffers_riscv[i].resize(output_buffer_size, 0);
    output_ptrs_riscv[i] = output_buffers_riscv[i].data();
  }

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (32-bit)
  std::vector<Term> symbolic_input = createSymbolicArray(tm, channels, "input", 32);
  std::vector<Term> symbolic_index = createSymbolicArray(tm, channels, "index", 32);

  // Constrain indices to be valid (0 to kernel_elements-1)
  for (size_t i = 0; i < channels; i++) {
    Term max_val = tm.mkBitVector(32, kernel_elements - 1);
    Term constraint = tm.mkTerm(Kind::BITVECTOR_ULE, {symbolic_index[i], max_val});
    solver.assertFormula(constraint);
  }

  // Populate NEON memory for input and index arrays
  SymbolicNEONHelpers::populateMemoryU32(input.data(), symbolic_input);
  SymbolicNEONHelpers::populateMemoryU32(index.data(), symbolic_index);

  // Populate RISC-V memory for input and index arrays
  SymbolicRISCVHelpers::populateMemoryU32(input.data(), symbolic_input);
  SymbolicRISCVHelpers::populateMemoryU32(index.data(), symbolic_index);

  std::cout << "Testing XNNPACK x32_unpool: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Kernel elements: " << kernel_elements << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Fill value: 0x" << std::hex << fill << std::dec << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x32_unpool_ukernel__neon(
      kernel_elements, channels, fill,
      input.data(), index.data(), output_ptrs_neon.data());

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x32_unpool_ukernel__rvv(
      kernel_elements, channels, fill,
      input.data(), index.data(), output_ptrs_riscv.data());

  // Collect results from both architectures
  // Each output buffer has `channels` elements
  std::vector<Term> neon_elements;
  std::vector<Term> riscv_elements;

  for (size_t buf = 0; buf < kernel_elements; buf++) {
    std::vector<Term> neon_buf = SymbolicNEONHelpers::collectResultsU32(
        output_ptrs_neon[buf], output_buffer_size);
    std::vector<Term> riscv_buf = SymbolicRISCVHelpers::collectResultsU32(
        output_ptrs_riscv[buf], output_buffer_size);

    std::cout << "Buffer " << buf << ": NEON=" << neon_buf.size()
              << " elements, RISC-V=" << riscv_buf.size() << " elements" << std::endl;

    neon_elements.insert(neon_elements.end(), neon_buf.begin(), neon_buf.end());
    riscv_elements.insert(riscv_elements.end(), riscv_buf.begin(), riscv_buf.end());
  }

  std::cout << "\nNEON collected " << neon_elements.size() << " total elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_elements.size() << " total elements" << std::endl;

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

    for (size_t i = 0; i < std::min(channels, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
      std::cout << "  index[" << i << "] = " << solver.getValue(symbolic_index[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)16); i++) {
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
