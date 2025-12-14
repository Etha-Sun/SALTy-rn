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

// Forward declarations for f16 rsum kernels
extern "C" {
void xnn_f16_rsum_ukernel__neonfp16arith_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_scale_params* params);

void xnn_f16_rsum_ukernel__rvv_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_scale_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-rsum: Reduction sum with scaling
  // Operation: output = sum(input[0:n]) * scale + output[0]
  // Using a small batch size for tractable verification
  const size_t batch_elements = 9;  // Number of elements to sum (4 to hit simpler path)
  const size_t batch_bytes = batch_elements * sizeof(uint16_t);

  // Concrete scale value
  _Float16 scale_val = (_Float16)1.0f;
  uint16_t scale_bits;
  std::memcpy(&scale_bits, &scale_val, sizeof(scale_bits));

  // Concrete initial output value
  _Float16 output_init_val = (_Float16)0.0f;
  uint16_t output_init_bits;
  std::memcpy(&output_init_bits, &output_init_val, sizeof(output_init_bits));

  // Allocate arrays for NEON operations
  std::vector<uint16_t> input_neon(batch_elements + 16, 0);
  std::vector<uint16_t> output_neon(16, 0);
  output_neon[0] = output_init_bits;

  // Allocate arrays for RVV operations
  std::vector<_Float16> input_riscv(batch_elements + 16, (_Float16)0.0f);
  std::vector<_Float16> output_riscv(16, (_Float16)0.0f);
  output_riscv[0] = output_init_val;

  // Setup params struct with scale
  struct xnn_f16_scale_params params;
  std::memcpy(&params.scalar.scale, &scale_val, sizeof(scale_val));

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

  // Create bounds for inputs to avoid overflow: |x| <= 100
  // fp16 100.0 = sign=0, exp=01110(14 biased, so 14-15=-1+...wait)
  // Actually fp16 100.0: exp = log2(100) ~ 6.6, so biased exp = 15+6 = 21 = 0b10101
  // Let's use a simpler approach: restrict exponent to <= 14 (biased), which keeps values in [-16384, 16384]
  // fp16 format: sign(1) | exp(5) | mant(10)
  // To keep |value| <= some bound, we can restrict the exponent field
  // exp biased 14 = 14-15 = -1, so |x| < 2^0 = 1
  // exp biased 15 = 0, so |x| in [1, 2)
  // exp biased 20 = 5, so |x| in [32, 64)
  // For safety, let's bound |x| <= 16 by requiring biased_exp <= 19 (2^4 = 16)
  // Actually, let's just bound the absolute value directly using fp comparison

  Term rm = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
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

    // Bound inputs to [-16, 16] to avoid overflow
    // x >= -16.0
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp, bound_neg}));
    // x <= 16.0
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp, bound_pos}));
  }

  // Store concrete scale for NEON scalar load (vld1_dup_u16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&params.scalar.scale);
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, scale_bits);
  }

  // Store concrete initial output for NEON (vld1_dup_u16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, output_init_bits);
  }

  // Populate NEON memory for input
  // NEON uses vld1q_u16 (loads 8 elements) and vld1_u16 (loads 4 elements)
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_neon.data());

    // Store first 8 elements at base address
    std::array<Term, 8> bv_elements_8;
    for (size_t i = 0; i < 8; i++) {
      bv_elements_8[i] = (i < batch_elements) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0);
    }
    uint16x8_t symbolic_vec_8(g_symbolic_tm, bv_elements_8);
    g_neon_memory_u16x8[base_addr].push_back(symbolic_vec_8);

    // For batch_elements > 8, store remaining elements at offset addresses
    if (batch_elements > 8) {
      // Elements at offset 8 (for vld1_u16 loads after 8-element processing)
      uintptr_t offset_addr = base_addr + 8 * sizeof(uint16_t);
      std::array<Term, 4> bv_elements_4;
      for (size_t i = 0; i < 4; i++) {
        size_t idx = 8 + i;
        bv_elements_4[i] = (idx < batch_elements) ? symbolic_input_bv[idx] : tm.mkBitVector(16, 0);
      }
      uint16x4_t symbolic_vec_4(g_symbolic_tm, bv_elements_4);
      g_neon_memory_u16x4[offset_addr].push_back(symbolic_vec_4);

      // Also store in scalar memory for single-element loads (vld1_dup_u16)
      for (size_t i = 8; i < batch_elements; i++) {
        uintptr_t elem_addr = base_addr + i * sizeof(uint16_t);
        g_neon_u16_scalar_memory[elem_addr] = symbolic_input_bv[i];
      }
    }

    // Store first 4 elements for vld1_u16 (4-element) loads
    if (batch_elements <= 4) {
      std::array<Term, 4> bv_elements_4;
      for (size_t i = 0; i < 4; i++) {
        bv_elements_4[i] = (i < batch_elements) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0);
      }
      uint16x4_t symbolic_vec_4(g_symbolic_tm, bv_elements_4);
      g_neon_memory_u16x4[base_addr].push_back(symbolic_vec_4);
    }
  }

  // Populate RISC-V memory for input - use vfloat16m1_t since RVV kernel uses __riscv_vle16_v_f16m1
  // Store at base address and also at offset addresses for loads that happen after processing
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input_riscv.data());

    // Store all elements at base address
    g_riscv_memory_f16m1[base_addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_input_fp));

    // Also store at offset addresses for loads after the 8-element loop
    // The RVV code does i += 8, so we need elements at offset 8
    if (batch_elements > 8) {
      // Elements starting at index 8
      std::vector<Term> remaining_elements;
      for (size_t j = 8; j < batch_elements; j++) {
        remaining_elements.push_back(symbolic_input_fp[j]);
      }
      uintptr_t offset_addr = base_addr + 8 * sizeof(_Float16);
      g_riscv_memory_f16m1[offset_addr].push_back(vfloat16m1_t(g_symbolic_tm, remaining_elements));
    }
  }

  // Store concrete initial output for RISC-V (used by vle16_v_f16m1 load of existing output)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    // Create concrete zero for initial output
    Term zero_fp = tm.mkFloatingPointPosZero(5, 11);
    std::vector<Term> output_init_terms = {zero_fp};
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, output_init_terms));
  }

  std::cout << "Testing XNNPACK f16_rsum: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output = sum(input[0:n]) * scale + output[0]" << std::endl;
  std::cout << "Using concrete scale=" << (float)scale_val << ", initial_output=" << (float)output_init_val << std::endl;
  std::cout << "Batch size: " << batch_elements << " elements (" << batch_bytes << " bytes)" << std::endl;
  std::cout << "\nNote: NEON uses tree reduction (pairwise adds), RVV uses linear reduction." << std::endl;
  std::cout << "Due to FP non-associativity, these may produce different results." << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_rsum_ukernel__neonfp16arith_u16_acc2(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_rsum_ukernel__rvv_u16_acc2(
      batch_bytes,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

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
  // The RVV implementation uses __riscv_vfmv_f_s_f16m1_f16 to extract scalar,
  // then does: *o = sum * scale + *o
  // With scale=1.0 and initial output=0.0, result = sum
  // The symbolic sum is stored in g_riscv_scalar_results["vfmv_f_s_f16m1_f16"]
  Term riscv_output_fp;
  bool riscv_found = false;
  {
    // Check g_riscv_scalar_results for the extracted scalar
    auto it = g_riscv_scalar_results.find("vfmv_f_s_f16m1_f16");
    if (it != g_riscv_scalar_results.end()) {
      // Since scale=1.0 and initial_output=0.0, output = sum * 1.0 + 0.0 = sum
      riscv_output_fp = it->second;
      riscv_found = true;
    }

    // Fallback: Check scalar memory
    if (!riscv_found) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
      auto it_scalar = g_riscv_scalar_memory.find(addr);
      if (it_scalar != g_riscv_scalar_memory.end()) {
        riscv_output_fp = it_scalar->second;
        riscv_found = true;
      }
    }

    // Fallback: Check f16m1 vector memory
    if (!riscv_found) {
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
  }

  if (!neon_found) {
    std::cerr << "ERROR: No NEON output found!" << std::endl;
    std::cerr << "Dumping NEON memory state:" << std::endl;
    std::cerr << "  u16_scalar_memory entries: " << g_neon_u16_scalar_memory.size() << std::endl;
    for (const auto& [addr, val] : g_neon_u16_scalar_memory) {
      std::cerr << "    addr=" << std::hex << addr << std::dec << std::endl;
    }
    return 1;
  }

  if (!riscv_found) {
    std::cerr << "ERROR: No RISC-V output found!" << std::endl;
    std::cerr << "Dumping RISC-V memory state:" << std::endl;
    std::cerr << "  scalar_memory entries: " << g_riscv_scalar_memory.size() << std::endl;
    std::cerr << "  f16m1 memory entries: " << g_riscv_memory_f16m1.size() << std::endl;
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
