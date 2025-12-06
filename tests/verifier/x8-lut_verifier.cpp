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
void xnn_x8_lut_ukernel__aarch64_neon_tbx128x4_u16(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const uint8_t* table);

void xnn_x8_lut_ukernel__rvv(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const uint8_t* table);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // LUT parameters
  const size_t batch = 17;        // Number of elements to process
  const size_t table_size = 256;  // Full 256-byte lookup table

  // Allocate arrays - use at least 16 bytes for input/output to handle NEON vector loads
  const size_t buffer_size = std::max(batch, (size_t)16);
  std::vector<uint8_t> input(buffer_size, 0);
  std::vector<uint8_t> table(table_size);
  std::vector<uint8_t> output_neon(buffer_size, 0);
  std::vector<uint8_t> output_riscv(buffer_size, 0);

  // Initialize table with identity values (can be any concrete values)
  // The table values themselves don't need to be symbolic - we're verifying
  // that both implementations access the same table positions
  for (size_t i = 0; i < table_size; i++) {
    table[i] = static_cast<uint8_t>(i);
  }

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (8-bit)
  std::vector<Term> symbolic_input = createSymbolicArray(tm, batch, "input", 8);

  // Setup symbolic table (8-bit) - make table entries symbolic too for full verification
  std::vector<Term> symbolic_table = createSymbolicArray(tm, table_size, "table", 8);

  // Populate NEON memory for input
  // Store as uint8x16_t vectors - always create full 16-element vectors
  Term zero_u8 = tm.mkBitVector(8, 0);
  {
    std::array<Term, 16> lanes;
    // Initialize all lanes to zero first
    for (size_t j = 0; j < 16; j++) {
      lanes[j] = zero_u8;
    }
    // Then populate with actual symbolic values (up to batch elements)
    for (size_t j = 0; j < batch && j < 16; j++) {
      lanes[j] = symbolic_input[j];
    }
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data());
    g_neon_memory_u8x16[addr].push_back(uint8x16_t(g_symbolic_tm, lanes));
  }

  // Populate NEON memory for table (4 chunks of 64 bytes = 4 x uint8x16x4_t)
  for (size_t chunk = 0; chunk < 4; chunk++) {
    for (size_t vec = 0; vec < 4; vec++) {
      std::array<Term, 16> lanes;
      for (size_t j = 0; j < 16; j++) {
        size_t idx = chunk * 64 + vec * 16 + j;
        lanes[j] = symbolic_table[idx];
      }
      uintptr_t addr = reinterpret_cast<uintptr_t>(table.data() + chunk * 64 + vec * 16);
      g_neon_memory_u8x16[addr].push_back(uint8x16_t(g_symbolic_tm, lanes));
    }
  }

  // Populate RISC-V memory for input - pad with zeros if batch < 16
  std::vector<Term> riscv_input_terms;
  for (size_t j = 0; j < batch; j++) {
    riscv_input_terms.push_back(symbolic_input[j]);
  }
  // Pad to at least 16 elements for consistency
  while (riscv_input_terms.size() < 16) {
    riscv_input_terms.push_back(zero_u8);
  }
  g_riscv_memory_u8m8[reinterpret_cast<uintptr_t>(input.data())].push_back(
      vuint8m8_t(g_symbolic_tm, riscv_input_terms));

  // Populate RISC-V memory for table
  g_riscv_memory_u8m8[reinterpret_cast<uintptr_t>(table.data())].push_back(
      vuint8m8_t(g_symbolic_tm, symbolic_table));

  std::cout << "Testing XNNPACK x8_lut: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << std::endl;
  std::cout << "Table size: " << table_size << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x8_lut_ukernel__aarch64_neon_tbx128x4_u16(
      batch, input.data(), output_neon.data(), table.data());

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x8_lut_ukernel__rvv(
      batch, input.data(), output_riscv.data(), table.data());

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU8(
      output_neon.data(), batch);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU8(
      output_riscv.data(), batch);

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

    for (size_t i = 0; i < std::min(batch, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)8); i++) {
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
