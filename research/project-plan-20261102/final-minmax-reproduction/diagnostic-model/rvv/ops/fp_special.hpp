#pragma once
// RVV FP special: vfsqrt, vfrec7, vfrsqrt7, vfclass (cvc5).
// vfsqrt exact (FLOATINGPOINT_SQRT). vfrec7/vfrsqrt7 are 7-bit LUT approximations
// in hardware; modeled here as full-precision 1/x and 1/sqrt(x) (see report).
// vfclass: 10-bit IEEE class mask (bit0 -inf .. bit9 qNaN), result is uint SEW.
#include "../intrinsics.hpp"

namespace salt_cvc5 {

// ---- fp64 raw-bits <-> FP term (sort 11,53) ----
inline Term _gfsp_load_fp64(TermManager& tm, Term bv) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    return tm.mkTerm(op, {bv});
}
inline size_t& _gfsp_fp64_bv_counter() { static size_t c = 0; return c; }
inline Term _gfsp_store_fp64(TermManager& tm, Term fp_val) {
    Sort bv64 = tm.mkBitVectorSort(64);
    Term bv = tm.mkConst(bv64, "_gfsp_fp64_2bv_" + std::to_string(_gfsp_fp64_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    g_ctx->solver->assertFormula(fold_eq(tm, tm.mkTerm(op, {bv}), fp_val));
    return bv;
}
inline Term _gfsp_load_fp(TermManager& tm, Term bv, size_t fp_bits) {
    if (fp_bits == 16) return rvv_load_as_fp16(tm, bv);
    if (fp_bits == 32) return rvv_load_as_fp32(tm, bv);
    return _gfsp_load_fp64(tm, bv);
}
inline Term _gfsp_store_fp(TermManager& tm, Term fp, size_t fp_bits) {
    if (fp_bits == 16) return rvv_store_fp16_as_bv(tm, fp);
    if (fp_bits == 32) return rvv_store_fp32_as_bv(tm, fp);
    return _gfsp_store_fp64(tm, fp);
}
inline void _gfsp_fmt(size_t fp_bits, uint32_t& eb, uint32_t& sb) {
    if (fp_bits == 16) { eb = 5; sb = 11; }
    else if (fp_bits == 32) { eb = 8; sb = 24; }
    else { eb = 11; sb = 53; }
}

// ---- vfsqrt ----
inline RVVVector _gfsp_sqrt(const RVVVector& a, size_t fp_bits, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = _gfsp_load_fp(tm, a.getElement(i), fp_bits);
        Term out = tm.mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, fp});
        r.push_back(_gfsp_store_fp(tm, out, fp_bits));
    }
    return RVVVector(tm, fp_bits, r);
}

// ---- vfrec7 (approx 1/x) — modeled as exact 1/x ----
inline RVVVector _gfsp_rec(const RVVVector& a, size_t fp_bits, size_t vl, Term rm) {
    auto& tm = g_ctx->tm;
    uint32_t eb, sb; _gfsp_fmt(fp_bits, eb, sb);
    Op cvt1 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {eb, sb});
    Term one = tm.mkTerm(cvt1, {rm, mk_bv_val(tm, 32, 1)});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = _gfsp_load_fp(tm, a.getElement(i), fp_bits);
        Term out = tm.mkTerm(Kind::FLOATINGPOINT_DIV, {rm, one, fp});
        r.push_back(_gfsp_store_fp(tm, out, fp_bits));
    }
    return RVVVector(tm, fp_bits, r);
}

// ---- vfrsqrt7 (approx 1/sqrt(x)) — modeled as exact 1/sqrt(x) ----
inline RVVVector _gfsp_rsqrt(const RVVVector& a, size_t fp_bits, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    uint32_t eb, sb; _gfsp_fmt(fp_bits, eb, sb);
    Op cvt1 = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {eb, sb});
    Term one = tm.mkTerm(cvt1, {rm, mk_bv_val(tm, 32, 1)});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = _gfsp_load_fp(tm, a.getElement(i), fp_bits);
        Term sq = tm.mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, fp});
        Term out = tm.mkTerm(Kind::FLOATINGPOINT_DIV, {rm, one, sq});
        r.push_back(_gfsp_store_fp(tm, out, fp_bits));
    }
    return RVVVector(tm, fp_bits, r);
}

// ---- vfclass: 10-bit IEEE class mask, zero-extended to SEW ----
// bit0 -inf, 1 -normal, 2 -subnormal, 3 -0, 4 +0, 5 +subnormal,
// 6 +normal, 7 +inf, 8 sNaN, 9 qNaN.
inline RVVVector _gfsp_class(const RVVVector& a, size_t fp_bits, size_t vl) {
    auto& tm = g_ctx->tm;
    uint32_t eb, sb; _gfsp_fmt(fp_bits, eb, sb);
    Term b1 = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term raw = a.getElement(i);
        Term fp = _gfsp_load_fp(tm, raw, fp_bits);

        Term is_nan  = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp});
        Term is_inf  = tm.mkTerm(Kind::FLOATINGPOINT_IS_INF, {fp});
        Term is_zero = tm.mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {fp});
        Term is_sub  = tm.mkTerm(Kind::FLOATINGPOINT_IS_SUBNORMAL, {fp});
        Term is_nrm  = tm.mkTerm(Kind::FLOATINGPOINT_IS_NORMAL, {fp});
        Term is_neg  = tm.mkTerm(Kind::FLOATINGPOINT_IS_NEG, {fp});
        Term is_pos  = tm.mkTerm(Kind::FLOATINGPOINT_IS_POS, {fp});

        // sNaN: NaN with quiet-bit (msb of trailing significand) == 0.
        // quiet bit is bit (sb-2) of the raw element.
        Op ext_q = tm.mkOp(Kind::BITVECTOR_EXTRACT, {(uint32_t)(sb - 2), (uint32_t)(sb - 2)});
        Term qbit = tm.mkTerm(ext_q, {raw});
        Term quiet_clear = fold_eq(tm, qbit, mk_bv_val(tm, 1, 0));
        Term is_snan = tm.mkTerm(Kind::AND, {is_nan, quiet_clear});
        Term is_qnan = tm.mkTerm(Kind::AND, {is_nan, tm.mkTerm(Kind::NOT, {quiet_clear})});

        auto AND = [&](Term x, Term y){ return tm.mkTerm(Kind::AND, {x, y}); };
        Term c0 = AND(is_inf, is_neg);                 // -inf
        Term c1 = AND(is_nrm, is_neg);                 // -normal
        Term c2 = AND(is_sub, is_neg);                 // -subnormal
        Term c3 = AND(is_zero, is_neg);                // -0
        Term c4 = AND(is_zero, is_pos);                // +0
        Term c5 = AND(is_sub, is_pos);                 // +subnormal
        Term c6 = AND(is_nrm, is_pos);                 // +normal
        Term c7 = AND(is_inf, is_pos);                 // +inf
        Term c8 = is_snan;
        Term c9 = is_qnan;

        Term bits[10] = {c0,c1,c2,c3,c4,c5,c6,c7,c8,c9};
        // assemble 10-bit value, bit0 = c0
        Term acc = fold_ite(tm, bits[9], b1, mk_bv_val(tm, 1, 0));
        for (int k = 8; k >= 0; k--) {
            Term bk = fold_ite(tm, bits[k], b1, mk_bv_val(tm, 1, 0));
            acc = fold_bvconcat(tm, acc, bk);
        }
        // acc is 10 bits: index 9..0 = c9..c0 (bit0 lsb). zero-extend to SEW.
        Term out = fold_bvzext(tm, fp_bits - 10, acc);
        r.push_back(out);
    }
    return RVVVector(tm, fp_bits, r);
}

// ===========================================================================
// vfsqrt
// ===========================================================================
#define GFSP_SQRT(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& a, size_t vl) { return _gfsp_sqrt(a, FPB, vl); }
GFSP_SQRT(vfsqrt_v_f16m2, 16)
GFSP_SQRT(vfsqrt_v_f16m4, 16)
GFSP_SQRT(vfsqrt_v_f16m8, 16)
GFSP_SQRT(vfsqrt_v_f16mf2, 16)
GFSP_SQRT(vfsqrt_v_f16mf4, 16)
GFSP_SQRT(vfsqrt_v_f32m8, 32)
GFSP_SQRT(vfsqrt_v_f32mf2, 32)
GFSP_SQRT(vfsqrt_v_f64m1, 64)
GFSP_SQRT(vfsqrt_v_f64m2, 64)
GFSP_SQRT(vfsqrt_v_f64m4, 64)
GFSP_SQRT(vfsqrt_v_f64m8, 64)
#undef GFSP_SQRT

// ===========================================================================
// vfrec7 (approx)
// ===========================================================================
#define GFSP_REC(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& a, size_t vl) { \
    return _gfsp_rec(a, FPB, vl, g_ctx->fp.rounding_mode); }
GFSP_REC(vfrec7_v_f16m1, 16)
GFSP_REC(vfrec7_v_f16m2, 16)
GFSP_REC(vfrec7_v_f16m4, 16)
GFSP_REC(vfrec7_v_f16m8, 16)
GFSP_REC(vfrec7_v_f16mf2, 16)
GFSP_REC(vfrec7_v_f16mf4, 16)
GFSP_REC(vfrec7_v_f32m1, 32)
GFSP_REC(vfrec7_v_f32m2, 32)
GFSP_REC(vfrec7_v_f32m4, 32)
GFSP_REC(vfrec7_v_f32m8, 32)
GFSP_REC(vfrec7_v_f32mf2, 32)
GFSP_REC(vfrec7_v_f64m1, 64)
GFSP_REC(vfrec7_v_f64m2, 64)
GFSP_REC(vfrec7_v_f64m4, 64)
GFSP_REC(vfrec7_v_f64m8, 64)
#undef GFSP_REC

// ===========================================================================
// vfrsqrt7 (approx)
// ===========================================================================
#define GFSP_RSQRT(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& a, size_t vl) { return _gfsp_rsqrt(a, FPB, vl); }
GFSP_RSQRT(vfrsqrt7_v_f16m1, 16)
GFSP_RSQRT(vfrsqrt7_v_f16m2, 16)
GFSP_RSQRT(vfrsqrt7_v_f16m4, 16)
GFSP_RSQRT(vfrsqrt7_v_f16m8, 16)
GFSP_RSQRT(vfrsqrt7_v_f16mf2, 16)
GFSP_RSQRT(vfrsqrt7_v_f16mf4, 16)
GFSP_RSQRT(vfrsqrt7_v_f32m1, 32)
GFSP_RSQRT(vfrsqrt7_v_f32m2, 32)
GFSP_RSQRT(vfrsqrt7_v_f32m4, 32)
GFSP_RSQRT(vfrsqrt7_v_f32m8, 32)
GFSP_RSQRT(vfrsqrt7_v_f32mf2, 32)
GFSP_RSQRT(vfrsqrt7_v_f64m1, 64)
GFSP_RSQRT(vfrsqrt7_v_f64m2, 64)
GFSP_RSQRT(vfrsqrt7_v_f64m4, 64)
GFSP_RSQRT(vfrsqrt7_v_f64m8, 64)
#undef GFSP_RSQRT

// ===========================================================================
// vfclass
// ===========================================================================
#define GFSP_CLASS(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& a, size_t vl) { return _gfsp_class(a, FPB, vl); }
GFSP_CLASS(vfclass_v_u16m1, 16)
GFSP_CLASS(vfclass_v_u16m2, 16)
GFSP_CLASS(vfclass_v_u16m4, 16)
GFSP_CLASS(vfclass_v_u16m8, 16)
GFSP_CLASS(vfclass_v_u16mf2, 16)
GFSP_CLASS(vfclass_v_u16mf4, 16)
GFSP_CLASS(vfclass_v_u32m1, 32)
GFSP_CLASS(vfclass_v_u32m2, 32)
GFSP_CLASS(vfclass_v_u32m4, 32)
GFSP_CLASS(vfclass_v_u32m8, 32)
GFSP_CLASS(vfclass_v_u32mf2, 32)
GFSP_CLASS(vfclass_v_u64m1, 64)
GFSP_CLASS(vfclass_v_u64m2, 64)
GFSP_CLASS(vfclass_v_u64m4, 64)
GFSP_CLASS(vfclass_v_u64m8, 64)
#undef GFSP_CLASS

} // namespace salt_cvc5
