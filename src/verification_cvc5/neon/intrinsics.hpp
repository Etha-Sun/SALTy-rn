#pragma once
// NEON shared infra base (cvc5): type aliases, fp16 helpers, and the trailing
// XNNPACK compat macros. Every intrinsic family — including the hand-written
// core — lives in ops/*.hpp and includes this. Bodies follow neon-intrinsics.md.

#include "../core/context.hpp"
#include "../core/fp_bf16.hpp"
#include "../core/fp_convert.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_scalar.hpp"
#include "../core/symbolic_vector.hpp"

#include <cmath>
#include <cstring>
#include <cvc5/cvc5.h>

#include <array>
#include <cstddef>
#include <cstdint>
#include <string>

namespace salt_cvc5 {

// ===========================================================================
// Type aliases not present in symbolic_vector.hpp's restricted set.
// These are no-ops if a name is already aliased — both refer to the same target.
// ===========================================================================
using int8x8_t    = NeonVector<8, 8>;
using int16x4_t   = NeonVector<16, 4>;
using int32x2_t   = NeonVector<32, 2>;
using uint8x8_t   = NeonVector<8, 8>;
// uint16x4_t / uint32x2_t / float16x4_t already aliased.

using int8x16_t   = NeonVector<8, 16>;
using int16x8_t   = NeonVector<16, 8>;
using int32x4_t   = NeonVector<32, 4>;
using uint8x16_t  = NeonVector<8, 16>;
// uint16x8_t already aliased.
using uint32x4_t  = NeonVector<32, 4>;
using float32x2_t = NeonVector<32, 2>;
using float32x4_t = NeonVector<32, 4>;

// FP16 helpers: BV16 ↔ FP16 (5-bit exponent, 11-bit significand).
// cvc5 has no fp.to_ieee_bv either, so we use the same fresh-const +
// asserted-equality trick the bitwuzla tree uses.
inline Term load_as_fp16(TermManager& tm, Term bv16) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    return tm.mkTerm(op, {bv16});
}

inline size_t& fp16_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term store_fp16_as_bv(TermManager& tm, Term fp_val) {
    Sort bv16 = tm.mkBitVectorSort(16);
    Term bv = tm.mkConst(bv16, "_neon_fp16_2bv_" + std::to_string(fp16_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term fp_from_bv = tm.mkTerm(op, {bv});
    g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}
} // namespace salt_cvc5

// XNNPACK macros (preprocessor — must live outside the namespace).
#ifndef XNN_INLINE
#define XNN_INLINE inline
#endif
#ifndef XNN_UNLIKELY
#define XNN_UNLIKELY(x) __builtin_expect(!!(x), 0)
#endif
#ifndef XNN_LOG2_SIZEOF_FLOAT16
#define XNN_LOG2_SIZEOF_FLOAT16 1
#endif
#ifndef XNN_FORCE_REALIZATION
// Codegen hint in upstream XNNPACK; semantic no-op for symbolic verification.
#define XNN_FORCE_REALIZATION(x) ((void)(x))
#endif
#ifndef XNN_SIMD_CONST_F16_FROM_FLOAT
// Declares `const xnn_simd_f16_t name = vdupq_n_f16((float)val);`
// Resolved via `using namespace salt;` in the harness scope.
#define XNN_SIMD_CONST_F16_FROM_FLOAT(name, val) \
    const xnn_simd_f16_t name = vdupq_n_f16((float)(val))
#endif
