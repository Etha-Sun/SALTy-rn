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

// Forward declarations for f16 ibilinear kernels
extern "C" {
void xnn_f16_ibilinear_ukernel__neonfp16arith_u16(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t output_increment);

void xnn_f16_ibilinear_ukernel__rvv_u16(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t output_increment);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");
  solver.setOption("fp-exp", "true");

  // f16-ibilinear: Bilinear interpolation
  // Input layout: 4 pointers per output pixel
  //   i0 = top_left values (channel data)
  //   i1 = top_right values (channel data)
  //   i2 = bottom_left values (channel data)
  //   i3 = bottom_right values (channel data)
  // Formula:
  //   top = top_left + alpha_h * (top_right - top_left)
  //   bottom = bottom_left + alpha_h * (bottom_right - bottom_left)
  //   result = top + alpha_v * (bottom - top)

  // Test parameters - simplified for verification
  const size_t output_pixels = 1;  // Single output pixel
  const size_t channels = 8 * sizeof(uint16_t);  // 8 channels (fits in one vector)
  const size_t input_offset = 0;
  const size_t output_increment = 0;

  // Allocate input data for 4 corners, each with 8 channel values
  std::vector<uint16_t> tl_neon(8, 0);      // top_left
  std::vector<uint16_t> tr_neon(8, 0);      // top_right
  std::vector<uint16_t> bl_neon(8, 0);      // bottom_left
  std::vector<uint16_t> br_neon(8, 0);      // bottom_right

  std::vector<_Float16> tl_riscv(8, (_Float16)0.0f);
  std::vector<_Float16> tr_riscv(8, (_Float16)0.0f);
  std::vector<_Float16> bl_riscv(8, (_Float16)0.0f);
  std::vector<_Float16> br_riscv(8, (_Float16)0.0f);

  // Weights: [alpha_h, alpha_v] per output pixel
  std::vector<uint16_t> weights_neon(2, 0);
  std::vector<_Float16> weights_riscv(2, (_Float16)0.0f);

  // Output buffers
  std::vector<uint16_t> output_neon(8, 0);
  std::vector<_Float16> output_riscv(8, (_Float16)0.0f);

  // Input pointer arrays (4 pointers: tl, tr, bl, br)
  std::vector<const xnn_float16*> input_ptrs_neon(4);
  std::vector<const xnn_float16*> input_ptrs_riscv(4);

  input_ptrs_neon[0] = reinterpret_cast<const xnn_float16*>(tl_neon.data());
  input_ptrs_neon[1] = reinterpret_cast<const xnn_float16*>(tr_neon.data());
  input_ptrs_neon[2] = reinterpret_cast<const xnn_float16*>(bl_neon.data());
  input_ptrs_neon[3] = reinterpret_cast<const xnn_float16*>(br_neon.data());

  input_ptrs_riscv[0] = reinterpret_cast<const xnn_float16*>(tl_riscv.data());
  input_ptrs_riscv[1] = reinterpret_cast<const xnn_float16*>(tr_riscv.data());
  input_ptrs_riscv[2] = reinterpret_cast<const xnn_float16*>(bl_riscv.data());
  input_ptrs_riscv[3] = reinterpret_cast<const xnn_float16*>(br_riscv.data());

  // Clear memory before setup
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic inputs
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Create symbolic values for each corner (same across all 8 channels for simplicity)
  Term top_left_bv = tm.mkConst(bv16, "top_left");
  Term top_right_bv = tm.mkConst(bv16, "top_right");
  Term bottom_left_bv = tm.mkConst(bv16, "bottom_left");
  Term bottom_right_bv = tm.mkConst(bv16, "bottom_right");

  Term top_left_fp = tm.mkTerm(to_fp_op, {top_left_bv});
  Term top_right_fp = tm.mkTerm(to_fp_op, {top_right_bv});
  Term bottom_left_fp = tm.mkTerm(to_fp_op, {bottom_left_bv});
  Term bottom_right_fp = tm.mkTerm(to_fp_op, {bottom_right_bv});

  // Create symbolic alpha values
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

  // Populate NEON memory
  // vld1q_u16 loads 8 elements, so we populate u16x8 memory
  {
    uintptr_t tl_addr = reinterpret_cast<uintptr_t>(tl_neon.data());
    uintptr_t tr_addr = reinterpret_cast<uintptr_t>(tr_neon.data());
    uintptr_t bl_addr = reinterpret_cast<uintptr_t>(bl_neon.data());
    uintptr_t br_addr = reinterpret_cast<uintptr_t>(br_neon.data());

    // Create vector terms with same value across all lanes
    std::array<Term, 8> tl_lanes, tr_lanes, bl_lanes, br_lanes;
    for (size_t i = 0; i < 8; i++) {
      tl_lanes[i] = top_left_bv;
      tr_lanes[i] = top_right_bv;
      bl_lanes[i] = bottom_left_bv;
      br_lanes[i] = bottom_right_bv;
    }

    uint16x8_t tl_vec(&tm, tl_lanes);
    uint16x8_t tr_vec(&tm, tr_lanes);
    uint16x8_t bl_vec(&tm, bl_lanes);
    uint16x8_t br_vec(&tm, br_lanes);

    g_neon_memory_u16x8[tl_addr].push_back(tl_vec);
    g_neon_memory_u16x8[tr_addr].push_back(tr_vec);
    g_neon_memory_u16x8[bl_addr].push_back(bl_vec);
    g_neon_memory_u16x8[br_addr].push_back(br_vec);
  }

  // Weights for NEON: vld1q_dup_u16 loads a single u16 and broadcasts it
  {
    uintptr_t ah_addr = reinterpret_cast<uintptr_t>(&weights_neon[0]);
    uintptr_t av_addr = reinterpret_cast<uintptr_t>(&weights_neon[1]);
    g_neon_u16_scalar_memory[ah_addr] = alpha_h_bv;
    g_neon_u16_scalar_memory[av_addr] = alpha_v_bv;
  }

  // Populate RISC-V memory
  // vle16 loads contiguous elements, so we populate f16m1 memory
  {
    uintptr_t tl_addr = reinterpret_cast<uintptr_t>(tl_riscv.data());
    uintptr_t tr_addr = reinterpret_cast<uintptr_t>(tr_riscv.data());
    uintptr_t bl_addr = reinterpret_cast<uintptr_t>(bl_riscv.data());
    uintptr_t br_addr = reinterpret_cast<uintptr_t>(br_riscv.data());

    // Create vector terms with same value across all elements
    std::vector<Term> tl_elems(8, top_left_fp);
    std::vector<Term> tr_elems(8, top_right_fp);
    std::vector<Term> bl_elems(8, bottom_left_fp);
    std::vector<Term> br_elems(8, bottom_right_fp);

    vfloat16m1_t tl_vec(&tm, tl_elems);
    vfloat16m1_t tr_vec(&tm, tr_elems);
    vfloat16m1_t bl_vec(&tm, bl_elems);
    vfloat16m1_t br_vec(&tm, br_elems);

    g_riscv_memory_f16m1[tl_addr].push_back(tl_vec);
    g_riscv_memory_f16m1[tr_addr].push_back(tr_vec);
    g_riscv_memory_f16m1[bl_addr].push_back(bl_vec);
    g_riscv_memory_f16m1[br_addr].push_back(br_vec);
  }

  // Weights for RISC-V: scalar loads
  {
    uintptr_t ah_addr = reinterpret_cast<uintptr_t>(&weights_riscv[0]);
    uintptr_t av_addr = reinterpret_cast<uintptr_t>(&weights_riscv[1]);
    g_riscv_scalar_memory[ah_addr] = alpha_h_fp;
    g_riscv_scalar_memory[av_addr] = alpha_v_fp;
  }

  std::cout << "Testing XNNPACK f16_ibilinear: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: Bilinear interpolation" << std::endl;
  std::cout << "  top = top_left + alpha_h * (top_right - top_left)" << std::endl;
  std::cout << "  bottom = bottom_left + alpha_h * (bottom_right - bottom_left)" << std::endl;
  std::cout << "  result = top + alpha_v * (bottom - top)" << std::endl;
  std::cout << "Output pixels: " << output_pixels << ", Channels: " << channels / sizeof(uint16_t) << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_ibilinear_ukernel__neonfp16arith_u16(
      output_pixels,
      channels,
      input_ptrs_neon.data(),
      input_offset,
      reinterpret_cast<const xnn_float16*>(weights_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      output_increment);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_ibilinear_ukernel__rvv_u16(
      output_pixels,
      channels,
      input_ptrs_riscv.data(),
      input_offset,
      reinterpret_cast<const xnn_float16*>(weights_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      output_increment);

  // Collect NEON outputs
  std::vector<Term> neon_outputs_bv;
  bool neon_found = false;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try u16x8 memory (vst1q_u16 for 8+ channels)
    auto it8 = g_neon_memory_u16x8.find(addr);
    if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
      const uint16x8_t& vec = it8->second.back();
      for (size_t i = 0; i < 8; i++) {
        neon_outputs_bv.push_back(vec.getLane(i));
      }
      neon_found = true;
    }

    // Try u16x4 memory (vst1_u16 for 4 channels)
    if (!neon_found) {
      auto it4 = g_neon_memory_u16x4.find(addr);
      if (it4 != g_neon_memory_u16x4.end() && !it4->second.empty()) {
        const uint16x4_t& vec = it4->second.back();
        for (size_t i = 0; i < 4; i++) {
          neon_outputs_bv.push_back(vec.getLane(i));
        }
        neon_found = true;
      }
    }

    // Try scalar memory (vst1_lane_u16 for 1 channel)
    if (!neon_found) {
      auto it_scalar = g_neon_u16_scalar_memory.find(addr);
      if (it_scalar != g_neon_u16_scalar_memory.end()) {
        neon_outputs_bv.push_back(it_scalar->second);
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
      for (size_t i = 0; i < vec.getVL(); i++) {
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
    return 1;
  }

  if (!riscv_found) {
    std::cerr << "ERROR: No RISC-V output found!" << std::endl;
    std::cerr << "Dumping RISC-V memory state:" << std::endl;
    std::cerr << "  f16m1 memory entries: " << g_riscv_memory_f16m1.size() << std::endl;
    return 1;
  }

  // Build floating-point equality assertion for all output channels
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
  std::cout << "Comparing " << num_outputs << " output channels" << std::endl;

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
      std::cout << "  Channel " << i << ":" << std::endl;
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
