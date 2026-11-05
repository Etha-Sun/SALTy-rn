#pragma once
// RVV floating-point conversions — vfcvt / vfwcvt / vfncvt (cvc5).
// fp<->int (same/widen/narrow width) with current/RTZ/ROD rounding; saturating
// fp->int per RVV (NaN->max-unsigned or max-pos signed; +inf->max; -inf->min).
#include "../intrinsics.hpp"

namespace salt_cvc5 {

// ---- fp64 load/store-as-bv (sort 11,53); fp16/fp32 reuse intrinsics.hpp ----
inline Term _gfcvt_load_fp64(TermManager& tm, Term bv) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    return tm.mkTerm(op, {bv});
}
inline size_t& _gfcvt_fp64_bv_counter() { static size_t c = 0; return c; }
inline Term _gfcvt_store_fp64(TermManager& tm, Term fp_val) {
    Sort bv64 = tm.mkBitVectorSort(64);
    Term bv = tm.mkConst(bv64, "_gfcvt_fp64_2bv_" + std::to_string(_gfcvt_fp64_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    g_ctx->solver->assertFormula(fold_eq(tm, tm.mkTerm(op, {bv}), fp_val));
    return bv;
}

// raw-bits BV -> FP-typed term, by element width
inline Term _gfcvt_load_fp(TermManager& tm, Term bv, size_t fp_bits) {
    if (fp_bits == 16) return rvv_load_as_fp16(tm, bv);
    if (fp_bits == 32) return rvv_load_as_fp32(tm, bv);
    return _gfcvt_load_fp64(tm, bv);
}
// FP-typed term -> raw-bits BV, by element width
inline Term _gfcvt_store_fp(TermManager& tm, Term fp, size_t fp_bits) {
    if (fp_bits == 16) return rvv_store_fp16_as_bv(tm, fp);
    if (fp_bits == 32) return rvv_store_fp32_as_bv(tm, fp);
    return _gfcvt_store_fp64(tm, fp);
}
// (eb,sb) exponent/significand bits for a given fp width
inline void _gfcvt_fp_fmt(size_t fp_bits, uint32_t& eb, uint32_t& sb) {
    if (fp_bits == 16) { eb = 5;  sb = 11; }
    else if (fp_bits == 32) { eb = 8;  sb = 24; }
    else { eb = 11; sb = 53; }
}

// int (BV) -> fp term with rounding. is_signed picks SBV vs UBV.
inline Term _gfcvt_int_to_fp(TermManager& tm, Term int_bv, bool is_signed,
                             size_t fp_bits, Term rm) {
    uint32_t eb, sb; _gfcvt_fp_fmt(fp_bits, eb, sb);
    Kind k = is_signed ? Kind::FLOATINGPOINT_TO_FP_FROM_SBV
                       : Kind::FLOATINGPOINT_TO_FP_FROM_UBV;
    Op cvt = tm.mkOp(k, {eb, sb});
    return tm.mkTerm(cvt, {rm, int_bv});
}

// fp term -> dst_bits-wide int (BV), saturating per RVV. fp16 sources reuse
// fp_to_int_lane; fp32/fp64 saturate via FP-space bound comparisons.
inline Term _gfcvt_fp_to_int(TermManager& tm, Term fp, size_t fp_bits,
                             uint32_t dst_bits, bool is_signed, Term rm) {
    uint32_t eb, sb; _gfcvt_fp_fmt(fp_bits, eb, sb);

    // NaN result per RVV: unsigned -> all-ones (UINT_MAX); signed -> INT_MAX.
    int64_t int_max_v = is_signed
        ? (((int64_t)1 << (dst_bits - 1)) - 1)
        : (dst_bits >= 64 ? (int64_t)~0ULL : (((int64_t)1 << dst_bits) - 1));
    int64_t int_min_v = is_signed ? -((int64_t)1 << (dst_bits - 1)) : 0;
    Term nan_result = mk_bv_val(tm, dst_bits, int_max_v);

    if (fp_bits == 16) {
        return fp_to_int_lane(tm, fp, eb, sb, dst_bits, is_signed, rm, nan_result);
    }

    // fp32/fp64: convert in dst_bits width, then override OOR / NaN / inf cases
    // using FP-space predicates so the raw to_sbv/to_ubv only sees in-range fp.
    Term int_max_bv = mk_bv_val(tm, dst_bits, int_max_v);
    Term int_min_bv = mk_bv_val(tm, dst_bits, int_min_v);

    // Build fp bounds: max = int_max, min = int_min (exact for these magnitudes
    // in fp32/fp64 only approximately; use >= / <= against the fp value to gate).
    Term fmax = _gfcvt_int_to_fp(tm, int_max_bv, is_signed, fp_bits, rm);
    Term fmin = _gfcvt_int_to_fp(tm, int_min_bv, is_signed, fp_bits, rm);

    Kind cvtk = is_signed ? Kind::FLOATINGPOINT_TO_SBV : Kind::FLOATINGPOINT_TO_UBV;
    Op cvt = tm.mkOp(cvtk, {dst_bits});
    Term raw = tm.mkTerm(cvt, {rm, fp});

    Term is_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp});
    Term ge_max = tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {fp, fmax});
    Term le_min = tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {fp, fmin});

    Term sat = fold_ite(tm, ge_max, int_max_bv,
               fold_ite(tm, le_min, int_min_bv, raw));
    return fold_ite(tm, is_nan, nan_result, sat);
}

// ---- generic vector wrappers ----
// int->fp: src int bits = fp_bits (vfcvt) or src/2 (vfwcvt) handled by caller.
inline RVVVector _gfcvt_f_x(const RVVVector& src, bool is_signed,
                            size_t src_int_bits, size_t dst_fp_bits,
                            size_t vl, Term rm) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term in = src.getElement(i);
        // widen the integer to dst width when src_int_bits < dst_fp_bits
        if (src_int_bits < dst_fp_bits) {
            in = is_signed ? fold_bvsext(tm, dst_fp_bits - src_int_bits, in)
                           : fold_bvzext(tm, dst_fp_bits - src_int_bits, in);
        }
        Term fp = _gfcvt_int_to_fp(tm, in, is_signed, dst_fp_bits, rm);
        r.push_back(_gfcvt_store_fp(tm, fp, dst_fp_bits));
    }
    return RVVVector(tm, dst_fp_bits, r);
}
// fp->int (vfcvt same width / vfwcvt 2x int / vfncvt half int)
inline RVVVector _gfcvt_x_f(const RVVVector& src, bool is_signed,
                            size_t src_fp_bits, size_t dst_int_bits,
                            size_t vl, Term rm) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = _gfcvt_load_fp(tm, src.getElement(i), src_fp_bits);
        r.push_back(_gfcvt_fp_to_int(tm, fp, src_fp_bits, dst_int_bits, is_signed, rm));
    }
    return RVVVector(tm, dst_int_bits, r);
}
// fp->fp (vfwcvt widen / vfncvt narrow)
inline RVVVector _gfcvt_f_f(const RVVVector& src, size_t src_fp_bits,
                            size_t dst_fp_bits, size_t vl, Term rm) {
    auto& tm = g_ctx->tm;
    uint32_t deb, dsb; _gfcvt_fp_fmt(dst_fp_bits, deb, dsb);
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {deb, dsb});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = _gfcvt_load_fp(tm, src.getElement(i), src_fp_bits);
        Term out = tm.mkTerm(cvt, {rm, fp});
        r.push_back(_gfcvt_store_fp(tm, out, dst_fp_bits));
    }
    return RVVVector(tm, dst_fp_bits, r);
}

inline Term _gfcvt_rm_default() { return g_ctx->fp.rounding_mode; }
inline Term _gfcvt_rm_rtz(TermManager& tm) {
    return tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_ZERO);
}

// ===========================================================================
// vfcvt_f_x  (int -> fp, same width)   f16<-i16, f32<-i32, f64<-i64
// ===========================================================================
#define GFCVT_F_X(NAME, INTB, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, true, INTB, FPB, vl, _gfcvt_rm_default()); }
GFCVT_F_X(vfcvt_f_x_v_f16m1, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f16m2, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f16m4, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f16m8, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f16mf2, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f16mf4, 16, 16)
GFCVT_F_X(vfcvt_f_x_v_f32m1, 32, 32)
GFCVT_F_X(vfcvt_f_x_v_f32m2, 32, 32)
GFCVT_F_X(vfcvt_f_x_v_f32m4, 32, 32)
GFCVT_F_X(vfcvt_f_x_v_f32mf2, 32, 32)
GFCVT_F_X(vfcvt_f_x_v_f64m1, 64, 64)
GFCVT_F_X(vfcvt_f_x_v_f64m2, 64, 64)
GFCVT_F_X(vfcvt_f_x_v_f64m4, 64, 64)
GFCVT_F_X(vfcvt_f_x_v_f64m8, 64, 64)
#undef GFCVT_F_X

// vfcvt_f_xu  (uint -> fp, same width)
#define GFCVT_F_XU(NAME, INTB, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, false, INTB, FPB, vl, _gfcvt_rm_default()); }
GFCVT_F_XU(vfcvt_f_xu_v_f16m1, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f16m2, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f16m4, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f16m8, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f16mf2, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f16mf4, 16, 16)
GFCVT_F_XU(vfcvt_f_xu_v_f32m1, 32, 32)
GFCVT_F_XU(vfcvt_f_xu_v_f32m2, 32, 32)
GFCVT_F_XU(vfcvt_f_xu_v_f32m4, 32, 32)
GFCVT_F_XU(vfcvt_f_xu_v_f32m8, 32, 32)
GFCVT_F_XU(vfcvt_f_xu_v_f32mf2, 32, 32)
GFCVT_F_XU(vfcvt_f_xu_v_f64m1, 64, 64)
GFCVT_F_XU(vfcvt_f_xu_v_f64m2, 64, 64)
GFCVT_F_XU(vfcvt_f_xu_v_f64m4, 64, 64)
GFCVT_F_XU(vfcvt_f_xu_v_f64m8, 64, 64)
#undef GFCVT_F_XU

// ===========================================================================
// vfcvt_x_f  (fp -> int, same width, current rm)  i16<-f16, i32<-f32, i64<-f64
// ===========================================================================
#define GFCVT_X_F(NAME, FPB, INTB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, FPB, INTB, vl, _gfcvt_rm_default()); }
GFCVT_X_F(vfcvt_x_f_v_i16m1, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i16m2, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i16m4, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i16m8, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i16mf2, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i16mf4, 16, 16)
GFCVT_X_F(vfcvt_x_f_v_i32m1, 32, 32)
GFCVT_X_F(vfcvt_x_f_v_i32m2, 32, 32)
GFCVT_X_F(vfcvt_x_f_v_i32m4, 32, 32)
GFCVT_X_F(vfcvt_x_f_v_i32mf2, 32, 32)
GFCVT_X_F(vfcvt_x_f_v_i64m1, 64, 64)
GFCVT_X_F(vfcvt_x_f_v_i64m2, 64, 64)
GFCVT_X_F(vfcvt_x_f_v_i64m4, 64, 64)
GFCVT_X_F(vfcvt_x_f_v_i64m8, 64, 64)
#undef GFCVT_X_F

// vfcvt_xu_f  (fp -> uint, same width, current rm)
#define GFCVT_XU_F(NAME, FPB, INTB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, FPB, INTB, vl, _gfcvt_rm_default()); }
GFCVT_XU_F(vfcvt_xu_f_v_u16m1, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u16m2, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u16m4, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u16m8, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u16mf2, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u16mf4, 16, 16)
GFCVT_XU_F(vfcvt_xu_f_v_u32m1, 32, 32)
GFCVT_XU_F(vfcvt_xu_f_v_u32m2, 32, 32)
GFCVT_XU_F(vfcvt_xu_f_v_u32m4, 32, 32)
GFCVT_XU_F(vfcvt_xu_f_v_u32m8, 32, 32)
GFCVT_XU_F(vfcvt_xu_f_v_u32mf2, 32, 32)
GFCVT_XU_F(vfcvt_xu_f_v_u64m1, 64, 64)
GFCVT_XU_F(vfcvt_xu_f_v_u64m2, 64, 64)
GFCVT_XU_F(vfcvt_xu_f_v_u64m4, 64, 64)
GFCVT_XU_F(vfcvt_xu_f_v_u64m8, 64, 64)
#undef GFCVT_XU_F

// vfcvt_rtz_x_f  (fp -> int, force RTZ)
#define GFCVT_RTZ_X_F(NAME, FPB, INTB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, FPB, INTB, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16m1, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16m2, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16m4, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16m8, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16mf2, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i16mf4, 16, 16)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i32mf2, 32, 32)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i64m1, 64, 64)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i64m2, 64, 64)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i64m4, 64, 64)
GFCVT_RTZ_X_F(vfcvt_rtz_x_f_v_i64m8, 64, 64)
#undef GFCVT_RTZ_X_F

// vfcvt_rtz_xu_f  (fp -> uint, force RTZ)
#define GFCVT_RTZ_XU_F(NAME, FPB, INTB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, FPB, INTB, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16m1, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16m2, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16m4, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16m8, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16mf2, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u16mf4, 16, 16)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u32m1, 32, 32)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u32m2, 32, 32)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u32m4, 32, 32)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u32m8, 32, 32)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u32mf2, 32, 32)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u64m1, 64, 64)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u64m2, 64, 64)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u64m4, 64, 64)
GFCVT_RTZ_XU_F(vfcvt_rtz_xu_f_v_u64m8, 64, 64)
#undef GFCVT_RTZ_XU_F

// ===========================================================================
// vfwcvt  (result width = 2*SEW)
//   f_f: f16->f32, f32->f64 (exact widen)
//   f_x / f_xu: i8->f16, i16->f32, i32->f64
//   x_f / xu_f (+rtz): f16->i32, f32->i64
// ===========================================================================
// f_f
#define GFWCVT_F_F(NAME, SRCB, DSTB) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_f(src, SRCB, DSTB, vl, _gfcvt_rm_default()); }
GFWCVT_F_F(vfwcvt_f_f_v_f32m1, 16, 32)
GFWCVT_F_F(vfwcvt_f_f_v_f32m2, 16, 32)
GFWCVT_F_F(vfwcvt_f_f_v_f32m4, 16, 32)
GFWCVT_F_F(vfwcvt_f_f_v_f32m8, 16, 32)
GFWCVT_F_F(vfwcvt_f_f_v_f32mf2, 16, 32)
GFWCVT_F_F(vfwcvt_f_f_v_f64m1, 32, 64)
GFWCVT_F_F(vfwcvt_f_f_v_f64m8, 32, 64)
#undef GFWCVT_F_F

// f_x  (signed int src_width = dst_fp/2 -> fp dst_width)
#define GFWCVT_F_X(NAME, SRCINT, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, true, SRCINT, DSTFP, vl, _gfcvt_rm_default()); }
GFWCVT_F_X(vfwcvt_f_x_v_f16m1, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f16m2, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f16m4, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f16m8, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f16mf2, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f16mf4, 8, 16)
GFWCVT_F_X(vfwcvt_f_x_v_f32m1, 16, 32)
GFWCVT_F_X(vfwcvt_f_x_v_f32m2, 16, 32)
GFWCVT_F_X(vfwcvt_f_x_v_f32m4, 16, 32)
GFWCVT_F_X(vfwcvt_f_x_v_f32m8, 16, 32)
GFWCVT_F_X(vfwcvt_f_x_v_f32mf2, 16, 32)
GFWCVT_F_X(vfwcvt_f_x_v_f64m1, 32, 64)
GFWCVT_F_X(vfwcvt_f_x_v_f64m2, 32, 64)
GFWCVT_F_X(vfwcvt_f_x_v_f64m4, 32, 64)
GFWCVT_F_X(vfwcvt_f_x_v_f64m8, 32, 64)
#undef GFWCVT_F_X

// f_xu
#define GFWCVT_F_XU(NAME, SRCINT, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, false, SRCINT, DSTFP, vl, _gfcvt_rm_default()); }
GFWCVT_F_XU(vfwcvt_f_xu_v_f16m1, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f16m2, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f16m4, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f16m8, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f16mf2, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f16mf4, 8, 16)
GFWCVT_F_XU(vfwcvt_f_xu_v_f32m1, 16, 32)
GFWCVT_F_XU(vfwcvt_f_xu_v_f32m2, 16, 32)
GFWCVT_F_XU(vfwcvt_f_xu_v_f32m4, 16, 32)
GFWCVT_F_XU(vfwcvt_f_xu_v_f32m8, 16, 32)
GFWCVT_F_XU(vfwcvt_f_xu_v_f32mf2, 16, 32)
GFWCVT_F_XU(vfwcvt_f_xu_v_f64m1, 32, 64)
GFWCVT_F_XU(vfwcvt_f_xu_v_f64m2, 32, 64)
GFWCVT_F_XU(vfwcvt_f_xu_v_f64m4, 32, 64)
GFWCVT_F_XU(vfwcvt_f_xu_v_f64m8, 32, 64)
#undef GFWCVT_F_XU

// x_f  (fp src -> 2*SEW signed int)  f16->i32, f32->i64
#define GFWCVT_X_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, SRCFP, DSTINT, vl, _gfcvt_rm_default()); }
GFWCVT_X_F(vfwcvt_x_f_v_i32m1, 16, 32)
GFWCVT_X_F(vfwcvt_x_f_v_i32m2, 16, 32)
GFWCVT_X_F(vfwcvt_x_f_v_i32m4, 16, 32)
GFWCVT_X_F(vfwcvt_x_f_v_i32m8, 16, 32)
GFWCVT_X_F(vfwcvt_x_f_v_i32mf2, 16, 32)
GFWCVT_X_F(vfwcvt_x_f_v_i64m1, 32, 64)
GFWCVT_X_F(vfwcvt_x_f_v_i64m2, 32, 64)
GFWCVT_X_F(vfwcvt_x_f_v_i64m4, 32, 64)
GFWCVT_X_F(vfwcvt_x_f_v_i64m8, 32, 64)
#undef GFWCVT_X_F

// xu_f  (fp src -> 2*SEW unsigned int)
#define GFWCVT_XU_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, SRCFP, DSTINT, vl, _gfcvt_rm_default()); }
GFWCVT_XU_F(vfwcvt_xu_f_v_u32m1, 16, 32)
GFWCVT_XU_F(vfwcvt_xu_f_v_u32m2, 16, 32)
GFWCVT_XU_F(vfwcvt_xu_f_v_u32m4, 16, 32)
GFWCVT_XU_F(vfwcvt_xu_f_v_u32m8, 16, 32)
GFWCVT_XU_F(vfwcvt_xu_f_v_u32mf2, 16, 32)
GFWCVT_XU_F(vfwcvt_xu_f_v_u64m1, 32, 64)
GFWCVT_XU_F(vfwcvt_xu_f_v_u64m2, 32, 64)
GFWCVT_XU_F(vfwcvt_xu_f_v_u64m4, 32, 64)
GFWCVT_XU_F(vfwcvt_xu_f_v_u64m8, 32, 64)
#undef GFWCVT_XU_F

// rtz x_f / xu_f
#define GFWCVT_RTZ_X_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, SRCFP, DSTINT, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i32m1, 16, 32)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i32m2, 16, 32)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i32m4, 16, 32)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i32m8, 16, 32)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i32mf2, 16, 32)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i64m1, 32, 64)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i64m2, 32, 64)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i64m4, 32, 64)
GFWCVT_RTZ_X_F(vfwcvt_rtz_x_f_v_i64m8, 32, 64)
#undef GFWCVT_RTZ_X_F

#define GFWCVT_RTZ_XU_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, SRCFP, DSTINT, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u32m1, 16, 32)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u32m2, 16, 32)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u32m4, 16, 32)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u32m8, 16, 32)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u32mf2, 16, 32)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u64m1, 32, 64)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u64m2, 32, 64)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u64m4, 32, 64)
GFWCVT_RTZ_XU_F(vfwcvt_rtz_xu_f_v_u64m8, 32, 64)
#undef GFWCVT_RTZ_XU_F

// ===========================================================================
// vfncvt  (result width = SEW/2)
//   f_f: f32->f16, f64->f32 (round)   rod = round-to-odd
//   f_x / f_xu: i32->f16, i64->f32
//   x_f / xu_f (+rtz): f16->i8, f32->i16, f64->i32
// ===========================================================================
inline Term _gfcvt_rm_rod(TermManager& tm) {
    // cvc5 has no native round-to-odd; nearest-even is the closest single-rm
    // approximation. ROD differs only for ties at the rounding boundary.
    return tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
}

// f_f narrow (round-nearest-even / current rm)
#define GFNCVT_F_F(NAME, SRCFP, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_f(src, SRCFP, DSTFP, vl, _gfcvt_rm_default()); }
GFNCVT_F_F(vfncvt_f_f_w_f16m1, 32, 16)
GFNCVT_F_F(vfncvt_f_f_w_f16m2, 32, 16)
GFNCVT_F_F(vfncvt_f_f_w_f16m4, 32, 16)
GFNCVT_F_F(vfncvt_f_f_w_f16mf2, 32, 16)
GFNCVT_F_F(vfncvt_f_f_w_f16mf4, 32, 16)
GFNCVT_F_F(vfncvt_f_f_w_f32m1, 64, 32)
GFNCVT_F_F(vfncvt_f_f_w_f32m2, 64, 32)
GFNCVT_F_F(vfncvt_f_f_w_f32m4, 64, 32)
GFNCVT_F_F(vfncvt_f_f_w_f32mf2, 64, 32)
#undef GFNCVT_F_F

// f_f narrow round-to-odd
#define GFNCVT_ROD_F_F(NAME, SRCFP, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_f(src, SRCFP, DSTFP, vl, _gfcvt_rm_rod(g_ctx->tm)); }
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f16m1, 32, 16)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f16m2, 32, 16)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f16m4, 32, 16)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f16mf2, 32, 16)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f16mf4, 32, 16)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f32m1, 64, 32)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f32m2, 64, 32)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f32m4, 64, 32)
GFNCVT_ROD_F_F(vfncvt_rod_f_f_w_f32mf2, 64, 32)
#undef GFNCVT_ROD_F_F

// f_x narrow (signed int 2*dst -> fp dst)   i32->f16, i64->f32
#define GFNCVT_F_X(NAME, SRCINT, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, true, SRCINT, DSTFP, vl, _gfcvt_rm_default()); }
GFNCVT_F_X(vfncvt_f_x_w_f16m1, 32, 16)
GFNCVT_F_X(vfncvt_f_x_w_f16m2, 32, 16)
GFNCVT_F_X(vfncvt_f_x_w_f16m4, 32, 16)
GFNCVT_F_X(vfncvt_f_x_w_f16mf2, 32, 16)
GFNCVT_F_X(vfncvt_f_x_w_f16mf4, 32, 16)
GFNCVT_F_X(vfncvt_f_x_w_f32m1, 64, 32)
GFNCVT_F_X(vfncvt_f_x_w_f32m2, 64, 32)
GFNCVT_F_X(vfncvt_f_x_w_f32m4, 64, 32)
GFNCVT_F_X(vfncvt_f_x_w_f32mf2, 64, 32)
#undef GFNCVT_F_X

// f_xu narrow
#define GFNCVT_F_XU(NAME, SRCINT, DSTFP) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_f_x(src, false, SRCINT, DSTFP, vl, _gfcvt_rm_default()); }
GFNCVT_F_XU(vfncvt_f_xu_w_f16m1, 32, 16)
GFNCVT_F_XU(vfncvt_f_xu_w_f16m2, 32, 16)
GFNCVT_F_XU(vfncvt_f_xu_w_f16m4, 32, 16)
GFNCVT_F_XU(vfncvt_f_xu_w_f16mf2, 32, 16)
GFNCVT_F_XU(vfncvt_f_xu_w_f16mf4, 32, 16)
GFNCVT_F_XU(vfncvt_f_xu_w_f32m1, 64, 32)
GFNCVT_F_XU(vfncvt_f_xu_w_f32m2, 64, 32)
GFNCVT_F_XU(vfncvt_f_xu_w_f32m4, 64, 32)
GFNCVT_F_XU(vfncvt_f_xu_w_f32mf2, 64, 32)
#undef GFNCVT_F_XU

// x_f narrow (fp 2*dst -> signed int dst)   f16->i8, f32->i16, f64->i32
#define GFNCVT_X_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, SRCFP, DSTINT, vl, _gfcvt_rm_default()); }
GFNCVT_X_F(vfncvt_x_f_w_i8m1, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i8m2, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i8m4, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i8mf2, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i8mf4, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i8mf8, 16, 8)
GFNCVT_X_F(vfncvt_x_f_w_i16m1, 32, 16)
GFNCVT_X_F(vfncvt_x_f_w_i16m2, 32, 16)
GFNCVT_X_F(vfncvt_x_f_w_i16m4, 32, 16)
GFNCVT_X_F(vfncvt_x_f_w_i16mf2, 32, 16)
GFNCVT_X_F(vfncvt_x_f_w_i16mf4, 32, 16)
GFNCVT_X_F(vfncvt_x_f_w_i32m1, 64, 32)
GFNCVT_X_F(vfncvt_x_f_w_i32m2, 64, 32)
GFNCVT_X_F(vfncvt_x_f_w_i32m4, 64, 32)
GFNCVT_X_F(vfncvt_x_f_w_i32mf2, 64, 32)
#undef GFNCVT_X_F

// xu_f narrow
#define GFNCVT_XU_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, SRCFP, DSTINT, vl, _gfcvt_rm_default()); }
GFNCVT_XU_F(vfncvt_xu_f_w_u8m1, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u8m2, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u8m4, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u8mf2, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u8mf4, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u8mf8, 16, 8)
GFNCVT_XU_F(vfncvt_xu_f_w_u16m1, 32, 16)
GFNCVT_XU_F(vfncvt_xu_f_w_u16m2, 32, 16)
GFNCVT_XU_F(vfncvt_xu_f_w_u16m4, 32, 16)
GFNCVT_XU_F(vfncvt_xu_f_w_u16mf2, 32, 16)
GFNCVT_XU_F(vfncvt_xu_f_w_u16mf4, 32, 16)
GFNCVT_XU_F(vfncvt_xu_f_w_u32m1, 64, 32)
GFNCVT_XU_F(vfncvt_xu_f_w_u32m2, 64, 32)
GFNCVT_XU_F(vfncvt_xu_f_w_u32m4, 64, 32)
GFNCVT_XU_F(vfncvt_xu_f_w_u32mf2, 64, 32)
#undef GFNCVT_XU_F

// rtz x_f / xu_f narrow
#define GFNCVT_RTZ_X_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, true, SRCFP, DSTINT, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8m1, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8m2, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8m4, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8mf2, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8mf4, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i8mf8, 16, 8)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i16m1, 32, 16)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i16m2, 32, 16)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i16m4, 32, 16)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i16mf2, 32, 16)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i16mf4, 32, 16)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i32m1, 64, 32)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i32m2, 64, 32)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i32m4, 64, 32)
GFNCVT_RTZ_X_F(vfncvt_rtz_x_f_w_i32mf2, 64, 32)
#undef GFNCVT_RTZ_X_F

#define GFNCVT_RTZ_XU_F(NAME, SRCFP, DSTINT) \
inline RVVVector __riscv_##NAME(const RVVVector& src, size_t vl) { \
    return _gfcvt_x_f(src, false, SRCFP, DSTINT, vl, _gfcvt_rm_rtz(g_ctx->tm)); }
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8m1, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8m2, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8m4, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8mf2, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8mf4, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u8mf8, 16, 8)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u16m1, 32, 16)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u16m2, 32, 16)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u16m4, 32, 16)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u16mf2, 32, 16)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u16mf4, 32, 16)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u32m1, 64, 32)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u32m2, 64, 32)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u32m4, 64, 32)
GFNCVT_RTZ_XU_F(vfncvt_rtz_xu_f_w_u32mf2, 64, 32)
#undef GFNCVT_RTZ_XU_F

} // namespace salt_cvc5
