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

// Forward declarations for f16 vsqrt kernels
extern "C" {
void xnn_f16_vsqrt_ukernel__fp16arith_sqrt_u1(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_vsqrt_ukernel__rvv_sqrt(
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

  // f16-vsqrt: Square root of float16
  // output[i] = sqrt(input[i])
  // batch is in bytes, so batch/sizeof(uint16_t) is the number of elements

  const size_t num_elements = 5;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays for float16_t scalar operations
  std::vector<float16_t> input_data(num_elements + 16);
  std::vector<float16_t> output_neon(num_elements + 16);

  // Allocate arrays for RVV operations (uses _Float16)
  std::vector<uint16_t> input_riscv(num_elements + 16, 0);
  std::vector<uint16_t> output_riscv(num_elements + 16, 0);

  // Setup params struct (not used for vsqrt but required by signatures)
  struct xnn_f16_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using floating-point representation
  Sort fp16 = tm.mkFloatingPointSort(5, 11);  // IEEE 754 half precision

  // Symbolic input elements
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    Term x = tm.mkConst(fp16, "x_" + std::to_string(i));
    symbolic_input.push_back(x);

    // Constraint: input must be non-negative for sqrt (sqrt of negative = NaN)
    // fp16 >= 0.0
    Term zero = tm.mkFloatingPointPosZero(5, 11);
    Term is_non_negative = tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x, zero});
    solver.assertFormula(is_non_negative);

    // Exclude NaN values
    Term is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan}));

    // Exclude infinity values
    Term is_inf = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf}));
  }

  // Populate NEON memory for input (scalar float16_t)
  {
    for (size_t i = 0; i < num_elements; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(&input_data[i]);
      g_neon_f16_scalar_memory[addr] = symbolic_input[i];
    }
  }

  // Populate RISC-V memory for input (using vle16_v_f16m4)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    std::vector<Term> fp_elements;
    fp_elements.reserve(num_elements);
    for (size_t i = 0; i < num_elements; i++) {
      fp_elements.push_back(symbolic_input[i]);
    }
    g_riscv_memory_f16m4[addr].push_back(vfloat16m4_t(g_symbolic_tm, fp_elements));
  }

  std::cout << "Testing XNNPACK f16_vsqrt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = sqrt(input[i])" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vsqrt_ukernel__fp16arith_sqrt_u1(
      batch,
      reinterpret_cast<const xnn_float16*>(input_data.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vsqrt_ukernel__rvv_sqrt(
      batch,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

  // Collect NEON output results from scalar memory
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

  // Collect RISC-V output results from memory
  std::vector<Term> riscv_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_f16m4.find(addr);
    if (it != g_riscv_memory_f16m4.end() && !it->second.empty()) {
      const vfloat16m4_t& vec = it->second.back();
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

  // Build floating-point equality assertions
  // Both implementations should produce identical results for sqrt
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
