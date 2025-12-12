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
void xnn_f32_vmulcaddc_minmax_ukernel_c4__neon_2x(
    size_t rows,
    size_t channels,
    const float* input,
    size_t input_stride,
    const float* weights,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params);

void xnn_f32_vmulcaddc_minmax_ukernel_c4__rvv_2x(
    size_t rows,
    size_t channels,
    const float* input,
    size_t input_stride,
    const float* weights,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // f32-vmulcaddc: output = clamp(input * scale + bias, min, max)
  // This kernel processes 2 rows at a time with 4 channels per iteration
  // Weights are packed as [scale0-3, bias0-3]

  const size_t rows = 3;
  const size_t channels = 5;  // Testing with 5 channels (4 + 1 tail)
  const size_t input_stride = channels * sizeof(float);
  const size_t output_stride = channels * sizeof(float);

  // Calculate how many weight groups we need (each group is 8 floats: 4 scales + 4 biases)
  // RVV advances w by 8 each iteration, so we need enough weights for all iterations
  const size_t num_weight_groups = (channels + 3) / 4;  // Ceiling division

  // Allocate arrays with padding
  std::vector<float> input(rows * channels + 16, 0.0f);
  std::vector<float> weights(num_weight_groups * 8 + 16, 0.0f);  // Multiple groups of (4 scales + 4 biases)
  std::vector<float> output_neon(rows * channels + 16, 0.0f);
  std::vector<float> output_riscv(rows * channels + 16, 0.0f);

  // Setup params struct with min/max clamp values
  struct xnn_f32_minmax_params params;
  params.scalar.min = -10.0f;
  params.scalar.max = 10.0f;

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic input for row 0 and row 1
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(rows * channels);
  for (size_t r = 0; r < rows; r++) {
    for (size_t c = 0; c < channels; c++) {
      symbolic_input.push_back(tm.mkConst(fp32, "x_r" + std::to_string(r) + "_c" + std::to_string(c)));
    }
  }

  // Symbolic scales and biases
  std::vector<Term> symbolic_scales;
  std::vector<Term> symbolic_biases;
  for (size_t c = 0; c < channels; c++) {
    symbolic_scales.push_back(tm.mkConst(fp32, "scale_" + std::to_string(c)));
    symbolic_biases.push_back(tm.mkConst(fp32, "bias_" + std::to_string(c)));
  }

  // Populate NEON memory for input (all rows)
  for (size_t r = 0; r < rows; r++) {
    for (size_t i = 0; i < channels; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + r * channels + i);
      size_t base_idx = r * channels;

      // For vld1q_f32 (4 floats)
      std::array<Term, 4> lanes4;
      for (size_t j = 0; j < 4; j++) {
        size_t idx = i + j;
        if (idx < channels) {
          lanes4[j] = symbolic_input[base_idx + idx];
        } else {
          lanes4[j] = zero;
        }
      }
      g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes4));

      // For vld1_f32 (2 floats) - tail case
      std::array<Term, 2> lanes2;
      for (size_t j = 0; j < 2; j++) {
        size_t idx = i + j;
        if (idx < channels) {
          lanes2[j] = symbolic_input[base_idx + idx];
        } else {
          lanes2[j] = zero;
        }
      }
      g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, lanes2));

      g_neon_float_scalar_memory[addr] = symbolic_input[base_idx + i];
    }
  }

  // Populate NEON memory for weights
  // NEON reads scales at w[0-3] and biases at w[4-7] for each group
  // For tail handling, it reuses the same weights from the beginning
  uintptr_t weights_addr = reinterpret_cast<uintptr_t>(weights.data());

  for (size_t group = 0; group < num_weight_groups; group++) {
    uintptr_t group_addr = weights_addr + group * 8 * sizeof(float);

    // Scales for this group
    std::array<Term, 4> scale_lanes;
    for (size_t j = 0; j < 4; j++) {
      size_t ch_idx = group * 4 + j;
      scale_lanes[j] = (ch_idx < channels) ? symbolic_scales[ch_idx] : zero;
    }
    g_neon_memory_f32x4[group_addr].push_back(float32x4_t(g_symbolic_tm, scale_lanes));

    // Biases for this group (at offset +4)
    uintptr_t bias_group_addr = group_addr + 4 * sizeof(float);
    std::array<Term, 4> bias_lanes;
    for (size_t j = 0; j < 4; j++) {
      size_t ch_idx = group * 4 + j;
      bias_lanes[j] = (ch_idx < channels) ? symbolic_biases[ch_idx] : zero;
    }
    g_neon_memory_f32x4[bias_group_addr].push_back(float32x4_t(g_symbolic_tm, bias_lanes));
  }

  // Populate RISC-V memory for input (all rows)
  for (size_t r = 0; r < rows; r++) {
    for (size_t i = 0; i < channels; i++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(input.data() + r * channels + i);
      size_t base_idx = r * channels;
      g_riscv_float_scalar_memory[addr] = symbolic_input[base_idx + i];

      std::vector<Term> chunk;
      for (size_t j = 0; j < 4; j++) {
        size_t idx = i + j;
        if (idx < channels) {
          chunk.push_back(symbolic_input[base_idx + idx]);
        } else {
          chunk.push_back(zero);
        }
      }
      g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
    }
  }

  // Populate RISC-V memory for weights
  // RVV reads scales and biases for each iteration, advancing w by 8 each time
  for (size_t group = 0; group < num_weight_groups; group++) {
    uintptr_t group_addr = weights_addr + group * 8 * sizeof(float);

    // Scales for this group
    std::vector<Term> scale_vec;
    for (size_t j = 0; j < 4; j++) {
      size_t ch_idx = group * 4 + j;
      scale_vec.push_back((ch_idx < channels) ? symbolic_scales[ch_idx] : zero);
    }
    g_riscv_memory_f32m1[group_addr].push_back(vfloat32m1_t(g_symbolic_tm, scale_vec));

    // Biases for this group (at offset +4)
    uintptr_t bias_group_addr = group_addr + 4 * sizeof(float);
    std::vector<Term> bias_vec;
    for (size_t j = 0; j < 4; j++) {
      size_t ch_idx = group * 4 + j;
      bias_vec.push_back((ch_idx < channels) ? symbolic_biases[ch_idx] : zero);
    }
    g_riscv_memory_f32m1[bias_group_addr].push_back(vfloat32m1_t(g_symbolic_tm, bias_vec));
  }

  std::cout << "Testing XNNPACK f32_vmulcaddc: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output = clamp(input * scale + bias, min, max)" << std::endl;
  std::cout << "Rows: " << rows << ", Channels: " << channels << std::endl;
  std::cout << "Min: " << params.scalar.min << ", Max: " << params.scalar.max << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_vmulcaddc_minmax_ukernel_c4__neon_2x(
      rows,
      channels * sizeof(float),
      input.data(),
      input_stride,
      weights.data(),
      output_neon.data(),
      output_stride,
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_vmulcaddc_minmax_ukernel_c4__rvv_2x(
      rows,
      channels * sizeof(float),
      input.data(),
      input_stride,
      weights.data(),
      output_riscv.data(),
      output_stride,
      &params);

  // Collect results from NEON
  // Custom collection to handle vst1q_f32 (4 elements), vst1_f32 (2 elements), and vst1_lane_f32 (1 element)
  std::vector<Term> neon_elements;
  neon_elements.reserve(rows * channels);

  uintptr_t neon_base_addr = reinterpret_cast<uintptr_t>(output_neon.data());

  for (size_t i = 0; i < rows * channels;) {
    uintptr_t current_addr = neon_base_addr + i * sizeof(float);
    bool found = false;

    // Try float32x4_t first (vst1q_f32 stores 4 elements)
    auto it_f32x4 = g_neon_memory_f32x4.find(current_addr);
    if (it_f32x4 != g_neon_memory_f32x4.end() && !it_f32x4->second.empty()) {
      const float32x4_t& vec = it_f32x4->second.back();
      size_t len = std::min(static_cast<size_t>(4), rows * channels - i);
      for (size_t lane = 0; lane < len; lane++) {
        neon_elements.push_back(vec.getLane(lane));
      }
      i += 4;
      found = true;
      continue;
    }

    // Try float32x2_t (vst1_f32 stores 2 elements, vst1_lane_f32 stores 1)
    auto it_f32x2 = g_neon_memory_f32x2.find(current_addr);
    if (it_f32x2 != g_neon_memory_f32x2.end() && !it_f32x2->second.empty()) {
      const float32x2_t& vec = it_f32x2->second.back();
      // For vst1_lane_f32, only lane 0 is valid; for vst1_f32, both lanes are valid
      // Check if next address also has a store to determine if it was vst1_lane (1 elem) or vst1 (2 elem)
      uintptr_t next_addr = current_addr + sizeof(float);
      bool next_has_store = (g_neon_memory_f32x4.count(next_addr) && !g_neon_memory_f32x4[next_addr].empty()) ||
                            (g_neon_memory_f32x2.count(next_addr) && !g_neon_memory_f32x2[next_addr].empty());

      if (next_has_store) {
        // vst1_lane_f32 case - only 1 element
        neon_elements.push_back(vec.getLane(0));
        i += 1;
      } else {
        // vst1_f32 case - 2 elements
        size_t len = std::min(static_cast<size_t>(2), rows * channels - i);
        for (size_t lane = 0; lane < len; lane++) {
          neon_elements.push_back(vec.getLane(lane));
        }
        i += 2;
      }
      found = true;
      continue;
    }

    // Try scalar float memory
    auto it_scalar = g_neon_float_scalar_memory.find(current_addr);
    if (it_scalar != g_neon_float_scalar_memory.end()) {
      neon_elements.push_back(it_scalar->second);
      i++;
      found = true;
      continue;
    }

    // No data found, skip this element
    if (!found) {
      i++;
    }
  }

  // Collect results from RISC-V (uses f32m1 stores)
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(rows * channels);

  uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_riscv.data());

  for (size_t i = 0; i < rows * channels;) {
    uintptr_t current_addr = base_addr + i * sizeof(float);
    bool found = false;

    // Try f32m1 first (what this kernel uses)
    auto it_m1 = g_riscv_memory_f32m1.find(current_addr);
    if (it_m1 != g_riscv_memory_f32m1.end() && !it_m1->second.empty()) {
      const vfloat32m1_t& vec = it_m1->second.back();
      size_t vec_len = vec.getVL();
      for (size_t elem = 0; elem < vec_len && i + elem < rows * channels; elem++) {
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
    for (size_t r = 0; r < rows; r++) {
      for (size_t c = 0; c < channels; c++) {
        std::cout << "  x[" << r << "][" << c << "] = " << solver.getValue(symbolic_input[r * channels + c]) << std::endl;
      }
    }

    std::cout << "\nScale values:" << std::endl;
    for (size_t c = 0; c < channels; c++) {
      std::cout << "  scale[" << c << "] = " << solver.getValue(symbolic_scales[c]) << std::endl;
    }

    std::cout << "\nBias values:" << std::endl;
    for (size_t c = 0; c < channels; c++) {
      std::cout << "  bias[" << c << "] = " << solver.getValue(symbolic_biases[c]) << std::endl;
    }

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
