#pragma once
// Strict-Arm BFloat16 op semantics — bitwuzla mirror.
// See src/verification_cvc5/core/fp_bf16.hpp for design notes.

#include "context.hpp"

namespace salt {

inline Term bf16_is_nan(TermManager& tm, Term bv16) {
    Term exp = tm.mk_term(Kind::BV_EXTRACT, {bv16}, {14, 7});
    Term mnt = tm.mk_term(Kind::BV_EXTRACT, {bv16}, {6, 0});
    Term exp_max  = mk_bv_val(tm, 8, (int64_t)0xFF);
    Term mnt_zero = mk_bv_val(tm, 7, (int64_t)0);
    Term exp_eq = tm.mk_term(Kind::EQUAL, {exp, exp_max});
    Term mnt_nz = tm.mk_term(Kind::NOT, {tm.mk_term(Kind::EQUAL, {mnt, mnt_zero})});
    return tm.mk_term(Kind::AND, {exp_eq, mnt_nz});
}
inline Term bf16_is_subnormal(TermManager& tm, Term bv16) {
    Term exp = tm.mk_term(Kind::BV_EXTRACT, {bv16}, {14, 7});
    Term mnt = tm.mk_term(Kind::BV_EXTRACT, {bv16}, {6, 0});
    Term exp_zero = mk_bv_val(tm, 8, (int64_t)0);
    Term mnt_zero = mk_bv_val(tm, 7, (int64_t)0);
    Term exp_eq = tm.mk_term(Kind::EQUAL, {exp, exp_zero});
    Term mnt_nz = tm.mk_term(Kind::NOT, {tm.mk_term(Kind::EQUAL, {mnt, mnt_zero})});
    return tm.mk_term(Kind::AND, {exp_eq, mnt_nz});
}
inline Term bf16_fz_preflush(TermManager& tm, Term bv16) {
    Term sign_bit  = tm.mk_term(Kind::BV_EXTRACT, {bv16}, {15, 15});
    Term sign_only = tm.mk_term(Kind::BV_CONCAT,
                                 {sign_bit, mk_bv_val(tm, 15, (int64_t)0)});
    Term subn = bf16_is_subnormal(tm, bv16);
    return tm.mk_term(Kind::ITE, {subn, sign_only, bv16});
}

inline Term bf16_widen_to_fp64(TermManager& tm, Term bv16) {
    Term bv32 = tm.mk_term(Kind::BV_CONCAT,
                            {bv16, mk_bv_val(tm, 16, (int64_t)0)});
    Term fp32 = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv32}, {8, 24});
    Term rne = tm.mk_rm_value(RoundingMode::RNE);
    return tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rne, fp32}, {11, 53});
}

inline Term narrow_fp64_to_fp32_RO_FZ(TermManager& tm, Term sum_fp64) {
    Term rdn = tm.mk_rm_value(RoundingMode::RTN);
    Term rup = tm.mk_rm_value(RoundingMode::RTP);
    Term floor_fp32 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rdn, sum_fp64}, {8, 24});
    Term ceil_fp32  = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rup, sum_fp64}, {8, 24});

    auto fp32_to_bv32 = [&](Term fp_val) {
        Sort bv32_sort = tm.mk_bv_sort(32);
        static size_t counter = 0;
        Term bv = tm.mk_const(bv32_sort, "_bf16ro_bv_" + std::to_string(counter++));
        Term fp_round = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {8, 24});
        g_ctx->solver->assert_formula(tm.mk_term(Kind::EQUAL, {fp_round, fp_val}));
        return bv;
    };
    Term floor_bv = fp32_to_bv32(floor_fp32);
    Term ceil_bv  = fp32_to_bv32(ceil_fp32);

    Term floor_lsb = tm.mk_term(Kind::BV_EXTRACT, {floor_bv}, {0, 0});
    Term lsb_one   = mk_bv_val(tm, 1, (int64_t)1);

    Term exact     = tm.mk_term(Kind::EQUAL, {floor_bv, ceil_bv});
    Term floor_odd = tm.mk_term(Kind::EQUAL, {floor_lsb, lsb_one});
    Term ro_bv = tm.mk_term(Kind::ITE, {exact, floor_bv,
                  tm.mk_term(Kind::ITE, {floor_odd, floor_bv, ceil_bv})});

    Term sign  = tm.mk_term(Kind::BV_EXTRACT, {ro_bv}, {31, 31});
    Term exp_v = tm.mk_term(Kind::BV_EXTRACT, {ro_bv}, {30, 23});
    Term mnt_v = tm.mk_term(Kind::BV_EXTRACT, {ro_bv}, {22,  0});
    Term exp_zero = mk_bv_val(tm, 8,  (int64_t)0);
    Term mnt_zero = mk_bv_val(tm, 23, (int64_t)0);
    Term exp_eq_zero = tm.mk_term(Kind::EQUAL, {exp_v, exp_zero});
    Term mnt_nz      = tm.mk_term(Kind::NOT,
                                   {tm.mk_term(Kind::EQUAL, {mnt_v, mnt_zero})});
    Term subn = tm.mk_term(Kind::AND, {exp_eq_zero, mnt_nz});
    Term sign_only = tm.mk_term(Kind::BV_CONCAT,
                                 {sign, mk_bv_val(tm, 31, (int64_t)0)});
    return tm.mk_term(Kind::ITE, {subn, sign_only, ro_bv});
}

inline Term bfdot_lane_strict(TermManager& tm,
                               Term r_bv32,
                               Term a0_bv16, Term b0_bv16,
                               Term a1_bv16, Term b1_bv16) {
    Term default_nan = mk_bv_val(tm, 32, (int64_t)0x7FC00000);

    Term r_fp32 = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {r_bv32}, {8, 24});
    Term r_nan  = tm.mk_term(Kind::FP_IS_NAN, {r_fp32});
    Term any_nan = tm.mk_term(Kind::OR,
        {r_nan, bf16_is_nan(tm, a0_bv16), bf16_is_nan(tm, b0_bv16),
                bf16_is_nan(tm, a1_bv16), bf16_is_nan(tm, b1_bv16)});

    Term a0f = bf16_fz_preflush(tm, a0_bv16);
    Term b0f = bf16_fz_preflush(tm, b0_bv16);
    Term a1f = bf16_fz_preflush(tm, a1_bv16);
    Term b1f = bf16_fz_preflush(tm, b1_bv16);

    Term a0_64 = bf16_widen_to_fp64(tm, a0f);
    Term b0_64 = bf16_widen_to_fp64(tm, b0f);
    Term a1_64 = bf16_widen_to_fp64(tm, a1f);
    Term b1_64 = bf16_widen_to_fp64(tm, b1f);
    Term rne = tm.mk_rm_value(RoundingMode::RNE);
    Term r_64 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rne, r_fp32}, {11, 53});

    Term p0 = tm.mk_term(Kind::FP_MUL, {rne, a0_64, b0_64});
    Term p1 = tm.mk_term(Kind::FP_MUL, {rne, a1_64, b1_64});
    Term s0 = tm.mk_term(Kind::FP_ADD, {rne, r_64, p0});
    Term s1 = tm.mk_term(Kind::FP_ADD, {rne, s0,   p1});

    Term result = narrow_fp64_to_fp32_RO_FZ(tm, s1);
    return tm.mk_term(Kind::ITE, {any_nan, default_nan, result});
}

} // namespace salt
