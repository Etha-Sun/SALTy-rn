#pragma once
// RVV narrowing shifts/convert (source 2*SEW -> result SEW) — generated (ns salt_cvc5).
#include "../intrinsics.hpp"
namespace salt_cvc5 {
inline RVVVector _gn_sh_wv(const RVVVector& a,const RVVVector& sh,size_t sew,bool arith,size_t vl){
  auto& tm=g_ctx->tm; size_t w=2*sew; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term s=fold_bvzext(tm,w-sew,sh.getElement(i));
    Term m=tm.mkTerm(Kind::BITVECTOR_AND,{s,mk_bv_val(tm,w,(int64_t)(w-1))});
    Term v=tm.mkTerm(arith?Kind::BITVECTOR_ASHR:Kind::BITVECTOR_LSHR,{a.getElement(i),m});
    r.push_back(fold_bvextract(tm,sew-1,0,v));
  }
  return RVVVector(tm,sew,r);
}
inline RVVVector _gn_sh_wx(const RVVVector& a,size_t shift,size_t sew,bool arith,size_t vl){
  auto& tm=g_ctx->tm; size_t w=2*sew; Term m=mk_bv_val(tm,w,(int64_t)(shift&(w-1)));
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term v=tm.mkTerm(arith?Kind::BITVECTOR_ASHR:Kind::BITVECTOR_LSHR,{a.getElement(i),m});
    r.push_back(fold_bvextract(tm,sew-1,0,v));
  }
  return RVVVector(tm,sew,r);
}
inline RVVVector _gn_trunc(const RVVVector& a,size_t sew,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(fold_bvextract(tm,sew-1,0,a.getElement(i)));
  return RVVVector(tm,sew,r);
}
inline RVVVector __riscv_vncvt_x_x_w_i16m1(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i16mf2(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i16mf4(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i32m1(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i32m2(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i32m4(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i32mf2(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i8m4(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i8mf2(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i8mf4(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_i8mf8(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u16m1(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u16m2(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u16m4(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u16mf4(const RVVVector& a, size_t vl){ return _gn_trunc(a,16,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u32m1(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u32m2(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u32m4(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u32mf2(const RVVVector& a, size_t vl){ return _gn_trunc(a,32,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u8m2(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u8m4(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u8mf2(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u8mf4(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vncvt_x_x_w_u8mf8(const RVVVector& a, size_t vl){ return _gn_trunc(a,8,vl); }
inline RVVVector __riscv_vnsra_wv_i16m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,true,vl); }
inline RVVVector __riscv_vnsra_wv_i16m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,true,vl); }
inline RVVVector __riscv_vnsra_wv_i16m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,true,vl); }
inline RVVVector __riscv_vnsra_wv_i16mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,true,vl); }
inline RVVVector __riscv_vnsra_wv_i16mf4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,true,vl); }
inline RVVVector __riscv_vnsra_wv_i32m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,true,vl); }
inline RVVVector __riscv_vnsra_wv_i32m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,true,vl); }
inline RVVVector __riscv_vnsra_wv_i32m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,true,vl); }
inline RVVVector __riscv_vnsra_wv_i32mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8mf4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wv_i8mf8(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,true,vl); }
inline RVVVector __riscv_vnsra_wx_i16m1(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,true,vl); }
inline RVVVector __riscv_vnsra_wx_i16mf2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,true,vl); }
inline RVVVector __riscv_vnsra_wx_i16mf4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,true,vl); }
inline RVVVector __riscv_vnsra_wx_i32m1(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,true,vl); }
inline RVVVector __riscv_vnsra_wx_i32m2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,true,vl); }
inline RVVVector __riscv_vnsra_wx_i32m4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,true,vl); }
inline RVVVector __riscv_vnsra_wx_i32mf2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,true,vl); }
inline RVVVector __riscv_vnsra_wx_i8m4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,true,vl); }
inline RVVVector __riscv_vnsra_wx_i8mf2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,true,vl); }
inline RVVVector __riscv_vnsra_wx_i8mf4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,true,vl); }
inline RVVVector __riscv_vnsra_wx_i8mf8(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,true,vl); }
inline RVVVector __riscv_vnsrl_wv_u16m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u16m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u16m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u16mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u16mf4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,16,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u32m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u32m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u32m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u32mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,32,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8m1(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8m2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8m4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8mf2(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8mf4(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wv_u8mf8(const RVVVector& a, const RVVVector& sh, size_t vl){ return _gn_sh_wv(a,sh,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u16m2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u16m4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u16mf4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,16,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u32m1(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u32m2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u32m4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u32mf2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,32,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8m1(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8m2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8m4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8mf2(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8mf4(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
inline RVVVector __riscv_vnsrl_wx_u8mf8(const RVVVector& a, size_t shift, size_t vl){ return _gn_sh_wx(a,shift,8,false,vl); }
} // namespace salt_cvc5
