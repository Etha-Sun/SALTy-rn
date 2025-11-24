#ifndef SYMBOLIC_COMMON_H
#define SYMBOLIC_COMMON_H

#include <cvc5/c/cvc5.h>

/**
 * Shared global term manager and solver instances
 * Used by both NEON and RISC-V symbolic execution
 * Must be initialized before using any symbolic intrinsics
 */
extern Cvc5TermManager* g_symbolic_tm;
extern Cvc5* g_symbolic_solver;

#endif // SYMBOLIC_COMMON_H
