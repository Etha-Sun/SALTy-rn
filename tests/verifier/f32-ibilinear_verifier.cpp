#include "../../src/symbolic_common.hpp"
#include "../../src/xnn_minimal.h"
#include "../../src/neon_symbolic/memory.hpp"
#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/riscv_symbolic/memory.hpp"
#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_helpers.hpp"
#include "../../src/symbolic_scalar_types.hpp"
#include <algorithm>
#include <array>
#include <cstdint>
#include <cmath>
#include <limits>
#include <iostream>
#include <vector>

// Forward declarations
extern "C" {
void xnn_f32_ibilinear_chw_ukernel__neon_p16(
    size_t output_pixels,
    size_t channels,
    const float** input,
    size_t input_offset,
    const float* weights,
    float* output,
    size_t input_increment);

void xnn_f32_ibilinear_chw_ukernel__rvv_p8(
    size_t output_pixels,
    size_t channels,
    const float** input,
    size_t input_offset,
    const float* weights,
    float* output,
    size_t input_increment);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Bilinear interpolation parameters
  // For each output pixel, we need:
  // - 2 input pointers: top-left row pointer and bottom-left row pointer
  // - Each pointer points to 2 floats: [left, right]
  // - 2 weights: alphah (horizontal), alphav (vertical)
  const size_t output_pixels = 8;  // Process 16 pixels to use p>=16 loop in both kernels
  const size_t channels = 1;       // Single channel for verification
  const size_t input_offset = 0;
  const size_t input_increment = 0;

  // Each output pixel needs 2 input pointers (top row, bottom row)
  // Each row has 2 floats (left pixel, right pixel)
  const size_t num_input_ptrs = output_pixels * 2;  // 8 pointers for 4 pixels
  const size_t pixels_per_input = 2;  // tl/tr or bl/br

  // Weights: 2 per output pixel (alphah, alphav), interleaved
  const size_t weights_size = output_pixels * 2;  // 8 weights for 4 pixels

  // Allocate input pixel data - 4 pixels, each needs tl, tr, bl, br
  // Layout: for pixel i, input[2*i] points to [tl, tr], input[2*i+1] points to [bl, br]
  std::vector<float> pixel_data(output_pixels * 4, 0.0f);  // 4 floats per pixel
  std::vector<const float*> input_ptrs(num_input_ptrs);
  std::vector<float> weights_data(weights_size + 8, 0.0f);
  std::vector<float> output_neon(output_pixels, 0.0f);
  std::vector<float> output_riscv(output_pixels, 0.0f);

  // Setup input pointers
  // For pixel i: input[2*i] = &pixel_data[4*i] (tl, tr)
  //              input[2*i+1] = &pixel_data[4*i+2] (bl, br)
  for (size_t i = 0; i < output_pixels; i++) {
    input_ptrs[2 * i] = &pixel_data[4 * i];      // top row: tl, tr
    input_ptrs[2 * i + 1] = &pixel_data[4 * i + 2];  // bottom row: bl, br
  }

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort fp32 = tm.mkFloatingPointSort(8, 24);
  Term zero = tm.mkFloatingPointPosZero(8, 24);

  // Symbolic pixel values: tl, tr, bl, br for each output pixel
  std::vector<Term> symbolic_tl(output_pixels);
  std::vector<Term> symbolic_tr(output_pixels);
  std::vector<Term> symbolic_bl(output_pixels);
  std::vector<Term> symbolic_br(output_pixels);

  for (size_t i = 0; i < output_pixels; i++) {
    symbolic_tl[i] = tm.mkConst(fp32, "tl_" + std::to_string(i));
    symbolic_tr[i] = tm.mkConst(fp32, "tr_" + std::to_string(i));
    symbolic_bl[i] = tm.mkConst(fp32, "bl_" + std::to_string(i));
    symbolic_br[i] = tm.mkConst(fp32, "br_" + std::to_string(i));
  }

  // Symbolic weights: alphah, alphav for each output pixel
  std::vector<Term> symbolic_alphah(output_pixels);
  std::vector<Term> symbolic_alphav(output_pixels);

  for (size_t i = 0; i < output_pixels; i++) {
    symbolic_alphah[i] = tm.mkConst(fp32, "alphah_" + std::to_string(i));
    symbolic_alphav[i] = tm.mkConst(fp32, "alphav_" + std::to_string(i));
  }

  // Populate NEON memory
  // NEON uses vld1_f32 (2 floats) for pixel pairs and vld2q_f32 for weights
  for (size_t i = 0; i < output_pixels; i++) {
    // Top row pointer (tl, tr)
    uintptr_t top_addr = reinterpret_cast<uintptr_t>(input_ptrs[2 * i]);
    std::array<Term, 2> top_lanes = {symbolic_tl[i], symbolic_tr[i]};
    g_neon_memory_f32x2[top_addr].push_back(float32x2_t(g_symbolic_tm, top_lanes));

    // Bottom row pointer (bl, br)
    uintptr_t bot_addr = reinterpret_cast<uintptr_t>(input_ptrs[2 * i + 1]);
    std::array<Term, 2> bot_lanes = {symbolic_bl[i], symbolic_br[i]};
    g_neon_memory_f32x2[bot_addr].push_back(float32x2_t(g_symbolic_tm, bot_lanes));
  }

  // NEON weights: vld2q_f32 loads 8 floats from scalar memory and deinterleaves
  // Layout: [h0, v0, h1, v1, h2, v2, h3, v3]
  // After vld2q: val[0] = [h0, h1, h2, h3], val[1] = [v0, v1, v2, v3]
  uintptr_t weights_addr = reinterpret_cast<uintptr_t>(weights_data.data());
  for (size_t i = 0; i < output_pixels; i++) {
    // Store interleaved: [alphah_i, alphav_i]
    g_neon_float_scalar_memory[weights_addr + (2 * i) * sizeof(float)] = symbolic_alphah[i];
    g_neon_float_scalar_memory[weights_addr + (2 * i + 1) * sizeof(float)] = symbolic_alphav[i];
  }

  // Populate RISC-V memory
  // RVV uses __riscv_vle32_v_f32m1 for weights (8 floats), then gathers even/odd indices
  // Layout: [h0, v0, h1, v1, h2, v2, h3, v3, h4, v4, h5, v5, h6, v6, h7, v7]
  // For p>=8 loop: loads from w (first 8 floats) and w+8 (next 8 floats)
  std::vector<Term> weights_vec_rvv;
  for (size_t i = 0; i < output_pixels; i++) {
    weights_vec_rvv.push_back(symbolic_alphah[i]);
    weights_vec_rvv.push_back(symbolic_alphav[i]);
  }
  g_riscv_memory_f32m1[weights_addr].push_back(vfloat32m1_t(g_symbolic_tm, weights_vec_rvv));

  // For p>=16 loop, need to populate weights at multiple offsets
  // Each batch of 4 pixels uses 8 floats of weights
  if (output_pixels >= 16) {
    // w+8: pixels 4-7
    std::vector<Term> weights_vec_rvv_1;
    for (size_t i = 4; i < 8 && i < output_pixels; i++) {
      weights_vec_rvv_1.push_back(symbolic_alphah[i]);
      weights_vec_rvv_1.push_back(symbolic_alphav[i]);
    }
    g_riscv_memory_f32m1[weights_addr + 8 * sizeof(float)].push_back(
        vfloat32m1_t(g_symbolic_tm, weights_vec_rvv_1));

    // w+16: pixels 8-11
    std::vector<Term> weights_vec_rvv_2;
    for (size_t i = 8; i < 12 && i < output_pixels; i++) {
      weights_vec_rvv_2.push_back(symbolic_alphah[i]);
      weights_vec_rvv_2.push_back(symbolic_alphav[i]);
    }
    g_riscv_memory_f32m1[weights_addr + 16 * sizeof(float)].push_back(
        vfloat32m1_t(g_symbolic_tm, weights_vec_rvv_2));

    // w+24: pixels 12-15
    std::vector<Term> weights_vec_rvv_3;
    for (size_t i = 12; i < 16 && i < output_pixels; i++) {
      weights_vec_rvv_3.push_back(symbolic_alphah[i]);
      weights_vec_rvv_3.push_back(symbolic_alphav[i]);
    }
    g_riscv_memory_f32m1[weights_addr + 24 * sizeof(float)].push_back(
        vfloat32m1_t(g_symbolic_tm, weights_vec_rvv_3));
  }

  // RVV pixel data: loaded via __riscv_vle32_v_f32m1 from arrays
  // The kernel builds arrays like: float tl_arr[4] = {itl0[0], itl1[0], itl2[0], itl3[0]}
  // We need to populate scalar memory for each pixel access

  // For each pixel, the kernel accesses itl[0], itl[1], ibl[0], ibl[1]
  // The p>=4 loop uses __riscv_vle32_v_f32m1 with vl=2 to load [tl, tr] and [bl, br] pairs
  for (size_t i = 0; i < output_pixels; i++) {
    uintptr_t top_ptr = reinterpret_cast<uintptr_t>(input_ptrs[2 * i]);
    uintptr_t bot_ptr = reinterpret_cast<uintptr_t>(input_ptrs[2 * i + 1]);

    // itl[0] = tl, itl[1] = tr
    g_riscv_float_scalar_memory[top_ptr] = symbolic_tl[i];
    g_riscv_float_scalar_memory[top_ptr + sizeof(float)] = symbolic_tr[i];

    // ibl[0] = bl, ibl[1] = br
    g_riscv_float_scalar_memory[bot_ptr] = symbolic_bl[i];
    g_riscv_float_scalar_memory[bot_ptr + sizeof(float)] = symbolic_br[i];

    // Also populate f32m1 memory for the vector loads with vl=2
    // vtltr = __riscv_vle32_v_f32m1(itl, vl2) loads [tl, tr]
    std::vector<Term> top_vec = {symbolic_tl[i], symbolic_tr[i]};
    g_riscv_memory_f32m1[top_ptr].push_back(vfloat32m1_t(g_symbolic_tm, top_vec));

    // vblbr = __riscv_vle32_v_f32m1(ibl, vl2) loads [bl, br]
    std::vector<Term> bot_vec = {symbolic_bl[i], symbolic_br[i]};
    g_riscv_memory_f32m1[bot_ptr].push_back(vfloat32m1_t(g_symbolic_tm, bot_vec));
  }

  std::cout << "Testing XNNPACK f32_ibilinear_chw: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "output_pixels: " << output_pixels << std::endl;
  std::cout << "channels: " << channels << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f32_ibilinear_chw_ukernel__neon_p16(
      output_pixels, channels,
      input_ptrs.data(),
      input_offset,
      weights_data.data(),
      output_neon.data(),
      input_increment);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f32_ibilinear_chw_ukernel__rvv_p8(
      output_pixels, channels,
      input_ptrs.data(),
      input_offset,
      weights_data.data(),
      output_riscv.data(),
      input_increment);

  // Collect results from NEON
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsF32(output_neon.data(), output_pixels);

  // Collect results from RISC-V
  // For p>=16, results are stored at offsets 0, 4, 8, 12 (each with vl4=4)
  std::vector<Term> riscv_elements;
  riscv_elements.reserve(output_pixels);

  uintptr_t riscv_out_addr = reinterpret_cast<uintptr_t>(output_riscv.data());

  // Collect from multiple store locations
  for (size_t batch = 0; batch < (output_pixels + 3) / 4; batch++) {
    uintptr_t batch_addr = riscv_out_addr + batch * 4 * sizeof(float);
    auto it = g_riscv_memory_f32m1.find(batch_addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
      const vfloat32m1_t& vec = it->second.back();
      size_t remaining = output_pixels - batch * 4;
      size_t vec_len = std::min(vec.getVL(), remaining);
      for (size_t elem = 0; elem < vec_len; elem++) {
        riscv_elements.push_back(vec.getElement(elem));
      }
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

  // Build equality assertions (NaN-aware floating point comparison)
  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_elements[i], riscv_elements[i]});
    Term neon_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {neon_elements[i]});
    Term riscv_is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {riscv_elements[i]});
    Term both_nan = tm.mkTerm(Kind::AND, {neon_is_nan, riscv_is_nan});
    Term eq = tm.mkTerm(Kind::OR, {fp_eq, both_nan});
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

    std::cout << "\nPixel values:" << std::endl;
    for (size_t i = 0; i < output_pixels; i++) {
      std::cout << "  Pixel " << i << ":" << std::endl;
      std::cout << "    tl = " << solver.getValue(symbolic_tl[i]) << std::endl;
      std::cout << "    tr = " << solver.getValue(symbolic_tr[i]) << std::endl;
      std::cout << "    bl = " << solver.getValue(symbolic_bl[i]) << std::endl;
      std::cout << "    br = " << solver.getValue(symbolic_br[i]) << std::endl;
    }

    std::cout << "\nWeight values:" << std::endl;
    for (size_t i = 0; i < output_pixels; i++) {
      std::cout << "  alphah[" << i << "] = " << solver.getValue(symbolic_alphah[i]) << std::endl;
      std::cout << "  alphav[" << i << "] = " << solver.getValue(symbolic_alphav[i]) << std::endl;
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
