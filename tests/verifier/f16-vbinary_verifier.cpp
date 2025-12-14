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

// Forward declarations for f16 vadd kernels
extern "C" {
void xnn_f16_vadd_ukernel__fp16arith_u4(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_vadd_ukernel__rvv_u4(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
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
  solver.setOption("fp-exp", "true");

  // f16-vbinary (vadd): Element-wise addition of float16 vectors
  // output[i] = input_a[i] + input_b[i]

  const size_t num_elements = 8;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays for NEON operations (uses float16_t scalar ops)
  std::vector<float16_t> input_a_neon(num_elements + 16);
  std::vector<float16_t> input_b_neon(num_elements + 16);
  std::vector<float16_t> output_neon(num_elements + 16);

  // Allocate arrays for RVV operations (uses _Float16 directly)
  std::vector<_Float16> input_a_riscv(num_elements + 16, 0);
  std::vector<_Float16> input_b_riscv(num_elements + 16, 0);
  std::vector<_Float16> output_riscv(num_elements + 16, 0);

  // Setup params struct (not used for vadd but required by signature)
  struct xnn_f16_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements
  std::vector<Term> symbolic_a_bv, symbolic_b_bv;
  std::vector<Term> symbolic_a_fp, symbolic_b_fp;

  for (size_t i = 0; i < num_elements; i++) {
    Term a_bv = tm.mkConst(bv16, "a_" + std::to_string(i));
    Term b_bv = tm.mkConst(bv16, "b_" + std::to_string(i));
    symbolic_a_bv.push_back(a_bv);
    symbolic_b_bv.push_back(b_bv);

    Term a_fp = tm.mkTerm(to_fp_op, {a_bv});
    Term b_fp = tm.mkTerm(to_fp_op, {b_bv});
    symbolic_a_fp.push_back(a_fp);
    symbolic_b_fp.push_back(b_fp);

    // Exclude NaN values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp})}));

    // Exclude infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {a_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {b_fp})}));
  }

  // Populate NEON memory for inputs (scalar float16_t access)
  // NEON uses scalar loads via pointer dereference, store symbolic values in float16_t array
  {
    for (size_t i = 0; i < num_elements; i++) {
      uintptr_t addr_a = reinterpret_cast<uintptr_t>(&input_a_neon[i]);
      uintptr_t addr_b = reinterpret_cast<uintptr_t>(&input_b_neon[i]);

      // Store as scalar fp16 for NEON scalar operations
      g_neon_f16_scalar_memory[addr_a] = symbolic_a_fp[i];
      g_neon_f16_scalar_memory[addr_b] = symbolic_b_fp[i];
    }
  }

  // Populate RISC-V memory for inputs
  {
    uintptr_t addr_a = reinterpret_cast<uintptr_t>(input_a_riscv.data());
    uintptr_t addr_b = reinterpret_cast<uintptr_t>(input_b_riscv.data());

    g_riscv_memory_f16m1[addr_a].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_a_fp));
    g_riscv_memory_f16m1[addr_b].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_b_fp));
  }

  std::cout << "Testing XNNPACK f16_vadd: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = input_a[i] + input_b[i]" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vadd_ukernel__fp16arith_u4(
      batch,
      reinterpret_cast<const xnn_float16*>(input_a_neon.data()),
      reinterpret_cast<const xnn_float16*>(input_b_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vadd_ukernel__rvv_u4(
      batch,
      reinterpret_cast<const xnn_float16*>(input_a_riscv.data()),
      reinterpret_cast<const xnn_float16*>(input_b_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

  // Collect NEON output results (scalar stores)
  std::vector<Term> neon_output_elements;
  {
    for (size_t i = 0; i < num_elements; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(&output_neon[i]);
      auto it = g_neon_f16_scalar_memory.find(addr);
      if (it != g_neon_f16_scalar_memory.end()) {
        neon_output_elements.push_back(it->second);
      }
    }
  }

  // Collect RISC-V output results
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

  // Build floating-point equality assertions
  // Both NEON and RVV outputs are already fp16 terms
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_elements[i], riscv_output_elements[i]});
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
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a_fp[i])
                << ", b[" << i << "] = " << solver.getValue(symbolic_b_fp[i]) << std::endl;
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
