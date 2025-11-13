#include "neon_symbolic/neon_symbolic.hpp"
#include "riscv_symbolic/riscv_symbolic.hpp"
#include "symbolic_helpers.hpp"
#include <iostream>

// NEON symbolic implementation
void neon_add_scale_intrinsic(const int32_t *a, const int32_t *b,
                               int32_t *result, int len) {

    for (int i = 0; i < len; i += 4) {
        // Load vectors (4 elements at a time)
        int32x4_t va = vld1q_s32(&a[i]);
        int32x4_t vb = vld1q_s32(&b[i]);

        // Vector add: va + vb
        int32x4_t vsum = vaddq_s32(va, vb);

        // Vector multiply by scalar 3
        int32x4_t vresult = vmulq_n_s32(vsum, 3);

        // Store result
        vst1q_s32(&result[i], vresult);
    }
}

// RISC-V symbolic implementation
void riscv_add_scale_intrinsic(const int32_t *a, const int32_t *b,
                                int32_t *result, int len) {

    size_t n = len;
    for (size_t vl; n > 0; n -= vl, a += vl, b += vl, result += vl) {
        vl = __riscv_vsetvl_e32m1(n);

        // Load vectors
        vint32m1_t va = __riscv_vle32_v_i32m1(a, vl);
        vint32m1_t vb = __riscv_vle32_v_i32m1(b, vl);

        // Vector add
        vint32m1_t vsum = __riscv_vadd_vv_i32m1(va, vb, vl);

        // Vector-scalar multiply by 3
        vint32m1_t vresult = __riscv_vmul_vx_i32m1(vsum, 3, vl);

        // Store result
        __riscv_vse32_v_i32m1(result, vresult, vl);
    }
}

int main() {
    // Initialize the global term manager and solver
    TermManager tm;
    Solver solver(tm);
    g_symbolic_tm = &tm;
    g_symbolic_solver = &solver;


    // generate the length of the vectors being tested upon (must be a multiple of 4)
    const int len = 8;

    // Use SAME arrays for both - this is done to avoid error because they think it is different if creating different unputs
    int32_t a[len] = {0};
    int32_t b[len] = {0};
    int32_t result_neon[len] = {0};
    int32_t result_riscv[len] = {0};

    // Validate that len is a multiple of 4 (required for NEON 4-element vectors)
    if (len % 4 != 0) {
        std::cerr << "ERROR: len must be a multiple of 4, got " << len << std::endl;
        return 1;
    }

    // Clear memory before each run
    SymbolicNEONHelpers::clearMemory();
    SymbolicRISCVHelpers::clearMemory();

    // Setup symbolic inputs for both NEON and RISC-V
    // This ensures NEON and RISC-V read the SAME symbolic values from a[] and b[]
    auto [symbolic_a, symbolic_b] = SymbolicHelpers::setupSymbolicInputs(tm, a, b, len);

    // Run NEON symbolic execution
    neon_add_scale_intrinsic(a, b, result_neon, len);

    // Run RISC-V symbolic execution
    riscv_add_scale_intrinsic(a, b, result_riscv, len);

    // Retrieve stored results - NEON stores at multiple addresses when looping
    const auto* riscv_results = SymbolicRISCVHelpers::getStoredResults(result_riscv);

    

    std::cout << "RISC-V stored " << riscv_results->size() << " result vector(s)" << std::endl;

   
    std::vector<Term> neon_elements;

    // Collect NEON elements from all loop iterations (i=0, i=4, ...)
    for (int i = 0; i < len; i += 4) {
        const auto* neon_chunk = SymbolicNEONHelpers::getStoredResults(&result_neon[i]);

        if (!neon_chunk || neon_chunk->empty()) {
            std::cerr << "ERROR: No NEON results stored at offset " << i << "!" << std::endl;
            return 1;
        }

        // Get the last stored vector at this address (most recent store)
        const int32x4_t& neon_vec = neon_chunk->back();
        for (int lane = 0; lane < 4; lane++) {
            neon_elements.push_back(neon_vec.getLane(lane));
        }
    }

    std::cout << "NEON collected from " << (len / 4) << " memory location(s)" << std::endl;

    // Collect RISC-V elements from all stored vectors
    std::vector<Term> riscv_elements;
    for (size_t vec_idx = 0; vec_idx < riscv_results->size(); vec_idx++) {
        const vint32m1_t& riscv_vec = (*riscv_results)[vec_idx];
        for (size_t elem = 0; elem < riscv_vec.getVL(); elem++) {
            riscv_elements.push_back(riscv_vec.getElement(elem));
        }
    }

    std::cout << "NEON total elements: " << neon_elements.size() << std::endl;
    std::cout << "RISC-V total elements: " << riscv_elements.size() << std::endl;

    if (neon_elements.size() != riscv_elements.size()) {
        std::cerr << "ERROR: Different number of elements!" << std::endl;
        return 1;
    }

    // Compare element-by-element
    std::vector<Term> all_equalities;
    for (size_t i = 0; i < neon_elements.size(); i++) {
        Term eq = tm.mkTerm(
            Kind::EQUAL,
            {neon_elements[i], riscv_elements[i]}
        );
        all_equalities.push_back(eq);
    }

    // All elements must be equal for the implementations to be equivalent
    Term all_equal = tm.mkTerm(Kind::AND, all_equalities);

    // We want to check if there exists a case where they are NOT equal
    // If UNSAT, then they are always equal (no counterexample exists)
    Term not_equal = tm.mkTerm(Kind::NOT, {all_equal});

    
    solver.assertFormula(not_equal);
    Result result = solver.checkSat();

    std::cout << "\nResult: " << result << std::endl;

    if (result.isUnsat()) {
        std::cout << "✓ UNSAT: No counterexample found!" << std::endl;
        std::cout << "✓ NEON and RISC-V implementations are EQUIVALENT" << std::endl;
        std::cout << "✓ For all inputs, they produce the same output" << std::endl;
        return 0;
    } else if (result.isSat()) {
        std::cout << "✗ SAT: Found a counterexample!" << std::endl;
        std::cout << "✗ NEON and RISC-V implementations are NOT equivalent" << std::endl;
        std::cout << "✗ There exists an input where they differ" << std::endl;

        // Could print the model here to see the counterexample
        // std::cout << "Model: " << solver.getValue(...) << std::endl;

        return 1;
    } else {
        std::cout << "? UNKNOWN: Solver could not determine" << std::endl;
        return 2;
    }
}
