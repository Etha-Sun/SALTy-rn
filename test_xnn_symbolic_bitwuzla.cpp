#include "neon_symbolic/neon_symbolic.hpp"
#include "riscv_symbolic/riscv_symbolic.hpp"
#include "neon_symbolic/memory.hpp"
#include "riscv_symbolic/memory.hpp"
#include "symbolic_common_bitwuzla.hpp"
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

// Bitwuzla wrappers for compatibility with CVC5-based symbolic types
class BitwuzlaTermWrapper {
private:
    BitwuzlaTerm term;
    Bitwuzla* bitwuzla;

public:
    BitwuzlaTermWrapper(Bitwuzla* bv, const BitwuzlaTerm& t) : term(t), bitwuzla(bv) {}

    BitwuzlaTerm getTerm() const { return term; }
    Bitwuzla* getSolver() const { return bitwuzla; }
};

// Adapter functions to convert between CVC5 Term and Bitwuzla BitwuzlaTerm
inline BitwuzlaTerm cvc5_to_bitwuzla_term(const Term& cvc5_term, Bitwuzla* bitwuzla) {
    // This is a placeholder - in reality, you'd need to rebuild the term tree
    // For now, we'll handle this at the symbolic type level
    return BitwuzlaTerm();
}

inline void populateNEONMemory8x16(const int8_t* ptr, const std::vector<BitwuzlaTerm>& symbolic_values, size_t offset = 0) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // NEON processes 16 elements at a time
    for (size_t i = 0; i < symbolic_values.size(); i += 16) {
        std::array<BitwuzlaTerm, 16> lanes;
        for (size_t j = 0; j < 16 && (i + j) < symbolic_values.size(); j++) {
            lanes[j] = symbolic_values[i + j];
        }
        for (size_t j = (symbolic_values.size() - i); j < 16; j++) {
            lanes[j] = symbolic_values.back();
        }
        // Note: This requires adapting the int8x16_t constructor to work with BitwuzlaTerm
        // g_neon_memory_i8x16[addr + i].push_back(int8x16_t(g_symbolic_bitwuzla, lanes));
    }
}

// Helper to populate RISC-V memory with int8 symbolic inputs
inline void populateRISCVMemory8(const int8_t* ptr, const std::vector<BitwuzlaTerm>& symbolic_values) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // RISC-V can process all elements at once (variable length)
    // Note: This requires adapting the vint8m1_t constructor to work with BitwuzlaTerm
    // g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_bitwuzla, symbolic_values));
}

int main() {
    // Initialize Bitwuzla
    Options options;
    Bitwuzla bitwuzla(options);
    g_symbolic_bitwuzla = &bitwuzla;

    std::cout << "NOTE: This Bitwuzla version requires updating the symbolic NEON/RISC-V types" << std::endl;
    std::cout << "      to work with BitwuzlaTerm instead of CVC5 Term." << std::endl;
    std::cout << "      The main difference is in the API for creating terms and solving." << std::endl;
    std::cout << std::endl;

    // Test parameters
    const size_t batch = 16;  // Test with 4 int8_t elements

    // Allocate arrays
    int8_t input_a[batch] = {0};
    int8_t input_b[batch] = {0};
    int8_t output_neon[batch] = {0};
    int8_t output_riscv[batch] = {0};

    // Clear memory before each run
    SymbolicNEONHelpers::clearMemory();
    SymbolicRISCVHelpers::clearMemory();

    // Setup symbolic inputs for int8_t arrays
    BitwuzlaSort bv8_sort = bitwuzla.mk_bv_sort(8);
    std::vector<BitwuzlaTerm> symbolic_a, symbolic_b;
    symbolic_a.reserve(batch);
    symbolic_b.reserve(batch);

    for (size_t i = 0; i < batch; i++) {
        symbolic_a.push_back(bitwuzla.mk_const(bv8_sort, ("a_" + std::to_string(i)).c_str()));
        symbolic_b.push_back(bitwuzla.mk_const(bv8_sort, ("b_" + std::to_string(i)).c_str()));
    }

    // Note: The following would need the symbolic types to be updated
    // populateNEONMemory8x16(input_a, symbolic_a);
    // populateNEONMemory8x16(input_b, symbolic_b);
    // populateRISCVMemory8(input_a, symbolic_a);
    // populateRISCVMemory8(input_b, symbolic_b);

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

    std::cout << "Testing XNNPACK NEON vs RISC-V equivalence (Bitwuzla)" << std::endl;
    std::cout << "Batch size: " << batch << " elements" << std::endl;

    g_current_params_ptr = nullptr;

    // Note: These calls would work once the symbolic types are updated
    // xnn_qs8_vadd_minmax_ukernel__neon_ld128_u16(
    //     batch * sizeof(int8_t), input_a, input_b, output_neon, &params);

    // xnn_qs8_vadd_minmax_ukernel__rvv_u1v(
    //     batch * sizeof(int8_t), input_a, input_b, output_riscv, &params);

    std::vector<BitwuzlaTerm> neon_elements;
    std::vector<BitwuzlaTerm> riscv_elements;

    // Note: Collecting results would happen here after execution
    // For now, create dummy symbolic values to demonstrate the solving API
    for (size_t i = 0; i < batch; i++) {
        neon_elements.push_back(bitwuzla.mk_const(bv8_sort, ("neon_" + std::to_string(i)).c_str()));
        riscv_elements.push_back(bitwuzla.mk_const(bv8_sort, ("riscv_" + std::to_string(i)).c_str()));
    }

    std::cout << "NEON collected " << neon_elements.size() << " elements" << std::endl;
    std::cout << "RISC-V collected " << riscv_elements.size() << " elements" << std::endl;

    if (neon_elements.size() != riscv_elements.size()) {
        std::cerr << "ERROR: Different number of elements! NEON: " << neon_elements.size()
                  << ", RISC-V: " << riscv_elements.size() << std::endl;
        return 1;
    }

    // Build equivalence formula using Bitwuzla API
    std::vector<BitwuzlaTerm> all_equalities;
    for (size_t i = 0; i < neon_elements.size(); i++) {
        BitwuzlaTerm eq = bitwuzla.mk_term(
            Kind::EQUAL,
            {neon_elements[i], riscv_elements[i]}
        );
        all_equalities.push_back(eq);
    }

    BitwuzlaTerm all_equal = bitwuzla.mk_term(Kind::AND, all_equalities);
    BitwuzlaTerm not_equal = bitwuzla.mk_term(Kind::NOT, {all_equal});

    std::cout << "\nAsserting: NOT(NEON_result == RISC-V_result)" << std::endl;
    std::cout << "Looking for counterexample where outputs differ..." << std::endl;

    // Assert and check satisfiability
    bitwuzla.assert_formula(not_equal);
    Result result = bitwuzla.check_sat();

    std::cout << "\nResult: ";
    if (result == Result::SAT) {
        std::cout << "SAT" << std::endl;
        std::cout << "SAT: Found a counterexample!" << std::endl;

        // Get model values
        std::cout << "\nCounterexample:" << std::endl;
        for (size_t i = 0; i < batch; i++) {
            std::cout << "  a_" << i << " = " << bitwuzla.get_value(symbolic_a[i]) << std::endl;
            std::cout << "  b_" << i << " = " << bitwuzla.get_value(symbolic_b[i]) << std::endl;
        }
        return 1;
    } else if (result == Result::UNSAT) {
        std::cout << "UNSAT" << std::endl;
        std::cout << "UNSAT: No counterexample found!" << std::endl;
        std::cout << "The implementations are equivalent!" << std::endl;
        return 0;
    } else {
        std::cout << "UNKNOWN" << std::endl;
        std::cout << "UNKNOWN: Solver could not determine" << std::endl;
        return 2;
    }
}
