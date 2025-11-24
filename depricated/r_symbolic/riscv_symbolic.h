#ifndef RISCV_SYMBOLIC_H
#define RISCV_SYMBOLIC_H

/**
 * RISC-V Vector Extension Symbolic Execution Library (C Version)
 *
 * This library provides symbolic execution semantics for RISC-V Vector Extension
 * intrinsics using the CVC5 SMT solver C API.
 *
 * Usage:
 *   #include "riscv_symbolic/riscv_symbolic.h"
 *
 *   Cvc5TermManager* tm = cvc5_term_manager_new();
 *   Cvc5* solver = cvc5_new(tm);
 *   g_symbolic_tm = tm;
 *   g_symbolic_solver = solver;
 *   riscv_memory_init(&g_riscv_memory);
 *
 *   // Use RVV intrinsics...
 *
 *   riscv_memory_free(&g_riscv_memory);
 *   cvc5_delete(solver);
 *   cvc5_term_manager_delete(tm);
 */

#include "types.h"
#include "memory.h"
#include "intrinsics.h"
#include "helpers.h"

#endif // RISCV_SYMBOLIC_H
