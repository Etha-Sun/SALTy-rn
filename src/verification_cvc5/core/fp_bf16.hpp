#pragma once
// fp_bf16 — Strict-Arm BFloat16 op semantics.
//
// Arm BFDOT/BFMMLA/BFCVT use Round-to-Odd, flush subnormal inputs+outputs to
// ±0, and produce the default NaN (0x7FC00000 for fp32 / 0x7FC0 for bf16) for
// any NaN input — unconditionally, regardless of FPCR. This file provides the
// helpers needed to model that contract correctly in cvc5.
//
// Implementation strategy:
//   1. FZ pre-flush BF16 input lanes to ±0 if subnormal.
//   2. Detect NaN on any input lane; force output to default-NaN bit pattern.
//   3. Compute the sum-of-products + accumulator in fp64 (exact for BF16
//      operand widths and one fp32 accumulator: ≤ 24-bit mantissas, well
//      within fp64's 53).
//   4. Narrow fp64 → fp32 with Round-to-Odd via the bracket trick: cast
//      with both RDN and RUP, pick whichever bracket has odd LSB. This
//      handles overflow correctly (RO never overflows to inf) and
//      underflow correctly (subnormal output is then flushed by FZ).
//   5. FZ post-flush subnormal fp32 output to ±0.
//
// SOUNDNESS NOTE: same fflags abstraction as fp_convert.hpp — this models
// values, not exception flags.

#include "context.hpp"

namespace salt_cvc5 {

// fp64 sort builder (cvc5 supports arbitrary FP sorts via the experimental
// FP solver, which is enabled in the VerificationContext ctor).
inline Sort fp64_sort_helper(TermManager& tm) {
    return tm.mkFloatingPointSort(11, 53);
}

// BF16 raw-bv predicates and constants.
inline Term bf16_is_nan(TermManager& tm, Term bv16) {
    // exp == 0xFF AND mantissa != 0
    Op extract_exp = tm.mkOp(Kind::BITVECTOR_EXTRACT, {14u, 7u});
    Op extract_mnt = tm.mkOp(Kind::BITVECTOR_EXTRACT, {6u, 0u});
    Term exp = tm.mkTerm(extract_exp, {bv16});
    Term mnt = tm.mkTerm(extract_mnt, {bv16});
    Term exp_max = tm.mkBitVector(8, (uint64_t)0xFF);
    Term mnt_zero = tm.mkBitVector(7, (uint64_t)0);
    Term exp_eq = tm.mkTerm(Kind::EQUAL, {exp, exp_max});
    Term mnt_nz = tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::EQUAL, {mnt, mnt_zero})});
    return tm.mkTerm(Kind::AND, {exp_eq, mnt_nz});
}
inline Term bf16_is_subnormal(TermManager& tm, Term bv16) {
    // exp == 0 AND mantissa != 0
    Op extract_exp = tm.mkOp(Kind::BITVECTOR_EXTRACT, {14u, 7u});
    Op extract_mnt = tm.mkOp(Kind::BITVECTOR_EXTRACT, {6u, 0u});
    Term exp = tm.mkTerm(extract_exp, {bv16});
    Term mnt = tm.mkTerm(extract_mnt, {bv16});
    Term exp_zero = tm.mkBitVector(8, (uint64_t)0);
    Term mnt_zero = tm.mkBitVector(7, (uint64_t)0);
    Term exp_eq = tm.mkTerm(Kind::EQUAL, {exp, exp_zero});
    Term mnt_nz = tm.mkTerm(Kind::NOT, {tm.mkTerm(Kind::EQUAL, {mnt, mnt_zero})});
    return tm.mkTerm(Kind::AND, {exp_eq, mnt_nz});
}
// FZ pre-flush: if subnormal, replace with sign-only (preserves sign of zero).
inline Term bf16_fz_preflush(TermManager& tm, Term bv16) {
    Op extract_sign = tm.mkOp(Kind::BITVECTOR_EXTRACT, {15u, 15u});
    Term sign_bit = tm.mkTerm(extract_sign, {bv16});
    Term sign_only = tm.mkTerm(Kind::BITVECTOR_CONCAT,
                                {sign_bit, tm.mkBitVector(15, (uint64_t)0)});
    Term subn = bf16_is_subnormal(tm, bv16);
    return tm.mkTerm(Kind::ITE, {subn, sign_only, bv16});
}

// Widen BF16 (raw bv16) to fp64 exactly. Caller should pre-flush first.
// Implementation: bv16 → bv32 (concat with 0x0000) → fp32 → fp64 (exact cast).
inline Term bf16_widen_to_fp64(TermManager& tm, Term bv16) {
    Term bv32 = tm.mkTerm(Kind::BITVECTOR_CONCAT,
                          {bv16, tm.mkBitVector(16, (uint64_t)0)});
    Op fp32_from_bv = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term fp32 = tm.mkTerm(fp32_from_bv, {bv32});
    Op fp64_from_fp = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {11, 53});
    Term rne = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    return tm.mkTerm(fp64_from_fp, {rne, fp32});  // exact: fp32 fits in fp64
}

// Narrow fp64 → fp32 with Round-to-Odd, then FZ-flush subnormal output.
// Returns a 32-bit BV (the IEEE pattern).
inline Term narrow_fp64_to_fp32_RO_FZ(TermManager& tm, Term sum_fp64) {
    Op fp32_from_fp64 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {8, 24});
    Term rdn = tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_NEGATIVE);
    Term rup = tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_POSITIVE);
    Term floor_fp32 = tm.mkTerm(fp32_from_fp64, {rdn, sum_fp64});
    Term ceil_fp32  = tm.mkTerm(fp32_from_fp64, {rup, sum_fp64});

    // Round-trip to BV via the asserted-equality trick (cvc5 has no
    // fp.to_ieee_bv).  Allocate fresh BV consts and constrain.
    auto fp32_to_bv32 = [&](Term fp_val) {
        Sort bv32 = tm.mkBitVectorSort(32);
        static size_t counter = 0;
        Term bv = tm.mkConst(bv32, "_bf16ro_bv_" + std::to_string(counter++));
        Op fp_from_bv = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
        Term fp_round = tm.mkTerm(fp_from_bv, {bv});
        g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_round, fp_val}));
        return bv;
    };
    Term floor_bv = fp32_to_bv32(floor_fp32);
    Term ceil_bv  = fp32_to_bv32(ceil_fp32);

    Op extract_lsb = tm.mkOp(Kind::BITVECTOR_EXTRACT, {0u, 0u});
    Term floor_lsb = tm.mkTerm(extract_lsb, {floor_bv});
    Term lsb_one   = tm.mkBitVector(1, (uint64_t)1);

    // Exact case: floor == ceil → that is the result.
    // Inexact: pick whichever bracket bv has odd LSB. Adjacent fp32 values
    // always have differing LSBs, so exactly one of {floor, ceil} is odd.
    Term exact = tm.mkTerm(Kind::EQUAL, {floor_bv, ceil_bv});
    Term floor_odd = tm.mkTerm(Kind::EQUAL, {floor_lsb, lsb_one});
    Term ro_bv = tm.mkTerm(Kind::ITE, {exact, floor_bv,
                  tm.mkTerm(Kind::ITE, {floor_odd, floor_bv, ceil_bv})});

    // FZ post-flush: if exp == 0 AND mantissa != 0, replace with sign-only.
    Op extract_sign = tm.mkOp(Kind::BITVECTOR_EXTRACT, {31u, 31u});
    Op extract_exp  = tm.mkOp(Kind::BITVECTOR_EXTRACT, {30u, 23u});
    Op extract_mnt  = tm.mkOp(Kind::BITVECTOR_EXTRACT, {22u,  0u});
    Term sign  = tm.mkTerm(extract_sign, {ro_bv});
    Term exp_v = tm.mkTerm(extract_exp,  {ro_bv});
    Term mnt_v = tm.mkTerm(extract_mnt,  {ro_bv});
    Term exp_zero = tm.mkBitVector(8,  (uint64_t)0);
    Term mnt_zero = tm.mkBitVector(23, (uint64_t)0);
    Term exp_eq_zero = tm.mkTerm(Kind::EQUAL, {exp_v, exp_zero});
    Term mnt_nz      = tm.mkTerm(Kind::NOT,
                                 {tm.mkTerm(Kind::EQUAL, {mnt_v, mnt_zero})});
    Term subn = tm.mkTerm(Kind::AND, {exp_eq_zero, mnt_nz});
    Term sign_only = tm.mkTerm(Kind::BITVECTOR_CONCAT,
                                {sign, tm.mkBitVector(31, (uint64_t)0)});
    return tm.mkTerm(Kind::ITE, {subn, sign_only, ro_bv});
}

// Strict-Arm BFDOT lane: r_bv32 + (a0_bv16 * b0_bv16) + (a1_bv16 * b1_bv16).
// Returns the result as a 32-bit BV (the IEEE fp32 pattern).
// Default-NaN: 0x7FC00000 for any NaN input (BF16 lane or fp32 acc).
inline Term bfdot_lane_strict(TermManager& tm,
                               Term r_bv32,
                               Term a0_bv16, Term b0_bv16,
                               Term a1_bv16, Term b1_bv16) {
    Term default_nan = tm.mkBitVector(32, (uint64_t)0x7FC00000);

    // Default-NaN if any input is NaN.
    Op fp32_from_bv = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term r_fp32 = tm.mkTerm(fp32_from_bv, {r_bv32});
    Term r_nan  = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {r_fp32});
    Term any_nan = tm.mkTerm(Kind::OR,
        {r_nan, bf16_is_nan(tm, a0_bv16), bf16_is_nan(tm, b0_bv16),
                bf16_is_nan(tm, a1_bv16), bf16_is_nan(tm, b1_bv16)});

    // FZ pre-flush BF16 inputs.
    Term a0f = bf16_fz_preflush(tm, a0_bv16);
    Term b0f = bf16_fz_preflush(tm, b0_bv16);
    Term a1f = bf16_fz_preflush(tm, a1_bv16);
    Term b1f = bf16_fz_preflush(tm, b1_bv16);

    // Widen all to fp64 (exact for BF16 widened values and one fp32 acc).
    Term a0_64 = bf16_widen_to_fp64(tm, a0f);
    Term b0_64 = bf16_widen_to_fp64(tm, b0f);
    Term a1_64 = bf16_widen_to_fp64(tm, a1f);
    Term b1_64 = bf16_widen_to_fp64(tm, b1f);
    Op fp64_from_fp32 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {11, 53});
    Term rne = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term r_64 = tm.mkTerm(fp64_from_fp32, {rne, r_fp32});  // exact

    // Sum in fp64. With ≤24-bit mantissa operands and bounded fp32-range
    // exponents, every step here is exact in fp64 — no rounding loss.
    Term p0 = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rne, a0_64, b0_64});
    Term p1 = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rne, a1_64, b1_64});
    Term s0 = tm.mkTerm(Kind::FLOATINGPOINT_ADD,  {rne, r_64, p0});
    Term s1 = tm.mkTerm(Kind::FLOATINGPOINT_ADD,  {rne, s0,   p1});

    // Narrow fp64 → fp32 with Round-to-Odd, then FZ-flush output.
    Term result = narrow_fp64_to_fp32_RO_FZ(tm, s1);

    return tm.mkTerm(Kind::ITE, {any_nan, default_nan, result});
}

} // namespace salt_cvc5
