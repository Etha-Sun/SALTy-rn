#ifndef RISCV_SYMBOLIC_HELPERS_H
#define RISCV_SYMBOLIC_HELPERS_H

#include "types.h"
#include "memory.h"

/**
 * Get stored results at a memory address
 * Returns NULL if no results stored
 */
static inline const riscv_memory_entry_t* riscv_get_stored_results(const int32_t* ptr) {
    uintptr_t addr = (uintptr_t)ptr;
    for (size_t i = 0; i < g_riscv_memory.count; i++) {
        if (g_riscv_memory.slots[i].address == addr) {
            return &g_riscv_memory.slots[i].entry;
        }
    }
    return NULL;
}

/**
 * Clear all memory
 */
static inline void riscv_clear_memory(void) {
    riscv_memory_clear(&g_riscv_memory);
}

/**
 * Check if two vectors are equal (all elements equal)
 */
static inline Cvc5Term riscv_vector_equal(const vint32m1_t* a, const vint32m1_t* b) {
    size_t vl = a->vl < b->vl ? a->vl : b->vl;  // min(a->vl, b->vl)

    Cvc5Term* element_equalities = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vl);
    if (!element_equalities) return (Cvc5Term){0};  // Error handling

    for (size_t i = 0; i < vl; i++) {
        Cvc5Term args[2] = {a->elements[i], b->elements[i]};
        element_equalities[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_EQUAL, 2, args);
    }

    Cvc5Term result = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_AND, vl, element_equalities);
    free(element_equalities);
    return result;
}

/**
 * Check if two vectors are not equal (at least one element differs)
 */
static inline Cvc5Term riscv_vector_not_equal(const vint32m1_t* a, const vint32m1_t* b) {
    size_t vl = a->vl < b->vl ? a->vl : b->vl;  // min(a->vl, b->vl)

    Cvc5Term* element_inequalities = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vl);
    if (!element_inequalities) return (Cvc5Term){0};  // Error handling

    for (size_t i = 0; i < vl; i++) {
        Cvc5Term args[2] = {a->elements[i], b->elements[i]};
        Cvc5Term eq = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_EQUAL, 2, args);
        Cvc5Term not_args[1] = {eq};
        element_inequalities[i] = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_NOT, 1, not_args);
    }

    Cvc5Term result = cvc5_mk_term(g_symbolic_tm, CVC5_KIND_OR, vl, element_inequalities);
    free(element_inequalities);
    return result;
}

#endif // RISCV_SYMBOLIC_HELPERS_H
