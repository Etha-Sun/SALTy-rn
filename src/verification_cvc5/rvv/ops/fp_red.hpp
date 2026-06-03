#pragma once
// RVV FP reductions: vfredusum / vfredosum / vfredmax / vfredmin (cvc5).
// acc = scalar.lane(0); fold acc OP src[i] over vl lanes; result lane0 = acc.
// usum/osum both fold left-to-right (acceptable for unordered). max/min use
// IEEE min/maxNumber (FLOATINGPOINT_MIN/MAX). Result type is *m1.
#include "../intrinsics.hpp"

namespace salt_cvc5 {

// ---- fp64 raw-bits <-> FP term (sort 11,53) ----
inline Term _gfrd_load_fp64(TermManager& tm, Term bv) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    return tm.mkTerm(op, {bv});
}
inline size_t& _gfrd_fp64_bv_counter() { static size_t c = 0; return c; }
inline Term _gfrd_store_fp64(TermManager& tm, Term fp_val) {
    Sort bv64 = tm.mkBitVectorSort(64);
    Term bv = tm.mkConst(bv64, "_gfrd_fp64_2bv_" + std::to_string(_gfrd_fp64_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
    g_ctx->solver->assertFormula(fold_eq(tm, tm.mkTerm(op, {bv}), fp_val));
    return bv;
}
inline Term _gfrd_load_fp(TermManager& tm, Term bv, size_t fp_bits) {
    if (fp_bits == 16) return rvv_load_as_fp16(tm, bv);
    if (fp_bits == 32) return rvv_load_as_fp32(tm, bv);
    return _gfrd_load_fp64(tm, bv);
}
inline Term _gfrd_store_fp(TermManager& tm, Term fp, size_t fp_bits) {
    if (fp_bits == 16) return rvv_store_fp16_as_bv(tm, fp);
    if (fp_bits == 32) return rvv_store_fp32_as_bv(tm, fp);
    return _gfrd_store_fp64(tm, fp);
}

enum GfrdOp { GFRD_SUM, GFRD_MAX, GFRD_MIN };

// Fold src lanes into scalar.lane(0). op SUM uses rounding; MAX/MIN don't.
inline RVVVector _gfrd_reduce(const RVVVector& vec, const RVVVector& scalar,
                              size_t fp_bits, size_t vl, GfrdOp op) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term acc = _gfrd_load_fp(tm, scalar.getElement(0), fp_bits);
    for (size_t i = 0; i < vl; i++) {
        Term lane = _gfrd_load_fp(tm, vec.getElement(i), fp_bits);
        if (op == GFRD_SUM)
            acc = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, acc, lane});
        else if (op == GFRD_MAX)
            acc = tm.mkTerm(Kind::FLOATINGPOINT_MAX, {acc, lane});
        else
            acc = tm.mkTerm(Kind::FLOATINGPOINT_MIN, {acc, lane});
    }
    Term acc_bv = _gfrd_store_fp(tm, acc, fp_bits);
    std::vector<Term> r; r.reserve(scalar.getVL());
    r.push_back(acc_bv);
    for (size_t i = 1; i < scalar.getVL(); i++) r.push_back(scalar.getElement(i));
    return RVVVector(tm, fp_bits, r);
}

// ===========================================================================
// vfredusum  (unordered sum; folded left-to-right)
// ===========================================================================
#define GFRD_USUM(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& vector, const RVVVector& scalar, size_t vl) { \
    return _gfrd_reduce(vector, scalar, FPB, vl, GFRD_SUM); }
GFRD_USUM(vfredusum_vs_f16m1_f16m1, 16)
GFRD_USUM(vfredusum_vs_f16m2_f16m1, 16)
GFRD_USUM(vfredusum_vs_f16m4_f16m1, 16)
GFRD_USUM(vfredusum_vs_f16m8_f16m1, 16)
GFRD_USUM(vfredusum_vs_f16mf2_f16m1, 16)
GFRD_USUM(vfredusum_vs_f16mf4_f16m1, 16)
GFRD_USUM(vfredusum_vs_f32m1_f32m1, 32)
GFRD_USUM(vfredusum_vs_f32m2_f32m1, 32)
GFRD_USUM(vfredusum_vs_f32m4_f32m1, 32)
GFRD_USUM(vfredusum_vs_f32mf2_f32m1, 32)
GFRD_USUM(vfredusum_vs_f64m1_f64m1, 64)
GFRD_USUM(vfredusum_vs_f64m2_f64m1, 64)
GFRD_USUM(vfredusum_vs_f64m4_f64m1, 64)
GFRD_USUM(vfredusum_vs_f64m8_f64m1, 64)
#undef GFRD_USUM

// ===========================================================================
// vfredosum  (ordered sum; left-to-right)
// ===========================================================================
#define GFRD_OSUM(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& vector, const RVVVector& scalar, size_t vl) { \
    return _gfrd_reduce(vector, scalar, FPB, vl, GFRD_SUM); }
GFRD_OSUM(vfredosum_vs_f16m1_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f16m2_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f16m4_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f16m8_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f16mf2_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f16mf4_f16m1, 16)
GFRD_OSUM(vfredosum_vs_f32m1_f32m1, 32)
GFRD_OSUM(vfredosum_vs_f32m2_f32m1, 32)
GFRD_OSUM(vfredosum_vs_f32m4_f32m1, 32)
GFRD_OSUM(vfredosum_vs_f32m8_f32m1, 32)
GFRD_OSUM(vfredosum_vs_f32mf2_f32m1, 32)
GFRD_OSUM(vfredosum_vs_f64m1_f64m1, 64)
GFRD_OSUM(vfredosum_vs_f64m2_f64m1, 64)
GFRD_OSUM(vfredosum_vs_f64m4_f64m1, 64)
GFRD_OSUM(vfredosum_vs_f64m8_f64m1, 64)
#undef GFRD_OSUM

// ===========================================================================
// vfredmax
// ===========================================================================
#define GFRD_MAXR(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& vector, const RVVVector& scalar, size_t vl) { \
    return _gfrd_reduce(vector, scalar, FPB, vl, GFRD_MAX); }
GFRD_MAXR(vfredmax_vs_f16m1_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f16m2_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f16m4_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f16m8_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f16mf2_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f16mf4_f16m1, 16)
GFRD_MAXR(vfredmax_vs_f32m1_f32m1, 32)
GFRD_MAXR(vfredmax_vs_f32m2_f32m1, 32)
GFRD_MAXR(vfredmax_vs_f32m4_f32m1, 32)
GFRD_MAXR(vfredmax_vs_f32m8_f32m1, 32)
GFRD_MAXR(vfredmax_vs_f32mf2_f32m1, 32)
GFRD_MAXR(vfredmax_vs_f64m1_f64m1, 64)
GFRD_MAXR(vfredmax_vs_f64m2_f64m1, 64)
GFRD_MAXR(vfredmax_vs_f64m4_f64m1, 64)
GFRD_MAXR(vfredmax_vs_f64m8_f64m1, 64)
#undef GFRD_MAXR

// ===========================================================================
// vfredmin
// ===========================================================================
#define GFRD_MINR(NAME, FPB) \
inline RVVVector __riscv_##NAME(const RVVVector& vector, const RVVVector& scalar, size_t vl) { \
    return _gfrd_reduce(vector, scalar, FPB, vl, GFRD_MIN); }
GFRD_MINR(vfredmin_vs_f16m1_f16m1, 16)
GFRD_MINR(vfredmin_vs_f16m2_f16m1, 16)
GFRD_MINR(vfredmin_vs_f16m4_f16m1, 16)
GFRD_MINR(vfredmin_vs_f16m8_f16m1, 16)
GFRD_MINR(vfredmin_vs_f16mf2_f16m1, 16)
GFRD_MINR(vfredmin_vs_f16mf4_f16m1, 16)
GFRD_MINR(vfredmin_vs_f32m1_f32m1, 32)
GFRD_MINR(vfredmin_vs_f32m2_f32m1, 32)
GFRD_MINR(vfredmin_vs_f32m4_f32m1, 32)
GFRD_MINR(vfredmin_vs_f32m8_f32m1, 32)
GFRD_MINR(vfredmin_vs_f32mf2_f32m1, 32)
GFRD_MINR(vfredmin_vs_f64m1_f64m1, 64)
GFRD_MINR(vfredmin_vs_f64m2_f64m1, 64)
GFRD_MINR(vfredmin_vs_f64m4_f64m1, 64)
GFRD_MINR(vfredmin_vs_f64m8_f64m1, 64)
#undef GFRD_MINR

} // namespace salt_cvc5
