#ifndef NEON_SYMBOLIC_H
#define NEON_SYMBOLIC_H

/**
 * ARM NEON Symbolic Execution Library (C Version)
 *
 * This library provides symbolic execution semantics for ARM NEON intrinsics
 * using the CVC5 SMT solver C API.
 *
 * Usage:
 *   #include "neon_symbolic/neon_symbolic.h"
 *
 *   Cvc5TermManager* tm = cvc5_term_manager_new();
 *   Cvc5* solver = cvc5_new(tm);
 *   g_symbolic_tm = tm;
 *   g_symbolic_solver = solver;
 *   neon_memory_init(&g_neon_memory);
 *
 *   // Use NEON intrinsics...
 *
 *   neon_memory_free(&g_neon_memory);
 *   cvc5_delete(solver);
 *   cvc5_term_manager_delete(tm);
 */

#include "types.h"
#include "memory.h"
#include "intrinsics.h"
#include "utils.h"

#endif // NEON_SYMBOLIC_H
