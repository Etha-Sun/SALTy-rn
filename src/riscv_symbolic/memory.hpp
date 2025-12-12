#ifndef RISCV_SYMBOLIC_MEMORY_HPP
#define RISCV_SYMBOLIC_MEMORY_HPP

#include "../symbolic_common.hpp"
#include "../symbolic_scalar_types.hpp"
#include "types.hpp"
#include <map>
#include <vector>
#include <cstdint>
#include <iostream>
#include <string>

/**
 * Global VL (vector length) for current operation
 * Set by vsetvl instructions, affects subsequent vector operations
 */
inline size_t g_current_vl = 0;

/**
 * Global storage for scalar results from reduction operations
 * Maps operation names to their symbolic result terms
 */
inline std::map<std::string, Term> g_riscv_scalar_results;

/**
 * Global storage indexed by memory address for load/store tracking
 * Maps memory addresses to vectors of stored symbolic values
 */
inline std::map<uintptr_t, std::vector<vint32m1_t>> g_riscv_memory;

/**
 * Global storage for int8 vectors (needed for XNN operations)
 */
inline std::map<uintptr_t, std::vector<vint8m1_t>> g_riscv_memory_i8;

/**
 * Global storage for int32m4 vectors (needed for wider LMUL operations)
 */
inline std::map<uintptr_t, std::vector<vint32m4_t>> g_riscv_memory_i32m4;

/**
 * Global storage for float16m2 vectors (needed for half-precision operations)
 */
inline std::map<uintptr_t, std::vector<vfloat16m2_t>> g_riscv_memory_f16m2;

/**
 * Global storage for float32m4 vectors (needed for single-precision operations with LMUL=4)
 */
inline std::map<uintptr_t, std::vector<vfloat32m4_t>> g_riscv_memory_f32m4;

/**
 * Global storage for unsigned 8-bit vectors (LMUL=1)
 */
inline std::map<uintptr_t, std::vector<vuint8m1_t>> g_riscv_memory_u8m1;

/**
 * Global storage for unsigned 8-bit vectors (LMUL=1/2)
 */
inline std::map<uintptr_t, std::vector<vuint8mf2_t>> g_riscv_memory_u8mf2;

/**
 * Global storage for unsigned 8-bit vectors (LMUL=1/4)
 */
inline std::map<uintptr_t, std::vector<vuint8mf4_t>> g_riscv_memory_u8mf4;

/**
 * Global storage for signed 8-bit vectors (LMUL=1/4)
 */
inline std::map<uintptr_t, std::vector<vint8mf4_t>> g_riscv_memory_i8mf4;

/**
 * Global storage for signed 8-bit vectors (LMUL=1/2)
 */
inline std::map<uintptr_t, std::vector<vint8mf2_t>> g_riscv_memory_i8mf2;

/**
 * Global storage for unsigned 32-bit vectors (LMUL=1)
 */
inline std::map<uintptr_t, std::vector<vuint32m1_t>> g_riscv_memory_u32m1;

/**
 * Global storage for unsigned 32-bit vectors (LMUL=4)
 */
inline std::map<uintptr_t, std::vector<vuint32m4_t>> g_riscv_memory_u32m4;

/**
 * Global storage for unsigned 32-bit vectors (LMUL=8)
 */
inline std::map<uintptr_t, std::vector<vuint32m8_t>> g_riscv_memory_u32m8;

/**
 * Global storage for unsigned 8-bit vectors (LMUL=8)
 */
inline std::map<uintptr_t, std::vector<vuint8m8_t>> g_riscv_memory_u8m8;

/**
 * Global storage for unsigned 16-bit vectors (LMUL=1)
 */
inline std::map<uintptr_t, std::vector<vuint16m1_t>> g_riscv_memory_u16m1;

/**
 * Global storage for unsigned 16-bit vectors (LMUL=4)
 */
inline std::map<uintptr_t, std::vector<vuint16m4_t>> g_riscv_memory_u16m4;

/**
 * Global storage for float16 vectors (LMUL=4)
 */
inline std::map<uintptr_t, std::vector<vfloat16m4_t>> g_riscv_memory_f16m4;


/**
 * __riscv_vle32_v_i32m1: Load vector of 32-bit integers
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vint32m1_t __riscv_vle32_v_i32m1(const int32_t* ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory.find(addr);
    if (it != g_riscv_memory.end() && !it->second.empty()) {
        // Return the most recently stored value at this address
        return it->second.back();
    }

    // Otherwise, create fresh symbolic variables (represents input data)
    return vint32m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vle32_v_i32m1: Load vector from symbolic_int32_t array
 * Extracts symbolic terms from array elements and creates a vector
 */
inline vint32m1_t __riscv_vle32_v_i32m1(const symbolic_int32_t* ptr, size_t vl) {
    std::vector<Term> elements;
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        elements.push_back(ptr[i].getTerm());
    }
    return vint32m1_t(g_symbolic_tm, elements);
}

/**
 * __riscv_vse32_v_i32m1: Store vector of 32-bit integers
 */
inline void __riscv_vse32_v_i32m1(int32_t* ptr, const vint32m1_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory[addr].push_back(vec);
}

/**
 * __riscv_vse32_v_i32m1: Store vector to symbolic_int32_t array
 * This overload allows storing to symbolic scalar arrays for proper tracking
 */
inline void __riscv_vse32_v_i32m1(symbolic_int32_t* ptr, const vint32m1_t& vec, size_t vl) {
    for (size_t i = 0; i < vl; i++) {
        ptr[i] = symbolic_int32_t(g_symbolic_tm, vec.getElement(i), 0, false);
    }
}

/**
 * __riscv_vle8_v_i8m1: Load vector of 8-bit integers (LMUL=1)
 */
inline vint8m1_t __riscv_vle8_v_i8m1(const int8_t* ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_i8.find(addr);
    if (it != g_riscv_memory_i8.end() && !it->second.empty()) {
        return it->second.back();
    }

    // Overlap search
    for (auto it = g_riscv_memory_i8.begin(); it != g_riscv_memory_i8.end(); ++it) {
        uintptr_t base_addr = it->first;
        if (!it->second.empty()) {
            const vint8m1_t& base_vec = it->second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl; // 1 byte per element

            if (addr >= base_addr && addr < base_addr + base_size) {
                // Found overlap
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        // Out of bounds read - return 0
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vint8m1_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, return concrete zeros (not symbolic variables)
    std::vector<Term> zero_elements(vl);
    Term zero = g_symbolic_tm->mkBitVector(8, 0);
    for (size_t i = 0; i < vl; i++) {
        zero_elements[i] = zero;
    }
    return vint8m1_t(g_symbolic_tm, zero_elements);
}

/**
 * __riscv_vse8_v_i8m1: Store vector of 8-bit integers (LMUL=1)
 */
inline void __riscv_vse8_v_i8m1(int8_t* ptr, const vint8m1_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_i8[addr].push_back(vec);
}

/**
 * __riscv_vse8_v_i8m1: Store vector to symbolic_int8_t array
 * This overload allows storing to symbolic scalar arrays for proper tracking
 */
inline void __riscv_vse8_v_i8m1(symbolic_int8_t* ptr, const vint8m1_t& vec, size_t vl) {
    for (size_t i = 0; i < vl; i++) {
        ptr[i] = symbolic_int8_t(g_symbolic_tm, vec.getElement(i), 0, false);
    }
}

/**
 * __riscv_vle32_v_i32m4: Load vector of 32-bit integers (LMUL=4)
 */
inline vint32m4_t __riscv_vle32_v_i32m4(const int32_t* ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_i32m4.find(addr);
    if (it != g_riscv_memory_i32m4.end() && !it->second.empty()) {
        return it->second.back();
    }

    return vint32m4_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_i32m4: Store vector of 32-bit integers (LMUL=4)
 */
inline void __riscv_vse32_v_i32m4(int32_t* ptr, const vint32m4_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_i32m4[addr].push_back(vec);
}

/**
 * __riscv_vse16_v_f16m2: Store vector of 16-bit floats (LMUL=2)
 */
inline void __riscv_vse16_v_f16m2(_Float16* ptr, const vfloat16m2_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f16m2[addr].push_back(vec);
}

/**
 * __riscv_vse32_v_f32m4: Store vector of 32-bit floats (LMUL=4)
 */
inline void __riscv_vse32_v_f32m4(float* ptr, const vfloat32m4_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f32m4[addr].push_back(vec);
}

// ============================================================================
// Unsigned 8-bit Load/Store Operations
// ============================================================================

/**
 * __riscv_vle8_v_u8m1: Load vector of unsigned 8-bit integers (LMUL=1)
 */
inline vuint8m1_t __riscv_vle8_v_u8m1(const uint8_t *base, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);

    // Check if we have stored values at this exact address
    auto it = g_riscv_memory_u8m1.find(addr);
    if (it != g_riscv_memory_u8m1.end() && !it->second.empty()) {
        const vuint8m1_t& stored = it->second.back();
        // If the stored vector has enough elements, return it
        // Otherwise, we need to handle overlap/partial reads
        if (stored.getVL() >= vl) {
            // Return only the requested number of elements
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vuint8m1_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search - check if address falls within a previously stored vector
    for (const auto& entry : g_riscv_memory_u8m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint8m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl; // 1 byte per element

            if (addr >= base_addr && addr < base_addr + base_size) {
                // Found overlap - extract elements at offset
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        // Out of bounds read - return 0
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vuint8m1_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in symbolic memory, read concrete values from the actual memory
    // This handles cases like loading from static const arrays (e.g., permutation tables)
    std::vector<Term> elements;
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        elements.push_back(g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(base[i])));
    }
    return vuint8m1_t(g_symbolic_tm, elements);
}

/**
 * __riscv_vse8_v_u8m1: Store vector of unsigned 8-bit integers (LMUL=1)
 * Only stores the first vl elements of the vector
 */
inline void __riscv_vse8_v_u8m1(uint8_t *base, const vuint8m1_t &vec, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    // Create a new vector with only the first vl elements
    std::vector<Term> elements;
    elements.reserve(vl);
    for (size_t i = 0; i < vl && i < vec.getVL(); i++) {
        elements.push_back(vec.getElement(i));
    }
    g_riscv_memory_u8m1[addr].push_back(vuint8m1_t(g_symbolic_tm, elements));
}

/**
 * __riscv_vle8_v_u8mf2: Load vector of unsigned 8-bit integers (LMUL=1/2)
 */
inline vuint8mf2_t __riscv_vle8_v_u8mf2(const uint8_t *base, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);

    // Check if we have stored values at this exact address
    auto it = g_riscv_memory_u8mf2.find(addr);
    if (it != g_riscv_memory_u8mf2.end() && !it->second.empty()) {
        return it->second.back();
    }

    // Overlap search in u8mf2 memory
    for (auto& entry : g_riscv_memory_u8mf2) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint8mf2_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vuint8mf2_t(g_symbolic_tm, elements);
            }
        }
    }

    // Also check u8m1 memory (might load from a larger stored vector)
    for (auto& entry : g_riscv_memory_u8m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint8m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vuint8mf2_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables
    return vuint8mf2_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_u8mf4: Store vector of unsigned 8-bit integers (LMUL=1/4)
 */
inline void __riscv_vse8_v_u8mf4(uint8_t *base, const vuint8mf4_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    g_riscv_memory_u8mf4[addr].push_back(vec);
}

/**
 * __riscv_vle8_v_i8mf4: Load vector of signed 8-bit integers (LMUL=1/4)
 */
inline vint8mf4_t __riscv_vle8_v_i8mf4(const int8_t *base, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);

    // Check if we have stored values at this exact address
    auto it = g_riscv_memory_i8mf4.find(addr);
    if (it != g_riscv_memory_i8mf4.end() && !it->second.empty()) {
        return it->second.back();
    }

    // Overlap search in i8mf4 memory
    for (auto& entry : g_riscv_memory_i8mf4) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vint8mf4_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vint8mf4_t(g_symbolic_tm, elements);
            }
        }
    }

    // Also check i8m1 memory (might load from a larger stored vector)
    for (auto& entry : g_riscv_memory_i8) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vint8m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vint8mf4_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables
    return vint8mf4_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_i8mf4: Store vector of signed 8-bit integers (LMUL=1/4)
 */
inline void __riscv_vse8_v_i8mf4(int8_t *base, const vint8mf4_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    g_riscv_memory_i8mf4[addr].push_back(vec);
}

// ============================================================================
// Unsigned 32-bit Load/Store Operations (LMUL=1)
// ============================================================================

/**
 * __riscv_vle32_v_u32m1: Load vector of unsigned 32-bit integers (LMUL=1)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_u32m1.find(addr);
    if (it != g_riscv_memory_u32m1.end() && !it->second.empty()) {
        const vuint32m1_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vuint32m1_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in u32m1 memory
    for (const auto& entry : g_riscv_memory_u32m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint32m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(uint32_t);

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(uint32_t);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(32, 0));
                    }
                }
                return vuint32m1_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vuint32m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_u32m1: Store vector of unsigned 32-bit integers (LMUL=1)
 */
inline void __riscv_vse32_v_u32m1(uint32_t *ptr, const vuint32m1_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_u32m1[addr].push_back(vec);
}

/**
 * __riscv_vsse32_v_u32m1: Strided store vector of unsigned 32-bit integers (LMUL=1)
 * Stores elements with a constant byte stride between consecutive elements
 * 
 * @param base Base address for the first element
 * @param bstride Byte stride (distance in bytes between consecutive elements)
 * @param vec Vector to store
 * @param vl Vector length (number of elements to store)
 */
inline void __riscv_vsse32_v_u32m1(uint32_t *base, ptrdiff_t bstride, const vuint32m1_t &vec, size_t vl) {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(base);
    
    // Store each element at base + i * bstride
    for (size_t i = 0; i < vl; i++) {
        uintptr_t addr = base_addr + i * bstride;
        std::vector<Term> elem = {vec.getElement(i)};
        g_riscv_memory_u32m1[addr].push_back(vuint32m1_t(g_symbolic_tm, elem));
    }
}

/**
 * __riscv_vsse32_v_u32m1: Overload for void* (common in XNNPACK code)
 */
inline void __riscv_vsse32_v_u32m1(void *base, ptrdiff_t bstride, const vuint32m1_t &vec, size_t vl) {
    __riscv_vsse32_v_u32m1(reinterpret_cast<uint32_t*>(base), bstride, vec, vl);
}

// ============================================================================
// Unsigned 32-bit Load/Store Operations (LMUL=4)
// ============================================================================

/**
 * __riscv_vle32_v_u32m4: Load vector of unsigned 32-bit integers (LMUL=4)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_u32m4.find(addr);
    if (it != g_riscv_memory_u32m4.end() && !it->second.empty()) {
        return it->second.back();
    }

    // If not found, create fresh symbolic variables (represents input data)
    return vuint32m4_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_u32m4: Store vector of unsigned 32-bit integers (LMUL=4)
 */
inline void __riscv_vse32_v_u32m4(uint32_t *ptr, const vuint32m4_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_u32m4[addr].push_back(vec);
}

/**
 * __riscv_vse32_v_u32m8: Store vector of unsigned 32-bit integers (LMUL=8)
 */
inline void __riscv_vse32_v_u32m8(uint32_t *ptr, const vuint32m8_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_u32m8[addr].push_back(vec);
}

/**
 * __riscv_vse32_v_u32m8: Overload for void* (common in XNNPACK code)
 */
inline void __riscv_vse32_v_u32m8(void *ptr, const vuint32m8_t &vec, size_t vl) {
    __riscv_vse32_v_u32m8(reinterpret_cast<uint32_t*>(ptr), vec, vl);
}

// ============================================================================
// Unsigned 8-bit Load/Store Operations (LMUL=8)
// ============================================================================

/**
 * __riscv_vle8_v_u8m8: Load vector of unsigned 8-bit integers (LMUL=8)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vuint8m8_t __riscv_vle8_v_u8m8(const uint8_t *base, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);

    // Check if we have stored values at this exact address
    auto it = g_riscv_memory_u8m8.find(addr);
    if (it != g_riscv_memory_u8m8.end() && !it->second.empty()) {
        const vuint8m8_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vuint8m8_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in u8m8 memory
    for (const auto& entry : g_riscv_memory_u8m8) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint8m8_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vuint8m8_t(g_symbolic_tm, elements);
            }
        }
    }

    // Also check u8m1 memory for overlaps
    for (const auto& entry : g_riscv_memory_u8m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint8m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl;

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = addr - base_addr;

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
                    }
                }
                return vuint8m8_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vuint8m8_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_u8m8: Store vector of unsigned 8-bit integers (LMUL=8)
 */
inline void __riscv_vse8_v_u8m8(uint8_t *base, const vuint8m8_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    g_riscv_memory_u8m8[addr].push_back(vec);
}

/**
 * __riscv_vluxei8_v_u8m8: Indexed (gather) load of unsigned 8-bit integers (LMUL=8)
 *
 * For each element i, loads a byte from base + bindex[i].
 * The index values in bindex are 8-bit byte offsets from base.
 *
 * Semantics: result[i] = *(base + bindex[i])
 *
 * @param base Base pointer for indexed load
 * @param bindex Vector of 8-bit byte indices/offsets
 * @param vl Vector length (number of elements to load)
 * @return Vector with gathered elements
 */
inline vuint8m8_t __riscv_vluxei8_v_u8m8(const uint8_t *base, const vuint8m8_t &bindex, size_t vl) {
    std::vector<Term> elements;
    elements.reserve(vl);
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(base);

    for (size_t i = 0; i < vl; i++) {
        // Get the index value - in symbolic execution, we need to handle this symbolically
        Term index_term = bindex.getElement(i);

        // For each possible index value, we build an ITE chain to select the right element
        // This is necessary because the index is symbolic
        
        // First, check if we have symbolic values stored in memory that cover the range
        bool found_symbolic = false;
        Term result_term;

        // Check u8m8 memory for symbolic values
        for (const auto& entry : g_riscv_memory_u8m8) {
            uintptr_t stored_base = entry.first;
            if (!entry.second.empty()) {
                const vuint8m8_t& stored_vec = entry.second.back();
                size_t stored_vl = stored_vec.getVL();

                // Check if base_addr falls within or matches this stored range
                if (base_addr >= stored_base && base_addr < stored_base + stored_vl) {
                    // Build ITE chain for all possible index values
                    size_t offset = base_addr - stored_base;
                    Term default_val = g_symbolic_tm->mkBitVector(8, 0);
                    result_term = default_val;

                    // For indices that would access within the stored vector
                    for (size_t idx = 0; idx < 256 && offset + idx < stored_vl; idx++) {
                        Term idx_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(idx));
                        Term is_match = g_symbolic_tm->mkTerm(Kind::EQUAL, {index_term, idx_const});
                        Term val = stored_vec.getElement(offset + idx);
                        result_term = g_symbolic_tm->mkTerm(Kind::ITE, {is_match, val, result_term});
                    }
                    found_symbolic = true;
                    break;
                }
            }
        }

        // Also check u8m1 memory
        if (!found_symbolic) {
            for (const auto& entry : g_riscv_memory_u8m1) {
                uintptr_t stored_base = entry.first;
                if (!entry.second.empty()) {
                    const vuint8m1_t& stored_vec = entry.second.back();
                    size_t stored_vl = stored_vec.getVL();

                    if (base_addr >= stored_base && base_addr < stored_base + stored_vl) {
                        size_t offset = base_addr - stored_base;
                        Term default_val = g_symbolic_tm->mkBitVector(8, 0);
                        result_term = default_val;

                        for (size_t idx = 0; idx < 256 && offset + idx < stored_vl; idx++) {
                            Term idx_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(idx));
                            Term is_match = g_symbolic_tm->mkTerm(Kind::EQUAL, {index_term, idx_const});
                            Term val = stored_vec.getElement(offset + idx);
                            result_term = g_symbolic_tm->mkTerm(Kind::ITE, {is_match, val, result_term});
                        }
                        found_symbolic = true;
                        break;
                    }
                }
            }
        }

        if (!found_symbolic) {
            // Fall back to reading concrete values from memory
            // Build ITE chain over concrete memory values
            Term default_val = g_symbolic_tm->mkBitVector(8, 0);
            result_term = default_val;

            // For a reasonable range of index values, read from concrete memory
            for (size_t idx = 0; idx < 256; idx++) {
                Term idx_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(idx));
                Term is_match = g_symbolic_tm->mkTerm(Kind::EQUAL, {index_term, idx_const});
                Term val = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(base[idx]));
                result_term = g_symbolic_tm->mkTerm(Kind::ITE, {is_match, val, result_term});
            }
        }

        elements.push_back(result_term);
    }

    return vuint8m8_t(g_symbolic_tm, elements);
}

// ============================================================================
// Unsigned 16-bit Load/Store Operations (LMUL=1)
// ============================================================================

/**
 * __riscv_vle16_v_u16m1: Load vector of unsigned 16-bit integers (LMUL=1)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vuint16m1_t __riscv_vle16_v_u16m1(const uint16_t *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_u16m1.find(addr);
    if (it != g_riscv_memory_u16m1.end() && !it->second.empty()) {
        const vuint16m1_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vuint16m1_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in u16m1 memory
    for (const auto& entry : g_riscv_memory_u16m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint16m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(uint16_t);

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(uint16_t);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(16, 0));
                    }
                }
                return vuint16m1_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vuint16m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse16_v_u16m1: Store vector of unsigned 16-bit integers (LMUL=1)
 */
inline void __riscv_vse16_v_u16m1(uint16_t *ptr, const vuint16m1_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_u16m1[addr].push_back(vec);
}

/**
 * __riscv_vlse16_v_u16m1: Strided load of unsigned 16-bit integers (LMUL=1)
 * Loads vl elements with a stride (in bytes) between consecutive elements
 */
inline vuint16m1_t __riscv_vlse16_v_u16m1(const uint16_t *ptr, ptrdiff_t stride, size_t vl) {
    std::vector<Term> elements;
    elements.reserve(vl);

    const uint8_t* base = reinterpret_cast<const uint8_t*>(ptr);

    for (size_t i = 0; i < vl; i++) {
        const uint16_t* elem_ptr = reinterpret_cast<const uint16_t*>(base + i * stride);
        uintptr_t addr = reinterpret_cast<uintptr_t>(elem_ptr);

        // Check if we have this address in memory
        bool found = false;
        for (const auto& entry : g_riscv_memory_u16m1) {
            uintptr_t base_addr = entry.first;
            if (!entry.second.empty()) {
                const vuint16m1_t& base_vec = entry.second.back();
                size_t base_vl = base_vec.getVL();
                size_t base_size = base_vl * sizeof(uint16_t);

                if (addr >= base_addr && addr < base_addr + base_size) {
                    size_t offset_elems = (addr - base_addr) / sizeof(uint16_t);
                    if (offset_elems < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems));
                        found = true;
                        break;
                    }
                }
            }
        }

        if (!found) {
            // Read concrete value from memory
            elements.push_back(g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*elem_ptr)));
        }
    }

    return vuint16m1_t(g_symbolic_tm, elements);
}

/**
 * __riscv_vlse16_v_u16m1_tu: Tail-undisturbed strided load of unsigned 16-bit integers (LMUL=1)
 * Loads vl elements with a stride (in bytes) between consecutive elements
 * Elements beyond vl are preserved from the merge vector (tail undisturbed)
 */
inline vuint16m1_t __riscv_vlse16_v_u16m1_tu(const vuint16m1_t& merge, const uint16_t *ptr, ptrdiff_t stride, size_t vl) {
    std::vector<Term> elements;
    size_t merge_vl = merge.getVL();
    elements.reserve(merge_vl > vl ? merge_vl : vl);

    const uint8_t* base = reinterpret_cast<const uint8_t*>(ptr);

    // Load active elements (up to vl)
    for (size_t i = 0; i < vl; i++) {
        const uint16_t* elem_ptr = reinterpret_cast<const uint16_t*>(base + i * stride);
        uintptr_t addr = reinterpret_cast<uintptr_t>(elem_ptr);

        // Check if we have this address in memory
        bool found = false;
        for (const auto& entry : g_riscv_memory_u16m1) {
            uintptr_t base_addr = entry.first;
            if (!entry.second.empty()) {
                const vuint16m1_t& base_vec = entry.second.back();
                size_t base_vl = base_vec.getVL();
                size_t base_size = base_vl * sizeof(uint16_t);

                if (addr >= base_addr && addr < base_addr + base_size) {
                    size_t offset_elems = (addr - base_addr) / sizeof(uint16_t);
                    if (offset_elems < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems));
                        found = true;
                        break;
                    }
                }
            }
        }

        if (!found) {
            // Read concrete value from memory
            elements.push_back(g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*elem_ptr)));
        }
    }

    // Preserve tail elements from merge vector (tail undisturbed)
    for (size_t i = vl; i < merge_vl; i++) {
        elements.push_back(merge.getElement(i));
    }

    return vuint16m1_t(g_symbolic_tm, elements);
}

// ============================================================================
// Segment Store Operations
// ============================================================================

// ============================================================================
// Float32 Load Operations (LMUL=1)
// ============================================================================

/**
 * Global storage for float32m1 vectors
 */
inline std::map<uintptr_t, std::vector<vfloat32m1_t>> g_riscv_memory_f32m1;

/**
 * __riscv_vle32_v_f32m1: Load vector of 32-bit floats (LMUL=1)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vfloat32m1_t __riscv_vle32_v_f32m1(const float *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_f32m1.find(addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
        const vfloat32m1_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vfloat32m1_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in f32m1 memory
    for (const auto& entry : g_riscv_memory_f32m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vfloat32m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(float);

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(float);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkFloatingPointPosZero(8, 24));
                    }
                }
                return vfloat32m1_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vfloat32m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_f32m1: Store vector of 32-bit floats (LMUL=1)
 */
inline void __riscv_vse32_v_f32m1(float *ptr, const vfloat32m1_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f32m1[addr].push_back(vec);
}

/**
 * __riscv_vle32_v_f32m1: Overload for symbolic_float32_t arrays
 * This allows loading from local arrays that contain symbolic values
 */
inline vfloat32m1_t __riscv_vle32_v_f32m1(const symbolic_float32_t *ptr, size_t vl) {
    std::vector<Term> elements;
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        elements.push_back(ptr[i].getTerm());
    }
    return vfloat32m1_t(g_symbolic_tm, elements);
}

/**
 * riscv_symbolic_float_load: Read a symbolic float from memory
 * Looks up the address in g_riscv_float_scalar_memory and returns a symbolic_float32_t
 * If not found, returns a symbolic_float32_t with the concrete value from memory
 */
inline symbolic_float32_t riscv_symbolic_float_load(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    auto it = g_riscv_float_scalar_memory.find(addr);
    if (it != g_riscv_float_scalar_memory.end()) {
        return symbolic_float32_t(g_symbolic_tm, it->second, *ptr, false);
    }
    // Not found in symbolic memory - create from concrete value
    return symbolic_float32_t(g_symbolic_tm, *ptr, false);
}

/**
 * riscv_symbolic_float_store: Write a symbolic float to memory
 * Stores the symbolic term to g_riscv_float_scalar_memory and updates the concrete value
 */
inline void riscv_symbolic_float_store(float* ptr, const symbolic_float32_t& val) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_float_scalar_memory[addr] = val.getTerm();
    *ptr = static_cast<float>(val);
}

// ============================================================================
// Segment Load Operations (Float32)
// ============================================================================

/**
 * __riscv_vlseg2e32_v_f32m1x2: Segment load of 2 vectors with 32-bit float elements
 * Loads interleaved data: result.v0 = {ptr[0], ptr[2], ptr[4], ...}
 *                         result.v1 = {ptr[1], ptr[3], ptr[5], ...}
 * This is the RVV equivalent of NEON's vld2q_f32 de-interleave operation
 *
 * @param ptr Base address to load from (must point to 2*vl floats in interleaved order)
 * @param vl Vector length (number of elements per segment)
 * @return Tuple of 2 vfloat32m1_t vectors
 */
inline vfloat32m1x2_t __riscv_vlseg2e32_v_f32m1x2(const float *ptr, size_t vl) {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(ptr);

    std::vector<Term> seg0_elements;
    std::vector<Term> seg1_elements;
    seg0_elements.reserve(vl);
    seg1_elements.reserve(vl);

    // Check if we have symbolic values stored at this base address
    // For segment load, data is interleaved: v0[0], v1[0], v0[1], v1[1], ...
    bool found_in_memory = false;

    // Check in f32m1 memory for stored values
    auto it = g_riscv_memory_f32m1.find(base_addr);
    if (it != g_riscv_memory_f32m1.end() && !it->second.empty()) {
        const vfloat32m1_t& stored = it->second.back();
        size_t stored_vl = stored.getVL();

        // If we have enough interleaved elements
        if (stored_vl >= 2 * vl) {
            for (size_t i = 0; i < vl; i++) {
                seg0_elements.push_back(stored.getElement(i * 2));      // Even indices
                seg1_elements.push_back(stored.getElement(i * 2 + 1));  // Odd indices
            }
            found_in_memory = true;
        }
    }

    if (!found_in_memory) {
        // Also search for overlaps - check if the address falls within any stored vector
        for (const auto& entry : g_riscv_memory_f32m1) {
            uintptr_t stored_base = entry.first;
            if (!entry.second.empty()) {
                const vfloat32m1_t& stored_vec = entry.second.back();
                size_t stored_vl = stored_vec.getVL();
                size_t stored_size = stored_vl * sizeof(float);

                if (base_addr >= stored_base && base_addr < stored_base + stored_size) {
                    size_t offset_elems = (base_addr - stored_base) / sizeof(float);
                    size_t available = stored_vl - offset_elems;

                    if (available >= 2 * vl) {
                        for (size_t i = 0; i < vl; i++) {
                            seg0_elements.push_back(stored_vec.getElement(offset_elems + i * 2));
                            seg1_elements.push_back(stored_vec.getElement(offset_elems + i * 2 + 1));
                        }
                        found_in_memory = true;
                        break;
                    }
                }
            }
        }
    }

    if (!found_in_memory) {
        // If not found in symbolic memory, create fresh symbolic constants for input
        Sort fp32 = g_symbolic_tm->mkFloatingPointSort(8, 24);
        for (size_t i = 0; i < vl; i++) {
            seg0_elements.push_back(g_symbolic_tm->mkConst(fp32, "seg2_v0_" + std::to_string(i)));
            seg1_elements.push_back(g_symbolic_tm->mkConst(fp32, "seg2_v1_" + std::to_string(i)));
        }
    }

    vfloat32m1_t v0(g_symbolic_tm, seg0_elements);
    vfloat32m1_t v1(g_symbolic_tm, seg1_elements);

    return vfloat32m1x2_t(v0, v1);
}

/**
 * __riscv_vget_v_f32m1x2_f32m1: Extract a single vector from a vfloat32m1x2_t tuple
 *
 * @param tuple The tuple to extract from
 * @param index Index of vector to extract (0 or 1)
 * @return The extracted vfloat32m1_t vector
 */
inline vfloat32m1_t __riscv_vget_v_f32m1x2_f32m1(const vfloat32m1x2_t& tuple, size_t index) {
    if (index == 0) {
        return tuple.get0();
    } else {
        return tuple.get1();
    }
}

// ============================================================================
// Segment Store Operations
// ============================================================================

/**
 * __riscv_vsseg4e32_v_u32m1x4: Segment store of 4 vectors with 32-bit elements
 * Stores elements interleaved: v0[0], v1[0], v2[0], v3[0], v0[1], v1[1], ...
 * This is the RVV equivalent of NEON's vst4q_u32
 */
inline void __riscv_vsseg4e32_v_u32m1x4(uint32_t *ptr, const vuint32m1x4_t &tuple, size_t vl) {
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(ptr);

    const vuint32m1_t& v0 = tuple.get0();
    const vuint32m1_t& v1 = tuple.get1();
    const vuint32m1_t& v2 = tuple.get2();
    const vuint32m1_t& v3 = tuple.get3();

    // Store elements interleaved: for each index i, store v0[i], v1[i], v2[i], v3[i]
    // Store each element at consecutive addresses to match NEON vst4q_u32 behavior
    for (size_t i = 0; i < vl; i++) {
        // Store v0[i] at base + (i*4 + 0) * 4 bytes
        uintptr_t addr0 = base_addr + (i * 4 + 0) * sizeof(uint32_t);
        std::vector<Term> elem0 = {v0.getElement(i)};
        g_riscv_memory_u32m1[addr0].push_back(vuint32m1_t(g_symbolic_tm, elem0));

        // Store v1[i] at base + (i*4 + 1) * 4 bytes
        uintptr_t addr1 = base_addr + (i * 4 + 1) * sizeof(uint32_t);
        std::vector<Term> elem1 = {v1.getElement(i)};
        g_riscv_memory_u32m1[addr1].push_back(vuint32m1_t(g_symbolic_tm, elem1));

        // Store v2[i] at base + (i*4 + 2) * 4 bytes
        uintptr_t addr2 = base_addr + (i * 4 + 2) * sizeof(uint32_t);
        std::vector<Term> elem2 = {v2.getElement(i)};
        g_riscv_memory_u32m1[addr2].push_back(vuint32m1_t(g_symbolic_tm, elem2));

        // Store v3[i] at base + (i*4 + 3) * 4 bytes
        uintptr_t addr3 = base_addr + (i * 4 + 3) * sizeof(uint32_t);
        std::vector<Term> elem3 = {v3.getElement(i)};
        g_riscv_memory_u32m1[addr3].push_back(vuint32m1_t(g_symbolic_tm, elem3));
    }
}

// ============================================================================
// Float32 LMUL=2 Memory Operations
// ============================================================================

/**
 * Global storage for float32m2 vectors
 */
inline std::map<uintptr_t, std::vector<vfloat32m2_t>> g_riscv_memory_f32m2;

/**
 * __riscv_vle32_v_f32m2: Load vector of 32-bit floats (LMUL=2)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vfloat32m2_t __riscv_vle32_v_f32m2(const float *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // First check for exact address match
    auto it = g_riscv_memory_f32m2.find(addr);
    if (it != g_riscv_memory_f32m2.end() && !it->second.empty()) {
        const vfloat32m2_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vfloat32m2_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in f32m2 memory - check if addr falls within a stored vector
    for (const auto& entry : g_riscv_memory_f32m2) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vfloat32m2_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(float);

            // Check if our load address falls within the range of this stored vector
            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(float);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkFloatingPointPosZero(8, 24));
                    }
                }
                return vfloat32m2_t(g_symbolic_tm, elements);
            }
        }
    }

    // Also check f32m1 memory for overlaps (in case data was stored as m1)
    for (const auto& entry : g_riscv_memory_f32m1) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vfloat32m1_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(float);

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(float);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkFloatingPointPosZero(8, 24));
                    }
                }
                return vfloat32m2_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vfloat32m2_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_f32m2: Store vector of 32-bit floats (LMUL=2)
 */
inline void __riscv_vse32_v_f32m2(float *ptr, const vfloat32m2_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f32m2[addr].push_back(vec);
}

// ============================================================================
// Float16 LMUL=1 Memory Operations
// ============================================================================

/**
 * Global storage for float16m1 vectors
 */
inline std::map<uintptr_t, std::vector<vfloat16m1_t>> g_riscv_memory_f16m1;

/**
 * __riscv_vle16_v_f16m1: Load vector of 16-bit floats (LMUL=1)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vfloat16m1_t __riscv_vle16_v_f16m1(const _Float16 *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_f16m1.find(addr);
    if (it != g_riscv_memory_f16m1.end() && !it->second.empty()) {
        const vfloat16m1_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vfloat16m1_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vfloat16m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse16_v_f16m1: Store vector of 16-bit floats (LMUL=1)
 */
inline void __riscv_vse16_v_f16m1(_Float16 *ptr, const vfloat16m1_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f16m1[addr].push_back(vec);
}

// ============================================================================
// Signed 8-bit Load/Store Operations (LMUL=1/2)
// ============================================================================

/**
 * __riscv_vle8_v_i8mf2: Load vector of signed 8-bit integers (LMUL=1/2)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vint8mf2_t __riscv_vle8_v_i8mf2(const int8_t *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_i8mf2.find(addr);
    if (it != g_riscv_memory_i8mf2.end() && !it->second.empty()) {
        return it->second.back();
    }

    // If not found in memory, create fresh symbolic variables
    return vint8mf2_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_i8mf2: Store vector of signed 8-bit integers (LMUL=1/2)
 */
inline void __riscv_vse8_v_i8mf2(int8_t *base, const vint8mf2_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    g_riscv_memory_i8mf2[addr].push_back(vec);
}

// ============================================================================
// Unsigned 16-bit Load/Store Operations (LMUL=4)
// ============================================================================

/**
 * __riscv_vle16_v_u16m4: Load vector of unsigned 16-bit integers (LMUL=4)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vuint16m4_t __riscv_vle16_v_u16m4(const uint16_t *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_u16m4.find(addr);
    if (it != g_riscv_memory_u16m4.end() && !it->second.empty()) {
        const vuint16m4_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vuint16m4_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // Overlap search in u16m4 memory
    for (const auto& entry : g_riscv_memory_u16m4) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const vuint16m4_t& base_vec = entry.second.back();
            size_t base_vl = base_vec.getVL();
            size_t base_size = base_vl * sizeof(uint16_t);

            if (addr >= base_addr && addr < base_addr + base_size) {
                size_t offset_elems = (addr - base_addr) / sizeof(uint16_t);

                std::vector<Term> elements;
                elements.reserve(vl);
                for (size_t i = 0; i < vl; i++) {
                    if (offset_elems + i < base_vl) {
                        elements.push_back(base_vec.getElement(offset_elems + i));
                    } else {
                        elements.push_back(g_symbolic_tm->mkBitVector(16, 0));
                    }
                }
                return vuint16m4_t(g_symbolic_tm, elements);
            }
        }
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vuint16m4_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse16_v_u16m4: Store vector of unsigned 16-bit integers (LMUL=4)
 */
inline void __riscv_vse16_v_u16m4(uint16_t *ptr, const vuint16m4_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_u16m4[addr].push_back(vec);
}

// ============================================================================
// Float16 Load/Store Operations (LMUL=4)
// ============================================================================

/**
 * __riscv_vle16_v_f16m4: Load vector of 16-bit floats (LMUL=4)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vfloat16m4_t __riscv_vle16_v_f16m4(const _Float16 *ptr, size_t vl) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    auto it = g_riscv_memory_f16m4.find(addr);
    if (it != g_riscv_memory_f16m4.end() && !it->second.empty()) {
        const vfloat16m4_t& stored = it->second.back();
        if (stored.getVL() >= vl) {
            std::vector<Term> elements;
            elements.reserve(vl);
            for (size_t i = 0; i < vl; i++) {
                elements.push_back(stored.getElement(i));
            }
            return vfloat16m4_t(g_symbolic_tm, elements);
        }
        return stored;
    }

    // If not found in memory, create fresh symbolic variables (for input data)
    return vfloat16m4_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse16_v_f16m4: Store vector of 16-bit floats (LMUL=4)
 */
inline void __riscv_vse16_v_f16m4(_Float16 *ptr, const vfloat16m4_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_f16m4[addr].push_back(vec);
}

#endif // RISCV_SYMBOLIC_MEMORY_HPP
