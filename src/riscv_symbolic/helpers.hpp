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
        g_riscv_memory_i32m4.clear();
        g_riscv_memory_f16m2.clear();
        g_riscv_memory_f32m4.clear();
        g_riscv_memory_u8m1.clear();
        g_riscv_memory_u8mf2.clear();
        g_riscv_memory_u8mf4.clear();
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
        if constexpr (std::is_same_v<T, int8_t>) {
            // Signed 8-bit types use signed memory map
            g_riscv_memory_i8[addr].push_back(vint8m1_t(g_symbolic_tm, symbolic_values));
        } else if constexpr (std::is_same_v<T, uint8_t>) {
            // Unsigned 8-bit types use unsigned memory map
            g_riscv_memory_u8m1[addr].push_back(vuint8m1_t(g_symbolic_tm, symbolic_values));
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
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        
        // Store in both memory maps to support both m1 and m4 loads
        g_riscv_memory[addr].push_back(vint32m1_t(g_symbolic_tm, symbolic_values));
        g_riscv_memory_i32m4[addr].push_back(vint32m4_t(g_symbolic_tm, symbolic_values));
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
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        
        // Try g_riscv_memory_i32m4 first (for LMUL=4 operations like rdsum)
        auto it_m4 = g_riscv_memory_i32m4.find(addr);
        if (it_m4 != g_riscv_memory_i32m4.end() && !it_m4->second.empty()) {
            // Only collect from the last stored vector (most recent result)
            const vint32m4_t& vec = it_m4->second.back();
            for (size_t elem = 0; elem < vec.getVL(); elem++) {
                elements.push_back(vec.getElement(elem));
            }
            return elements;
        }
        
        // Otherwise try the standard memory (vint32m1)
        const auto* results = getStoredResults(ptr);
        if (results && !results->empty()) {
            // Only collect from the last stored vector (most recent result)
            const vint32m1_t& vec = results->back();
            for (size_t elem = 0; elem < vec.getVL(); elem++) {
                elements.push_back(vec.getElement(elem));
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

    /**
     * Collect all float16 elements from RISC-V memory (vfloat16m2_t)
     */
    inline std::vector<Term> collectResultsF16(const void* ptr) {
        std::vector<Term> elements;
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

        auto it = g_riscv_memory_f16m2.find(addr);
        if (it != g_riscv_memory_f16m2.end() && !it->second.empty()) {
            // Collect all stored vectors at this address
            for (const vfloat16m2_t& vec : it->second) {
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
        }

        return elements;
    }

    /**
     * Collect all float32 elements from RISC-V memory (vfloat32m4_t)
     */
    inline std::vector<Term> collectResultsF32(const float* ptr) {
        std::vector<Term> elements;
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

        auto it = g_riscv_memory_f32m4.find(addr);
        if (it != g_riscv_memory_f32m4.end() && !it->second.empty()) {
            // Collect all stored vectors at this address
            for (const vfloat32m4_t& vec : it->second) {
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
        }

        return elements;
    }

    /**
     * Collect all unsigned 8-bit elements from RISC-V memory
     * Handles vuint8m1_t, vuint8mf2_t, and vuint8mf4_t vector types
     */
    inline std::vector<Term> collectResultsU8(const uint8_t* ptr) {
        std::vector<Term> elements;
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

        // Try vuint8m1_t first (LMUL=1)
        auto it_m1 = g_riscv_memory_u8m1.find(addr);
        if (it_m1 != g_riscv_memory_u8m1.end() && !it_m1->second.empty()) {
            for (const vuint8m1_t& vec : it_m1->second) {
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
            return elements;
        }

        // Try vuint8mf2_t (LMUL=1/2)
        auto it_mf2 = g_riscv_memory_u8mf2.find(addr);
        if (it_mf2 != g_riscv_memory_u8mf2.end() && !it_mf2->second.empty()) {
            for (const vuint8mf2_t& vec : it_mf2->second) {
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
            return elements;
        }

        // Try vuint8mf4_t (LMUL=1/4)
        auto it_mf4 = g_riscv_memory_u8mf4.find(addr);
        if (it_mf4 != g_riscv_memory_u8mf4.end() && !it_mf4->second.empty()) {
            for (const vuint8mf4_t& vec : it_mf4->second) {
                for (size_t elem = 0; elem < vec.getVL(); elem++) {
                    elements.push_back(vec.getElement(elem));
                }
            }
            return elements;
        }

        return elements;
    }
}

#endif 
