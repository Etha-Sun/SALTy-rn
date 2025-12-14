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

// Forward declarations for f16 ibilinear chw kernels
extern "C" {
void xnn_f16_ibilinear_chw_ukernel__neonfp16arith_p8(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_increment);

void xnn_f16_ibilinear_chw_ukernel__rvv_p16(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_increment);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-ibilinear-chw: Bilinear interpolation for channel-wise (CHW) layout
  // Formula: result = left + alpha_h * (right - left)
  //   where left  = top_left + alpha_v * (bottom_left - top_left)
  //         right = top_right + alpha_v * (bottom_right - top_right)

  // Test parameters - simplified for verification
  const size_t output_pixels = 1;  // 4 output pixels
  const size_t channels = 1;       // Single channel
  const size_t input_offset = 0;
  const size_t input_increment = 0;

  // Input data layout:
  // For 4 output pixels, we need 8 input pointers (2 per pixel: top row, bottom row)
  // Each pointer points to 2 consecutive fp16 values (left, right)

  // Allocate pixel data for 4 pixels (2 fp16 values each: left and right)
  // We'll use the same corner values for all 4 pixels for simplicity
  std::vector<uint16_t> top_rows_neon(8, 0);      // 4 pixels × 2 values
  std::vector<uint16_t> bottom_rows_neon(8, 0);   // 4 pixels × 2 values
  std::vector<_Float16> top_rows_riscv(8, (_Float16)0.0f);
  std::vector<_Float16> bottom_rows_riscv(8, (_Float16)0.0f);

  // Weights: alpha_h, alpha_v for each output pixel (interleaved)
  // For 4 pixels: [ah0, av0, ah1, av1, ah2, av2, ah3, av3]
  std::vector<uint16_t> weights_neon(8, 0);
  std::vector<_Float16> weights_riscv(8, (_Float16)0.0f);

  // Output buffers
  std::vector<uint16_t> output_neon(4, 0);
  std::vector<_Float16> output_riscv(4, (_Float16)0.0f);

  // Input pointer arrays (2 pointers per output pixel: top row, bottom row)
  // For 4 pixels: [itl0, ibl0, itl1, ibl1, itl2, ibl2, itl3, ibl3]
  std::vector<const xnn_float16*> input_ptrs_neon(8);
  std::vector<const xnn_float16*> input_ptrs_riscv(8);

  // Set up pointers for each of the 4 pixels
  for (size_t p = 0; p < 4; p++) {
    input_ptrs_neon[p * 2]     = reinterpret_cast<const xnn_float16*>(&top_rows_neon[p * 2]);
    input_ptrs_neon[p * 2 + 1] = reinterpret_cast<const xnn_float16*>(&bottom_rows_neon[p * 2]);
    input_ptrs_riscv[p * 2]     = reinterpret_cast<const xnn_float16*>(&top_rows_riscv[p * 2]);
    input_ptrs_riscv[p * 2 + 1] = reinterpret_cast<const xnn_float16*>(&bottom_rows_riscv[p * 2]);
  }

  // Clear memory before setup
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // For 4 pixels, create symbolic values for each pixel's corners and weights
  // Using same values for all pixels to simplify verification
  Term top_left_bv = tm.mkConst(bv16, "top_left");
  Term top_right_bv = tm.mkConst(bv16, "top_right");
  Term bottom_left_bv = tm.mkConst(bv16, "bottom_left");
  Term bottom_right_bv = tm.mkConst(bv16, "bottom_right");

  Term top_left_fp = tm.mkTerm(to_fp_op, {top_left_bv});
  Term top_right_fp = tm.mkTerm(to_fp_op, {top_right_bv});
  Term bottom_left_fp = tm.mkTerm(to_fp_op, {bottom_left_bv});
  Term bottom_right_fp = tm.mkTerm(to_fp_op, {bottom_right_bv});

  // Create symbolic alpha values (same for all pixels)
  Term alpha_h_bv = tm.mkConst(bv16, "alpha_h");
  Term alpha_v_bv = tm.mkConst(bv16, "alpha_v");
  Term alpha_h_fp = tm.mkTerm(to_fp_op, {alpha_h_bv});
  Term alpha_v_fp = tm.mkTerm(to_fp_op, {alpha_v_bv});

  // Constrain inputs to be valid (no NaN, no Inf, bounded range)
  std::vector<Term> all_inputs = {top_left_fp, top_right_fp, bottom_left_fp, bottom_right_fp, alpha_h_fp, alpha_v_fp};

  // Bound values to reasonable range to avoid overflow
  Term bound_pos = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x4800));  // +8.0 in fp16
  Term bound_neg = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xC800));  // -8.0 in fp16
  Term zero_fp = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x0000));    // 0.0
  Term one_fp = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x3C00));     // 1.0

  for (const auto& x_fp : all_inputs) {
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp})}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp, bound_neg}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp, bound_pos}));
  }

  // Alpha values should be in [0, 1]
  solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {alpha_h_fp, zero_fp}));
  solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {alpha_h_fp, one_fp}));
  solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {alpha_v_fp, zero_fp}));
  solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {alpha_v_fp, one_fp}));

  // Packed 32-bit values containing [top_right, top_left] and [bottom_right, bottom_left]
  Term packed_top = tm.mkTerm(Kind::BITVECTOR_CONCAT, {top_right_bv, top_left_bv});
  Term packed_bottom = tm.mkTerm(Kind::BITVECTOR_CONCAT, {bottom_right_bv, bottom_left_bv});

  // Populate NEON memory for all 4 pixels
  // Each pixel needs its top row and bottom row data at the address pointed to by input_ptrs
  for (size_t p = 0; p < 4; p++) {
    // Top row for pixel p
    uintptr_t top_addr = reinterpret_cast<uintptr_t>(&top_rows_neon[p * 2]);
    g_neon_u32_scalar_memory[top_addr] = packed_top;

    // Bottom row for pixel p
    uintptr_t bot_addr = reinterpret_cast<uintptr_t>(&bottom_rows_neon[p * 2]);
    g_neon_u32_scalar_memory[bot_addr] = packed_bottom;
  }

  // Weights for NEON: [ah0, av0, ah1, av1, ah2, av2, ah3, av3] - vld2_u16 deinterleaves
  for (size_t p = 0; p < 4; p++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&weights_neon[p * 2]);
    g_neon_u16_scalar_memory[addr] = alpha_h_bv;
    g_neon_u16_scalar_memory[addr + sizeof(uint16_t)] = alpha_v_bv;
  }

  // Populate RISC-V memory for all 4 pixels
  for (size_t p = 0; p < 4; p++) {
    // Top row for pixel p
    uintptr_t top_addr = reinterpret_cast<uintptr_t>(&top_rows_riscv[p * 2]);
    g_riscv_scalar_memory[top_addr] = top_left_fp;
    g_riscv_scalar_memory[top_addr + sizeof(_Float16)] = top_right_fp;

    // Bottom row for pixel p
    uintptr_t bot_addr = reinterpret_cast<uintptr_t>(&bottom_rows_riscv[p * 2]);
    g_riscv_scalar_memory[bot_addr] = bottom_left_fp;
    g_riscv_scalar_memory[bot_addr + sizeof(_Float16)] = bottom_right_fp;
  }

  // Weights for RISC-V
  for (size_t p = 0; p < 4; p++) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&weights_riscv[p * 2]);
    g_riscv_scalar_memory[addr] = alpha_h_fp;
    g_riscv_scalar_memory[addr + sizeof(_Float16)] = alpha_v_fp;
  }

  std::cout << "Testing XNNPACK f16_ibilinear_chw: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Bilinear interpolation" << std::endl;
  std::cout << "  result = left + alpha_h * (right - left)" << std::endl;
  std::cout << "  left = top_left + alpha_v * (bottom_left - top_left)" << std::endl;
  std::cout << "  right = top_right + alpha_v * (bottom_right - top_right)" << std::endl;
  std::cout << "Output pixels: " << output_pixels << ", Channels: " << channels << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_ibilinear_chw_ukernel__neonfp16arith_p8(
      output_pixels,
      channels,
      input_ptrs_neon.data(),
      input_offset,
      reinterpret_cast<const xnn_float16*>(weights_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      input_increment);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_ibilinear_chw_ukernel__rvv_p16(
      output_pixels,
      channels,
      input_ptrs_riscv.data(),
      input_offset,
      reinterpret_cast<const xnn_float16*>(weights_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      input_increment);

  // Collect NEON outputs
  // For 1 pixel: vst1_lane_u16 stores to scalar memory
  // For 4 pixels: vst1_u16 stores to u16x4 memory
  // For 8 pixels: vst1q_u16 stores to u16x8 memory
  std::vector<Term> neon_outputs_bv;
  bool neon_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try scalar memory first (for single pixel output via vst1_lane_u16)
    auto it_scalar = g_neon_u16_scalar_memory.find(addr);
    if (it_scalar != g_neon_u16_scalar_memory.end()) {
      neon_outputs_bv.push_back(it_scalar->second);
      neon_found = true;
    }

    // Try u16x4 memory
    if (!neon_found) {
      auto it4 = g_neon_memory_u16x4.find(addr);
      if (it4 != g_neon_memory_u16x4.end() && !it4->second.empty()) {
        const uint16x4_t& vec = it4->second.back();
        for (size_t i = 0; i < output_pixels; i++) {
          neon_outputs_bv.push_back(vec.getLane(i));
        }
        neon_found = true;
      }
    }
    // Try u16x8 memory
    if (!neon_found) {
      auto it8 = g_neon_memory_u16x8.find(addr);
      if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
        const uint16x8_t& vec = it8->second.back();
        for (size_t i = 0; i < output_pixels; i++) {
          neon_outputs_bv.push_back(vec.getLane(i));
        }
        neon_found = true;
      }
    }
  }

  // Collect RISC-V outputs
  std::vector<Term> riscv_outputs_fp;
  bool riscv_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_f16m1.find(addr);
    if (it != g_riscv_memory_f16m1.end() && !it->second.empty()) {
      const vfloat16m1_t& vec = it->second.back();
      for (size_t i = 0; i < output_pixels && i < vec.getVL(); i++) {
        riscv_outputs_fp.push_back(vec.getElement(i));
      }
      riscv_found = true;
    }
  }

  if (!neon_found) {
    std::cerr << "ERROR: No NEON output found!" << std::endl;
    std::cerr << "Dumping NEON memory state:" << std::endl;
    std::cerr << "  u16 scalar memory entries: " << g_neon_u16_scalar_memory.size() << std::endl;
    std::cerr << "  u16x4 memory entries: " << g_neon_memory_u16x4.size() << std::endl;
    std::cerr << "  u16x8 memory entries: " << g_neon_memory_u16x8.size() << std::endl;
    for (const auto& [addr, val] : g_neon_u16_scalar_memory) {
      std::cerr << "    u16 scalar addr=" << std::hex << addr << std::dec << std::endl;
    }
    for (const auto& [addr, val] : g_neon_memory_u16x4) {
      std::cerr << "    u16x4 addr=" << std::hex << addr << std::dec << std::endl;
    }
    return 1;
  }

  if (!riscv_found) {
    std::cerr << "ERROR: No RISC-V output found!" << std::endl;
    std::cerr << "Dumping RISC-V memory state:" << std::endl;
    std::cerr << "  f16m1 memory entries: " << g_riscv_memory_f16m1.size() << std::endl;
    return 1;
  }

  // Build floating-point equality assertion for all output pixels
  std::vector<Term> inequalities;
  size_t num_outputs = std::min(neon_outputs_bv.size(), riscv_outputs_fp.size());

  for (size_t i = 0; i < num_outputs; i++) {
    Term neon_output_fp = tm.mkTerm(to_fp_op, {neon_outputs_bv[i]});
    Term outputs_equal = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {neon_output_fp, riscv_outputs_fp[i]});
    Term not_equal = tm.mkTerm(Kind::NOT, {outputs_equal});
    inequalities.push_back(not_equal);
  }

  // Assert that at least one output differs
  Term any_not_equal = inequalities.size() == 1 ? inequalities[0] : tm.mkTerm(Kind::OR, inequalities);

  std::cout << "\nAsserting: NOT(NEON_results == RISC-V_results)" << std::endl;
  std::cout << "Looking for counterexample where any output differs..." << std::endl;
  std::cout << "Comparing " << num_outputs << " output pixels" << std::endl;

  solver.assertFormula(any_not_equal);
  Result result = solver.checkSat();

  std::cout << "\nResult: " << result << std::endl;

  if (result.isUnsat()) {
    std::cout << "\n===== VERIFICATION PASSED =====" << std::endl;
    std::cout << "UNSAT: No counterexample found!" << std::endl;
    std::cout << "The NEON and RISC-V implementations are equivalent for all " << num_outputs << " outputs." << std::endl;
    return 0;
  } else if (result.isSat()) {
    std::cout << "\n===== VERIFICATION FAILED =====" << std::endl;
    std::cout << "SAT: Found a counterexample!" << std::endl;
    std::cout << "Input values that cause different outputs:" << std::endl;

    std::cout << "\nCorner pixels:" << std::endl;
    std::cout << "  top_left = " << solver.getValue(top_left_bv)
              << " (fp16: " << solver.getValue(top_left_fp) << ")" << std::endl;
    std::cout << "  top_right = " << solver.getValue(top_right_bv)
              << " (fp16: " << solver.getValue(top_right_fp) << ")" << std::endl;
    std::cout << "  bottom_left = " << solver.getValue(bottom_left_bv)
              << " (fp16: " << solver.getValue(bottom_left_fp) << ")" << std::endl;
    std::cout << "  bottom_right = " << solver.getValue(bottom_right_bv)
              << " (fp16: " << solver.getValue(bottom_right_fp) << ")" << std::endl;

    std::cout << "\nInterpolation weights:" << std::endl;
    std::cout << "  alpha_h = " << solver.getValue(alpha_h_bv)
              << " (fp16: " << solver.getValue(alpha_h_fp) << ")" << std::endl;
    std::cout << "  alpha_v = " << solver.getValue(alpha_v_bv)
              << " (fp16: " << solver.getValue(alpha_v_fp) << ")" << std::endl;

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < num_outputs; i++) {
      Term neon_fp = tm.mkTerm(to_fp_op, {neon_outputs_bv[i]});
      std::cout << "  Pixel " << i << ":" << std::endl;
      std::cout << "    NEON: " << solver.getValue(neon_outputs_bv[i])
                << " (fp16: " << solver.getValue(neon_fp) << ")" << std::endl;
      std::cout << "    RISC-V: " << solver.getValue(riscv_outputs_fp[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
