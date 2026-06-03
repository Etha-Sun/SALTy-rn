#pragma once
// NEON shared infra base (bitwuzla): saturation helper + type setup.
// Every intrinsic family — including the hand-written core — lives in
// ops/*.hpp and includes this. Bodies follow op-semantics/neon-intrinsics.md.

#include "../core/context.hpp"
#include "../core/fp_bf16.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_vector.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <algorithm>
#include <array>
#include <cstddef>
#include <cstdint>

namespace salt {

using namespace bitwuzla;

// ===========================================================================
// Helper: signed saturation (SatQ for signed)
// Clamps a wider signed value to the range of a narrower signed type.
// Input: wide_val (2*esize bits), output esize bits, saturated.
// ===========================================================================
inline Term signed_saturate(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));

    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);

    // if val > max: max; elif val < min: min; else: val
    Term gt_max = tm.mk_term(Kind::BV_SGT, {wide_val, t_max});
    Term lt_min = tm.mk_term(Kind::BV_SLT, {wide_val, t_min});
    Term clamped = tm.mk_term(Kind::ITE, {gt_max, t_max,
                    tm.mk_term(Kind::ITE, {lt_min, t_min, wide_val})});

    // Extract low narrow_bits
    return tm.mk_term(Kind::BV_EXTRACT, {clamped},
                       {static_cast<uint64_t>(narrow_bits - 1), 0UL});
}
} // namespace salt
