#pragma once
// RVV FP compare → mask: vmfeq/vmfne/vmflt/vmfle/vmfgt/vmfge, vv and vf (cvc5).
// IEEE comparisons (NaN-aware): any compare with NaN is false; vmfne is !eq.
#include "../intrinsics.hpp"
namespace salt_cvc5 {

enum GfcOp { G_EQ,G_NE,G_LT,G_LE,G_GT,G_GE };

inline Term _gfc_load_fp(TermManager& tm, size_t p, Term bv){
  if(p==16) return rvv_load_as_fp16(tm,bv);
  if(p==32) return rvv_load_as_fp32(tm,bv);
  return rvv_load_as_fp64(tm,bv);
}
inline Term _gfc_scalar_bv(TermManager& tm, size_t p, salt_float16 v){ return rvv_store_fp16_as_bv(tm, mk_fp16_from_f16(tm,v)); }
inline Term _gfc_scalar_bv(TermManager& tm, size_t p, float v){ return rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm,v)); }
inline Term _gfc_scalar_bv(TermManager& tm, size_t p, double v){ uint64_t b; std::memcpy(&b,&v,8); return tm.mkBitVector(64,(uint64_t)b); }

inline Term _gfc_bit(TermManager& tm, size_t p, Term abv, Term bbv, GfcOp op){
  Term af=_gfc_load_fp(tm,p,abv), bf=_gfc_load_fp(tm,p,bbv);
  Term cmp;
  switch(op){
    case G_EQ: cmp=tm.mkTerm(Kind::FLOATINGPOINT_EQ,{af,bf}); break;
    case G_NE: cmp=tm.mkTerm(Kind::NOT,{tm.mkTerm(Kind::FLOATINGPOINT_EQ,{af,bf})}); break;
    case G_LT: cmp=tm.mkTerm(Kind::FLOATINGPOINT_LT,{af,bf}); break;
    case G_LE: cmp=tm.mkTerm(Kind::FLOATINGPOINT_LEQ,{af,bf}); break;
    case G_GT: cmp=tm.mkTerm(Kind::FLOATINGPOINT_GT,{af,bf}); break;
    default:   cmp=tm.mkTerm(Kind::FLOATINGPOINT_GEQ,{af,bf}); break; // G_GE
  }
  return fold_ite(tm,cmp,mk_bv_val(tm,1,1),mk_bv_val(tm,1,0));
}
inline MaskVector _gfc_vv(const RVVVector& a, const RVVVector& b, size_t p, GfcOp op, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> bits; bits.reserve(vl);
  for(size_t i=0;i<vl;i++) bits.push_back(_gfc_bit(tm,p,a.getElement(i),b.getElement(i),op));
  return MaskVector(tm,bits);
}
inline MaskVector _gfc_vf(const RVVVector& a, Term sbv, size_t p, GfcOp op, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> bits; bits.reserve(vl);
  for(size_t i=0;i<vl;i++) bits.push_back(_gfc_bit(tm,p,a.getElement(i),sbv,op));
  return MaskVector(tm,bits);
}

inline MaskVector __riscv_vmfeq_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f32m1_b32(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f32m2_b16(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f32m4_b8(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f32m8_b4(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_EQ,vl); }
inline MaskVector __riscv_vmfeq_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_EQ,vl); }
inline MaskVector __riscv_vmfge_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f32m2_b16(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f32m4_b8(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f32m8_b4(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GE,vl); }
inline MaskVector __riscv_vmfge_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GE,vl); }
inline MaskVector __riscv_vmfgt_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f32m2_b16(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f32m8_b4(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GT,vl); }
inline MaskVector __riscv_vmfgt_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_GT,vl); }
inline MaskVector __riscv_vmfle_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f32m2_b16(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f32m4_b8(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f32m8_b4(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LE,vl); }
inline MaskVector __riscv_vmfle_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LE,vl); }
inline MaskVector __riscv_vmflt_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LT,vl); }
inline MaskVector __riscv_vmflt_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_LT,vl); }
inline MaskVector __riscv_vmfne_vf_f16m1_b16(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f16m2_b8(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f16m4_b4(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f16m8_b2(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f16mf2_b32(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f16mf4_b64(const RVVVector& a, salt_float16 b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,16,b),16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f32m1_b32(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f32m2_b16(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f32m4_b8(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f32m8_b4(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f32mf2_b64(const RVVVector& a, float b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,32,b),32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f64m1_b64(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f64m2_b32(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f64m4_b16(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vf_f64m8_b8(const RVVVector& a, double b, size_t vl){ return _gfc_vf(a,_gfc_scalar_bv(g_ctx->tm,64,b),64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,16,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,32,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_NE,vl); }
inline MaskVector __riscv_vmfne_vv_f64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gfc_vv(a,b,64,G_NE,vl); }

} // namespace salt_cvc5
