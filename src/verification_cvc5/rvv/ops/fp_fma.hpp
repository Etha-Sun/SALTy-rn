#pragma once
// RVV same-width fused multiply-add: vfmacc/vfnmacc/vfmsac/vfnmsac/vfmadd/vfnmadd/vfmsub/vfnmsub
// vv & vf over f16/f32/f64. Single fused rounding (FLOATINGPOINT_FMA). Lanes hold raw IEEE bits.
//   macc/msac/nmacc/nmsac: product = vs1*vs2, accumulate vd
//   madd/msub/nmadd/nmsub: product = vs1*vd,  accumulate vs2
//   n* negates the product; *s* (msac/msub) negates the accumulator (per RVV sign table).
#include "../intrinsics.hpp"
namespace salt_cvc5 {

// raw BV <-> FP for a given precision (16/32/64).
inline Term _gffma_load_fp(TermManager& tm, size_t p, Term bv){
  if(p==16) return rvv_load_as_fp16(tm,bv);
  if(p==32) return rvv_load_as_fp32(tm,bv);
  return rvv_load_as_fp64(tm,bv);
}
inline Term _gffma_store_fp(TermManager& tm, size_t p, Term fp){
  if(p==16) return rvv_store_fp16_as_bv(tm,fp);
  if(p==32) return rvv_store_fp32_as_bv(tm,fp);
  return rvv_store_fp64_as_bv(tm,fp);
}
// scalar (f16/f32/f64) -> FP-typed term.
inline Term _gffma_scalar_fp(TermManager& tm, salt_float16 v){ return mk_fp16_from_f16(tm,v); }
inline Term _gffma_scalar_fp(TermManager& tm, float v){ return mk_fp32_from_float(tm,v); }
inline Term _gffma_scalar_fp(TermManager& tm, double v){
  uint64_t bits; std::memcpy(&bits,&v,8);
  return rvv_load_as_fp64(tm, tm.mkBitVector(64,(uint64_t)bits));
}
inline Term _gffma_neg(TermManager& tm, Term fp){ return tm.mkTerm(Kind::FLOATINGPOINT_NEG,{fp}); }

// One fused-FMA lane: res = (+/-)(x*y) (+/-) z, computed with a single rounding.
inline Term _gffma_lane(TermManager& tm, size_t p, Term x, Term y, Term z,
                        bool neg_prod, bool neg_acc){
  Term rm=g_ctx->fp.rounding_mode;
  Term a = neg_prod ? _gffma_neg(tm,x) : x;   // negate product by negating one factor
  Term c = neg_acc  ? _gffma_neg(tm,z) : z;
  return tm.mkTerm(Kind::FLOATINGPOINT_FMA,{rm,a,y,c});
}

// vv: product factors (vs1,vs2)|(vs1,vd); accumulator vd|vs2.
inline RVVVector _gffma_vv(const RVVVector& vd,const RVVVector& vs1,const RVVVector& vs2,
                          size_t p,bool mul_vd,bool neg_prod,bool neg_acc,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term d=_gffma_load_fp(tm,p,vd.getElement(i));
    Term s1=_gffma_load_fp(tm,p,vs1.getElement(i));
    Term s2=_gffma_load_fp(tm,p,vs2.getElement(i));
    Term x,y,z;
    if(mul_vd){ x=s1; y=d; z=s2; } else { x=s1; y=s2; z=d; }
    r.push_back(_gffma_store_fp(tm,p,_gffma_lane(tm,p,x,y,z,neg_prod,neg_acc)));
  }
  return RVVVector(tm,p,r);
}
// vf: scalar rs1 replaces vs1.
inline RVVVector _gffma_vf(const RVVVector& vd,Term rs1_fp,const RVVVector& vs2,
                          size_t p,bool mul_vd,bool neg_prod,bool neg_acc,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term d=_gffma_load_fp(tm,p,vd.getElement(i));
    Term s2=_gffma_load_fp(tm,p,vs2.getElement(i));
    Term x,y,z;
    if(mul_vd){ x=rs1_fp; y=d; z=s2; } else { x=rs1_fp; y=s2; z=d; }
    r.push_back(_gffma_store_fp(tm,p,_gffma_lane(tm,p,x,y,z,neg_prod,neg_acc)));
  }
  return RVVVector(tm,p,r);
}

inline RVVVector __riscv_vfmacc_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmacc_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmadd_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,false,vl); }
inline RVVVector __riscv_vfmsac_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsac_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfmsub_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,false,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmacc_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmadd_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,true,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsac_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,false,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16m1(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16m2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16m4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16m8(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16mf2(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f16mf4(const RVVVector& vd, salt_float16 rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f32m1(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f32m2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f32m4(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f32m8(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f32mf2(const RVVVector& vd, float rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f64m1(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f64m2(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f64m4(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vf_f64m8(const RVVVector& vd, double rs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gffma_vf(vd,_gffma_scalar_fp(tm,rs1),vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f16mf4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,16,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,32,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,false,vl); }
inline RVVVector __riscv_vfnmsub_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gffma_vv(vd,vs1,vs2,64,true,true,false,vl); }

} // namespace salt_cvc5
