#pragma once
// SALTy-RN cvc5 verification umbrella header — single include for harnesses.
//
// Mirrors src/verification/salt.hpp but built on top of cvc5 instead of
// bitwuzla.  All identifiers live in `salt_cvc5::`.

#include <type_traits>

// Guard against the real arm_neon.h / riscv_vector.h being pulled in.
#define _RISCV_VECTOR_H
#define __ARM_NEON_H

// xnn_minimal.h FIRST so xnn_float16 is fully visible to context.hpp's
// salt_float16 struct (which now has an implicit `salt_float16(xnn_float16)` ctor).
#include "../verification_bw/xnn_minimal.h"

#include "core/context.hpp"
#include "core/symbolic_vector.hpp"
#include "core/symbolic_buffer.hpp"
#include "core/comparison.hpp"

#include "neon/intrinsics.hpp"
#include "rvv/intrinsics.hpp"

static_assert(sizeof(xnn_float16) == sizeof(uint16_t) && !std::is_scalar_v<xnn_float16>,
              "xnn_float16 must be a struct (XNN_HAVE_FLOAT16=0)");

// Backend-portability alias: generated harnesses do `using namespace salt;`,
// expecting the bitwuzla layout.  Aliasing `salt = salt_cvc5` lets the same
// generated source file compile against either backend without any `#ifdef`.
namespace salt = salt_cvc5;
