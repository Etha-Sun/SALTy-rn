#ifndef NEON_SYMBOLIC_HPP
#define NEON_SYMBOLIC_HPP

#include <cvc5/cvc5.h>
#include <vector>
#include <array>
#include <string>
#include <map>
#include <cstdint>

using namespace cvc5;


class int32x4_t {
private:
    std::array<Term, 4> lanes;
    Solver* solver;
    
public:
    int32x4_t(Solver* s) : solver(s) {
        Sort bv32 = solver->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = solver->mkConst(bv32, "int_" + std::to_string(i));
        }
    }
    // use when you already have the 4 term array and would like to create a Int32x4
    int32x4_t(Solver* s, const std::array<Term, 4>& data) 
        : solver(s), lanes(data) {}
    
    // create with specific names instead of int
    int32x4_t(Solver* s, const std::string& name) : solver(s) {
        Sort bv32 = solver->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = solver->mkConst(bv32, name + "_" + std::to_string(i));
        }
    }
    
    Term getLane(int idx) const {
        return lanes[idx];
    }
    
    const std::array<Term, 4>& getLanes() const {
        return lanes;
    }
    
    Solver* getSolver() const {
        return solver;
    }
};

// Global symbolic solver instance to prevent needing to pass it into functions when going through neon test
inline Solver* g_symbolic_solver = nullptr;

// Global storage indexed by memory address for load/store tracking
inline std::map<uintptr_t, std::vector<int32x4_t>> g_neon_memory;


//START OF NEON INTRINSIC SYMBOLIC IMPLEMENTATIONS


// vld1q_s32: Load 4x 32-bit integers into vector register
// Semantics: Returns previously stored value if available, otherwise creates fresh symbolic constants

inline int32x4_t vld1q_s32(const int32_t* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Check if this address was previously stored to
    auto it = g_neon_memory.find(addr);
    if (it != g_neon_memory.end() && !it->second.empty()) {
        // Return the most recently stored value at this address
        return it->second.back();
    }

    // Otherwise, create fresh symbolic variables (represents input data)
    return int32x4_t(g_symbolic_solver);
}

// vaddq_s32: Add two vectors element-wise (wrapping arithmetic)
// Semantics: result[i] = a[i] + b[i] (mod 2^32)
inline int32x4_t vaddq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> result_lanes;

    for (int i = 0; i < 4; i++) {
        // Bitvector addition (automatically wraps on overflow)
        result_lanes[i] = g_symbolic_solver->mkTerm(
            Kind::BITVECTOR_ADD,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return int32x4_t(g_symbolic_solver, result_lanes);
}

/**
 * vmulq_n_s32: Multiply vector by scalar (wrapping arithmetic)
 * Semantics: result[i] = vec[i] * scalar (mod 2^32)
 */
inline int32x4_t vmulq_n_s32(const int32x4_t& vec, int32_t scalar) {
    std::array<Term, 4> result_lanes;

    // Convert scalar to bitvector term
    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_solver->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (int i = 0; i < 4; i++) {
        // Bitvector multiplication (automatically wraps on overflow)
        result_lanes[i] = g_symbolic_solver->mkTerm(
            Kind::BITVECTOR_MULT,
            {vec.getLane(i), scalar_term}
        );
    }

    return int32x4_t(g_symbolic_solver, result_lanes);
}

/**
 * vst1q_s32: Store vector to memory
 *
 * In symbolic execution, captures the stored vector indexed by memory address
 */
inline void vst1q_s32(int32_t* ptr, const int32x4_t& vec) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_neon_memory[addr].push_back(vec);
}


// Helper utilities for verification

namespace SymbolicNEONHelpers {
    /**
     * Get stored results at a specific memory address
     */
    inline const std::vector<int32x4_t>* getStoredResults(const int32_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory.find(addr);
        if (it != g_neon_memory.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    /**
     * Clear all stored memory (useful between test runs)
     */
    inline void clearMemory() {
        g_neon_memory.clear();
    }
    /**
     * Assert that two vectors are equal
     */
    inline Term vectorEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_equalities;

        for (int i = 0; i < 4; i++) {
            lane_equalities.push_back(
                g_symbolic_solver->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)})
            );
        }

        // All lanes must be equal
        return g_symbolic_solver->mkTerm(Kind::AND, lane_equalities);
    }

    /**
     * Assert that two vectors are NOT equal
     */
    inline Term vectorNotEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_inequalities;

        for (int i = 0; i < 4; i++) {
            Term eq = g_symbolic_solver->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)});
            lane_inequalities.push_back(g_symbolic_solver->mkTerm(Kind::NOT, {eq}));
        }

        return g_symbolic_solver->mkTerm(Kind::OR, lane_inequalities);
    }
}
#endif // NEON_SYMBOLIC_HPP