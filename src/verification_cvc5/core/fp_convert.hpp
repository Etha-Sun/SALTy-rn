#pragma once
// fp_to_int_lane — single-lane fp→int conversion that models the ISA
// contract on NaN, ±inf, finite OOR, and in-range inputs.
// Used by both NEON `vcvt*` and RVV `vfcvt.x/xu.f.v` symbolic intrinsics.
//
// SOUNDNESS NOTE: models result value only, not fflags (NV / NX). SALTy
// harnesses compare output buffers; no flow reads fflags. If a future flow
// observes fflags, this wrapper must also produce a flag term and current
// call sites become unsound.
//
// SCOPE: fp16 sources only (eb=5, sb=11). fp32 finite range exceeds any
// reasonable wide-int width, so the wide-intermediate strategy below does
// not generalize. fp32→int conversion needs a separate, rm-aware OOR check.
// Calling with non-fp16 sort throws std::invalid_argument.

#include "context.hpp"

#include <stdexcept>

namespace salt_cvc5 {

// Map an RVV FRM constant to a cvc5 RoundingMode term.
// frm encoding: 0=RNE, 1=RTZ, 2=RDN, 3=RUP, 4=RMM. Other values (incl. 7=DYN)
// are intentionally not supported — kernels using DYN must read fcsr first.
inline Term rm_term_from_frm(TermManager& tm, unsigned frm) {
    switch (frm) {
        case 0: return tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
        case 1: return tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_ZERO);
        case 2: return tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_NEGATIVE);
        case 3: return tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_POSITIVE);
        case 4: return tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_AWAY);
        default:
            throw std::invalid_argument(
                "rm_term_from_frm: unsupported FRM value (DYN/reserved encodings "
                "not modeled)");
    }
}

// Convert one fp lane to a dst_bits-wide integer per ISA contract.
// fp:           FP-typed term, sort = (fp_eb, fp_sb)  — only fp16 currently
// dst_bits:     destination integer width (8, 16, or 32)
// is_signed:    true → fp.to_sbv (RVV vfcvt.x.f, NEON vcvt*_s); false → fp.to_ubv
// rm:           rounding mode term (intrinsic-specific: RNE for vcvtn, etc.)
// nan_result:   dst_bits-wide BV — NEON: 0; RVV signed: INT_MAX; RVV unsigned: UINT_MAX
//
// Strategy: convert finite fp to a 32-bit signed intermediate (always defined
// for fp16 finite, since max 65504 < 2^17), then saturate-and-truncate in BV
// arithmetic. fp.to_sbv only sees inputs whose rounded result demonstrably
// fits in 32 bits, so its semantics are fully defined regardless of rm.
inline Term fp_to_int_lane(
    TermManager& tm,
    Term fp,
    uint32_t fp_eb,
    uint32_t fp_sb,
    uint32_t dst_bits,
    bool is_signed,
    Term rm,
    Term nan_result)
{
    if (fp_eb != 5 || fp_sb != 11) {
        throw std::invalid_argument(
            "fp_to_int_lane: only fp16 sources currently supported (eb=5, sb=11)");
    }
    if (dst_bits == 0 || dst_bits > 32) {
        throw std::invalid_argument(
            "fp_to_int_lane: dst_bits must be in (0, 32]");
    }

    constexpr uint32_t WIDE = 32;

    // Destination range expressed in wide-signed BV for OOR comparison.
    int64_t dst_max_v = is_signed
        ? ((int64_t)1 << (dst_bits - 1)) - 1
        : ((dst_bits >= 64) ? (int64_t)~0ULL : ((int64_t)1 << dst_bits) - 1);
    int64_t dst_min_v = is_signed ? -((int64_t)1 << (dst_bits - 1)) : 0;
    Term dst_max_wide = mk_bv_val(tm, WIDE, dst_max_v);
    Term dst_min_wide = mk_bv_val(tm, WIDE, dst_min_v);
    Term dst_max_bv   = mk_bv_val(tm, dst_bits, dst_max_v);
    Term dst_min_bv   = mk_bv_val(tm, dst_bits, dst_min_v);

    // Predicates over the FP value.
    Term is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp});
    Term is_inf = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {fp});
    Term is_neg = tm.mkTerm(Kind::FLOATINGPOINT_IS_NEG, {fp});
    Term is_pos_inf = tm.mkTerm(Kind::AND, {is_inf, tm.mkTerm(Kind::NOT, {is_neg})});
    Term is_neg_inf = tm.mkTerm(Kind::AND, {is_inf, is_neg});

    // Wide signed convert — well-defined for all finite fp16 (range fits in i32).
    Op cvt_wide = tm.mkOp(Kind::FLOATINGPOINT_TO_SBV, {WIDE});
    Term wide_int = tm.mkTerm(cvt_wide, {rm, fp});

    Term too_high = tm.mkTerm(Kind::BITVECTOR_SGT, {wide_int, dst_max_wide});
    Term too_low  = tm.mkTerm(Kind::BITVECTOR_SLT, {wide_int, dst_min_wide});

    // Truncate to dst_bits — only sound when wide_int is in [dst_min, dst_max],
    // which the surrounding ITE chain guarantees.
    Op extract_low = tm.mkOp(Kind::BITVECTOR_EXTRACT, {dst_bits - 1, 0u});
    Term truncated = tm.mkTerm(extract_low, {wide_int});

    Term saturated = tm.mkTerm(Kind::ITE, {too_high, dst_max_bv,
                     tm.mkTerm(Kind::ITE, {too_low,  dst_min_bv,
                                                     truncated})});

    return tm.mkTerm(Kind::ITE, {is_nan, nan_result,
           tm.mkTerm(Kind::ITE, {is_pos_inf, dst_max_bv,
           tm.mkTerm(Kind::ITE, {is_neg_inf, dst_min_bv,
                                             saturated})})});
}

} // namespace salt_cvc5
