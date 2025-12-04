#ifndef RISCV_SYMBOLIC_MEMORY_HPP
#define RISCV_SYMBOLIC_MEMORY_HPP

#include "../symbolic_common.hpp"
#include "types.hpp"
#include <map>
#include <vector>
#include <cstdint>

/**
 * Global VL (vector length) for current operation
 * Set by vsetvl instructions, affects subsequent vector operations
 */
inline size_t g_current_vl = 0;

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
 * Global storage for unsigned 32-bit vectors (LMUL=1)
 */
inline std::map<uintptr_t, std::vector<vuint32m1_t>> g_riscv_memory_u32m1;

/**
 * Global storage for unsigned 32-bit vectors (LMUL=4)
 */
inline std::map<uintptr_t, std::vector<vuint32m4_t>> g_riscv_memory_u32m4;

/**
 * Global storage for unsigned 8-bit vectors (LMUL=8)
 */
inline std::map<uintptr_t, std::vector<vuint8m8_t>> g_riscv_memory_u8m8;


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
 * __riscv_vse32_v_i32m1: Store vector of 32-bit integers
 */
inline void __riscv_vse32_v_i32m1(int32_t* ptr, const vint32m1_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory[addr].push_back(vec);
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

    // If not found in memory, create fresh symbolic variables (for input data)
    return vuint8m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_u8m1: Store vector of unsigned 8-bit integers (LMUL=1)
 */
inline void __riscv_vse8_v_u8m1(uint8_t *base, const vuint8m1_t &vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(base);
    g_riscv_memory_u8m1[addr].push_back(vec);
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

#endif // RISCV_SYMBOLIC_MEMORY_HPP
