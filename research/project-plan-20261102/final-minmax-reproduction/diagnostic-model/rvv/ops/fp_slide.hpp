#pragma once
// RVV FP slide/move/merge: vfslide1up/down, vfmv_v_f/s_f/f_s, vfmerge_vfm (cvc5).
// Scalars are NaN-boxed implicitly; lanes hold raw IEEE bits in a BV.
#include "../intrinsics.hpp"
namespace salt_cvc5 {

// scalar f16/f32/f64 -> raw IEEE BV (p bits)
inline Term _gfs_scalar_bv(TermManager& tm, size_t p, salt_float16 v){ return rvv_store_fp16_as_bv(tm, mk_fp16_from_f16(tm,v)); }
inline Term _gfs_scalar_bv(TermManager& tm, size_t p, float v){ return rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm,v)); }
inline Term _gfs_scalar_bv(TermManager& tm, size_t p, double v){ uint64_t b; std::memcpy(&b,&v,8); return tm.mkBitVector(64,(uint64_t)b); }

// vfmv_v_f: broadcast scalar to all lanes.
inline RVVVector _gfs_mv_v(Term sbv, size_t p, size_t vl){
  auto& tm=g_ctx->tm;
  return RVVVector(tm,p,std::vector<Term>(vl,sbv));
}
// vfmv_s_f: element 0 = scalar; remaining tail-agnostic (0).
inline RVVVector _gfs_mv_s(Term sbv, size_t p, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(i==0?sbv:mk_bv_val(tm,p,0));
  return RVVVector(tm,p,r);
}
// vfmerge_vfm: res[i] = mask[i] ? scalar : op1[i].
inline RVVVector _gfs_merge(const RVVVector& a, Term sbv, size_t p, const MaskVector& mask, size_t vl){
  auto& tm=g_ctx->tm; Term one=mk_bv_val(tm,1,1); std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term sel=fold_eq(tm,mask.getBit(i),one);
    r.push_back(fold_ite(tm,sel,sbv,a.getElement(i)));
  }
  return RVVVector(tm,p,r);
}
// vfslide1up: res[0]=scalar; res[i]=src[i-1].
inline RVVVector _gfs_slide1up(const RVVVector& src, Term sbv, size_t p, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(i==0?sbv:src.getElement(i-1));
  return RVVVector(tm,p,r);
}
// vfslide1down: res[i]=src[i+1]; res[vl-1]=scalar.
inline RVVVector _gfs_slide1down(const RVVVector& src, Term sbv, size_t p, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back((i+1<vl)?src.getElement(i+1):sbv);
  return RVVVector(tm,p,r);
}

inline RVVVector __riscv_vfmerge_vfm_f16m1(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f16m2(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f16m4(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f16m8(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f16mf2(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f16mf4(const RVVVector& a, salt_float16 b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,16,b),16,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f32mf2(const RVVVector& a, float b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,32,b),32,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f64m1(const RVVVector& a, double b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,64,b),64,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f64m2(const RVVVector& a, double b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,64,b),64,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f64m4(const RVVVector& a, double b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,64,b),64,mask,vl); }
inline RVVVector __riscv_vfmerge_vfm_f64m8(const RVVVector& a, double b, const MaskVector& mask, size_t vl){ return _gfs_merge(a,_gfs_scalar_bv(g_ctx->tm,64,b),64,mask,vl); }
inline salt_float16 __riscv_vfmv_f_s_f16m1_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline salt_float16 __riscv_vfmv_f_s_f16m2_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline salt_float16 __riscv_vfmv_f_s_f16m4_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline salt_float16 __riscv_vfmv_f_s_f16m8_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline salt_float16 __riscv_vfmv_f_s_f16mf2_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline salt_float16 __riscv_vfmv_f_s_f16mf4_f16(const RVVVector& src){ (void)src; return salt_float16((uint16_t)0); }
inline float __riscv_vfmv_f_s_f32m8_f32(const RVVVector& src){ (void)src; return 0.0f; }
inline float __riscv_vfmv_f_s_f32mf2_f32(const RVVVector& src){ (void)src; return 0.0f; }
inline double __riscv_vfmv_f_s_f64m1_f64(const RVVVector& src){ (void)src; return 0.0; }
inline double __riscv_vfmv_f_s_f64m2_f64(const RVVVector& src){ (void)src; return 0.0; }
inline double __riscv_vfmv_f_s_f64m4_f64(const RVVVector& src){ (void)src; return 0.0; }
inline double __riscv_vfmv_f_s_f64m8_f64(const RVVVector& src){ (void)src; return 0.0; }
inline RVVVector __riscv_vfmv_s_f_f16m1(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f16m2(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f16m4(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f16m8(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f16mf2(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f16mf4(salt_float16 src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_s_f_f32m1(float src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_s_f_f32m2(float src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_s_f_f32m4(float src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_s_f_f32m8(float src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_s_f_f32mf2(float src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_s_f_f64m1(double src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_s_f_f64m2(double src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_s_f_f64m4(double src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_s_f_f64m8(double src, size_t vl){ return _gfs_mv_s(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_v_f_f16m1(salt_float16 src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_v_f_f16m2(salt_float16 src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_v_f_f16m4(salt_float16 src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_v_f_f16mf2(salt_float16 src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_v_f_f16mf4(salt_float16 src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,16,src),16,vl); }
inline RVVVector __riscv_vfmv_v_f_f32mf2(float src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,32,src),32,vl); }
inline RVVVector __riscv_vfmv_v_f_f64m1(double src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_v_f_f64m2(double src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_v_f_f64m4(double src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfmv_v_f_f64m8(double src, size_t vl){ return _gfs_mv_v(_gfs_scalar_bv(g_ctx->tm,64,src),64,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16m1(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16m2(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16m4(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16m8(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16mf2(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f16mf4(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1down_vf_f32m1(const RVVVector& src, float value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1down_vf_f32m8(const RVVVector& src, float value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1down_vf_f32mf2(const RVVVector& src, float value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1down_vf_f64m1(const RVVVector& src, double value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1down_vf_f64m2(const RVVVector& src, double value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1down_vf_f64m4(const RVVVector& src, double value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1down_vf_f64m8(const RVVVector& src, double value, size_t vl){ return _gfs_slide1down(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16m1(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16m2(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16m4(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16m8(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16mf2(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f16mf4(const RVVVector& src, salt_float16 value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,16,value),16,vl); }
inline RVVVector __riscv_vfslide1up_vf_f32m1(const RVVVector& src, float value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1up_vf_f32m8(const RVVVector& src, float value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1up_vf_f32mf2(const RVVVector& src, float value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,32,value),32,vl); }
inline RVVVector __riscv_vfslide1up_vf_f64m1(const RVVVector& src, double value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1up_vf_f64m2(const RVVVector& src, double value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1up_vf_f64m4(const RVVVector& src, double value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }
inline RVVVector __riscv_vfslide1up_vf_f64m8(const RVVVector& src, double value, size_t vl){ return _gfs_slide1up(src,_gfs_scalar_bv(g_ctx->tm,64,value),64,vl); }

} // namespace salt_cvc5
