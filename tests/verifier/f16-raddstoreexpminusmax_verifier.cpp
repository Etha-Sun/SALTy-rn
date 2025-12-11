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

// Forward declarations for f16 raddstoreexpminusmax kernels
extern "C" {
void xnn_f16_raddstoreexpminusmax_ukernel__neonfp16arith_rr2_p2_u32(
    size_t batch,
    const xnn_float16* input,
    const xnn_float16* max,
    xnn_float16* output,
    xnn_float16* sum,
    const void* params);

void xnn_f16_raddstoreexpminusmax_ukernel__rvv_rr2_p2(
    size_t batch,
    const xnn_float16* input,
    const xnn_float16* max,
    xnn_float16* output,
    xnn_float16* sum,
    const void* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Parameters for raddstoreexpminusmax kernel
  // batch = number of bytes (elements * sizeof(uint16_t))
  const size_t num_elements = 8;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays
  std::vector<uint16_t> input_data(num_elements + 16, 0);
  std::vector<uint16_t> output_neon(num_elements + 16, 0);
  std::vector<uint16_t> output_riscv(num_elements + 16, 0);
  uint16_t max_val = 0;
  uint16_t sum_neon = 0;
  uint16_t sum_riscv = 0;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using float16 sort (5-bit exponent, 11-bit significand including hidden bit)
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Term zero_f16 = tm.mkFloatingPointPosZero(5, 11);

  // Symbolic input elements
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    symbolic_input.push_back(tm.mkConst(fp16, "input_" + std::to_string(i)));
  }

  // Symbolic max value
  Term symbolic_max = tm.mkConst(fp16, "max_val");

  // Populate NEON memory for input (using uint16x8 loads)
  // vld1q_u16 loads 8 consecutive uint16_t values
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data() + i);

    // For vld1q_u16 (8 elements) - need to convert fp16 terms to bv16
    std::array<Term, 8> lanes8;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        // Create bitvector variable representing the IEEE bits of the float16
        Sort bv16 = tm.mkBitVectorSort(16);
        Term bv_lane = tm.mkConst(bv16, "input_bv_" + std::to_string(idx));
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

  // Populate NEON memory for max value (using vld1q_dup_u16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&max_val);
    Sort bv16 = tm.mkBitVectorSort(16);
    Term max_bv = tm.mkConst(bv16, "max_bv");
    Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term fp_from_bv = tm.mkTerm(to_fp_op, {max_bv});
    solver.assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, symbolic_max}));

    std::array<Term, 8> lanes8_dup;
    for (int j = 0; j < 8; j++) {
      lanes8_dup[j] = max_bv;
    }
    g_neon_memory_u16x8[addr].push_back(uint16x8_t(g_symbolic_tm, lanes8_dup));
  }

  // Populate RISC-V memory for input (using vle16_v_f16m1)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_data.data());
    std::vector<Term> elements;
    for (size_t i = 0; i < num_elements; i++) {
      elements.push_back(symbolic_input[i]);
    }
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, elements));
  }

  // Populate RISC-V memory for max value (scalar read)
  // The RVV kernel reads max as a _Float16 scalar directly
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&max_val);
    // Store the symbolic max as float16 scalar
    Sort bv16 = tm.mkBitVectorSort(16);
    Term max_bv = tm.mkConst(bv16, "max_bv_riscv");
    Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term fp_from_bv = tm.mkTerm(to_fp_op, {max_bv});
    solver.assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, symbolic_max}));
    // Store as vfloat16m1 for vle16 access
    std::vector<Term> max_vec;
    max_vec.push_back(symbolic_max);
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, max_vec));
  }

  std::cout << "Testing XNNPACK f16_raddstoreexpminusmax: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_raddstoreexpminusmax_ukernel__neonfp16arith_rr2_p2_u32(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<const xnn_float16*>(&max_val),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      reinterpret_cast<xnn_float16*>(&sum_neon),
      nullptr);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_raddstoreexpminusmax_ukernel__rvv_rr2_p2(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<const xnn_float16*>(&max_val),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      reinterpret_cast<xnn_float16*>(&sum_riscv),
      nullptr);

  // Collect NEON output results from memory
  std::vector<Term> neon_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());
    auto it = g_neon_memory_u16x8.find(addr);
    if (it != g_neon_memory_u16x8.end() && !it->second.empty()) {
      const uint16x8_t& vec = it->second.back();
      Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
      for (size_t i = 0; i < num_elements && i < 8; i++) {
        // Convert u16 bitvector back to fp16
        neon_output_elements.push_back(tm.mkTerm(to_fp_op, {vec.getLane(i)}));
      }
    }
  }

  // Collect RISC-V output results from memory
  std::vector<Term> riscv_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_f16m1.find(addr);
    if (it != g_riscv_memory_f16m1.end() && !it->second.empty()) {
      const vfloat16m1_t& vec = it->second.back();
      for (size_t i = 0; i < vec.getVL() && i < num_elements; i++) {
        riscv_output_elements.push_back(vec.getElement(i));
      }
    }
  }

  // Collect sum results
  Term neon_sum_term;
  Term riscv_sum_term;

  // NEON sum is stored via vst1_lane_u16
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&sum_neon);
    auto it = g_neon_memory_u16x4.find(addr);
    if (it != g_neon_memory_u16x4.end() && !it->second.empty()) {
      Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
      neon_sum_term = tm.mkTerm(to_fp_op, {it->second.back().getLane(0)});
    }
  }

  // RISC-V sum is stored via scalar write
  {
    auto it = g_riscv_scalar_results.find("vfmv_f_s_f16m1_f16");
    if (it != g_riscv_scalar_results.end()) {
      riscv_sum_term = it->second;
    }
  }

  std::cout << "\nNEON collected " << neon_output_elements.size() << " output elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_output_elements.size() << " output elements" << std::endl;

  bool have_outputs = !neon_output_elements.empty() && !riscv_output_elements.empty();
  bool have_sums = !neon_sum_term.isNull() && !riscv_sum_term.isNull();

  if (!have_outputs) {
    std::cerr << "WARNING: Could not collect output elements from both implementations" << std::endl;
  }

  if (!have_sums) {
    std::cerr << "WARNING: Could not collect sum results from both implementations" << std::endl;
  }

  // Build equality assertions
  std::vector<Term> all_equalities;

  // Compare output elements
  if (have_outputs) {
    size_t compare_count = std::min(neon_output_elements.size(), riscv_output_elements.size());
    for (size_t i = 0; i < compare_count; i++) {
      Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_elements[i], riscv_output_elements[i]});
      Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_output_elements[i]});
      Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_output_elements[i]});
      Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});
      Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan});
      all_equalities.push_back(eq);
    }
  }

  // Compare sum results
  if (have_sums) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_sum_term, riscv_sum_term});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_sum_term});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_sum_term});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});
    Term sum_eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan});
    all_equalities.push_back(sum_eq);
    std::cout << "Added sum comparison to verification" << std::endl;
  }

  if (all_equalities.empty()) {
    std::cerr << "ERROR: No elements to compare!" << std::endl;
    return 1;
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
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nMax value:" << std::endl;
    std::cout << "  max = " << solver.getValue(symbolic_max) << std::endl;

    if (have_outputs) {
      std::cout << "\nOutput comparison:" << std::endl;
      size_t compare_count = std::min(neon_output_elements.size(), riscv_output_elements.size());
      for (size_t i = 0; i < compare_count; i++) {
        std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_output_elements[i])
                  << ", RISC-V = " << solver.getValue(riscv_output_elements[i]) << std::endl;
      }
    }

    if (have_sums) {
      std::cout << "\nSum comparison:" << std::endl;
      std::cout << "  NEON sum = " << solver.getValue(neon_sum_term) << std::endl;
      std::cout << "  RISC-V sum = " << solver.getValue(riscv_sum_term) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
