#ifndef RISCV_SYMBOLIC_INTRINSICS_H
#define RISCV_SYMBOLIC_INTRINSICS_H

#include "types.h"
#include "memory.h"
#include <stdint.h>

/**
 * RISC-V Vector Extension Intrinsic Symbolic Implementations
 */

/**
 * __riscv_vsetvl_e32m1: Set vector length for 32-bit elements with LMUL=1
 * Semantics: Returns the actual vector length that will be used
 */
static inline size_t __riscv_vsetvl_e32m1(size_t avl) {
    g_current_vl = avl;
    return avl;
}

/**
 * __riscv_vle32_v_i32m1: Load vector of 32-bit integers
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
static inline vint32m1_t __riscv_vle32_v_i32m1(const int32_t* ptr, size_t vl) {
    uintptr_t addr = (uintptr_t)ptr;

    // Check if this address was previously stored to
    vint32m1_t* stored = riscv_memory_get_last(&g_riscv_memory, addr);
    if (stored) {
        return *stored;
    }

    // Otherwise, create fresh symbolic variables (represents input data)
    return vint32m1_t_new(g_symbolic_tm, vl);
}

/**
 * __riscv_vse32_v_i32m1: Store vector of 32-bit integers
 */
static inline void __riscv_vse32_v_i32m1(int32_t* ptr, vint32m1_t vec, size_t vl) {
    uintptr_t addr = (uintptr_t)ptr;
    riscv_memory_push(&g_riscv_memory, addr, vec);
}

/**
 * __riscv_vadd_vv_i32m1: Vector-vector add
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
static inline vint32m1_t __riscv_vadd_vv_i32m1(vint32m1_t a, vint32m1_t b, size_t vl) {
    Cvc5Term* result_elements = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vl);
    if (!result_elements) {
        // Error handling - return empty vector
        vint32m1_t empty = {NULL, g_symbolic_tm, 0, 0};
        return empty;
    }

    for (size_t i = 0; i < vl; i++) {
        Cvc5Term args[2] = {a.elements[i], b.elements[i]};
        result_elements[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_BITVECTOR_ADD, 2, args);
    }

    vint32m1_t result = vint32m1_t_from_terms(g_symbolic_tm, result_elements, vl);
    free(result_elements);
    return result;
}

/**
 * __riscv_vmul_vx_i32m1: Vector-scalar multiply
 * Semantics: result[i] = vec[i] * scalar (mod 2^32)
 */
static inline vint32m1_t __riscv_vmul_vx_i32m1(vint32m1_t vec, int32_t scalar, size_t vl) {
    Cvc5Term* result_elements = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vl);
    if (!result_elements) {
        // Error handling - return empty vector
        vint32m1_t empty = {NULL, g_symbolic_tm, 0, 0};
        return empty;
    }

    uint32_t scalar_u32 = (uint32_t)scalar;
    Cvc5Term scalar_term = cvc5_mk_bv_uint64(g_symbolic_tm, 32, (uint64_t)scalar_u32);

    for (size_t i = 0; i < vl; i++) {
        Cvc5Term args[2] = {vec.elements[i], scalar_term};
        result_elements[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_BITVECTOR_MULT, 2, args);
    }

    vint32m1_t result = vint32m1_t_from_terms(g_symbolic_tm, result_elements, vl);
    free(result_elements);
    return result;
}

#endif // RISCV_SYMBOLIC_INTRINSICS_H
