#ifndef RISCV_SYMBOLIC_HPP
#define RISCV_SYMBOLIC_HPP

/**
 * RISC-V Vector Extension Symbolic Execution Library (Modular Header-Only Version)
 *
 * This library provides symbolic execution semantics for RISC-V Vector Extension
 * intrinsics using the CVC5 SMT solver.
 *
 * Usage:
 *   #include "riscv_symbolic/riscv_symbolic.hpp"
 *
 *   Solver solver;
 *   g_symbolic_solver = &solver;
 *   SymbolicRISCVHelpers::clearMemory();
 *
 *   // Use RVV intrinsics...
 */

#include "types.hpp"
#include "memory.hpp"
#include "intrinsics.hpp"
#include "helpers.hpp"

#endif // RISCV_SYMBOLIC_HPP
