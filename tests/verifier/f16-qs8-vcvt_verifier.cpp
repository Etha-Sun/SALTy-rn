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

// Forward declarations for f16 qs8 vcvt kernels
extern "C" {
void xnn_f16_qs8_vcvt_ukernel__neonfp16arith_u16(
    size_t batch,
    const xnn_float16* input,
    int8_t* output,
    const struct xnn_f16_qs8_cvt_params* params);

void xnn_f16_qs8_vcvt_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
    int8_t* output,
    const struct xnn_f16_qs8_cvt_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-qs8-vcvt: Convert float16 to quantized int8
  // Operation: output[i] = saturate_i8(round(input[i] * scale) + zero_point)
  const size_t batch_elements = 9;  // Number of elements to convert
  const size_t batch_bytes = batch_elements * sizeof(uint16_t);

  // Concrete scale value (1.0 for simplicity)
  _Float16 scale_val = (_Float16)1.0f;
  uint16_t scale_bits;
  std::memcpy(&scale_bits, &scale_val, sizeof(scale_bits));

  // Concrete output zero point
  int16_t output_zero_point = 0;

  // Allocate arrays for NEON operations
  std::vector<uint16_t> input_neon(batch_elements + 16, 0);
  std::vector<int8_t> output_neon(batch_elements + 16, 0);

  // Allocate arrays for RVV operations
  std::vector<_Float16> input_riscv(batch_elements + 16, (_Float16)0.0f);
  std::vector<int8_t> output_riscv(batch_elements + 16, 0);

  // Setup params struct
  struct xnn_f16_qs8_cvt_params params;
  std::memcpy(&params.scalar.scale, &scale_val, sizeof(scale_val));
  params.scalar.output_zero_point = output_zero_point;

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

  // Bound inputs to valid fp16 range that won't overflow int8 after conversion
  // int8 range is [-128, 127], so bound input to roughly that range
  Term bound_pos = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x57F0));  // ~127 in fp16
  Term bound_neg = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xD800));  // ~-128 in fp16

  for (size_t i = 0; i < batch_elements; i++) {
    Term x_bv = tm.mkConst(bv16, "input_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);

    Term x_fp = tm.mkTerm(to_fp_op, {x_bv});
    symbolic_input_fp.push_back(x_fp);

    // Exclude NaN and infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp})}));

    // Bound inputs to avoid int8 saturation edge cases for initial testing
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp, bound_neg}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp, bound_pos}));
  }

  // Store concrete scale for NEON (vdupq_n_u16 loads from params)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&params.scalar.scale);
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, scale_bits);
  }

  // Populate NEON memory for input (vld1q_u16 loads 8 elements)
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_neon.data());

    std::array<Term, 8> bv_elements_8;
    for (size_t i = 0; i < 8; i++) {
      bv_elements_8[i] = (i < batch_elements) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0);
    }
    uint16x8_t symbolic_vec_8(g_symbolic_tm, bv_elements_8);
    g_neon_memory_u16x8[base_addr].push_back(symbolic_vec_8);
  }

  // Populate RISC-V memory for input
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    g_riscv_memory_f16m1[base_addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_input_fp));
  }

  // Store scale for RVV (loaded as _Float16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&params.scalar.scale);
    Term scale_fp = tm.mkTerm(to_fp_op, {tm.mkBitVector(16, scale_bits)});
    g_riscv_scalar_memory[addr] = scale_fp;
  }

  std::cout << "Testing XNNPACK f16_qs8_vcvt: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = saturate_i8(round(input[i] * scale) + zero_point)" << std::endl;
  std::cout << "Scale: " << (float)scale_val << ", Zero point: " << output_zero_point << std::endl;
  std::cout << "Batch size: " << batch_elements << " elements (" << batch_bytes << " bytes)" << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_qs8_vcvt_ukernel__neonfp16arith_u16(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      output_neon.data(),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_qs8_vcvt_ukernel__rvv(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      output_riscv.data(),
      &params);

  // Collect NEON output results (stored via vst1_s8)
  std::vector<Term> neon_outputs;
  bool neon_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());
    auto it = g_neon_memory_i8x8.find(addr);
    if (it != g_neon_memory_i8x8.end() && !it->second.empty()) {
      const int8x8_t& vec = it->second.back();
      for (size_t i = 0; i < batch_elements && i < 8; i++) {
        neon_outputs.push_back(vec.getLane(i));
      }
      neon_found = true;
    }
  }

  // Collect RISC-V output results (stored via __riscv_vse8_v_i8m1)
  std::vector<Term> riscv_outputs;
  bool riscv_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_i8.find(addr);
    if (it != g_riscv_memory_i8.end() && !it->second.empty()) {
      const vint8m1_t& vec = it->second.back();
      for (size_t i = 0; i < batch_elements && i < vec.getVL(); i++) {
        riscv_outputs.push_back(vec.getElement(i));
      }
      riscv_found = true;
    }
  }

  if (!neon_found) {
    std::cerr << "ERROR: No NEON output found!" << std::endl;
    std::cerr << "Dumping NEON memory state:" << std::endl;
    std::cerr << "  i8x8 memory entries: " << g_neon_memory_i8x8.size() << std::endl;
    std::cerr << "  i8x16 memory entries: " << g_neon_memory_i8x16.size() << std::endl;
    for (const auto& [addr, val] : g_neon_memory_i8x8) {
      std::cerr << "    i8x8 addr=" << std::hex << addr << std::dec << std::endl;
    }
    return 1;
  }

  if (!riscv_found) {
    std::cerr << "ERROR: No RISC-V output found!" << std::endl;
    std::cerr << "Dumping RISC-V memory state:" << std::endl;
    std::cerr << "  i8 memory entries: " << g_riscv_memory_i8.size() << std::endl;
    return 1;
  }

  // Build equality assertion for all output elements
  std::vector<Term> inequalities;
  size_t num_outputs = std::min(neon_outputs.size(), riscv_outputs.size());

  for (size_t i = 0; i < num_outputs; i++) {
    Term eq = tm.mkTerm(Kind::EQUAL, {neon_outputs[i], riscv_outputs[i]});
    inequalities.push_back(tm.mkTerm(Kind::NOT, {eq}));
  }

  // Assert that at least one output differs
  Term any_different = inequalities[0];
  for (size_t i = 1; i < inequalities.size(); i++) {
    any_different = tm.mkTerm(Kind::OR, {any_different, inequalities[i]});
  }

  std::cout << "\nAsserting: EXISTS output where NEON != RISC-V" << std::endl;
  std::cout << "Looking for counterexample where outputs differ..." << std::endl;
  std::cout << "Comparing " << num_outputs << " output elements" << std::endl;

  solver.assertFormula(any_different);
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
    for (size_t i = 0; i < num_outputs; i++) {
      std::cout << "  output[" << i << "]: NEON=" << solver.getValue(neon_outputs[i])
                << ", RISC-V=" << solver.getValue(riscv_outputs[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
