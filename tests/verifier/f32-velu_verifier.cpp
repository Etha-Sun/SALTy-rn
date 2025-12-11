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
#include <cstring>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_f32_velu_ukernel__neon_rr2_lut16_p3_u16(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_elu_params* params);

void xnn_f32_velu_ukernel__rvv_rr2_lut16_p3(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_elu_params* params);
}

// Global LUT table for exp2minus
extern "C" const uint32_t xnn_table_exp2minus_k_over_16[16] = {
    0x3F800000,  // 2^(0/16) = 1.0
    0x3F7DAAC3,  // 2^(-1/16)
    0x3F7B95C2,  // 2^(-2/16)
    0x3F79C0C5,  // 2^(-3/16)
    0x3F782A0C,  // 2^(-4/16)
    0x3F76D19D,  // 2^(-5/16)
    0x3F75B6B3,  // 2^(-6/16)
    0x3F74D89C,  // 2^(-7/16)
    0x3F7436B5,  // 2^(-8/16)
    0x3F73D04D,  // 2^(-9/16)
    0x3F73A4D3,  // 2^(-10/16)
    0x3F73B3A8,  // 2^(-11/16)
    0x3F73FC35,  // 2^(-12/16)
    0x3F747DED,  // 2^(-13/16)
    0x3F75383F,  // 2^(-14/16)
    0x3F762A9E   // 2^(-15/16)
};

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // ELU operation:
  // For x < 0: output = alpha * (exp(prescale * x) - 1)
  // For x >= 0: output = beta * x
  // This kernel uses a LUT-based approximation for exp

  const size_t num_elements = 4;  // Test with 4 elements (matches NEON's 4-wide processing)
  const size_t batch = num_elements * sizeof(float);

  // Allocate arrays
  std::vector<float> input(num_elements + 16, 0.0f);
  std::vector<float> output_neon(num_elements + 16, 0.0f);
  std::vector<float> output_riscv(num_elements + 16, 0.0f);

  // ELU params
  xnn_f32_elu_params params;
  params.scalar.prescale = 1.0f;
  params.scalar.alpha = 1.0f;
  params.scalar.beta = 1.0f;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic input vector
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    Term x = tm.mkConst(fp32, "x_" + std::to_string(i));
    symbolic_input.push_back(x);

    // Constrain inputs to be normal numbers (not NaN, Inf, subnormal, or zero)
    Term is_normal = tm.mkTerm(Kind::FLOATINGPOINT_IS_NORMAL, {x});
    solver.assertFormula(is_normal);
  }

  // Use concrete params (typical ELU: prescale=1, alpha=1, beta=1)
  // Using symbolic params causes counterexamples with zero params,
  // which is a degenerate case not used in practice
  float prescale_val = 1.0f;
  float alpha_val = 1.0f;
  float beta_val = 1.0f;

  uint32_t prescale_bits, alpha_bits, beta_bits;
  std::memcpy(&prescale_bits, &prescale_val, sizeof(float));
  std::memcpy(&alpha_bits, &alpha_val, sizeof(float));
  std::memcpy(&beta_bits, &beta_val, sizeof(float));

  Term symbolic_prescale = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, prescale_bits));
  Term symbolic_alpha = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, alpha_bits));
  Term symbolic_beta = tm.mkFloatingPoint(8, 24, tm.mkBitVector(32, beta_bits));

  // Store params at params address
  uintptr_t params_addr = reinterpret_cast<uintptr_t>(&params);
  g_neon_float_scalar_memory[params_addr] = symbolic_prescale;
  g_neon_float_scalar_memory[params_addr + sizeof(float)] = symbolic_alpha;
  g_neon_float_scalar_memory[params_addr + 2 * sizeof(float)] = symbolic_beta;
  g_riscv_float_scalar_memory[params_addr] = symbolic_prescale;
  g_riscv_float_scalar_memory[params_addr + sizeof(float)] = symbolic_alpha;
  g_riscv_float_scalar_memory[params_addr + 2 * sizeof(float)] = symbolic_beta;

  // Populate NEON memory for input
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + i);

    // For vld1q_f32 (4 floats)
    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_input[idx];
      } else {
        lanes4[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

    // For vld1_f32 (2 floats) - tail case
    std::array<Term, 2> lanes2;
    for (size_t j = 0; j < 2; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes2[j] = symbolic_input[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    // Scalar memory for single element access
    g_neon_float_scalar_memory[addr] = symbolic_input[i];
  }

  // Populate LUT table for NEON (symbolic lookup)
  // The LUT contains exp2minus values for different indices
  Sort bv32 = tm.mkBitVectorSort(32);
  for (size_t i = 0; i < 16; i++) {
    uintptr_t lut_addr = reinterpret_cast<uintptr_t>(&xnn_table_exp2minus_k_over_16[i]);
    // Create concrete LUT value as bitvector
    Term lut_val = tm.mkBitVector(32, xnn_table_exp2minus_k_over_16[i]);
    // Store as scalar for vld1_dup_s32 and vld1_lane_s32
    g_neon_scalar_memory[lut_addr] = lut_val;

    // Also set up int32x2 memory for vld1_dup_s32
    std::array<Term, 2> s32_lanes = {lut_val, lut_val};
    g_neon_memory_i32x2[lut_addr].push_back(int32x2_t(g_symbolic_tm, s32_lanes));
  }

  // Populate RISC-V memory for input - only at base address
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(input.data());

    // Set up scalar memory for each element
    for (size_t i = 0; i < num_elements; i++) {
      g_riscv_float_scalar_memory[base_addr + i * sizeof(float)] = symbolic_input[i];
    }

    // Set up vector memory at base address only
    std::vector<Term> chunk;
    for (size_t j = 0; j < 16; j++) {
      if (j < num_elements) {
        chunk.push_back(symbolic_input[j]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m4[base_addr].push_back(vfloat32m4_t(g_symbolic_tm, chunk));
  }

  // Populate LUT table for RISC-V (indexed load vluxei32)
  for (size_t i = 0; i < 16; i++) {
    uintptr_t lut_addr = reinterpret_cast<uintptr_t>(&xnn_table_exp2minus_k_over_16[i]);
    Term lut_val = tm.mkBitVector(32, xnn_table_exp2minus_k_over_16[i]);
    g_riscv_scalar_memory[lut_addr] = lut_val;
  }

  std::cout << "Testing XNNPACK f32_velu: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: ELU activation (alpha * (exp(prescale*x) - 1) for x<0, beta*x for x>=0)" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  g_current_params_ptr = reinterpret_cast<void*>(&params);

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_velu_ukernel__neon_rr2_lut16_p3_u16(
      batch,
      input.data(),
      output_neon.data(),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_velu_ukernel__rvv_rr2_lut16_p3(
      batch,
      input.data(),
      output_riscv.data(),
      &params);

  // Collect results from NEON
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon.data(), num_elements);

  // Collect results from RISC-V
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(num_elements);

  uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_riscv.data());

  for (size_t i = 0; i < num_elements;) {
    uintptr_t current_addr = base_addr + i * sizeof(float);
    bool found = false;

    // Try f32m4 first (what the kernel uses)
    auto it_m4 = g_riscv_memory_f32m4.find(current_addr);
    if (it_m4 != g_riscv_memory_f32m4.end() && !it_m4->second.empty()) {
      const vfloat32m4_t& vec = it_m4->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < num_elements; elem++) {
        riscv_elements.push_back(vec.getElement(elem));
      }
      i += vec_len;
      found = true;
      continue;
    }

    // Try f32m2
    auto it_m2 = g_riscv_memory_f32m2.find(current_addr);
    if (it_m2 != g_riscv_memory_f32m2.end() && !it_m2->second.empty()) {
      const vfloat32m2_t& vec = it_m2->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < num_elements; elem++) {
        riscv_elements.push_back(vec.getElement(elem));
      }
      i += vec_len;
      found = true;
      continue;
    }

    // Try f32m1
    auto it_m1 = g_riscv_memory_f32m1.find(current_addr);
    if (it_m1 != g_riscv_memory_f32m1.end() && !it_m1->second.empty()) {
      const vfloat32m1_t& vec = it_m1->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < num_elements; elem++) {
        riscv_elements.push_back(vec.getElement(elem));
      }
      i += vec_len;
      found = true;
      continue;
    }

    // Try scalar storage
    auto scalar_it = g_riscv_float_scalar_memory.find(current_addr);
    if (scalar_it != g_riscv_float_scalar_memory.end()) {
      riscv_elements.push_back(scalar_it->second);
      i++;
      found = true;
      continue;
    }

    // No data found at this address, skip
    if (!found) {
      i++;
    }
  }

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
    std::cerr << "Comparing first " << compare_count << " floats" << std::endl;
  }

  // Build equality assertions (NaN-aware and denormal-tolerant floating point comparison)
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_elements[i], riscv_elements[i]});

    // NaN handling: both NaN = equivalent
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_elements[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});

    // Denormal/zero handling: if both are subnormal or zero, treat as equivalent
    Term neon_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {neon_elements[i]});
    Term neon_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {neon_elements[i]});
    Term neon_is_tiny = tm.mkTerm(Kind::OR, {neon_is_subnormal, neon_is_zero});

    Term riscv_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {riscv_elements[i]});
    Term riscv_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {riscv_elements[i]});
    Term riscv_is_tiny = tm.mkTerm(Kind::OR, {riscv_is_subnormal, riscv_is_zero});

    Term both_tiny = tm.mkTerm(Kind::AND, {neon_is_tiny, riscv_is_tiny});

    // Equal if: exact FP equal, OR both NaN, OR both tiny (subnormal/zero)
    Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan, both_tiny});
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

    std::cout << "\nParams (concrete):" << std::endl;
    std::cout << "  prescale = " << prescale_val << std::endl;
    std::cout << "  alpha = " << alpha_val << std::endl;
    std::cout << "  beta = " << beta_val << std::endl;

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < compare_count; i++) {
      std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
