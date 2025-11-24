#ifndef NEON_SYMBOLIC_UTILS_H
#define NEON_SYMBOLIC_UTILS_H

#include "types.h"
#include "memory.h"

/**
 * Get stored results at a memory address
 * Returns NULL if no results stored
 */
static inline const neon_memory_entry_t* neon_get_stored_results(const int32_t* ptr) {
    uintptr_t addr = (uintptr_t)ptr;
    for (size_t i = 0; i < g_neon_memory.count; i++) {
        if (g_neon_memory.slots[i].address == addr) {
            return &g_neon_memory.slots[i].entry;
        }
    }
    return NULL;
}

/**
 * Clear all memory
 */
static inline void neon_clear_memory(void) {
    neon_memory_clear(&g_neon_memory);
}

/**
 * Check if two vectors are equal (all lanes equal)
 */
static inline Cvc5Term neon_vector_equal(const int32x4_t* a, const int32x4_t* b) {
    Cvc5Term lane_equalities[4];

    for (int i = 0; i < 4; i++) {
        Cvc5Term args[2] = {a->lanes[i], b->lanes[i]};
        lane_equalities[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_EQUAL, 2, args);
    }

    return cvc5_mk_term(g_symbolic_tm, CVC5_KIND_AND, 4, lane_equalities);
}

/**
 * Check if two vectors are not equal (at least one lane differs)
 */
static inline Cvc5Term neon_vector_not_equal(const int32x4_t* a, const int32x4_t* b) {
    Cvc5Term lane_inequalities[4];

    for (int i = 0; i < 4; i++) {
        Cvc5Term args[2] = {a->lanes[i], b->lanes[i]};
        Cvc5Term eq = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_EQUAL, 2, args);
        Cvc5Term not_args[1] = {eq};
        lane_inequalities[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_NOT, 1, not_args);
    }

    return cvc5_mk_term(g_symbolic_tm, CVC5_KIND_OR, 4, lane_inequalities);
}

#endif // NEON_SYMBOLIC_UTILS_H
