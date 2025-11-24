#ifndef NEON_SYMBOLIC_TYPES_H
#define NEON_SYMBOLIC_TYPES_H

#include <cvc5/c/cvc5.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Symbolic representation of ARM NEON int32x4_t vector type
 * Represents 4 lanes of 32-bit signed integers
 */
typedef struct {
    Cvc5Term lanes[4];
    Cvc5TermManager* tm;
} int32x4_t;

/**
 * Create a new int32x4_t with default names
 */
static inline int32x4_t int32x4_t_new(Cvc5TermManager* tm) {
    int32x4_t vec;
    vec.tm = tm;

    Cvc5Sort bv32 = cvc5_mk_bv_sort(tm, 32);
    for (int i = 0; i < 4; i++) {
        char name[32];
        snprintf(name, sizeof(name), "int32_%d", i);
        vec.lanes[i] = cvc5_mk_const(tm, bv32, name);
    }

    return vec;
}

/**
 * Create a new int32x4_t with existing terms
 */
static inline int32x4_t int32x4_t_from_terms(Cvc5TermManager* tm, const Cvc5Term terms[4]) {
    int32x4_t vec;
    vec.tm = tm;

    for (int i = 0; i < 4; i++) {
        vec.lanes[i] = terms[i];
    }

    return vec;
}

/**
 * Create a new int32x4_t with specific name prefix
 */
static inline int32x4_t int32x4_t_new_named(Cvc5TermManager* tm, const char* name) {
    int32x4_t vec;
    vec.tm = tm;

    Cvc5Sort bv32 = cvc5_mk_bv_sort(tm, 32);
    for (int i = 0; i < 4; i++) {
        char full_name[128];
        snprintf(full_name, sizeof(full_name), "%s_%d", name, i);
        vec.lanes[i] = cvc5_mk_const(tm, bv32, full_name);
    }

    return vec;
}

/**
 * Get a specific lane from the vector
 */
static inline Cvc5Term int32x4_t_get_lane(const int32x4_t* vec, int idx) {
    return vec->lanes[idx];
}

/**
 * Get the term manager
 */
static inline Cvc5TermManager* int32x4_t_get_tm(const int32x4_t* vec) {
    return vec->tm;
}

#endif // NEON_SYMBOLIC_TYPES_H
