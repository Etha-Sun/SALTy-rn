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
void xnn_x32_packw_gemm_goi_ukernel_x8__neon_ld4lane_u8(
    size_t g,
    size_t nc,
    size_t kc,
    size_t nr,
    size_t kr,
    size_t sr,
    const uint32_t* weights,
    const uint32_t* bias,
    const void* scale,
    uint32_t* packed_weights,
    size_t extra_bytes,
    const void* params);

void xnn_x32_packw_gemm_goi_ukernel_x8__rvv(
    size_t g,
    size_t nc,
    size_t kc,
    size_t nr,
    size_t kr,
    size_t sr,
    const uint32_t* weights,
    const uint32_t* bias,
    const void* scale,
    uint32_t* packed_weights,
    size_t extra_bytes,
    const void* params);
}

int main() {
  // Initialize the global term manager and solver
  TermManager tm;
  Solver solver(tm);
  g_symbolic_tm = &tm;
  g_symbolic_solver = &solver;
  solver.setOption("produce-models", "true");

  // Packw parameters
  const size_t g = 1;      // Number of groups
  const size_t nc = 11;    // Number of output channels (must be >= nr for main loop)
  const size_t kc = 11;    // Number of input channels
  const size_t nr = 8;     // Register blocking factor for N
  const size_t kr = 1;     // Register blocking factor for K
  const size_t sr = 1;     // Stride

  // Calculate sizes
  const size_t weights_size = g * nc * kc;
  const size_t bias_size = nc;
  // Output: for each group, we pack (bias or zeros) + weights
  // With nr=8, each block packs 8 bias + 8*kc weights
  const size_t packed_weights_size = g * (nr + nr * kc);

  // Allocate arrays
  std::vector<uint32_t> weights(weights_size, 0);
  std::vector<uint32_t> bias(bias_size, 0);
  std::vector<uint32_t> packed_weights_neon(packed_weights_size, 0);
  std::vector<uint32_t> packed_weights_riscv(packed_weights_size, 0);

  // Clear memory before each run
  SymbolicNEONHelpers::clearMemory();
  SymbolicRISCVHelpers::clearMemory();

  // Setup symbolic inputs (32-bit)
  std::vector<Term> symbolic_weights = createSymbolicArray(tm, weights_size, "w", 32);
  std::vector<Term> symbolic_bias = createSymbolicArray(tm, bias_size, "b", 32);

  // Populate NEON memory (unsigned 32-bit)
  SymbolicNEONHelpers::populateMemoryU32(weights.data(), symbolic_weights);
  SymbolicNEONHelpers::populateMemoryU32(bias.data(), symbolic_bias);

  // Populate RISC-V memory (unsigned 32-bit)
  SymbolicRISCVHelpers::populateMemoryU32(weights.data(), symbolic_weights);
  SymbolicRISCVHelpers::populateMemoryU32(bias.data(), symbolic_bias);

  std::cout << "Testing XNNPACK x32_packw: NEON vs RISC-V equivalence" << std::endl;
  std::cout << "Parameters:" << std::endl;
  std::cout << "  g (groups): " << g << std::endl;
  std::cout << "  nc (output channels): " << nc << std::endl;
  std::cout << "  kc (input channels): " << kc << std::endl;
  std::cout << "  nr (register block N): " << nr << std::endl;
  std::cout << "  kr (register block K): " << kr << std::endl;
  std::cout << "  sr (stride): " << sr << std::endl;
  std::cout << "  weights_size: " << weights_size << std::endl;
  std::cout << "  bias_size: " << bias_size << std::endl;
  std::cout << "  packed_weights_size: " << packed_weights_size << std::endl;

  g_current_params_ptr = nullptr;

  // Run NEON implementation
  std::cout << "\nRunning NEON implementation..." << std::endl;
  xnn_x32_packw_gemm_goi_ukernel_x8__neon_ld4lane_u8(
      g, nc, kc, nr, kr, sr,
      weights.data(), bias.data(), nullptr,
      packed_weights_neon.data(), 0, nullptr);

  // Run RISC-V implementation
  std::cout << "Running RISC-V implementation..." << std::endl;
  xnn_x32_packw_gemm_goi_ukernel_x8__rvv(
      g, nc, kc, nr, kr, sr,
      weights.data(), bias.data(), nullptr,
      packed_weights_riscv.data(), 0, nullptr);

  // Collect results from both architectures
  std::vector<Term> neon_elements = SymbolicNEONHelpers::collectResultsU32(packed_weights_neon.data(), packed_weights_size);
  std::vector<Term> riscv_elements = SymbolicRISCVHelpers::collectResultsU32(packed_weights_riscv.data(), packed_weights_size);

  std::cout << "\nNEON collected " << neon_elements.size() << " elements" << std::endl;

  if (neon_elements.empty()) {
    std::cerr << "ERROR: No NEON results stored!" << std::endl;
    return 1;
  }

  if (riscv_elements.empty()) {
    std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
    return 1;
  }

  std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

  // Compare the minimum number of elements from both
  size_t compare_count = std::min(neon_elements.size(), riscv_elements.size());

  if (neon_elements.size() != riscv_elements.size()) {
    std::cerr << "WARNING: Different number of elements! NEON: "
              << neon_elements.size() << ", RISC-V: " << riscv_elements.size()
              << std::endl;
    std::cerr << "Comparing first " << compare_count << " elements" << std::endl;
  }

  std::vector<Term> all_equalities;
  for (size_t i = 0; i < compare_count; i++) {
    Term eq = tm.mkTerm(Kind::EQUAL, {neon_elements[i], riscv_elements[i]});
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

    std::cout << "\nWeights:" << std::endl;
    for (size_t i = 0; i < std::min(weights_size, (size_t)16); i++) {
      std::cout << "  weights[" << i << "] = " << solver.getValue(symbolic_weights[i]) << std::endl;
    }

    std::cout << "\nBias:" << std::endl;
    for (size_t i = 0; i < std::min(bias_size, (size_t)8); i++) {
      std::cout << "  bias[" << i << "] = " << solver.getValue(symbolic_bias[i]) << std::endl;
    }

    std::cout << "\nOutput comparison:" << std::endl;
    for (size_t i = 0; i < std::min(compare_count, (size_t)16); i++) {
      std::cout << "  NEON[" << i << "] = " << solver.getValue(neon_elements[i]) << std::endl;
      std::cout << "  RISC-V[" << i << "] = " << solver.getValue(riscv_elements[i]) << std::endl;
    }
    return 1;
  } else {
    std::cout << "\n===== VERIFICATION INCONCLUSIVE =====" << std::endl;
    std::cout << "UNKNOWN: Solver could not determine equivalence" << std::endl;
    return 2;
  }
}
