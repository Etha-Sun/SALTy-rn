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

// Forward declarations for f16 rmin kernels
extern "C" {
void xnn_f16_rmin_ukernel__neonfp16arith_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_rmin_ukernel__rvv(
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
  solver.setOption("fp-exp", "true");

  // f16-rminmax: Reduction minimum
  // Operation: output = min(input[0:n])
  const size_t batch_elements = 90;  // Number of elements
  const size_t batch_bytes = batch_elements * sizeof(uint16_t);

  // Initial output value (positive infinity so any input becomes min)
  // fp16 +inf = 0x7C00
  uint16_t output_init_bits = 0x7C00;

  // Allocate arrays for NEON operations
  std::vector<uint16_t> input_neon(batch_elements + 16, 0);
  std::vector<uint16_t> output_neon(16, 0);
  output_neon[0] = output_init_bits;

  // Allocate arrays for RVV operations
  std::vector<_Float16> input_riscv(batch_elements + 16, (_Float16)0.0f);
  std::vector<_Float16> output_riscv(16, (_Float16)0.0f);
  // Set initial output to +inf
  uint16_t inf_bits = 0x7C00;
  std::memcpy(&output_riscv[0], &inf_bits, sizeof(inf_bits));

  // Clear memory before setup
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements
  std::vector<Term> symbolic_input_bv;
  std::vector<Term> symbolic_input_fp;

  // Bound inputs to avoid special values
  Term bound_pos = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x4C00));  // +16.0 in fp16
  Term bound_neg = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xCC00));  // -16.0 in fp16

  for (size_t i = 0; i < batch_elements; i++) {
    Term x_bv = tm.mkConst(bv16, "input_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);

    Term x_fp = tm.mkTerm(to_fp_op, {x_bv});
    symbolic_input_fp.push_back(x_fp);

    // Exclude NaN and infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp})}));

    // Bound inputs to [-16, 16]
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp, bound_neg}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp, bound_pos}));
  }

  // Store concrete initial output for NEON (vld1q_dup_u16 loads from output)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, output_init_bits);
  }

  // Populate NEON memory for input
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_neon.data());

    // Store 8 elements for vld1q_u16 loads
    std::array<Term, 8> bv_elements_8;
    for (size_t i = 0; i < 8; i++) {
      bv_elements_8[i] = (i < batch_elements) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0x7C00);  // +inf for unused
    }
    uint16x8_t symbolic_vec_8(g_symbolic_tm, bv_elements_8);
    g_neon_memory_u16x8[base_addr].push_back(symbolic_vec_8);

    // Store 4 elements for vld1_u16 loads
    std::array<Term, 4> bv_elements_4;
    for (size_t i = 0; i < 4; i++) {
      bv_elements_4[i] = (i < batch_elements) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0x7C00);
    }
    uint16x4_t symbolic_vec_4(g_symbolic_tm, bv_elements_4);
    g_neon_memory_u16x4[base_addr].push_back(symbolic_vec_4);
  }

  // Populate RISC-V memory for input
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    g_riscv_memory_f16m4[base_addr].push_back(vfloat16m4_t(g_symbolic_tm, symbolic_input_fp));
  }

  // Store concrete initial output for RISC-V (+inf)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    Term inf_fp = tm.mkFloatingPointPosInf(5, 11);
    std::vector<Term> output_init_terms = {inf_fp};
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, output_init_terms));
  }

  std::cout << "Testing XNNPACK f16_rmin: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output = min(input[0:n])" << std::endl;
  std::cout << "Batch size: " << batch_elements << " elements (" << batch_bytes << " bytes)" << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_rmin_ukernel__neonfp16arith_u16_acc2(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      nullptr);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_rmin_ukernel__rvv(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      nullptr);

  // Collect NEON output result (scalar stored via vst1_lane_u16)
  Term neon_output_bv;
  bool neon_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());
    auto it = g_neon_u16_scalar_memory.find(addr);
    if (it != g_neon_u16_scalar_memory.end()) {
      neon_output_bv = it->second;
      neon_found = true;
    }
  }

  // Collect RISC-V output result
  Term riscv_output_fp;
  bool riscv_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it_m1 = g_riscv_memory_f16m1.find(addr);
    if (it_m1 != g_riscv_memory_f16m1.end() && !it_m1->second.empty()) {
      const vfloat16m1_t& vec = it_m1->second.back();
      if (vec.getVL() > 0) {
        riscv_output_fp = vec.getElement(0);
        riscv_found = true;
      }
    }
  }

  if (!neon_found) {
    std::cerr << "ERROR: No NEON output found!" << std::endl;
    return 1;
  }

  if (!riscv_found) {
    std::cerr << "ERROR: No RISC-V output found!" << std::endl;
    return 1;
  }

  // Convert NEON bitvector output to fp16 for comparison
  Term neon_output_fp = tm.mkTerm(to_fp_op, {neon_output_bv});

  // Build floating-point equality assertion
  Term outputs_equal = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_fp, riscv_output_fp});
  Term not_equal = tm.mkTerm(Kind::NOT, {outputs_equal});

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
    for (size_t i = 0; i < batch_elements; i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input_bv[i])
                << " (fp16: " << solver.getValue(symbolic_input_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    std::cout << "  NEON output: " << solver.getValue(neon_output_bv)
              << " (fp16: " << solver.getValue(neon_output_fp) << ")" << std::endl;
    std::cout << "  RISC-V output: " << solver.getValue(riscv_output_fp) << std::endl;
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
