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

// Forward declarations for f16 spmm kernels
extern "C" {
void xnn_f16_spmm_minmax_ukernel_16x1__neonfp16arith_u2(
    size_t mc,
    size_t nc,
    const xnn_float16* input,
    const xnn_float16* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    xnn_float16* output,
    size_t output_stride,
    const struct xnn_f16_minmax_params* params);

void xnn_f16_spmm_minmax_ukernel_16x1__rvv_u2(
    size_t mc,
    size_t nc,
    const _Float16* input,
    const _Float16* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    _Float16* output,
    size_t output_stride,
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

  // f16-spmm: Sparse Matrix-Matrix Multiplication with minmax clamping
  // For a simplified test, we use:
  // - mc = 4 (4 input elements per row, tests the mc & 4 path)
  // - nc = 1 (1 output column)
  // - 1 non-zero weight per output column
  //
  // Operation: output[i] = clamp(bias + input[i] * weight, min, max)
  // Using concrete bias=1.0, weight=1.0 to focus on input processing equivalence

  const size_t mc = 9;  // Number of input elements (tests 4-element path)
  const size_t nc = 4;  // Number of output columns
  const size_t nnz = 1; // Number of non-zeros per column

  // Concrete bias and weight values (same for both implementations)
  _Float16 bias_val = (_Float16)1.0f;
  _Float16 weight_val = (_Float16)1.0f;
  uint16_t bias_bits, weight_bits;
  std::memcpy(&bias_bits, &bias_val, sizeof(bias_bits));
  std::memcpy(&weight_bits, &weight_val, sizeof(weight_bits));

  // Allocate arrays for NEON operations
  std::vector<uint16_t> input_neon(mc + 16, 0);
  std::vector<uint16_t> weights_neon(nc * (nnz + 1) + 16, 0);  // bias + weights
  std::vector<int32_t> widx_dmap(nnz * nc + 16, 0);
  std::vector<uint32_t> nidx_nnzmap(nc + 16, 0);
  std::vector<uint16_t> output_neon(mc * nc + 16, 0);

  // Allocate arrays for RVV operations
  std::vector<_Float16> input_riscv(mc + 16, 0);
  std::vector<_Float16> weights_riscv(nc * (nnz + 1) + 16, 0);
  std::vector<_Float16> output_riscv(mc * nc + 16, 0);

  // Set concrete weights for both implementations
  weights_neon[0] = bias_bits;
  weights_neon[1] = weight_bits;
  weights_riscv[0] = bias_val;
  weights_riscv[1] = weight_val;

  // Setup params struct with min and max values
  struct xnn_f16_minmax_params params;
  _Float16 min_val = (_Float16)-10.0f;
  _Float16 max_val = (_Float16)10.0f;
  std::memcpy(&params.scalar.min, &min_val, sizeof(min_val));
  std::memcpy(&params.scalar.max, &max_val, sizeof(max_val));

  // Setup sparse matrix structure:
  // nidx_nnzmap[col] = number of non-zeros for column col
  // widx_dmap = differences in input indices between consecutive non-zeros
  nidx_nnzmap[0] = nnz;  // 1 non-zero in column 0

  // widx_dmap: For nnz=1, the diff points to first input element (offset 0)
  widx_dmap[0] = 0;  // First non-zero accesses input[0]

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements
  std::vector<Term> symbolic_input_bv;
  std::vector<Term> symbolic_input_fp;

  for (size_t i = 0; i < mc; i++) {
    Term x_bv = tm.mkConst(bv16, "input_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);

    Term x_fp = tm.mkTerm(to_fp_op, {x_bv});
    symbolic_input_fp.push_back(x_fp);

    // Exclude NaN and infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp})}));
  }

  // Store symbolic min/max for NEON vld2q_dup_u16
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&params.scalar.min);
    uint16_t min_bits, max_bits;
    std::memcpy(&min_bits, &min_val, sizeof(min_bits));
    std::memcpy(&max_bits, &max_val, sizeof(max_bits));
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, min_bits);
    g_neon_u16_scalar_memory[addr + sizeof(uint16_t)] = tm.mkBitVector(16, max_bits);
  }

  // Store concrete bias/weight for NEON scalar loads (vld1_dup_u16)
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(weights_neon.data());
    g_neon_u16_scalar_memory[addr] = tm.mkBitVector(16, bias_bits);
    g_neon_u16_scalar_memory[addr + sizeof(uint16_t)] = tm.mkBitVector(16, weight_bits);
  }

  // Populate NEON memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_neon.data());
    if (mc <= 4) {
      std::array<Term, 4> bv_elements;
      for (size_t i = 0; i < 4; i++) {
        bv_elements[i] = (i < mc) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0);
      }
      uint16x4_t symbolic_vec(g_symbolic_tm, bv_elements);
      g_neon_memory_u16x4[addr].push_back(symbolic_vec);
    } else {
      // For 8 elements, use uint16x8_t
      std::array<Term, 8> bv_elements;
      for (size_t i = 0; i < 8; i++) {
        bv_elements[i] = (i < mc) ? symbolic_input_bv[i] : tm.mkBitVector(16, 0);
      }
      uint16x8_t symbolic_vec(g_symbolic_tm, bv_elements);
      g_neon_memory_u16x8[addr].push_back(symbolic_vec);
    }
  }

  // Populate RISC-V memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_input_fp));
  }

  // Output stride (bytes between output columns)
  size_t output_stride = mc * sizeof(uint16_t);

  std::cout << "Testing XNNPACK f16_spmm: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = clamp(bias + input[i] * weight, min, max)" << std::endl;
  std::cout << "Using concrete bias=" << (float)bias_val << ", weight=" << (float)weight_val << std::endl;
  std::cout << "mc (input elements): " << mc << std::endl;
  std::cout << "nc (output columns): " << nc << std::endl;
  std::cout << "nnz (non-zeros per column): " << nnz << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_spmm_minmax_ukernel_16x1__neonfp16arith_u2(
      mc * sizeof(uint16_t),
      nc,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      reinterpret_cast<const xnn_float16*>(weights_neon.data()),
      widx_dmap.data(),
      nidx_nnzmap.data(),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      output_stride,
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_spmm_minmax_ukernel_16x1__rvv_u2(
      mc * sizeof(_Float16),
      nc,
      input_riscv.data(),
      weights_riscv.data(),
      widx_dmap.data(),
      nidx_nnzmap.data(),
      output_riscv.data(),
      output_stride,
      &params);

  // Collect NEON output results
  std::vector<Term> neon_output_elements;
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try u16x8 storage first (for 8-element path)
    auto it8 = g_neon_memory_u16x8.find(base_addr);
    if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
      const uint16x8_t& vec = it8->second.back();
      for (size_t i = 0; i < 8 && i < mc; i++) {
        neon_output_elements.push_back(vec.getLane(i));
      }
    }

    // Try u16x4 storage (for 4-element path)
    if (neon_output_elements.empty()) {
      auto it4 = g_neon_memory_u16x4.find(base_addr);
      if (it4 != g_neon_memory_u16x4.end() && !it4->second.empty()) {
        const uint16x4_t& vec = it4->second.back();
        for (size_t i = 0; i < 4 && i < mc; i++) {
          neon_output_elements.push_back(vec.getLane(i));
        }
      }
    }

    // Try scalar u16 memory
    if (neon_output_elements.empty()) {
      for (size_t i = 0; i < mc; i++) {
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
    auto it = g_riscv_memory_f16m1.find(addr);
    if (it != g_riscv_memory_f16m1.end() && !it->second.empty()) {
      const vfloat16m1_t& vec = it->second.back();
      for (size_t i = 0; i < vec.getVL() && i < mc; i++) {
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

    std::cout << "\nInput values:" << std::endl;
    for (size_t i = 0; i < mc; i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input_bv[i])
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
