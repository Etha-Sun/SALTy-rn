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

// Forward declarations for f16 vclamp kernels
extern "C" {
void xnn_f16_vclamp_ukernel__neonfp16arith_u8(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_minmax_params* params);

void xnn_f16_vclamp_ukernel__rvv_u8(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-vclamp: Clamp float16 values to [min, max] range
  // output[i] = min(max(input[i], min_val), max_val)

  const size_t num_elements =9;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays for NEON operations (uses uint16_t loads/stores)
  std::vector<uint16_t> input_neon(num_elements + 16, 0);
  std::vector<uint16_t> output_neon(num_elements + 16, 0);

  // Allocate arrays for RVV operations (uses _Float16 directly)
  std::vector<_Float16> input_riscv(num_elements + 16, 0);
  std::vector<_Float16> output_riscv(num_elements + 16, 0);

  // Setup params struct with min and max values
  // Use concrete min/max values for simplicity
  struct xnn_f16_minmax_params params;
  _Float16 min_val = (_Float16)-1.0f;
  _Float16 max_val = (_Float16)1.0f;
  std::memcpy(&params.scalar.min, &min_val, sizeof(min_val));
  std::memcpy(&params.scalar.max, &max_val, sizeof(max_val));

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using bitvector representation
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements
  std::vector<Term> symbolic_input_bv;
  std::vector<Term> symbolic_input_fp;

  for (size_t i = 0; i < num_elements; i++) {
    Term x_bv = tm.mkConst(bv16, "x_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);

    Term x_fp = tm.mkTerm(to_fp_op, {x_bv});
    symbolic_input_fp.push_back(x_fp);

    // Exclude NaN values
    Term is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan}));

    // Exclude infinity values
    Term is_inf = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf}));
  }

  // Store symbolic min/max values for NEON vld2q_dup_u16
  // NEON loads min and max as interleaved pair from params
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
    uint16_t min_bits, max_bits;
    std::memcpy(&min_bits, &min_val, sizeof(min_bits));
    std::memcpy(&max_bits, &max_val, sizeof(max_bits));

    // Store as scalar u16 values for vld2q_dup_u16
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, min_bits);
    g_neon_u16_scalar_memory[addr + sizeof(uint16_t)] = tm.mkBitVector(16, max_bits);
  }

  // Populate NEON memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_neon.data());

    // For single element, use scalar memory (vld1_dup_u16 path)
    if (num_elements == 1) {
      g_neon_u16_scalar_memory[addr] = symbolic_input_bv[0];
    } else if (num_elements <= 4) {
      std::array<Term, 4> bv_elements;
      for (size_t i = 0; i < 4; i++) {
        if (i < num_elements) {
          bv_elements[i] = symbolic_input_bv[i];
        } else {
          bv_elements[i] = tm.mkBitVector(16, 0);
        }
      }
      uint16x4_t symbolic_vec(g_symbolic_tm, bv_elements);
      g_neon_memory_u16x4[addr].push_back(symbolic_vec);
    } else {
      std::array<Term, 8> bv_elements;
      for (size_t i = 0; i < 8; i++) {
        if (i < num_elements) {
          bv_elements[i] = symbolic_input_bv[i];
        } else {
          bv_elements[i] = tm.mkBitVector(16, 0);
        }
      }
      uint16x8_t symbolic_vec(g_symbolic_tm, bv_elements);
      g_neon_memory_u16x8[addr].push_back(symbolic_vec);
    }
  }

  // Populate RISC-V memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    g_riscv_memory_f16m4[addr].push_back(vfloat16m4_t(g_symbolic_tm, symbolic_input_fp));
  }

  std::cout << "Testing XNNPACK f16_vclamp: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = clamp(input[i], min, max)" << std::endl;
  std::cout << "Min value: " << (float)min_val << ", Max value: " << (float)max_val << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vclamp_ukernel__neonfp16arith_u8(
      batch,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vclamp_ukernel__rvv_u8(
      batch,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

  // Collect NEON output results
  std::vector<Term> neon_output_elements;
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try u16x8 storage first
    auto it8 = g_neon_memory_u16x8.find(base_addr);
    if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
      const uint16x8_t& vec = it8->second.back();
      for (size_t i = 0; i < 8 && i < num_elements; i++) {
        neon_output_elements.push_back(vec.getLane(i));
      }
    }

    // Try u16x4 storage
    if (neon_output_elements.empty()) {
      auto it4 = g_neon_memory_u16x4.find(base_addr);
      if (it4 != g_neon_memory_u16x4.end() && !it4->second.empty()) {
        const uint16x4_t& vec = it4->second.back();
        for (size_t i = 0; i < 4 && i < num_elements; i++) {
          neon_output_elements.push_back(vec.getLane(i));
        }
      }
    }

    // Try scalar u16 memory (for vst1_lane_u16)
    if (neon_output_elements.empty()) {
      for (size_t i = 0; i < num_elements; i++) {
        uintptr_t addr = base_addr + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_elements.push_back(scalar_it->second);
        }
      }
    }
  }

  // Collect RISC-V output results
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

  // Build floating-point equality assertions
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    // Convert NEON bitvector output to fp16
    Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_elements[i]});
    Term eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_fp, riscv_output_elements[i]});
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

    std::cout << "\nInput values (bitvector and fp16):" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  x[" << i << "] = " << solver.getValue(symbolic_input_bv[i])
                << " (fp16: " << solver.getValue(symbolic_input_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < compare_count; i++) {
      Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_elements[i]});
      std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_output_elements[i])
                << " (fp16: " << solver.getValue(neon_fp) << ")"
                << ", RISC-V = " << solver.getValue(riscv_output_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
