#ifndef NEON_SYMBOLIC_HPP
#define NEON_SYMBOLIC_HPP

/**
 * ARM NEON Symbolic Execution Library (Modular Header-Only Version)
 *
 * This library provides symbolic execution semantics for ARM NEON intrinsics
 * using the CVC5 SMT solver.
 *
 * Usage:
 *   #include "neon_symbolic/neon_symbolic.hpp"
 *
 *   Solver solver;
 *   g_symbolic_solver = &solver;
 *   SymbolicNEONHelpers::clearMemory();
 *
 *   // Use NEON intrinsics...
 */

#include "types.hpp"
#include "memory.hpp"
#include "intrinsics.hpp"
#include "utils.hpp"

#endif // NEON_SYMBOLIC_HPP
