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
void xnn_f32_vcmul_ukernel__neon_u16(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params);

void xnn_f32_vcmul_ukernel__rvv_u16(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const void* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // vcmul: Complex multiplication
  // input_a and input_b are complex arrays stored as [real_part, imag_part]
  // where real_part and imag_part are each 'batch' bytes
  // output[real] = a[real] * b[real] - a[imag] * b[imag]
  // output[imag] = a[real] * b[imag] + a[imag] * b[real]

  const size_t num_elements = 8;  // Number of complex elements (real part)
  const size_t batch = num_elements * sizeof(float);  // batch is size of real part in bytes

  // Allocate arrays - need space for both real and imaginary parts
  // Layout: [real_0, real_1, ..., real_n, imag_0, imag_1, ..., imag_n]
  std::vector<float> input_a(num_elements * 2 + 16, 0.0f);
  std::vector<float> input_b(num_elements * 2 + 16, 0.0f);
  std::vector<float> output_neon(num_elements * 2 + 16, 0.0f);
  std::vector<float> output_riscv(num_elements * 2 + 16, 0.0f);

  // Default params (unused for vcmul but required by interface)
  xnn_f32_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic input vector A (real and imaginary parts)
  std::vector<Term> symbolic_ar;  // A real part
  std::vector<Term> symbolic_ai;  // A imaginary part
  symbolic_ar.reserve(num_elements);
  symbolic_ai.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    symbolic_ar.push_back(tm.mkConst(fp32, "ar_" + std::to_string(i)));
    symbolic_ai.push_back(tm.mkConst(fp32, "ai_" + std::to_string(i)));
  }

  // Symbolic input vector B (real and imaginary parts)
  std::vector<Term> symbolic_br;  // B real part
  std::vector<Term> symbolic_bi;  // B imaginary part
  symbolic_br.reserve(num_elements);
  symbolic_bi.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    symbolic_br.push_back(tm.mkConst(fp32, "br_" + std::to_string(i)));
    symbolic_bi.push_back(tm.mkConst(fp32, "bi_" + std::to_string(i)));
  }

  // Pointers to real and imaginary parts
  // Real part: input_a.data()
  // Imaginary part: input_a.data() + num_elements (offset by batch bytes)
  float* ar_ptr = input_a.data();
  float* ai_ptr = input_a.data() + num_elements;
  float* br_ptr = input_b.data();
  float* bi_ptr = input_b.data() + num_elements;

  // Populate NEON memory for input_a (real part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ar_ptr + i);

    // For vld1q_f32 (4 floats)
    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_ar[idx];
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
        lanes2[j] = symbolic_ar[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    g_neon_float_scalar_memory[addr] = symbolic_ar[i];
  }

  // Populate NEON memory for input_a (imaginary part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ai_ptr + i);

    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_ai[idx];
      } else {
        lanes4[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

    std::array<Term, 2> lanes2;
    for (size_t j = 0; j < 2; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes2[j] = symbolic_ai[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    g_neon_float_scalar_memory[addr] = symbolic_ai[i];
  }

  // Populate NEON memory for input_b (real part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(br_ptr + i);

    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_br[idx];
      } else {
        lanes4[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

    std::array<Term, 2> lanes2;
    for (size_t j = 0; j < 2; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes2[j] = symbolic_br[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    g_neon_float_scalar_memory[addr] = symbolic_br[i];
  }

  // Populate NEON memory for input_b (imaginary part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(bi_ptr + i);

    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_bi[idx];
      } else {
        lanes4[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

    std::array<Term, 2> lanes2;
    for (size_t j = 0; j < 2; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes2[j] = symbolic_bi[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    g_neon_float_scalar_memory[addr] = symbolic_bi[i];
  }

  // Populate RISC-V memory for input_a (real part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ar_ptr + i);

    g_riscv_float_scalar_memory[addr] = symbolic_ar[i];

    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        chunk.push_back(symbolic_ar[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for input_a (imaginary part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ai_ptr + i);

    g_riscv_float_scalar_memory[addr] = symbolic_ai[i];

    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        chunk.push_back(symbolic_ai[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for input_b (real part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(br_ptr + i);

    g_riscv_float_scalar_memory[addr] = symbolic_br[i];

    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        chunk.push_back(symbolic_br[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for input_b (imaginary part)
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(bi_ptr + i);

    g_riscv_float_scalar_memory[addr] = symbolic_bi[i];

    std::vector<Term> chunk;
    for (size_t j = 0; j < 8; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        chunk.push_back(symbolic_bi[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  std::cout << "Testing XNNPACK f32_vcmul: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Complex multiplication" << std::endl;
  std::cout << "  output_real[i] = a_real[i] * b_real[i] - a_imag[i] * b_imag[i]" << std::endl;
  std::cout << "  output_imag[i] = a_real[i] * b_imag[i] + a_imag[i] * b_real[i]" << std::endl;
  std::cout << "Number of complex elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_vcmul_ukernel__neon_u16(
      batch,
      input_a.data(),
      input_b.data(),
      output_neon.data(),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_vcmul_ukernel__rvv_u16(
      batch,
      input_a.data(),
      input_b.data(),
      output_riscv.data(),
      nullptr);

  // Collect results from NEON (real part)
  float* neon_or_ptr = output_neon.data();
  float* neon_oi_ptr = output_neon.data() + num_elements;
  std::vector<Term> neon_real = SymbolicNEONHelpers::collectResultsF32(neon_or_ptr, num_elements);
  std::vector<Term> neon_imag = SymbolicNEONHelpers::collectResultsF32(neon_oi_ptr, num_elements);

  // Collect results from RISC-V
  float* riscv_or_ptr = output_riscv.data();
  float* riscv_oi_ptr = output_riscv.data() + num_elements;

  std::vector<Term> riscv_real;
  std::vector<Term> riscv_imag;
  riscv_real.reserve(num_elements);
  riscv_imag.reserve(num_elements);

  // Collect real part
  uintptr_t base_addr_r = reinterpret_cast<uintptr_t>(riscv_or_ptr);
  for (size_t i = 0; i < num_elements;) {
    uintptr_t current_addr = base_addr_r + i * sizeof(float);
    bool found = false;

    auto it_m1 = g_riscv_memory_f32m1.find(current_addr);
    if (it_m1 != g_riscv_memory_f32m1.end() && !it_m1->second.empty()) {
      const vfloat32m1_t& vec = it_m1->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < num_elements; elem++) {
        riscv_real.push_back(vec.getElement(elem));
      }
      i += vec_len;
      found = true;
      continue;
    }

    auto scalar_it = g_riscv_float_scalar_memory.find(current_addr);
    if (scalar_it != g_riscv_float_scalar_memory.end()) {
      riscv_real.push_back(scalar_it->second);
      i++;
      found = true;
      continue;
    }

    if (!found) {
      i++;
    }
  }

  // Collect imaginary part
  uintptr_t base_addr_i = reinterpret_cast<uintptr_t>(riscv_oi_ptr);
  for (size_t i = 0; i < num_elements;) {
    uintptr_t current_addr = base_addr_i + i * sizeof(float);
    bool found = false;

    auto it_m1 = g_riscv_memory_f32m1.find(current_addr);
    if (it_m1 != g_riscv_memory_f32m1.end() && !it_m1->second.empty()) {
      const vfloat32m1_t& vec = it_m1->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < num_elements; elem++) {
        riscv_imag.push_back(vec.getElement(elem));
      }
      i += vec_len;
      found = true;
      continue;
    }

    auto scalar_it = g_riscv_float_scalar_memory.find(current_addr);
    if (scalar_it != g_riscv_float_scalar_memory.end()) {
      riscv_imag.push_back(scalar_it->second);
      i++;
      found = true;
      continue;
    }

    if (!found) {
      i++;
    }
  }

  std::cout << "\nNEON collected " << neon_real.size() << " real, " << neon_imag.size() << " imag elements" << std::endl;
  std::cout << "RISC-V collected " << riscv_real.size() << " real, " << riscv_imag.size() << " imag elements" << std::endl;

  if (neon_real.empty() || neon_imag.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_real.empty() || riscv_imag.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  // Compare outputs
  size_t compare_count_real = std::min(neon_real.size(), riscv_real.size());
  size_t compare_count_imag = std::min(neon_imag.size(), riscv_imag.size());

  if (neon_real.size() != riscv_real.size() || neon_imag.size() != riscv_imag.size()) {
    std::cerr << "WARNING: Different number of elements!" << std::endl;
    std::cerr << "NEON real: " << neon_real.size() << ", RISC-V real: " << riscv_real.size() << std::endl;
    std::cerr << "NEON imag: " << neon_imag.size() << ", RISC-V imag: " << riscv_imag.size() << std::endl;
  }

  // Build equality assertions
  std::vector<Term> all_equalities;

  // Compare real parts
  for (size_t i = 0; i < compare_count_real; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_real[i], riscv_real[i]});

    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_real[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_real[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});

    Term neon_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {neon_real[i]});
    Term neon_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {neon_real[i]});
    Term neon_is_tiny = tm.mkTerm(Kind::OR, {neon_is_subnormal, neon_is_zero});

    Term riscv_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {riscv_real[i]});
    Term riscv_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {riscv_real[i]});
    Term riscv_is_tiny = tm.mkTerm(Kind::OR, {riscv_is_subnormal, riscv_is_zero});

    Term both_tiny = tm.mkTerm(Kind::AND, {neon_is_tiny, riscv_is_tiny});

    Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan, both_tiny});
    all_equalities.push_back(eq);
  }

  // Compare imaginary parts
  for (size_t i = 0; i < compare_count_imag; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_imag[i], riscv_imag[i]});

    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_imag[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_imag[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});

    Term neon_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {neon_imag[i]});
    Term neon_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {neon_imag[i]});
    Term neon_is_tiny = tm.mkTerm(Kind::OR, {neon_is_subnormal, neon_is_zero});

    Term riscv_is_subnormal = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {riscv_imag[i]});
    Term riscv_is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {riscv_imag[i]});
    Term riscv_is_tiny = tm.mkTerm(Kind::OR, {riscv_is_subnormal, riscv_is_zero});

    Term both_tiny = tm.mkTerm(Kind::AND, {neon_is_tiny, riscv_is_tiny});

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

    std::cout << "\nInput A (complex) values:" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_ar[i])
                << " + " << solver.getValue(symbolic_ai[i]) << "i" << std::endl;
    }

    std::cout << "\nInput B (complex) values:" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  b[" << i << "] = " << solver.getValue(symbolic_br[i])
                << " + " << solver.getValue(symbolic_bi[i]) << "i" << std::endl;
    }

    std::cout << "\nReal output comparison:" << std::endl;
    for (size_t i = 0; i < compare_count_real; i++) {
      std::cout << "  real[" << i << "]: NEON = " << solver.getValue(neon_real[i])
                << ", RISC-V = " << solver.getValue(riscv_real[i]) << std::endl;
    }

    std::cout << "\nImaginary output comparison:" << std::endl;
    for (size_t i = 0; i < compare_count_imag; i++) {
      std::cout << "  imag[" << i << "]: NEON = " << solver.getValue(neon_imag[i])
                << ", RISC-V = " << solver.getValue(riscv_imag[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
