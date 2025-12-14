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

// Forward declarations for f16 vmulcaddc kernels
extern "C" {
void xnn_f16_vmulcaddc_minmax_ukernel_c16__neonfp16arith_2x(
    size_t rows,
    size_t channels,
    const xnn_float16* input,
    size_t input_stride,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t output_stride,
    const struct xnn_f16_minmax_params* params);

void xnn_f16_vmulcaddc_minmax_ukernel_c16__rvv_2x(
    size_t rows,
    size_t channels,
    const xnn_float16* input,
    size_t input_stride,
    const xnn_float16* weights,
    xnn_float16* output,
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
  // Enable experimental FP solver for Float16 (5/11) support
  solver.setOption("fp-exp", "true");

  // f16-vmulcaddc: Multiply-add with channel-wise scale and bias, then clamp
  // output[i] = clamp(input[i] * scale[i] + bias[i], min, max)
  // The kernel processes 2 rows at a time with the same weights
  // Weights layout: [scale0..scale15, bias0..bias15] for c16 variant

  // For verification, we use 1 row and 8 channels (simpler case)
  const size_t num_rows = 8;
  const size_t num_channels = 8;
  const size_t channels_bytes = num_channels * sizeof(uint16_t);

  // Allocate arrays for NEON operations
  std::vector<uint16_t> input_neon(num_channels + 16, 0);
  std::vector<uint16_t> output_neon(num_channels + 16, 0);
  // Weights: scale[0..15] followed by bias[0..15] (c16 layout)
  std::vector<uint16_t> weights_neon(32 + 16, 0);

  // Allocate arrays for RVV operations
  std::vector<uint16_t> input_riscv(num_channels + 16, 0);
  std::vector<uint16_t> output_riscv(num_channels + 16, 0);
  std::vector<uint16_t> weights_riscv(32 + 16, 0);

  // Setup params struct with min/max values
  struct xnn_f16_minmax_params params;
  // Use -65504 (most negative f16) and +65504 (most positive f16) for wide range
  // 0xFBFF = -65504.0h, 0x7BFF = +65504.0h
  params.scalar.min.value = 0xFC00;  // -inf (use very negative)
  params.scalar.max.value = 0x7C00;  // +inf (use very positive)

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Create symbolic types
  Sort bv16 = tm.mkBitVectorSort(16);
  Sort fp16 = tm.mkFloatingPointSort(5, 11);
  Op to_fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  // Symbolic input elements
  std::vector<Term> symbolic_input_bv;
  std::vector<Term> symbolic_input_fp;
  symbolic_input_bv.reserve(num_channels);
  symbolic_input_fp.reserve(num_channels);

  // Symbolic scale elements
  std::vector<Term> symbolic_scale_bv;
  std::vector<Term> symbolic_scale_fp;
  symbolic_scale_bv.reserve(num_channels);
  symbolic_scale_fp.reserve(num_channels);

  // Symbolic bias elements
  std::vector<Term> symbolic_bias_bv;
  std::vector<Term> symbolic_bias_fp;
  symbolic_bias_bv.reserve(num_channels);
  symbolic_bias_fp.reserve(num_channels);

  for (size_t i = 0; i < num_channels; i++) {
    // Input
    Term x_bv = tm.mkConst(bv16, "x_" + std::to_string(i));
    symbolic_input_bv.push_back(x_bv);
    Term x_fp = tm.mkTerm(to_fp_op, {x_bv});
    symbolic_input_fp.push_back(x_fp);

    // Exclude NaN and infinity for input
    Term is_nan_x = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {x_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan_x}));
    Term is_inf_x = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {x_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf_x}));

    // Scale
    Term s_bv = tm.mkConst(bv16, "scale_" + std::to_string(i));
    symbolic_scale_bv.push_back(s_bv);
    Term s_fp = tm.mkTerm(to_fp_op, {s_bv});
    symbolic_scale_fp.push_back(s_fp);

    // Exclude NaN and infinity for scale
    Term is_nan_s = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {s_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan_s}));
    Term is_inf_s = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {s_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf_s}));

    // Bias
    Term b_bv = tm.mkConst(bv16, "bias_" + std::to_string(i));
    symbolic_bias_bv.push_back(b_bv);
    Term b_fp = tm.mkTerm(to_fp_op, {b_bv});
    symbolic_bias_fp.push_back(b_fp);

    // Exclude NaN and infinity for bias
    Term is_nan_b = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_nan_b}));
    Term is_inf_b = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {b_fp});
    solver.assertFormula(tm.mkTerm(Kind::NOT, {is_inf_b}));

    // Constrain values to reasonable range to avoid overflow
    Term max_val = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0x4900));  // 10.0h
    Term min_val = tm.mkFloatingPoint(5, 11, tm.mkBitVector(16, 0xC900));  // -10.0h
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {x_fp, max_val}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {x_fp, min_val}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {s_fp, max_val}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {s_fp, min_val}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {b_fp, max_val}));
    solver.assertFormula(tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {b_fp, min_val}));
  }

  // Populate NEON memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_neon.data());
    std::array<Term, 8> bv_elements;
    for (size_t i = 0; i < num_channels; i++) {
      bv_elements[i] = symbolic_input_bv[i];
    }
    for (size_t i = num_channels; i < 8; i++) {
      bv_elements[i] = tm.mkBitVector(16, 0);
    }
    uint16x8_t symbolic_vec(g_symbolic_tm, bv_elements);
    g_neon_memory_u16x8[addr].push_back(symbolic_vec);
  }

  // Populate NEON memory for weights (scale at offset 0, bias at offset 16)
  {
    uintptr_t scale_addr = reinterpret_cast<uintptr_t>(weights_neon.data());
    std::array<Term, 8> scale_elements;
    for (size_t i = 0; i < num_channels; i++) {
      scale_elements[i] = symbolic_scale_bv[i];
    }
    for (size_t i = num_channels; i < 8; i++) {
      scale_elements[i] = tm.mkBitVector(16, 0);
    }
    uint16x8_t scale_vec(g_symbolic_tm, scale_elements);
    g_neon_memory_u16x8[scale_addr].push_back(scale_vec);

    // Bias is at offset 16 (16 uint16_t elements = 32 bytes)
    uintptr_t bias_addr = scale_addr + 16 * sizeof(uint16_t);
    std::array<Term, 8> bias_elements;
    for (size_t i = 0; i < num_channels; i++) {
      bias_elements[i] = symbolic_bias_bv[i];
    }
    for (size_t i = num_channels; i < 8; i++) {
      bias_elements[i] = tm.mkBitVector(16, 0);
    }
    uint16x8_t bias_vec(g_symbolic_tm, bias_elements);
    g_neon_memory_u16x8[bias_addr].push_back(bias_vec);
  }

  // Populate RISC-V memory for input
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(input_riscv.data());
    g_riscv_memory_f16m1[addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_input_fp));
  }

  // Populate RISC-V memory for weights
  {
    uintptr_t scale_addr = reinterpret_cast<uintptr_t>(weights_riscv.data());
    g_riscv_memory_f16m1[scale_addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_scale_fp));

    uintptr_t bias_addr = scale_addr + 16 * sizeof(uint16_t);
    g_riscv_memory_f16m1[bias_addr].push_back(vfloat16m1_t(g_symbolic_tm, symbolic_bias_fp));
  }

  std::cout << "Testing XNNPACK f16_vmulcaddc_minmax: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Operation: output[i] = clamp(input[i] * scale[i] + bias[i], min, max)" << std::endl;
  std::cout << "Number of rows: " << num_rows << std::endl;
  std::cout << "Number of channels: " << num_channels << std::endl;
  std::cout << "Channels (bytes): " << channels_bytes << std::endl;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_f16_vmulcaddc_minmax_ukernel_c16__neonfp16arith_2x(
      num_rows,
      channels_bytes,
      reinterpret_cast<const xnn_float16*>(input_neon.data()),
      channels_bytes,  // input_stride
      reinterpret_cast<const xnn_float16*>(weights_neon.data()),
      reinterpret_cast<xnn_float16*>(output_neon.data()),
      channels_bytes,  // output_stride
      &params);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_f16_vmulcaddc_minmax_ukernel_c16__rvv_2x(
      num_rows,
      channels_bytes,
      reinterpret_cast<const xnn_float16*>(input_riscv.data()),
      channels_bytes,  // input_stride
      reinterpret_cast<const xnn_float16*>(weights_riscv.data()),
      reinterpret_cast<xnn_float16*>(output_riscv.data()),
      channels_bytes,  // output_stride
      &params);

  // Collect NEON output results from memory
  std::vector<Term> neon_output_elements;
  {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(output_neon.data());

    // Try to collect from u16x8 storage first
    auto it8 = g_neon_memory_u16x8.find(base_addr);
    if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
      const uint16x8_t& vec = it8->second.back();
      for (size_t i = 0; i < 8 && i < num_channels; i++) {
        neon_output_elements.push_back(vec.getLane(i));
      }
    }

    // If not found in u16x8, try u16x4 storage
    if (neon_output_elements.empty()) {
      auto it4 = g_neon_memory_u16x4.find(base_addr);
      if (it4 != g_neon_memory_u16x4.end() && !it4->second.empty()) {
        const uint16x4_t& vec = it4->second.back();
        for (size_t i = 0; i < 4 && i < num_channels; i++) {
          neon_output_elements.push_back(vec.getLane(i));
        }
      }
    }

    // If not found in vector storage, try scalar u16 memory
    if (neon_output_elements.empty()) {
      for (size_t i = 0; i < num_channels; i++) {
        uintptr_t addr = base_addr + i * sizeof(uint16_t);
        auto scalar_it = g_neon_u16_scalar_memory.find(addr);
        if (scalar_it != g_neon_u16_scalar_memory.end()) {
          neon_output_elements.push_back(scalar_it->second);
        }
      }
    }
  }

  // Collect RISC-V output results from memory
  std::vector<Term> riscv_output_elements;
  {
    uintptr_t addr = reinterpret_cast<uintptr_t>(output_riscv.data());
    auto it = g_riscv_memory_f16m1.find(addr);
    if (it != g_riscv_memory_f16m1.end() && !it->second.empty()) {
      const vfloat16m1_t& vec = it->second.back();
      for (size_t i = 0; i < vec.getVL() && i < num_channels; i++) {
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

  if (neon_output_elements.size() != riscv_output_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_output_elements.size() << ", RISC-V: " << riscv_output_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  // Build floating-point equality assertions
  // Both implementations compute: clamp(input * scale + bias, min, max)
  // NEON uses vfmaq_f16 (FMA), RVV uses vfmadd_vv_f16m1 (FMA)
  // Both apply vmaxq_f16/vminq_f16 for clamping
  //
  // NEON outputs are bitvectors (from vst1q_u16), RVV outputs are fp16 (from vse16_v_f16m1)
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
    std::cout << "Values that cause different outputs:" << std::endl;

    std::cout << "\nInput values (bitvector and fp16):" << std::endl;
    for (size_t i = 0; i < num_channels; i++) {
      std::cout << "  x[" << i << "] = " << solver.getValue(symbolic_input_bv[i])
                << " (fp16: " << solver.getValue(symbolic_input_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nScale values:" << std::endl;
    for (size_t i = 0; i < num_channels; i++) {
      std::cout << "  scale[" << i << "] = " << solver.getValue(symbolic_scale_bv[i])
                << " (fp16: " << solver.getValue(symbolic_scale_fp[i]) << ")" << std::endl;
    }

    std::cout << "\nBias values:" << std::endl;
    for (size_t i = 0; i < num_channels; i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias_bv[i])
                << " (fp16: " << solver.getValue(symbolic_bias_fp[i]) << ")" << std::endl;
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
