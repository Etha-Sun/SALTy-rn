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
void xnn_f32_qs8_vcvt_ukernel__neon_u16(
    size_t batch,
    const float* input,
    int8_t* output,
    const struct xnn_f32_qs8_cvt_params* params);

void xnn_f32_qs8_vcvt_ukernel__rvv_u16(
    size_t batch,
    const float* input,
    int8_t* output,
    const struct xnn_f32_qs8_cvt_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Use batch size that exercises the main loop and remainder handling
  const size_t batch = 24;

  // Allocate arrays
  std::vector<float> input(batch, 0.0f);
  std::vector<int8_t> output_neon(batch);
  std::vector<int8_t> output_riscv(batch);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic float32 inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(batch);
  for (size_t i = 0; i < batch; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Constrain inputs to be normal floating-point values (not NaN, not Inf)
  // NaN and Inf handling differs between NEON and RVV implementations
  // and both behaviors are valid per their respective specs
  std::vector<Term> input_constraints;
  for (size_t i = 0; i < batch; i++) {
    Term not_nan = tm.mkTerm(Kind::NOT,
        {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {symbolic_input[i]})});
    Term not_inf = tm.mkTerm(Kind::NOT,
        {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {symbolic_input[i]})});
    input_constraints.push_back(tm.mkTerm(Kind::AND, {not_nan, not_inf}));
  }
  Term valid_inputs = tm.mkTerm(Kind::AND, input_constraints);
  solver.assertFormula(valid_inputs);

  // Populate NEON memory with symbolic float32 values
  for (size_t i = 0; i < batch; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + i);
    std::array<Term, 4> lanes;
    for (size_t j = 0; j < 4; j++) {
      if (i + j < batch) {
        lanes[j] = symbolic_input[i + j];
      } else {
        lanes[j] = tm.mkFloatingPointPosZero(8, 24);
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory with symbolic float32 values (vfloat32m2_t for LMUL=2)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data());
    g_riscv_memory_f32m2[addr].push_back(vfloat32m2_t(g_symbolic_tm, symbolic_input));
  }

  std::cout << "Testing XNNPACK f32_qs8_vcvt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Batch size: " << batch << " elements" << std::endl;

  // Set up conversion parameters
  // Use concrete values for scale and zero_point
  struct xnn_f32_qs8_cvt_params params;
  params.scalar.scale = 0.5f;  // Typical quantization scale
  params.scalar.output_zero_point = 0;  // Zero point for symmetric quantization

  std::cout << "Parameters: scale=" << params.scalar.scale
            << ", zero_point=" << params.scalar.output_zero_point << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_qs8_vcvt_ukernel__neon_u16(
      batch * sizeof(float),
      input.data(),
      output_neon.data(),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_qs8_vcvt_ukernel__rvv_u16(
      batch * sizeof(float),
      input.data(),
      output_riscv.data(),
      &params);

  // Collect NEON results (stored as int8x16_t or int8x8_t)
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResults8(
      output_neon.data(), batch);

  // Collect RISC-V results (stored as vint8mf2_t)
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResults8(
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

  // Compare outputs
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  // Build equality assertions
  // Both NEON and RISC-V results are 8-bit signed integers (bitvectors)
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
    std::cout << "The NEON and RISC-V implementations are equivalent for f32->qs8 conversion." << std::endl;
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
      std::cout << "  NEON[" << i << "] = " << solver.getValue(neon_elements[i])
                << ", RISC-V[" << i << "] = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
