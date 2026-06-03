#pragma once
// Backend-agnostic helper vocabulary for the generated NEON families (bitwuzla).
// Same names/signatures as the cvc5 nhelp.hpp so family bodies compile under both.
#include "../intrinsics.hpp"
#include "../../core/bv_fold.hpp"
#include "aliases.hpp"
#include <cstring>
#include <cmath>
namespace salt {

// ---- integer extras not in bv_fold.hpp ----
inline Term fold_bvashr(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_ASHR,{a,b}); }
inline Term fold_bvudiv(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_UDIV,{a,b}); }
inline Term fold_bvsdiv(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SDIV,{a,b}); }
inline Term fold_bvurem(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_UREM,{a,b}); }
inline Term fold_bvsrem(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SREM,{a,b}); }

// ---- integer comparisons -> Bool ----
inline Term cmp_eq (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::EQUAL,{a,b}); }
inline Term cmp_ne (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::DISTINCT,{a,b}); }
inline Term cmp_slt(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SLT,{a,b}); }
inline Term cmp_sle(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SLE,{a,b}); }
inline Term cmp_sgt(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SGT,{a,b}); }
inline Term cmp_sge(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_SGE,{a,b}); }
inline Term cmp_ult(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_ULT,{a,b}); }
inline Term cmp_ule(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_ULE,{a,b}); }
inline Term cmp_ugt(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_UGT,{a,b}); }
inline Term cmp_uge(TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::BV_UGE,{a,b}); }

// ---- min/max via compare+ite ----
inline Term bv_smin(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, cmp_sle(tm,a,b), a, b); }
inline Term bv_smax(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, cmp_sge(tm,a,b), a, b); }
inline Term bv_umin(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, cmp_ule(tm,a,b), a, b); }
inline Term bv_umax(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, cmp_uge(tm,a,b), a, b); }

// ---- masks ----
inline Term bv_ones(TermManager& tm, size_t w){ return mk_bv_val(tm, w, -1); }
inline Term bv_zero(TermManager& tm, size_t w){ return mk_bv_val(tm, w, 0); }
inline Term mask_from(TermManager& tm, const Term& cond, size_t w){ return fold_ite(tm, cond, bv_ones(tm,w), bv_zero(tm,w)); }

// ---- FP vocabulary (operands are FP-sorted terms) ----
inline Term nfp_add (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_ADD,{g_ctx->fp.rounding_mode,a,b}); }
inline Term nfp_sub (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_SUB,{g_ctx->fp.rounding_mode,a,b}); }
inline Term nfp_mul (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_MUL,{g_ctx->fp.rounding_mode,a,b}); }
inline Term nfp_div (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_DIV,{g_ctx->fp.rounding_mode,a,b}); }
inline Term nfp_neg (TermManager& tm, const Term& a){ return tm.mk_term(Kind::FP_NEG,{a}); }
inline Term nfp_abs (TermManager& tm, const Term& a){ return tm.mk_term(Kind::FP_ABS,{a}); }
inline Term nfp_sqrt(TermManager& tm, const Term& a){ return tm.mk_term(Kind::FP_SQRT,{g_ctx->fp.rounding_mode,a}); }
inline Term nfp_fma (TermManager& tm, const Term& a, const Term& b, const Term& c){ return tm.mk_term(Kind::FP_FMA,{g_ctx->fp.rounding_mode,a,b,c}); }
inline Term nfp_min (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_MIN,{a,b}); }
inline Term nfp_max (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_MAX,{a,b}); }
inline Term nfp_rti (TermManager& tm, const Term& rm, const Term& a){ return tm.mk_term(Kind::FP_RTI,{rm,a}); }
inline Term nfp_isnan(TermManager& tm, const Term& a){ return tm.mk_term(Kind::FP_IS_NAN,{a}); }
inline Term nfp_eq (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_EQUAL,{a,b}); }
inline Term nfp_lt (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_LT,{a,b}); }
inline Term nfp_le (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_LEQ,{a,b}); }
inline Term nfp_gt (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_GT,{a,b}); }
inline Term nfp_ge (TermManager& tm, const Term& a, const Term& b){ return tm.mk_term(Kind::FP_GEQ,{a,b}); }
inline Term nfp_minnm(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, nfp_isnan(tm,a), b, fold_ite(tm, nfp_isnan(tm,b), a, nfp_min(tm,a,b))); }
inline Term nfp_maxnm(TermManager& tm, const Term& a, const Term& b){ return fold_ite(tm, nfp_isnan(tm,a), b, fold_ite(tm, nfp_isnan(tm,b), a, nfp_max(tm,a,b))); }

// ---- raw FP<->BV for a lane of given width ----
inline Term lane_to_fp(TermManager& tm, const Term& bv, size_t bits){
    if (bits==16) return tm.mk_term(Kind::FP_TO_FP_FROM_BV,{bv},{5,11});
    if (bits==32) return tm.mk_term(Kind::FP_TO_FP_FROM_BV,{bv},{8,24});
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV,{bv},{11,53});
}
inline size_t& fpbv_counter(){ static size_t c=0; return c; }
inline Term fp_to_lane(TermManager& tm, const Term& fp, size_t bits){
    Term bv = tm.mk_const(tm.mk_bv_sort(bits), "_neon_fp2bv_"+std::to_string(fpbv_counter()++));
    uint32_t eb = bits==16?5:(bits==32?8:11), sb = bits==16?11:(bits==32?24:53);
    Term back = tm.mk_term(Kind::FP_TO_FP_FROM_BV,{bv},{eb,sb});
    g_ctx->solver->assert_formula(tm.mk_term(Kind::EQUAL,{back, fp}));
    return bv;
}


// ---- FP scalar-constant -> Term helpers ----
inline Term fp_rawbits(TermManager& tm, double v, size_t W){
    if(W==32){ float f=(float)v; uint32_t b; std::memcpy(&b,&f,4); return mk_bv_val(tm,32,(int64_t)b); }
    if(W==64){ uint64_t b; std::memcpy(&b,&v,8); return mk_bv_val(tm,64,(int64_t)b); }
    salt_float16 h((float)v); uint16_t b=h.value; return mk_bv_val(tm,16,(int64_t)b);
}
inline Term mk_fpc(TermManager& tm, double v, size_t W){ return lane_to_fp(tm, fp_rawbits(tm,v,W), W); }
inline Term fp_rawbits16(TermManager& tm, salt_float16 v){ return mk_bv_val(tm,16,(int64_t)v.value); }
inline Term fp_rawbits32(TermManager& tm, float v){ uint32_t b; std::memcpy(&b,&v,4); return mk_bv_val(tm,32,(int64_t)b); }
inline Term fp_rawbits64(TermManager& tm, double v){ uint64_t b; std::memcpy(&b,&v,8); return mk_bv_val(tm,64,(int64_t)b); }
inline Term mk_fpc16(TermManager& tm, salt_float16 v){ return lane_to_fp(tm, fp_rawbits16(tm,v),16); }
inline Term mk_fpc32(TermManager& tm, float v){ return lane_to_fp(tm, fp_rawbits32(tm,v),32); }
inline Term mk_fpc64(TermManager& tm, double v){ return lane_to_fp(tm, fp_rawbits64(tm,v),64); }


// ---- rounding modes + int<->fp conversions (bitwuzla) ----
inline Term rm_of(TermManager& tm, int k){
    RoundingMode m = k==1?RoundingMode::RTZ : k==2?RoundingMode::RTP
        : k==3?RoundingMode::RTN : k==4?RoundingMode::RNA : RoundingMode::RNE;
    return tm.mk_rm_value(m);
}
inline void _ebsb(size_t W, uint32_t& eb, uint32_t& sb){ eb=W==16?5:(W==32?8:11); sb=W==16?11:(W==32?24:53); }
inline Term fp_to_sint(TermManager& tm, const Term& fp, const Term& rm, size_t W){
    return tm.mk_term(Kind::FP_TO_SBV,{rm,fp},{(uint64_t)W}); }
inline Term fp_to_uint(TermManager& tm, const Term& fp, const Term& rm, size_t W){
    return tm.mk_term(Kind::FP_TO_UBV,{rm,fp},{(uint64_t)W}); }
inline Term sint_to_fp(TermManager& tm, const Term& bv, const Term& rm, size_t W){
    uint32_t eb,sb; _ebsb(W,eb,sb); return tm.mk_term(Kind::FP_TO_FP_FROM_SBV,{rm,bv},{eb,sb}); }
inline Term uint_to_fp(TermManager& tm, const Term& bv, const Term& rm, size_t W){
    uint32_t eb,sb; _ebsb(W,eb,sb); return tm.mk_term(Kind::FP_TO_FP_FROM_UBV,{rm,bv},{eb,sb}); }
inline Term fp_cvt_fp(TermManager& tm, const Term& fp, const Term& rm, size_t W){
    uint32_t eb,sb; _ebsb(W,eb,sb); return tm.mk_term(Kind::FP_TO_FP_FROM_FP,{rm,fp},{eb,sb}); }

inline Term _nclmul(TermManager& tm, Term a, Term b, size_t Wa, size_t Wout){
    Term acc=mk_bv_val(tm,Wout,0); Term ax=fold_bvzext(tm,Wout-Wa,a);
    for(size_t k=0;k<Wa;k++){
        Term bit=fold_bvextract(tm,k,k,b);
        Term sh=fold_bvshl(tm,ax,mk_bv_val(tm,Wout,(int64_t)k));
        acc=fold_ite(tm,fold_eq(tm,bit,mk_bv_val(tm,1,1)),fold_bvxor(tm,acc,sh),acc);
    }
    return acc;
}
inline Term bf16_to_fp(TermManager& tm, Term b16){ return lane_to_fp(tm, fold_bvconcat(tm, b16, mk_bv_val(tm,16,0)), 32); }
inline Term fp32_to_bf16(TermManager& tm, Term x32){
    Term lsb=fold_bvand(tm, fold_bvlshr(tm,x32,mk_bv_val(tm,32,16)), mk_bv_val(tm,32,1));
    Term r=fold_bvadd(tm,x32,fold_bvadd(tm,mk_bv_val(tm,32,0x7FFF),lsb));
    return fold_bvextract(tm,31,16,r);
}

} // namespace salt
