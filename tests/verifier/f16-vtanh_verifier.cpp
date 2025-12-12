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

// Forward declarations for f16 vtanh kernels
extern "C" {
void xnn_f16_vtanh_ukernel__aarch64_neonfp16arith_expm1minus_rr1_p3h2ts_div_u16(
    size_t n,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_vtanh_ukernel__rvv_expm1minus_rr1_p3h2ts_div(
    size_t n,
    const xnn_float16* input,
    xnn_float16* output);
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

  // f16-vtanh: Hyperbolic tangent activation function
  // output[i] = tanh(input[i])
  // batch is in bytes, so batch/sizeof(uint16_t) is the number of elements

  const size_t num_elements = 8;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays (using uint16_t for the underlying storage)
  std::vector<uint16_t> input_data(num_elements + 16, 0);
  std::vector<uint16_t> output_neon(num_elements + 16, 0);
  std::vector<uint16_t> output_riscv(num_elements + 16, 0);

  // Setup params struct (not used for vtanh but required by NEON signature)
  struct xnn_f16_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using float16 sort (5-bit exponent, 11-bit significand)
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Term zero_f16 = tm.mkFloatingPointPosZero(5, 11);

  // Symbolic input elements
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    Term x = tm.mkConst(fp16, "x_" + std::to_string(i));
    symbolic_input.push_back(x);

    // Constrain inputs to be non-NaN and non-Inf (implementation-defined behavior)
    Term is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x});
    Term is_inf = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf}));
  }

  // Populate NEON memory for input (using uint16x8 loads via vld1q_u16)
  // The NEON kernel uses vld1q_u16 then vreinterpretq_f16_u16
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);

    // For vld1q_u16 (8 elements) - convert fp16 terms to bv16
    std::array<Term, 8> lanes8;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        // Create bitvector variable representing the IEEE bits of the float16
        Sort bv16 = tm.mkBitVectorSort(16);
        Term bv_lane = tm.mkConst(bv16, "input_bv_" + std::to_string(i) + "_" + std::to_string(j));
        // Assert the relationship between the bitvector and float16
        Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
        Term fp_from_bv = tm.mkTerm(to_fp_op, {bv_lane});
        solver.assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, symbolic_input[idx]}));
        lanes8[j] = bv_lane;
      } else {
        lanes8[j] = tm.mkBitVector(16, 0);
      }
    }
    g_neon_memory_u16x8[addr].push_back(uint16x8_t(g_symbolic_tm, lanes8));
  }

  // Populate RISC-V memory for input (using vle16_v_u16m4)
  // The RVV kernel uses __riscv_vle16_v_u16m4 then reinterprets to f16m4
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data());

    // Create bitvector representations for the input
    std::vector<Term> bv_elements;
    bv_elements.reserve(num_elements);
    Sort bv16 = tm.mkBitVectorSort(16);
    Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    for (size_t i = 0; i < num_elements; i++) {
      Term bv_lane = tm.mkConst(bv16, "riscv_input_bv_" + std::to_string(i));
      Term fp_from_bv = tm.mkTerm(to_fp_op, {bv_lane});
      solver.assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, symbolic_input[i]}));
      bv_elements.push_back(bv_lane);
    }

    g_riscv_memory_u16m4[addr].push_back(vuint16m4_t(g_symbolic_tm, bv_elements));
  }

  std::cout << "Testing XNNPACK f16_vtanh: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = tanh(input[i])" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vtanh_ukernel__aarch64_neonfp16arith_expm1minus_rr1_p3h2ts_div_u16(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vtanh_ukernel__rvv_expm1minus_rr1_p3h2ts_div(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()));

  // Collect NEON output results from memory
  // NEON stores via vst1q_u16 to g_neon_memory_u16x8 (for full vectors)
  // or via vst1_u16/vst1_lane_u32/vst1_lane_u16 to g_neon_u16_scalar_memory (for tail)
  std::vector<Term> neon_output_elements;
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_neon.data());
    Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    // Try to collect from u16x8 storage first (for full 8-element stores)
    auto it = g_neon_memory_u16x8.find(base_addr);
    if (it != g_neon_memory_u16x8.end() && !it->second.empty()) {
      const uint16x8_t& vec = it->second.back();
      for (size_t i = 0; i < num_elements && i < 8; i++) {
        neon_output_elements.push_back(tm.mkTerm(to_fp_op, {vec.getLane(i)}));
      }
    }

    // If not found in u16x8, try collecting from u16 scalar memory (tail handling)
    if (neon_output_elements.empty()) {
      neon_output_elements.resize(num_elements);
      bool found_any = false;

      for (size_t i = 0; i < num_elements; i++) {
        uintptr_t addr = base_addr + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_elements[i] = tm.mkTerm(to_fp_op, {scalar_it->second});
          found_any = true;
        }
      }

      if (!found_any) {
        neon_output_elements.clear();
      } else {
        // Remove any unfilled slots
        neon_output_elements.erase(
            std::remove_if(neon_output_elements.begin(), neon_output_elements.end(),
                          [](const Term& t) { return t.isNull(); }),
            neon_output_elements.end());
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
              neon_output_elements[offset + i] = tm.mkTerm(to_fp_op, {vec.getLane(i)});
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
  // RVV stores via __riscv_vse16_v_u16m4 to g_riscv_memory_u16m4
  std::vector<Term> riscv_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_u16m4.find(addr);
    if (it != g_riscv_memory_u16m4.end() && !it->second.empty()) {
      const vuint16m4_t& vec = it->second.back();
      Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
      for (size_t i = 0; i < vec.getVL() && i < num_elements; i++) {
        // Convert u16 bitvector back to fp16
        riscv_output_elements.push_back(tm.mkTerm(to_fp_op, {vec.getElement(i)}));
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

  // Build simple bitwise equality assertions (no ULP tolerance)
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    // Simple floating-point equality (handles +0 == -0)
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_elements[i], riscv_output_elements[i]});

    // NaN handling: both NaN = equivalent
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_output_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_output_elements[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});

    // Equal if: exact FP equal OR both NaN
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

    std::cout << "\nInput values:" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  x[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
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
