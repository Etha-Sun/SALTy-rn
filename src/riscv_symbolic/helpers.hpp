#ifndef RISCV_SYMBOLIC_HELPERS_HPP
#define RISCV_SYMBOLIC_HELPERS_HPP

#include "../symbolic_common.hpp"
#include "types.hpp"
#include "memory.hpp"
#include <vector>

namespace SymbolicRISCVHelpers {

    inline const std::vector<vint32m1_t>* getStoredResults(const int32_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_riscv_memory.find(addr);
        if (it != g_riscv_memory.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    
    inline void clearMemory() {
        g_riscv_memory.clear();
        g_riscv_memory_i8.clear();
    }
    
    inline const std::vector<vint8m1_t>* getStoredResults8(const int8_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_riscv_memory_i8.find(addr);
        if (it != g_riscv_memory_i8.end()) {
            return &(it->second);
        }
        return nullptr;
    }

   
    inline Term vectorEqual(const vint32m1_t& a, const vint32m1_t& b) {
        std::vector<Term> element_equalities;
        size_t vl = std::min(a.getVL(), b.getVL());

        for (size_t i = 0; i < vl; i++) {
            element_equalities.push_back(
                g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getElement(i), b.getElement(i)})
            );
        }

        return g_symbolic_tm->mkTerm(Kind::AND, element_equalities);
    }


    inline Term vectorNotEqual(const vint32m1_t& a, const vint32m1_t& b) {
        std::vector<Term> element_inequalities;
        size_t vl = std::min(a.getVL(), b.getVL());

        for (size_t i = 0; i < vl; i++) {
            Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getElement(i), b.getElement(i)});
            element_inequalities.push_back(g_symbolic_tm->mkTerm(Kind::NOT, {eq}));
        }

        return g_symbolic_tm->mkTerm(Kind::OR, element_inequalities);
    }
}

#endif 
