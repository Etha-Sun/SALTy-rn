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
void xnn_f32_vmulc_ukernel__neon_u4(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params);

void xnn_f32_vmulc_ukernel__rvv_u4(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // vmulc: output[i] = input_a[i] * (*input_b)
  // This is a vector-scalar multiply operation
  // batch is in bytes, so batch/sizeof(float) is the number of elements

  const size_t num_elements = 57;  // Test with 8 elements (2 iterations of NEON 4-wide)
  const size_t batch = num_elements * sizeof(float);

  // Allocate arrays
  std::vector<float> input_a(num_elements + 16, 0.0f);
  float input_b_val = 0.0f;  // Scalar multiplier
  std::vector<float> output_neon(num_elements + 16, 0.0f);
  std::vector<float> output_riscv(num_elements + 16, 0.0f);

  // Default params (unused for vmulc but required by interface)
  xnn_f32_default_params params;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic input vector A
  std::vector<Term> symbolic_a;
  symbolic_a.reserve(num_elements);
  for (size_t i = 0; i < num_elements; i++) {
    symbolic_a.push_back(tm.mkConst(fp32, "a_" + std::to_string(i)));
  }

  // Symbolic scalar B
  Term symbolic_b = tm.mkConst(fp32, "b");

  // Populate NEON memory for input_a
  // NEON uses vld1q_f32 (4 floats) for main loop and vld1_f32/vld1_lane for tail
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_a.data() + i);

    // For vld1q_f32 (4 floats)
    std::array<Term, 4> lanes4;
    for (size_t j = 0; j < 4; j++) {
      size_t idx = i + j;
      if (idx < num_elements) {
        lanes4[j] = symbolic_a[idx];
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
        lanes2[j] = symbolic_a[idx];
      } else {
        lanes2[j] = zero;
      }
    }
    g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

    // Scalar memory for single element access
    g_neon_float_scalar_memory[addr] = symbolic_a[i];
  }

  // Populate NEON memory for input_b (scalar, broadcasted via vld1q_dup_f32)
  uintptr_t b_addr = reinterpret_cast<uintptr_t>(&input_b_val);
  g_neon_float_scalar_memory[b_addr] = symbolic_b;
  // vld1q_dup_f32 broadcasts scalar to all 4 lanes
  std::array<Term, 4> b_lanes4 = {symbolic_b, symbolic_b, symbolic_b, symbolic_b};
  g_neon_memory_f32x4[b_addr].push_back(float32x4_t(g_symbolic_tm, b_lanes4));

  // Populate RISC-V memory for input_a
  // RVV uses vle32_v_f32m2 to load vectors
  for (size_t i = 0; i < num_elements; i++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_a.data() + i);

    // Scalar memory for individual loads
    g_riscv_float_scalar_memory[addr] = symbolic_a[i];

    // Vector memory for vle32 loads (using m2 which can hold more elements)
    std::vector<Term> chunk;
    for (size_t j = 0; j < 16; j++) {  // m2 can hold up to 16 elements
      size_t idx = i + j;
      if (idx < num_elements) {
        chunk.push_back(symbolic_a[idx]);
      } else {
        chunk.push_back(zero);
      }
    }
    g_riscv_memory_f32m2[addr].push_back(vfloat32m2_t(g_symbolic_tm, chunk));
  }

  // Populate RISC-V memory for input_b (scalar)
  g_riscv_float_scalar_memory[b_addr] = symbolic_b;

  std::cout << "Testing XNNPACK f32_vmulc: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = input_a[i] * scalar_b" << std::endl;
  std::cout << "Number of elements: " << num_elements << std::endl;
  std::cout << "Batch size (bytes): " << batch << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_vmulc_ukernel__neon_u4(
      batch,
      input_a.data(),
      &input_b_val,
      output_neon.data(),
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_vmulc_ukernel__rvv_u4(
      batch,
      input_a.data(),
      &input_b_val,
      output_riscv.data(),
      &params);

  // Collect results from NEON
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon.data(), num_elements);

  // Collect results from RISC-V (uses f32m2 stores)
  // The kernel may loop and store at different offsets, so we scan consecutive addresses
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(num_elements);

  uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_riscv.data());

  for (size_t i = 0; i < num_elements;) {
    uintptr_t current_addr = base_addr + i * sizeof(float);
    bool found = false;

    // Try f32m2 first (what the kernel uses)
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
  // Denormals (subnormals) may be flushed to zero on RVV, so we treat
  // "both denormal/zero" as equivalent
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_elements[i], riscv_elements[i]});

    // NaN handling: both NaN = equivalent
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_elements[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});

    // Denormal/zero handling: if both are subnormal or zero, treat as equivalent
    // This accounts for flush-to-zero (FTZ) behavior differences
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

    std::cout << "\nInput A values:" << std::endl;
    for (size_t i = 0; i < num_elements; i++) {
      std::cout << "  a[" << i << "] = " << solver.getValue(symbolic_a[i]) << std::endl;
    }

    std::cout << "\nScalar B value:" << std::endl;
    std::cout << "  b = " << solver.getValue(symbolic_b) << std::endl;

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
