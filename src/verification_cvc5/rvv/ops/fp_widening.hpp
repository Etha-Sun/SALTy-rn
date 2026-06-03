#pragma once
// RVV widening FP: vfwadd/vfwsub/vfwmul (vv/vf/wv/wf), vfwmacc/vfwnmacc/vfwmsac/vfwnmsac (vv/vf),
// vfwredusum/vfwredosum. Narrow source SEW widens to 2*SEW (f16->f32, f32->f64), exact via
// TO_FP_FROM_FP; the FMA/add then rounds once. Lanes hold raw IEEE bits.
//   w-forms: first operand is already wide. MAC: product=vs1*vs2 (widened), accumulate wide vd.
//   n* negates the product; *s* negates the accumulator (RVV sign table).
#include "../intrinsics.hpp"
namespace salt_cvc5 {

enum GfwBin { GFW_ADD, GFW_SUB, GFW_MUL };

// raw BV (narrow/wide) -> FP at its own precision.
inline Term _gfw_load_fp(TermManager& tm, size_t p, Term bv){
  if(p==16) return rvv_load_as_fp16(tm,bv);
  if(p==32) return rvv_load_as_fp32(tm,bv);
  return rvv_load_as_fp64(tm,bv);
}
inline Term _gfw_store_wide(TermManager& tm, size_t wp, Term fp){
  if(wp==32) return rvv_store_fp32_as_bv(tm,fp);
  return rvv_store_fp64_as_bv(tm,fp);
}
// widen an FP term from narrow precision to wide precision (exact).
inline Term _gfw_widen(TermManager& tm, size_t np, Term fp_narrow){
  Term rm=g_ctx->fp.rounding_mode;
  if(np==16){ Op c=tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP,{8,24}); return tm.mkTerm(c,{rm,fp_narrow}); }
  Op c=tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP,{11,53}); return tm.mkTerm(c,{rm,fp_narrow});
}
// load a narrow BV lane and widen it to a wide FP term.
inline Term _gfw_load_widen(TermManager& tm, size_t np, Term bv_narrow){
  return _gfw_widen(tm,np,_gfw_load_fp(tm,np,bv_narrow));
}
// narrow scalar -> wide FP term.
inline Term _gfw_scalar_widen(TermManager& tm, salt_float16 v){ return _gfw_widen(tm,16,mk_fp16_from_f16(tm,v)); }
inline Term _gfw_scalar_widen(TermManager& tm, float v){ return _gfw_widen(tm,32,mk_fp32_from_float(tm,v)); }
inline Term _gfw_neg(TermManager& tm, Term fp){ return tm.mkTerm(Kind::FLOATINGPOINT_NEG,{fp}); }

inline Term _gfw_bin(TermManager& tm, Term af, Term bf, GfwBin op){
  Term rm=g_ctx->fp.rounding_mode;
  if(op==GFW_ADD) return tm.mkTerm(Kind::FLOATINGPOINT_ADD,{rm,af,bf});
  if(op==GFW_SUB) return tm.mkTerm(Kind::FLOATINGPOINT_SUB,{rm,af,bf});
  return tm.mkTerm(Kind::FLOATINGPOINT_MULT,{rm,af,bf});
}

// vv/vf/wv/wf widening add/sub/mul. a_wide/b_wide flag whether each operand
// term is already a wide FP term (true) or a narrow BV lane to load+widen.
inline RVVVector _gfw_binop_vv(const RVVVector& op1,const RVVVector& op2,
                              size_t np,size_t wp,bool op1_wide,GfwBin op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term a = op1_wide ? _gfw_load_fp(tm,wp,op1.getElement(i)) : _gfw_load_widen(tm,np,op1.getElement(i));
    Term b = _gfw_load_widen(tm,np,op2.getElement(i));
    r.push_back(_gfw_store_wide(tm,wp,_gfw_bin(tm,a,b,op)));
  }
  return RVVVector(tm,wp,r);
}
inline RVVVector _gfw_binop_vf(const RVVVector& op1,Term s_wide,
                              size_t np,size_t wp,bool op1_wide,GfwBin op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term a = op1_wide ? _gfw_load_fp(tm,wp,op1.getElement(i)) : _gfw_load_widen(tm,np,op1.getElement(i));
    r.push_back(_gfw_store_wide(tm,wp,_gfw_bin(tm,a,s_wide,op)));
  }
  return RVVVector(tm,wp,r);
}

// widening fused MAC: res = (+/-)(widen(vs1)*widen(vs2)) (+/-) vd, single rounding.
inline RVVVector _gfw_macc_vv(const RVVVector& vd,const RVVVector& vs1,const RVVVector& vs2,
                             size_t np,size_t wp,bool neg_prod,bool neg_acc,size_t vl){
  auto& tm=g_ctx->tm; Term rm=g_ctx->fp.rounding_mode; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term a=_gfw_load_widen(tm,np,vs1.getElement(i));
    Term b=_gfw_load_widen(tm,np,vs2.getElement(i));
    Term c=_gfw_load_fp(tm,wp,vd.getElement(i));
    if(neg_prod) a=_gfw_neg(tm,a);
    if(neg_acc)  c=_gfw_neg(tm,c);
    Term res=tm.mkTerm(Kind::FLOATINGPOINT_FMA,{rm,a,b,c});
    r.push_back(_gfw_store_wide(tm,wp,res));
  }
  return RVVVector(tm,wp,r);
}
inline RVVVector _gfw_macc_vf(const RVVVector& vd,Term s_wide,const RVVVector& vs2,
                             size_t np,size_t wp,bool neg_prod,bool neg_acc,size_t vl){
  auto& tm=g_ctx->tm; Term rm=g_ctx->fp.rounding_mode; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term a=s_wide;
    Term b=_gfw_load_widen(tm,np,vs2.getElement(i));
    Term c=_gfw_load_fp(tm,wp,vd.getElement(i));
    if(neg_prod) a=_gfw_neg(tm,a);
    if(neg_acc)  c=_gfw_neg(tm,c);
    Term res=tm.mkTerm(Kind::FLOATINGPOINT_FMA,{rm,a,b,c});
    r.push_back(_gfw_store_wide(tm,wp,res));
  }
  return RVVVector(tm,wp,r);
}

// widening sum reduction: acc = scalar[0] (already wide); acc += widen(vector[i]).
// Result element 0 = acc, remaining lanes 0 (only lane 0 meaningful).
inline RVVVector _gfw_redsum(const RVVVector& vec,const RVVVector& scalar,
                            size_t np,size_t wp,size_t vl){
  auto& tm=g_ctx->tm; Term rm=g_ctx->fp.rounding_mode;
  Term acc=_gfw_load_fp(tm,wp,scalar.getElement(0));
  for(size_t i=0;i<vl;i++){
    Term w=_gfw_load_widen(tm,np,vec.getElement(i));
    acc=tm.mkTerm(Kind::FLOATINGPOINT_ADD,{rm,acc,w});
  }
  std::vector<Term> r; r.push_back(_gfw_store_wide(tm,wp,acc));
  return RVVVector(tm,wp,r);
}

inline RVVVector __riscv_vfwadd_vf_f32m1(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f32m2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f32m4(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f32m8(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f32mf2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f64m1(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f64m2(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f64m4(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vf_f64m8(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_vv_f64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f32m1(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f32m2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f32m4(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f32m8(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f32mf2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f64m1(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f64m2(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f64m4(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wf_f64m8(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwadd_wv_f64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_ADD,vl); }
inline RVVVector __riscv_vfwmacc_vf_f32m1(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f32m2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f32m4(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f32m8(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f32mf2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f64m1(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f64m2(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f64m4(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vf_f64m8(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmacc_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,false,vl); }
inline RVVVector __riscv_vfwmsac_vf_f32m1(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f32m2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f32m4(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f32m8(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f32mf2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f64m1(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f64m2(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f64m4(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vf_f64m8(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmsac_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,false,true,vl); }
inline RVVVector __riscv_vfwmul_vf_f32m1(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f32m2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f32m4(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f32m8(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f32mf2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f64m1(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f64m2(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f64m4(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vf_f64m8(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwmul_vv_f64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_MUL,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f32m1(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f32m2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f32m4(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f32m8(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f32mf2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f64m1(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f64m2(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f64m4(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vf_f64m8(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmacc_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,true,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f32m1(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f32m2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f32m4(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f32m8(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f32mf2(const RVVVector& vd, salt_float16 vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f64m1(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f64m2(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f64m4(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vf_f64m8(const RVVVector& vd, float vs1, const RVVVector& vs2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_macc_vf(vd,_gfw_scalar_widen(tm,vs1),vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f32m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f32m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f32m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f32m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f32mf2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,16,32,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f64m1(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f64m2(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f64m4(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwnmsac_vv_f64m8(const RVVVector& vd, const RVVVector& vs1, const RVVVector& vs2, size_t vl){ return _gfw_macc_vv(vd,vs1,vs2,32,64,true,false,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16m1_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16m2_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16m4_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16m8_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16mf2_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f16mf4_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredosum_vs_f32m1_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredosum_vs_f32m2_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredosum_vs_f32m4_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredosum_vs_f32m8_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredosum_vs_f32mf2_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16m1_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16m2_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16m4_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16m8_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16mf2_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f16mf4_f32m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,16,32,vl); }
inline RVVVector __riscv_vfwredusum_vs_f32m1_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredusum_vs_f32m2_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredusum_vs_f32m4_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredusum_vs_f32m8_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwredusum_vs_f32mf2_f64m1(const RVVVector& vector, const RVVVector& scalar, size_t vl){ return _gfw_redsum(vector,scalar,32,64,vl); }
inline RVVVector __riscv_vfwsub_vf_f32m1(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f32m2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f32m4(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f32m8(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f32mf2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f64m1(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f64m2(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f64m4(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vf_f64m8(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_vv_f64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,false,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f32m1(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f32m2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f32m4(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f32m8(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f32mf2(const RVVVector& op1, salt_float16 op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f64m1(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f64m2(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f64m4(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wf_f64m8(const RVVVector& op1, float op2, size_t vl){ auto& tm=g_ctx->tm; return _gfw_binop_vf(op1,_gfw_scalar_widen(tm,op2),32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,16,32,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_SUB,vl); }
inline RVVVector __riscv_vfwsub_wv_f64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfw_binop_vv(op1,op2,32,64,true,GFW_SUB,vl); }

} // namespace salt_cvc5
