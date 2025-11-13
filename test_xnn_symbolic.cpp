#include "neon_symbolic/neon_symbolic.hpp"
#include "riscv_symbolic/riscv_symbolic.hpp"
#include "neon_symbolic/memory.hpp"
#include "riscv_symbolic/memory.hpp"
#include "symbolic_common.hpp"
#include "symbolic_helpers.hpp"
#include <iostream>
#include <vector>
#include <cstdint>
#include <array>

struct xnn_qs8_add_minmax_params {
    struct {
        int8_t a_zero_point;
        int8_t b_zero_point;
        int32_t bias;
        int32_t a_multiplier;
        int32_t b_multiplier;
        int32_t shift;
        int16_t output_zero_point;
        int8_t output_min;
        int8_t output_max;
    } scalar;
};

// Forward declarations
extern "C" {
void xnn_qs8_vadd_minmax_ukernel__neon_ld128_u16(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params);

void xnn_qs8_vadd_minmax_ukernel__rvv_u1v(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params);
}

inline void populateNEONMemory8x16(const int8_t* ptr, const std::vector<Term>& symbolic_values, size_t offset = 0) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    
    // NEON processes 16 elements at a time
    for (size_t i = 0; i < symbolic_values.size(); i += 16) {
        std::array<Term, 16> lanes;
        for (size_t j = 0; j < 16 && (i + j) < symbolic_values.size(); j++) {
            lanes[j] = symbolic_values[i + j];
        }
        for (size_t j = (symbolic_values.size() - i); j < 16; j++) {
            lanes[j] = symbolic_values.back();
        }
        g_neon_memory_i8x16[addr + i].push_back(int8x16_t(g_symbolic_tm, lanes));
    }
}

// Helper to populate RISC-V memory with int8 symbolic inputs
inline void populateRISCVMemory8(const int8_t* ptr, const std::vector<Term>& symbolic_values) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    
    // RISC-V can process all elements at once (variable length)
    g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_tm, symbolic_values));
}

int main() {
    // Initialize the global term manager and solver
    TermManager tm;
    Solver solver(tm);
    g_symbolic_tm = &tm;
    g_symbolic_solver = &solver;

    // Test parameters
    const size_t batch = 16;  // Test with 16 int8_t elements (must be multiple of 16 for NEON)
    
    // Allocate arrays
    int8_t input_a[batch] = {0};
    int8_t input_b[batch] = {0};
    int8_t output_neon[batch] = {0};
    int8_t output_riscv[batch] = {0};


    // Clear memory before each run
    SymbolicNEONHelpers::clearMemory();
    SymbolicRISCVHelpers::clearMemory();

    // Setup symbolic inputs for int8_t arrays
    Sort bv8_input = tm.mkBitVectorSort(8);
    std::vector<Term> symbolic_a, symbolic_b;
    symbolic_a.reserve(batch);
    symbolic_b.reserve(batch);
    
    for (size_t i = 0; i < batch; i++) {
        symbolic_a.push_back(tm.mkConst(bv8_input, "a_" + std::to_string(i)));
        symbolic_b.push_back(tm.mkConst(bv8_input, "b_" + std::to_string(i)));
    }

    populateNEONMemory8x16(input_a, symbolic_a);
    populateNEONMemory8x16(input_b, symbolic_b);

    populateRISCVMemory8(input_a, symbolic_a);
    populateRISCVMemory8(input_b, symbolic_b);

    // Setup params struct with concrete test values
    struct xnn_qs8_add_minmax_params params;
    params.scalar.a_zero_point = -7;
    params.scalar.b_zero_point = -1;
    params.scalar.bias = 7559896;  
    params.scalar.a_multiplier = 811801; 
    params.scalar.b_multiplier = 1353001; 
    params.scalar.shift = 20;  
    params.scalar.output_zero_point = 5;
    params.scalar.output_min = -128;
    params.scalar.output_max = 127;

    std::cout << "Testing XNNPACK NEON vs RISC-V equivalence" << std::endl;
    std::cout << "Batch size: " << batch << " elements" << std::endl;

    g_current_params_ptr = nullptr;
    
    xnn_qs8_vadd_minmax_ukernel__neon_ld128_u16(
        batch * sizeof(int8_t), input_a, input_b, output_neon, &params);

    xnn_qs8_vadd_minmax_ukernel__rvv_u1v(
        batch * sizeof(int8_t), input_a, input_b, output_riscv, &params);

    std::vector<Term> neon_elements;
    
    // Collect NEON elements from all loop iterations
    // NEON processes 16 elements at a time in main loop, 8 elements in fallback
    for (size_t i = 0; i < batch; ) {
        // Try to get 16-element results first (main loop)
        const auto* neon_results_16 = SymbolicNEONHelpers::getStoredResults8x16(output_neon + i);
        if (neon_results_16 && !neon_results_16->empty()) {
            const int8x16_t& neon_vec = neon_results_16->back();
            size_t elements_to_take = std::min(static_cast<size_t>(16), batch - i);
            for (size_t lane = 0; lane < elements_to_take; lane++) {
                neon_elements.push_back(neon_vec.getLane(lane));
            }
            i += 16;
        } else {
            // Try 8-element results (fallback path)
            const auto* neon_results_8 = SymbolicNEONHelpers::getStoredResults8x8(output_neon + i);
            if (neon_results_8 && !neon_results_8->empty()) {
                const int8x8_t& neon_vec = neon_results_8->back();
                size_t elements_to_take = std::min(static_cast<size_t>(8), batch - i);
                for (size_t lane = 0; lane < elements_to_take; lane++) {
                    neon_elements.push_back(neon_vec.getLane(lane));
                }
                i += 8;
            } else {
                std::cerr << "ERROR: No NEON results stored at offset " << i << "!" << std::endl;
                std::cerr << "  Tried int8x16_t at address " << (void*)(output_neon + i) << std::endl;
                std::cerr << "  Tried int8x8_t at address " << (void*)(output_neon + i) << std::endl;
                return 1;
            }
        }
    }

    std::cout << "NEON collected " << neon_elements.size() << " elements" << std::endl;

    std::vector<Term> riscv_elements;
    const auto* riscv_results = SymbolicRISCVHelpers::getStoredResults8(output_riscv);
    
    if (riscv_results && !riscv_results->empty()) {
        for (size_t vec_idx = 0; vec_idx < riscv_results->size(); vec_idx++) {
            const vint8m1_t& riscv_vec = (*riscv_results)[vec_idx];
            for (size_t elem = 0; elem < riscv_vec.getVL(); elem++) {
                riscv_elements.push_back(riscv_vec.getElement(elem));
            }
        }
    } else {
        std::cerr << "ERROR: No RISC-V results stored!" << std::endl;
        return 1;
    }

    std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

    if (neon_elements.size() != riscv_elements.size()) {
        std::cerr << "ERROR: Different number of elements! NEON: " << neon_elements.size() 
                  << ", RISC-V: " << riscv_elements.size() << std::endl;
        return 1;
    }

    std::vector<Term> all_equalities;
    for (size_t i = 0; i < neon_elements.size(); i++) {
        Term eq = tm.mkTerm(
            Kind::EQUAL,
            {neon_elements[i], riscv_elements[i]}
        );
        all_equalities.push_back(eq);
    }

    Term all_equal = tm.mkTerm(Kind::AND, all_equalities);


    Term not_equal = tm.mkTerm(Kind::NOT, {all_equal});

    std::cout << "\nAsserting: NOT(NEON_result == RISC-V_result)" << std::endl;
    std::cout << "Looking for counterexample where outputs differ..." << std::endl;

    solver.assertFormula(not_equal);
    Result result = solver.checkSat();

    std::cout << "\nResult: " << result << std::endl;

    if (result.isUnsat()) {
        std::cout << "UNSAT: No counterexample found!" << std::endl;
        return 0;
    } else if (result.isSat()) {
        std::cout << "SAT: Found a counterexample!" << std::endl;

        return 1;
    } else {
        std::cout << "UNKNOWN: Solver could not determine" << std::endl;
        return 2;
    }
}
