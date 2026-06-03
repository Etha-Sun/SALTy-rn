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

#include <type_traits>

// Core verification infrastructure
#include "core/context.hpp"
#include "core/symbolic_vector.hpp"
#include "core/symbolic_buffer.hpp"
#include "core/comparison.hpp"
#include "core/symbolic_scalar.hpp"

// Symbolic intrinsic implementations
#include "neon/intrinsics.hpp"
#include "rvv/intrinsics.hpp"

// XNN param structs, macros, and type definitions
// (guards the real arm_neon.h / riscv_vector.h from being included)
#define _RISCV_VECTOR_H
#define __ARM_NEON_H

#include "xnn_minimal.h"

// SymbolicScalar<xnn_float16> assumes xnn_float16 is a struct (XNN_HAVE_FLOAT16=0).
// If this fires, the SymTraits<xnn_float16> specialization and the forward declaration
// in symbolic_scalar.hpp need to be reworked for the salt_float16 typedef path.
static_assert(sizeof(xnn_float16) == sizeof(uint16_t) && !std::is_scalar_v<xnn_float16>,
              "xnn_float16 must be a struct (XNN_HAVE_FLOAT16=0) for SymbolicScalar support");
