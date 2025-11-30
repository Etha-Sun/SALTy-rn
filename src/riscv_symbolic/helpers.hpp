#ifndef RISCV_SYMBOLIC_HELPERS_HPP
#define RISCV_SYMBOLIC_HELPERS_HPP

#include "../symbolic_common.hpp"
#include "types.hpp"
#include "memory.hpp"
#include <vector>
#include <type_traits>

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

    /**
     * Generic populate memory function using template specialization
     * Automatically selects the correct memory map and vector type based on pointer type
     */
    template<typename T>
    inline void populateMemory(const T* ptr, const std::vector<Term>& symbolic_values) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        
        // Use if constexpr to select the right memory map and vector type at compile time
        if constexpr (std::is_same_v<T, int8_t> || std::is_same_v<T, uint8_t>) {
            // 8-bit types (both signed and unsigned use the same memory map)
            g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_tm, symbolic_values));
        } else if constexpr (std::is_same_v<T, int32_t> || std::is_same_v<T, uint32_t>) {
            // 32-bit types
            g_riscv_memory[addr].push_back(vint32m1_t(g_symbolic_tm, symbolic_values));
        } else {
            static_assert(std::is_same_v<T, int8_t> || std::is_same_v<T, uint8_t> || 
                         std::is_same_v<T, int32_t> || std::is_same_v<T, uint32_t>,
                         "Unsupported type for populateMemory. Supported types: int8_t, uint8_t, int32_t, uint32_t");
        }
    }
    
    /**
     * Convenience named functions (optional - just call populateMemory directly)
     * These are now simple wrappers for clarity in code
     */
    inline void populateMemory8(const int8_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values);
    }

    inline void populateMemoryU8(const uint8_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values);
    }

    inline void populateMemory32(const int32_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values);
    }

    /**
     * Collect all 8-bit signed integer elements from RISC-V memory
     */
    inline std::vector<Term> collectResults8(const int8_t* ptr) {
        std::vector<Term> elements;
        
        const auto* results = getStoredResults8(ptr);
        if (results && !results->empty()) {
            for (size_t vec_idx = 0; vec_idx < results->size(); vec_idx++) {
                const vint8m1_t& vec = (*results)[vec_idx];
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
        }
        
        return elements;
    }

    /**
     * Collect all 32-bit signed integer elements from RISC-V memory
     */
    inline std::vector<Term> collectResults32(const int32_t* ptr) {
        std::vector<Term> elements;
        
        const auto* results = getStoredResults(ptr);
        if (results && !results->empty()) {
            for (size_t vec_idx = 0; vec_idx < results->size(); vec_idx++) {
                const vint32m1_t& vec = (*results)[vec_idx];
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
        }
        
        return elements;
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
