#pragma once
// SALTy-RN Symbolic Verification Library — single include header.
//
// Usage in a verification harness:
//   #include "salt.hpp"
//   using namespace salt;
//
// This provides:
//   - All bitwuzla-based symbolic types (NeonVector, RVVVector, etc.)
//   - All symbolic NEON and RVV intrinsics
//   - VerificationContext, SymbolicBuffer, comparison functions
//   - XNN param structs and macros (from xnn_minimal.h)

// Core verification infrastructure
#include "core/context.hpp"
#include "core/symbolic_vector.hpp"
#include "core/symbolic_buffer.hpp"
#include "core/comparison.hpp"

// Symbolic intrinsic implementations
#include "neon/intrinsics.hpp"
#include "rvv/intrinsics.hpp"

// XNN param structs, macros, and type definitions
// (guards the real arm_neon.h / riscv_vector.h from being included)
#define _RISCV_VECTOR_H
#define __ARM_NEON_H

#include "xnn_minimal.h"
