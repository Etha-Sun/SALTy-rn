#ifndef NEON_SYMBOLIC_INTRINSICS_H
#define NEON_SYMBOLIC_INTRINSICS_H

#include "types.h"
#include "memory.h"
#include <stdint.h>

/**
 * vld1q_s32: Load 4 x 32-bit signed integers
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
static inline int32x4_t vld1q_s32(const int32_t* ptr) {
    uintptr_t addr = (uintptr_t)ptr;

    // Check if this address was previously stored to
    int32x4_t* stored = neon_memory_get_last(&g_neon_memory, addr);
    if (stored) {
        return *stored;
    }

    // Otherwise, create fresh symbolic variables (represents input data)
    return int32x4_t_new(g_symbolic_tm);
}

/**
 * vst1q_s32: Store 4 x 32-bit signed integers
 */
static inline void vst1q_s32(int32_t* ptr, int32x4_t vec) {
    uintptr_t addr = (uintptr_t)ptr;
    neon_memory_push(&g_neon_memory, addr, vec);
}

/**
 * vaddq_s32: Add two vectors element-wise (wrapping arithmetic)
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
static inline int32x4_t vaddq_s32(int32x4_t a, int32x4_t b) {
    Cvc5Term result_lanes[4];

    for (int i = 0; i < 4; i++) {
        Cvc5Term args[2] = {a.lanes[i], b.lanes[i]};
        result_lanes[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_BITVECTOR_ADD, 2, args);
    }

    return int32x4_t_from_terms(g_symbolic_tm, result_lanes);
}

/**
 * vmulq_n_s32: Multiply vector by scalar (wrapping arithmetic)
 * Semantics: result[i] = vec[i] * scalar (mod 2^32)
 */
static inline int32x4_t vmulq_n_s32(int32x4_t vec, int32_t scalar) {
    Cvc5Term result_lanes[4];

    uint32_t scalar_u32 = (uint32_t)scalar;
    Cvc5Term scalar_term = cvc5_mk_bv_uint64(g_symbolic_tm, 32, (uint64_t)scalar_u32);

    for (int i = 0; i < 4; i++) {
        Cvc5Term args[2] = {vec.lanes[i], scalar_term};
        result_lanes[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_BITVECTOR_MULT, 2, args);
    }

    return int32x4_t_from_terms(g_symbolic_tm, result_lanes);
}

#endif // NEON_SYMBOLIC_INTRINSICS_H
