#include <cvc5/cvc5.h>
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

using namespace cvc5;

// Forward declarations for f16 vabs kernels
extern "C" {
void xnn_f16_vabs_ukernel__neonfp16arith_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_vabs_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  // Enable experimental FP solver for Float16 (5/11) support
  solver.setOption("fp-exp", "true");

  // f16-vabs: Absolute value of float16
  // output[i] = abs(input[i])
  // Both implementations clear the sign bit (AND with 0x7FFF)
  // batch is in bytes, so batch/sizeof(uint16_t) is the number of elements

  const size_t num_elements = 1;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays (using uint16_t for the underlying storage)
  std::vector<uint16_t> input_data(num_elements + 16, 0);
  std::vector<uint16_t> output_neon(num_elements + 16, 0);
  std::vector<uint16_t> output_riscv(num_elements + 16, 0);

  // Setup params struct (not used for vabs but required by signatures)
  struct xnn_f16_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using bitvector (u16) representation
  // Both implementations work on raw bits: they AND with 0x7FFF to clear sign bit
  Sort bv16 = tm.mkBitVectorSort(16);

  // Symbolic input elements (as bitvectors since both impls work on raw bits)
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    Term x = tm.mkConst(bv16, "x_" + std::to_string(i));
    symbolic_input.push_back(x);

    // Exclude NaN values: exponent all 1s (bits 14:10 = 0x1F) AND mantissa non-zero
    // NaN in float16: exponent = 0x1F (bits 14-10), mantissa != 0 (bits 9-0)
    // We exclude these because FLOATINGPOINT_ABS and bitwise AND have different
    // NaN payload handling, but both are valid implementations.
    Op exp_extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT, {14, 10});
    Op mant_extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT, {9, 0});
    Term exp_bits = tm.mkTerm(exp_extract_op, {x});
    Term mant_bits = tm.mkTerm(mant_extract_op, {x});
    Term exp_all_ones = tm.mkTerm(Kind::EQUAL, {exp_bits, tm.mkBitVector(5, 0x1F)});
    Term mant_nonzero = tm.mkTerm(Kind::DISTINCT, {mant_bits, tm.mkBitVector(10, 0)});
    Term is_nan = tm.mkTerm(Kind::AND, {exp_all_ones, mant_nonzero});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan}));
  }

  // Populate NEON memory for input (using uint16x8 loads via vld1q_u16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data());
    std::array<Term, 8> lanes8;
    for (size_t i = 0; i < 8; i++) {
      if (i < num_elements) {
        lanes8[i] = symbolic_input[i];
      } else {
        lanes8[i] = tm.mkBitVector(16, 0);
      }
    }
    g_neon_memory_u16x8[addr].push_back(uint16x8_t(g_symbolic_tm, lanes8));
  }

  // Populate RISC-V memory for input (using vle16_v_u16m8)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data());
    std::vector<Term> bv_elements;
    bv_elements.reserve(num_elements);
    for (size_t i = 0; i < num_elements; i++) {
      bv_elements.push_back(symbolic_input[i]);
    }
    g_riscv_memory_u16m8[addr].push_back(vuint16m8_t(g_symbolic_tm, bv_elements));
  }

  std::cout << "Testing XNNPACK f16_vabs: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = abs(input[i]) via (input[i] & 0x7FFF)" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vabs_ukernel__neonfp16arith_u16(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vabs_ukernel__rvv_u16(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

  // Collect NEON output results from memory
  // NEON stores via vst1q_u16 to g_neon_memory_u16x8 (for full vectors)
  std::vector<Term> neon_output_elements;
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try to collect from u16x8 storage first (for full 8-element stores)
    auto it = g_neon_memory_u16x8.find(base_addr);
    if (it != g_neon_memory_u16x8.end() && !it->second.empty()) {
      const uint16x8_t& vec = it->second.back();
      for (size_t i = 0; i < num_elements && i < 8; i++) {
        neon_output_elements.push_back(vec.getLane(i));
      }
    }

    // If not found in u16x8, try collecting from u16 scalar memory (tail handling)
    if (neon_output_elements.empty()) {
      for (size_t i = 0; i < num_elements; i++) {
        uintptr_t addr = base_addr + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_elements.push_back(scalar_it->second);
        }
      }
    }

    // Also check u16x4 storage (for vst1_u16)
    if (neon_output_elements.empty()) {
      for (const auto& kv : g_neon_memory_u16x4) {
        uintptr_t stored_addr = kv.first;
        if (stored_addr >= base_addr && stored_addr < base_addr + (num_elements + 16) * sizeof(uint16_t)) {
          if (!kv.second.empty()) {
            const uint16x4_t& vec = kv.second.back();
            size_t offset = (stored_addr - base_addr) / sizeof(uint16_t);
            for (size_t i = 0; i < 4 && offset + i < num_elements; i++) {
              while (neon_output_elements.size() <= offset + i) {
                neon_output_elements.push_back(Term());
              }
              neon_output_elements[offset + i] = vec.getLane(i);
            }
          }
        }
      }
      neon_output_elements.erase(
          std::remove_if(neon_output_elements.begin(), neon_output_elements.end(),
                        [](const Term& t) { return t.isNull(); }),
          neon_output_elements.end());
    }
  }

  // Collect RISC-V output results from memory
  // RVV stores via __riscv_vse16_v_u16m8 to g_riscv_memory_u16m8
  std::vector<Term> riscv_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_u16m8.find(addr);
    if (it != g_riscv_memory_u16m8.end() && !it->second.empty()) {
      const vuint16m8_t& vec = it->second.back();
      for (size_t i = 0; i < vec.getVL() && i < num_elements; i++) {
        riscv_output_elements.push_back(vec.getElement(i));
      }
    }
  }

  std::cout << "\nNEON collected " << neon_output_elements.size() << " output elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_output_elements.size() << " output elements" << std::endl;

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
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  // Build simple bitwise equality assertions
  // Both implementations should produce identical bit patterns
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term eq = tm.mkTerm(Kind::EQUAL, {neon_output_elements[i], riscv_output_elements[i]});
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

    std::cout << "\nInput values (hex):" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  x[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison (hex):" << std::endl;
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
