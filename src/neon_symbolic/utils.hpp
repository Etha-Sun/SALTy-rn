#ifndef NEON_SYMBOLIC_HELPERS_HPP
#define NEON_SYMBOLIC_HELPERS_HPP

#include "types.hpp"
#include "memory.hpp"
#include <vector>


namespace SymbolicNEONHelpers {
    
    inline const std::vector<int32x4_t>* getStoredResults(const int32_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory.find(addr);
        if (it != g_neon_memory.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    inline void clearMemory() {
        g_neon_memory.clear();
        g_neon_memory_i8x16.clear();
        g_neon_memory_i8x8.clear();
    }
    
    inline const std::vector<int8x16_t>* getStoredResults8x16(const int8_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory_i8x16.find(addr);
        if (it != g_neon_memory_i8x16.end()) {
            return &(it->second);
        }
        return nullptr;
    }
    
    inline const std::vector<int8x8_t>* getStoredResults8x8(const int8_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory_i8x8.find(addr);
        if (it != g_neon_memory_i8x8.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    inline Term vectorEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_equalities;

        for (int i = 0; i < 4; i++) {
            lane_equalities.push_back(
                g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)})
            );
        }

        return g_symbolic_tm->mkTerm(Kind::AND, lane_equalities);
    }

    inline Term vectorNotEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_inequalities;

        for (int i = 0; i < 4; i++) {
            Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)});
            lane_inequalities.push_back(g_symbolic_tm->mkTerm(Kind::NOT, {eq}));
        }

        return g_symbolic_tm->mkTerm(Kind::OR, lane_inequalities);
    }
}

#endif
