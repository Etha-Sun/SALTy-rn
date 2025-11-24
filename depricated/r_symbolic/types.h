#ifndef RISCV_SYMBOLIC_TYPES_H
#define RISCV_SYMBOLIC_TYPES_H

#include <cvc5/c/cvc5.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Symbolic representation of RISC-V Vector vint32m1_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=1
 */
typedef struct {
    Cvc5Term* elements;
    Cvc5TermManager* tm;
    size_t vl;
    size_t capacity;
} vint32m1_t;

/**
 * Create a new vint32m1_t with specified vector length
 */
static inline vint32m1_t vint32m1_t_new(Cvc5TermManager* tm, size_t vector_length) {
    vint32m1_t vec;
    vec.tm = tm;
    vec.vl = vector_length;
    vec.capacity = vector_length;
    vec.elements = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vector_length);

    Cvc5Sort bv32 = cvc5_mk_bv_sort(tm, 32);
    for (size_t i = 0; i < vector_length; i++) {
        char name[32];
        snprintf(name, sizeof(name), "vec_%zu", i);
        vec.elements[i] = cvc5_mk_const(tm, bv32, name);
    }

    return vec;
}

/**
 * Create a new vint32m1_t from existing terms
 */
static inline vint32m1_t vint32m1_t_from_terms(Cvc5TermManager* tm, const Cvc5Term* terms, size_t count) {
    vint32m1_t vec;
    vec.tm = tm;
    vec.vl = count;
    vec.capacity = count;
    vec.elements = (Cvc5Term*)malloc(sizeof(Cvc5Term) * count);

    for (size_t i = 0; i < count; i++) {
        vec.elements[i] = terms[i];
    }

    return vec;
}

/**
 * Create a new vint32m1_t with specific name prefix
 */
static inline vint32m1_t vint32m1_t_new_named(Cvc5TermManager* tm, size_t vector_length, const char* name) {
    vint32m1_t vec;
    vec.tm = tm;
    vec.vl = vector_length;
    vec.capacity = vector_length;
    vec.elements = (Cvc5Term*)malloc(sizeof(Cvc5Term) * vector_length);

    Cvc5Sort bv32 = cvc5_mk_bv_sort(tm, 32);
    for (size_t i = 0; i < vector_length; i++) {
        char full_name[128];
        snprintf(full_name, sizeof(full_name), "%s_%zu", name, i);
        vec.elements[i] = cvc5_mk_const(tm, bv32, full_name);
    }

    return vec;
}

/**
 * Get a specific element from the vector
 */
static inline Cvc5Term vint32m1_t_get_element(const vint32m1_t* vec, size_t idx) {
    return vec->elements[idx];
}

/**
 * Get the vector length
 */
static inline size_t vint32m1_t_get_vl(const vint32m1_t* vec) {
    return vec->vl;
}

/**
 * Get the term manager
 */
static inline Cvc5TermManager* vint32m1_t_get_tm(const vint32m1_t* vec) {
    return vec->tm;
}

/**
 * Free the memory allocated for the vector
 */
static inline void vint32m1_t_free(vint32m1_t* vec) {
    if (vec->elements) {
        free(vec->elements);
        vec->elements = NULL;
    }
}

#endif // RISCV_SYMBOLIC_TYPES_H
