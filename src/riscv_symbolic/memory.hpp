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

    return vint8m1_t(g_symbolic_tm, vl);
}

/**
 * __riscv_vse8_v_i8m1: Store vector of 8-bit integers (LMUL=1)
 */
inline void __riscv_vse8_v_i8m1(int8_t* ptr, const vint8m1_t& vec, size_t vl) {
    (void)vl;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    g_riscv_memory_i8[addr].push_back(vec);
}

#endif // RISCV_SYMBOLIC_MEMORY_HPP
