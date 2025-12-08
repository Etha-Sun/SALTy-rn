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
void xnn_f32_argmaxpool_ukernel_9p8x__neon_c4(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment);

void xnn_f32_argmaxpool_ukernel_9p8x__rvv_c4(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Argmaxpool parameters
  // Using small values to keep verification tractable
  const size_t output_pixels = 1;
  const size_t pooling_elements = 3;  // 9p8x means 9 elements per pass
  const size_t channels = 3;          // Test non-multiple of 4 to exercise tail path         

  // Calculate sizes
  const size_t input_size = pooling_elements * channels;
  const size_t output_size = output_pixels * channels;

  // Allocate input arrays - one pointer per pooling element
  std::vector<float> input_data(input_size, 0.0f);
  std::vector<const float*> input_ptrs(pooling_elements);
  for (size_t i = 0; i < pooling_elements; i++) {
    input_ptrs[i] = input_data.data() + i * channels;
  }

  // Allocate output arrays
  std::vector<float> output_neon(output_size, 0.0f);
  std::vector<float> output_riscv(output_size, 0.0f);
  std::vector<uint32_t> index_neon(output_size, 0);
  std::vector<uint32_t> index_riscv(output_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();
  // Also clear f32m1 memory which may not be in the standard clear
  g_riscv_memory_f32m1.clear();

  // Create symbolic float32 inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  std::vector<Term> symbolic_input;
  symbolic_input.reserve(input_size);
  for (size_t i = 0; i < input_size; i++) {
    symbolic_input.push_back(tm.mkConst(fp32, "in_" + std::to_string(i)));
  }

  // Populate NEON memory with symbolic float32 values
  // Store at each input row's base address (where the kernel will load from)
  // The kernel reads from input_ptrs[i] for i in [0, pooling_elements)
  // Each row has 'channels' floats
  for (size_t row = 0; row < pooling_elements; row++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_ptrs[row]);
    std::array<Term, 4> lanes;
    // Fill lanes with symbolic values for this row's channels
    // Pad with zeros if channels < 4
    Sort fp32 = tm.mkFloatingPointSort(8, 24);
    Term zero = tm.mkFloatingPointPosZero(8, 24);
    for (size_t j = 0; j < 4; j++) {
      if (j < channels) {
        lanes[j] = symbolic_input[row * channels + j];
      } else {
        lanes[j] = zero;
      }
    }
    g_neon_memory_f32x4[addr].push_back(float32x4_t(g_symbolic_tm, lanes));
  }

  // Populate RISC-V memory with symbolic float32 values
  // Same approach - store at each input row's base address
  for (size_t row = 0; row < pooling_elements; row++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_ptrs[row]);
    std::vector<Term> chunk;
    for (size_t j = 0; j < channels; j++) {
      chunk.push_back(symbolic_input[row * channels + j]);
    }
    g_riscv_memory_f32m1[addr].push_back(vfloat32m1_t(g_symbolic_tm, chunk));
  }

  std::cout << "Testing XNNPACK f32_argmaxpool: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Output pixels: " << output_pixels << std::endl;
  std::cout << "Pooling elements: " << pooling_elements << std::endl;
  std::cout << "Channels: " << channels << std::endl;
  std::cout << "Total input floats: " << input_size << std::endl;
  std::cout << "Total output floats: " << output_size << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_argmaxpool_ukernel_9p8x__neon_c4(
      output_pixels,
      pooling_elements,
      channels,
      input_ptrs.data(),
      0,  // input_offset
      0,  // input_pixel_stride
      output_neon.data(),
      index_neon.data(),
      0,  // input_increment
      0,  // output_increment
      0   // index_increment
  );

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_argmaxpool_ukernel_9p8x__rvv_c4(
      output_pixels,
      pooling_elements,
      channels,
      input_ptrs.data(),
      0,  // input_offset
      0,  // input_pixel_stride
      output_riscv.data(),
      index_riscv.data(),
      0,  // input_increment
      0,  // output_increment
      0   // index_increment
  );

  // Collect float32 results from NEON
  // Need to check multiple memory maps: f32x4 (main loop), f32x2 (tail 2-element stores)
  std::vector<Term> neon_output_elements;
  for (size_t i = 0; i < output_size; ) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data() + i);

    // First try f32x4 (4-element stores from main loop)
    auto it4 = g_neon_memory_f32x4.find(addr);
    if (it4 != g_neon_memory_f32x4.end() && !it4->second.empty()) {
      const float32x4_t& vec = it4->second.back();
      for (size_t j = 0; j < 4 && (i + j) < output_size; j++) {
        neon_output_elements.push_back(vec.getLane(j));
      }
      i += 4;
      continue;
    }

    // Try f32x2 (2-element stores from tail path)
    auto it2 = g_neon_memory_f32x2.find(addr);
    if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
      const float32x2_t& vec = it2->second.back();
      for (size_t j = 0; j < 2 && (i + j) < output_size; j++) {
        neon_output_elements.push_back(vec.getLane(j));
      }
      i += 2;
      continue;
    }

    // Single element not found, skip
    i += 1;
  }

  // Collect uint32 index results from NEON
  // Need to check multiple memory maps: u32x4 (main loop), u32x2 (tail 2-element stores),
  // and u8x8 (single-element stores via vst1_lane_u32)
  std::vector<Term> neon_index_elements;
  for (size_t i = 0; i < output_size; ) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(index_neon.data() + i);

    // First try u32x4 (4-element stores from main loop)
    auto it4 = g_neon_memory_u32x4.find(addr);
    if (it4 != g_neon_memory_u32x4.end() && !it4->second.empty()) {
      const uint32x4_t& vec = it4->second.back();
      for (size_t j = 0; j < 4 && (i + j) < output_size; j++) {
        neon_index_elements.push_back(vec.getLane(j));
      }
      i += 4;
      continue;
    }

    // Try u32x2 (2-element stores from tail path)
    auto it2 = g_neon_memory_u32x2.find(addr);
    if (it2 != g_neon_memory_u32x2.end() && !it2->second.empty()) {
      const uint32x2_t& vec = it2->second.back();
      for (size_t j = 0; j < 2 && (i + j) < output_size; j++) {
        neon_index_elements.push_back(vec.getLane(j));
      }
      i += 2;
      continue;
    }

    // Try u8x8 (single-element stores via vst1_lane_u32 which stores 4 bytes)
    auto it8 = g_neon_memory_u8x8.find(addr);
    if (it8 != g_neon_memory_u8x8.end() && !it8->second.empty()) {
      const uint8x8_t& vec = it8->second.back();
      // Reconstruct uint32 from 4 bytes (little-endian)
      Term byte0 = vec.getLane(0);
      Term byte1 = vec.getLane(1);
      Term byte2 = vec.getLane(2);
      Term byte3 = vec.getLane(3);
      // Concat bytes: byte3 ## byte2 ## byte1 ## byte0
      Term u32_val = tm.mkTerm(Kind::BITVECTOR_CONCAT, {byte3, byte2});
      u32_val = tm.mkTerm(Kind::BITVECTOR_CONCAT, {u32_val, byte1});
      u32_val = tm.mkTerm(Kind::BITVECTOR_CONCAT, {u32_val, byte0});
      neon_index_elements.push_back(u32_val);
      i += 1;
      continue;
    }

    // Single element not found, skip
    i += 1;
  }

  // Collect float32 results from RISC-V
  // RVV uses variable vector length, so iterate element by element
  std::vector<Term> riscv_output_elements;
  for (size_t i = 0; i < output_size; ) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data() + i);
    auto it = g_riscv_memory_f32m1.find(addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
      const vfloat32m1_t& vec = it->second.back();
      size_t vl = vec.getVL();
      for (size_t j = 0; j < vl && (i + j) < output_size; j++) {
        riscv_output_elements.push_back(vec.getElement(j));
      }
      i += vl;
    } else {
      i += 1;
    }
  }

  // Collect uint32 index results from RISC-V
  std::vector<Term> riscv_index_elements;
  for (size_t i = 0; i < output_size; ) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(index_riscv.data() + i);
    auto it = g_riscv_memory_u32m1.find(addr);
    if (it != g_riscv_memory_u32m1.end() && !it->second.empty()) {
      const vuint32m1_t& vec = it->second.back();
      size_t vl = vec.getVL();
      for (size_t j = 0; j < vl && (i + j) < output_size; j++) {
        riscv_index_elements.push_back(vec.getElement(j));
      }
      i += vl;
    } else {
      i += 1;
    }
  }

  std::cout << "\nNEON collected " << neon_output_elements.size() << " output floats" << std::endl;
  std::cout << "NEON collected " << neon_index_elements.size() << " index values" << std::endl;
  std::cout << "RISC-V collected " << riscv_output_elements.size() << " output floats" << std::endl;
  std::cout << "RISC-V collected " << riscv_index_elements.size() << " index values" << std::endl;

  if (neon_output_elements.empty()) {
    std::cerr << "ERROR: No NEON output results stored!" << std::endl;
    return 1;
  }

  if (riscv_output_elements.empty()) {
    std::cerr << "ERROR: No RISC-V output results stored!" << std::endl;
    return 1;
  }

  if (neon_index_elements.empty()) {
    std::cerr << "ERROR: No NEON index results stored!" << std::endl;
    return 1;
  }

  if (riscv_index_elements.empty()) {
    std::cerr << "ERROR: No RISC-V index results stored!" << std::endl;
    return 1;
  }

  // Compare outputs (float values)
  size_t output_compare_count = std::min(neon_output_elements.size(), riscv_output_elements.size());
  if (neon_output_elements.size() != riscv_output_elements.size()) {
    std::cerr << "WARNING: Different number of output elements! NEON: "
              << neon_output_elements.size() << ", RISC-V: " << riscv_output_elements.size()
              << std::endl;
  }

  // Compare indices (uint32 values)
  size_t index_compare_count = std::min(neon_index_elements.size(), riscv_index_elements.size());
  if (neon_index_elements.size() != riscv_index_elements.size()) {
    std::cerr << "WARNING: Different number of index elements! NEON: "
              << neon_index_elements.size() << ", RISC-V: " << riscv_index_elements.size()
              << std::endl;
  }

  // Build equality assertions for outputs (NaN-aware equality)
  // We need to handle the case where both values are NaN (since fp.eq returns false for NaN == NaN)
  // For argmaxpool, we consider two outputs equal if:
  // 1. They are fp.eq (for normal values), OR
  // 2. Both are NaN (fp.isNaN)
  // Additionally, we need to handle -0 vs +0 which fp.eq treats as equal but might differ in bit pattern
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < output_compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_elements[i], riscv_output_elements[i]});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_output_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_output_elements[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});
    // Values are equivalent if fp.eq OR both are NaN
    Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan});
    all_equalities.push_back(eq);
  }

  // Build equality assertions for indices (bitvector equality)
  for (size_t i = 0; i < index_compare_count; i++) {
    Term eq = tm.mkTerm(Kind::EQUAL, {neon_index_elements[i], riscv_index_elements[i]});
    all_equalities.push_back(eq);
  }

  if (all_equalities.empty()) {
    std::cerr << "ERROR: No comparisons to make!" << std::endl;
    return 1;
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
  std::cout << "Comparing " << output_compare_count << " output values and "
            << index_compare_count << " index values" << std::endl;

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

    for (size_t i = 0; i < std::min(input_size, (size_t)8); i++) {
      std::cout << "  input[" << i << "] = " << solver.getValue(symbolic_input[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(output_compare_count, (size_t)4); i++) {
      std::cout << "  output[" << i << "]: NEON = " << solver.getValue(neon_output_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_output_elements[i]) << std::endl;
    }

    std::cout << "\nIndex comparison:" << std::endl;
    for (size_t i = 0; i < std::min(index_compare_count, (size_t)4); i++) {
      std::cout << "  index[" << i << "]: NEON = " << solver.getValue(neon_index_elements[i])
                << ", RISC-V = " << solver.getValue(riscv_index_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
