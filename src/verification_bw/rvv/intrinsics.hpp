#pragma once
// RVV shared infra base (bitwuzla): vxrm constants, rounding/saturation helpers,
// type setup. Every intrinsic family — including the hand-written core — lives in
// ops/*.hpp and includes this. Intrinsic bodies follow op-semantics/rvv-intrinsics.md.

#include "../core/bv_fold.hpp"
#include "../core/context.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_vector.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <vector>

namespace salt {

using namespace bitwuzla;

// ===========================================================================
// vxrm constants (fixed-point rounding modes)
// ===========================================================================
constexpr unsigned __RISCV_VXRM_RNU = 0; // round-to-nearest-up
constexpr unsigned __RISCV_VXRM_RNE = 1; // round-to-nearest-even
constexpr unsigned __RISCV_VXRM_RDN = 2; // round-down (truncate)
constexpr unsigned __RISCV_VXRM_ROD = 3; // round-to-odd

// ===========================================================================
// Helper: rounding right shift for vxrm modes
// Returns (val >> shift) with rounding adjustment per vxrm
// ===========================================================================
inline Term rounded_shift_right(TermManager& tm, Term val, size_t shift,
                                 size_t bits, unsigned vxrm, bool is_signed) {
    if (shift == 0) return val;

    Sort sort = tm.mk_bv_sort(bits);
    Term shift_amt = tm.mk_bv_value_uint64(sort, shift);
    Term shifted = is_signed
        ? tm.mk_term(Kind::BV_ASHR, {val, shift_amt})
        : fold_bvlshr(tm, val, shift_amt);

    if (vxrm == __RISCV_VXRM_RDN) {
        return shifted; // truncate, no rounding
    }

    // Extract the rounding bit (bit at position shift-1)
    Term round_bit = tm.mk_term(Kind::BV_EXTRACT, {val},
                                  {static_cast<uint64_t>(shift - 1),
                                   static_cast<uint64_t>(shift - 1)});
    Term round_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {round_bit},
                                  {static_cast<uint64_t>(bits - 1)});

    if (vxrm == __RISCV_VXRM_RNU) {
        // RNU: add rounding bit
        return fold_bvadd(tm, shifted, round_ext);
    }

    if (vxrm == __RISCV_VXRM_RNE) {
        // RNE: round up iff round_bit=1 AND (lower bits nonzero OR result odd).
        // For shift==1 there are no lower bits, so the OR collapses to result_odd.
        Term result_bit0 = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {0UL, 0UL});
        Term result_odd = fold_eq(tm, result_bit0, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1));
        Term tie_breaker;
        if (shift >= 2) {
            Term lower = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 2), 0UL});
            Term lower_zero = fold_eq(tm, lower, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift - 1), 0));
            tie_breaker = tm.mk_term(Kind::OR,
                {tm.mk_term(Kind::NOT, {lower_zero}), result_odd});
        } else {
            tie_breaker = result_odd;
        }
        Term should_round = tm.mk_term(Kind::AND, {
            fold_eq(tm, round_bit, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1)),
            tie_breaker
        });
        Term one = tm.mk_bv_value_uint64(sort, 1);
        Term zero = tm.mk_bv_value_uint64(sort, 0);
        Term adj = fold_ite(tm, should_round, one, zero);
        return fold_bvadd(tm, shifted, adj);
    }

    // ROD: if any truncated bits are nonzero, set bit 0 of result to 1
    if (vxrm == __RISCV_VXRM_ROD) {
        Term truncated = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 1), 0UL});
        Term trunc_zero = fold_eq(tm, truncated, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift), 0));
        Term one = tm.mk_bv_value_uint64(sort, 1);
        Term bit0_set = fold_bvor(tm, shifted, one);
        return fold_ite(tm, trunc_zero, shifted, bit0_set);
    }

    return shifted; // fallback
}

// ===========================================================================
// Helper: signed saturation (clip) for vnclip
// ===========================================================================
inline Term signed_clip(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));

    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);

    Term gt_max = tm.mk_term(Kind::BV_SGT, {wide_val, t_max});
    Term lt_min = tm.mk_term(Kind::BV_SLT, {wide_val, t_min});
    Term clamped = tm.mk_term(Kind::ITE, {gt_max, t_max,
                    fold_ite(tm, lt_min, t_min, wide_val)});

    return tm.mk_term(Kind::BV_EXTRACT, {clamped},
                       {static_cast<uint64_t>(narrow_bits - 1), 0UL});
}

} // namespace salt
