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

// Forward declarations for f16 vcmul kernels
extern "C" {
void xnn_f16_vcmul_ukernel__neonfp16arith_u16(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
    xnn_float16* output,
    const struct xnn_f16_default_params* params);

void xnn_f16_vcmul_ukernel__rvv_u16(
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

  // f16-vcmul: Complex multiplication for float16
  // Complex multiplication: (a_r + a_i*j) * (b_r + b_i*j) = (a_r*b_r - a_i*b_i) + (a_r*b_i + a_i*b_r)*j
  // Data layout: Real parts at input[0..batch-1], Imaginary parts at input[batch..2*batch-1]
  // output_real[i] = a_real[i] * b_real[i] - a_imag[i] * b_imag[i]
  // output_imag[i] = a_real[i] * b_imag[i] + a_imag[i] * b_real[i]

  const size_t num_elements = 4;  // Keep small for verification
  const size_t batch = num_elements * sizeof(uint16_t);

  // Allocate arrays for NEON operations (uses uint16_t loads/stores)
  // Layout: [real_0..real_n-1, imag_0..imag_n-1]
  std::vector<uint16_t> input_a_neon(num_elements * 2 + 16, 0);
  std::vector<uint16_t> input_b_neon(num_elements * 2 + 16, 0);
  std::vector<uint16_t> output_neon(num_elements * 2 + 16, 0);

  // Allocate arrays for RVV operations (uses _Float16 directly)
  std::vector<_Float16> input_a_riscv(num_elements * 2 + 16, 0);
  std::vector<_Float16> input_b_riscv(num_elements * 2 + 16, 0);
  std::vector<_Float16> output_riscv(num_elements * 2 + 16, 0);

  // Setup params struct (not used for vcmul but required by signatures)
  struct xnn_f16_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs using bitvector representation
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements for complex numbers a and b
  // a = a_real + a_imag*j
  // b = b_real + b_imag*j
  std::vector<Term> symbolic_a_real_bv, symbolic_a_imag_bv;
  std::vector<Term> symbolic_b_real_bv, symbolic_b_imag_bv;
  std::vector<Term> symbolic_a_real_fp, symbolic_a_imag_fp;
  std::vector<Term> symbolic_b_real_fp, symbolic_b_imag_fp;

  for (size_t i = 0; i < num_elements; i++) {
    // Create symbolic bitvectors for inputs
    Term ar_bv = tm.mkConst(bv16, "a_real_" + std::to_string(i));
    Term ai_bv = tm.mkConst(bv16, "a_imag_" + std::to_string(i));
    Term br_bv = tm.mkConst(bv16, "b_real_" + std::to_string(i));
    Term bi_bv = tm.mkConst(bv16, "b_imag_" + std::to_string(i));

    symbolic_a_real_bv.push_back(ar_bv);
    symbolic_a_imag_bv.push_back(ai_bv);
    symbolic_b_real_bv.push_back(br_bv);
    symbolic_b_imag_bv.push_back(bi_bv);

    // Convert to fp16 for constraints
    Term ar_fp = tm.mkTerm(to_fp_op, {ar_bv});
    Term ai_fp = tm.mkTerm(to_fp_op, {ai_bv});
    Term br_fp = tm.mkTerm(to_fp_op, {br_bv});
    Term bi_fp = tm.mkTerm(to_fp_op, {bi_bv});

    symbolic_a_real_fp.push_back(ar_fp);
    symbolic_a_imag_fp.push_back(ai_fp);
    symbolic_b_real_fp.push_back(br_fp);
    symbolic_b_imag_fp.push_back(bi_fp);

    // Exclude NaN values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {ar_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {ai_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {br_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {bi_fp})}));

    // Exclude infinity values
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {ar_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {ai_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {br_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {bi_fp})}));
  }

  // Populate NEON memory for input_a (real at offset 0, imag at offset batch)
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(input_a_neon.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(input_a_neon.data()) + batch;

    std::array<Term, 8> bv_elements_real;
    std::array<Term, 8> bv_elements_imag;
    for (size_t i = 0; i < num_elements; i++) {
      bv_elements_real[i] = symbolic_a_real_bv[i];
      bv_elements_imag[i] = symbolic_a_imag_bv[i];
    }
    for (size_t i = num_elements; i < 8; i++) {
      bv_elements_real[i] = tm.mkBitVector(16, 0);
      bv_elements_imag[i] = tm.mkBitVector(16, 0);
    }

    uint16x8_t symbolic_vec_real(g_symbolic_tm, bv_elements_real);
    uint16x8_t symbolic_vec_imag(g_symbolic_tm, bv_elements_imag);
    g_neon_memory_u16x8[addr_real].push_back(symbolic_vec_real);
    g_neon_memory_u16x8[addr_imag].push_back(symbolic_vec_imag);
  }

  // Populate NEON memory for input_b
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(input_b_neon.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(input_b_neon.data()) + batch;

    std::array<Term, 8> bv_elements_real;
    std::array<Term, 8> bv_elements_imag;
    for (size_t i = 0; i < num_elements; i++) {
      bv_elements_real[i] = symbolic_b_real_bv[i];
      bv_elements_imag[i] = symbolic_b_imag_bv[i];
    }
    for (size_t i = num_elements; i < 8; i++) {
      bv_elements_real[i] = tm.mkBitVector(16, 0);
      bv_elements_imag[i] = tm.mkBitVector(16, 0);
    }

    uint16x8_t symbolic_vec_real(g_symbolic_tm, bv_elements_real);
    uint16x8_t symbolic_vec_imag(g_symbolic_tm, bv_elements_imag);
    g_neon_memory_u16x8[addr_real].push_back(symbolic_vec_real);
    g_neon_memory_u16x8[addr_imag].push_back(symbolic_vec_imag);
  }

  // Populate RISC-V memory for input_a
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(input_a_riscv.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(input_a_riscv.data()) + batch;

    g_riscv_memory_f16m1[addr_real].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_a_real_fp));
    g_riscv_memory_f16m1[addr_imag].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_a_imag_fp));
  }

  // Populate RISC-V memory for input_b
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(input_b_riscv.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(input_b_riscv.data()) + batch;

    g_riscv_memory_f16m1[addr_real].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_b_real_fp));
    g_riscv_memory_f16m1[addr_imag].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_b_imag_fp));
  }

  std::cout << "Testing XNNPACK f16_vcmul: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Complex multiplication (a_r + a_i*j) * (b_r + b_i*j)" << std::endl;
  std::cout << "  output_real[i] = a_real[i] * b_real[i] - a_imag[i] * b_imag[i]" << std::endl;
  std::cout << "  output_imag[i] = a_real[i] * b_imag[i] + a_imag[i] * b_real[i]" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vcmul_ukernel__neonfp16arith_u16(
      batch,
      reinterpret_cast<const xnn_float16*>(input_a_neon.data()),
      reinterpret_cast<const xnn_float16*>(input_b_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vcmul_ukernel__rvv_u16(
      batch,
      reinterpret_cast<const xnn_float16*>(input_a_riscv.data()),
      reinterpret_cast<const xnn_float16*>(input_b_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      &params);

  // Collect NEON output results (real and imaginary parts)
  std::vector<Term> neon_output_real, neon_output_imag;
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(output_neon.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(output_neon.data()) + batch;

    // Try u16x8 storage first (for full 8-element stores)
    auto it_real = g_neon_memory_u16x8.find(addr_real);
    if (it_real != g_neon_memory_u16x8.end() && !it_real->second.empty()) {
      const uint16x8_t& vec = it_real->second.back();
      for (size_t i = 0; i < 8 && i < num_elements; i++) {
        neon_output_real.push_back(vec.getLane(i));
      }
    }

    auto it_imag = g_neon_memory_u16x8.find(addr_imag);
    if (it_imag != g_neon_memory_u16x8.end() && !it_imag->second.empty()) {
      const uint16x8_t& vec = it_imag->second.back();
      for (size_t i = 0; i < 8 && i < num_elements; i++) {
        neon_output_imag.push_back(vec.getLane(i));
      }
    }

    // Try u16x4 storage (for 4-element stores via vst1_u16)
    if (neon_output_real.empty()) {
      auto it4_real = g_neon_memory_u16x4.find(addr_real);
      if (it4_real != g_neon_memory_u16x4.end() && !it4_real->second.empty()) {
        const uint16x4_t& vec = it4_real->second.back();
        for (size_t i = 0; i < 4 && i < num_elements; i++) {
          neon_output_real.push_back(vec.getLane(i));
        }
      }
    }

    if (neon_output_imag.empty()) {
      auto it4_imag = g_neon_memory_u16x4.find(addr_imag);
      if (it4_imag != g_neon_memory_u16x4.end() && !it4_imag->second.empty()) {
        const uint16x4_t& vec = it4_imag->second.back();
        for (size_t i = 0; i < 4 && i < num_elements; i++) {
          neon_output_imag.push_back(vec.getLane(i));
        }
      }
    }

    // Try scalar u16 memory (for vst1_lane_u16 single-element stores)
    if (neon_output_real.empty()) {
      for (size_t i = 0; i < num_elements; i++) {
        uintptr_t addr = addr_real + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_real.push_back(scalar_it->second);
        }
      }
    }

    if (neon_output_imag.empty()) {
      for (size_t i = 0; i < num_elements; i++) {
        uintptr_t addr = addr_imag + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_imag.push_back(scalar_it->second);
        }
      }
    }
  }

  // Collect RISC-V output results
  std::vector<Term> riscv_output_real, riscv_output_imag;
  {
    uintptr_t addr_real = reinterpret_cast<uintptr_t>(output_riscv.data());
    uintptr_t addr_imag = reinterpret_cast<uintptr_t>(output_riscv.data()) + batch;

    // Get real part output
    auto it_real = g_riscv_memory_f16m1.find(addr_real);
    if (it_real != g_riscv_memory_f16m1.end() && !it_real->second.empty()) {
      const vfloat16m1_t& vec = it_real->second.back();
      for (size_t i = 0; i < vec.getVL() && i < num_elements; i++) {
        riscv_output_real.push_back(vec.getElement(i));
      }
    }

    // Get imaginary part output
    auto it_imag = g_riscv_memory_f16m1.find(addr_imag);
    if (it_imag != g_riscv_memory_f16m1.end() && !it_imag->second.empty()) {
      const vfloat16m1_t& vec = it_imag->second.back();
      for (size_t i = 0; i < vec.getVL() && i < num_elements; i++) {
        riscv_output_imag.push_back(vec.getElement(i));
      }
    }
  }

  std::cout << "\nNEON collected " << neon_output_real.size() << " real, "
            << neon_output_imag.size() << " imag output elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_output_real.size() << " real, "
            << riscv_output_imag.size() << " imag output elements" << std::endl;

  if (neon_output_real.empty() || neon_output_imag.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_output_real.empty() || riscv_output_imag.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  // Compare outputs
  size_t compare_count_real = std::min(neon_output_real.size(), riscv_output_real.size());
  size_t compare_count_imag = std::min(neon_output_imag.size(), riscv_output_imag.size());

  // Build floating-point equality assertions
  std::vector<Term> all_equalities;

  // Compare real parts
  for (size_t i = 0; i < compare_count_real; i++) {
    Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_real[i]});
    Term eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_fp, riscv_output_real[i]});
    all_equalities.push_back(eq);
  }

  // Compare imaginary parts
  for (size_t i = 0; i < compare_count_imag; i++) {
    Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_imag[i]});
    Term eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_fp, riscv_output_imag[i]});
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

    std::cout << "\nInput A (complex):";
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "\n  a[" << i << "] = " << solver.getValue(symbolic_a_real_fp[i])
                << " + " << solver.getValue(symbolic_a_imag_fp[i]) << "*j";
    }

    std::cout << "\n\nInput B (complex):";
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "\n  b[" << i << "] = " << solver.getValue(symbolic_b_real_fp[i])
                << " + " << solver.getValue(symbolic_b_imag_fp[i]) << "*j";
    }

    std::cout << "\n\nOutput comparison (real parts):";
    for (size_t i = 0; i < compare_count_real; i++) {
      Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_real[i]});
      std::cout << "\n  real[" << i << "]: NEON = " << solver.getValue(neon_fp)
                << ", RISC-V = " << solver.getValue(riscv_output_real[i]);
    }

    std::cout << "\n\nOutput comparison (imaginary parts):";
    for (size_t i = 0; i < compare_count_imag; i++) {
      Term neon_fp = tm.mkTerm(to_fp_op, {neon_output_imag[i]});
      std::cout << "\n  imag[" << i << "]: NEON = " << solver.getValue(neon_fp)
                << ", RISC-V = " << solver.getValue(riscv_output_imag[i]);
    }
    std::cout << std::endl;
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
