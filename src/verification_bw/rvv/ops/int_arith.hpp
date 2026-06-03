#pragma once
// RVV integer arithmetic / bitwise / shift — generated complete coverage (bitwuzla).
// vv/vx binary, unary (neg/not/rev8). Shift amount masked to SEW-1 (RVV semantics).
// Signed div-by-zero forced to -1 (SMT bvsdiv differs for negative dividend).
#include "../intrinsics.hpp"
namespace salt {
enum GiaOp { IA_ADD,IA_SUB,IA_AND,IA_OR,IA_XOR,IA_MUL,IA_RSUB,
  IA_MINS,IA_MINU,IA_MAXS,IA_MAXU,IA_MULHS,IA_MULHU,IA_MULHSU,
  IA_SDIV,IA_UDIV,IA_SREM,IA_UREM,IA_SLL,IA_SRL,IA_SRA };
inline Term _gia_lane(TermManager& tm, Term a, Term b, size_t bits, GiaOp op){
  auto K=[&](Kind k,Term x,Term y){return tm.mk_term(k,{x,y});};
  switch(op){
    case IA_ADD: return K(Kind::BV_ADD,a,b);
    case IA_SUB: return K(Kind::BV_SUB,a,b);
    case IA_AND: return K(Kind::BV_AND,a,b);
    case IA_OR:  return K(Kind::BV_OR,a,b);
    case IA_XOR: return K(Kind::BV_XOR,a,b);
    case IA_MUL: return K(Kind::BV_MUL,a,b);
    case IA_RSUB:return K(Kind::BV_SUB,b,a);
    case IA_MINS:return fold_ite(tm,tm.mk_term(Kind::BV_SLE,{a,b}),a,b);
    case IA_MINU:return fold_ite(tm,tm.mk_term(Kind::BV_ULE,{a,b}),a,b);
    case IA_MAXS:return fold_ite(tm,tm.mk_term(Kind::BV_SGE,{a,b}),a,b);
    case IA_MAXU:return fold_ite(tm,tm.mk_term(Kind::BV_UGE,{a,b}),a,b);
    case IA_MULHS:{Term wa=fold_bvsext(tm,bits,a),wb=fold_bvsext(tm,bits,b);
      return fold_bvextract(tm,2*bits-1,bits,tm.mk_term(Kind::BV_MUL,{wa,wb}));}
    case IA_MULHU:{Term wa=fold_bvzext(tm,bits,a),wb=fold_bvzext(tm,bits,b);
      return fold_bvextract(tm,2*bits-1,bits,tm.mk_term(Kind::BV_MUL,{wa,wb}));}
    case IA_MULHSU:{Term wa=fold_bvsext(tm,bits,a),wb=fold_bvzext(tm,bits,b);
      return fold_bvextract(tm,2*bits-1,bits,tm.mk_term(Kind::BV_MUL,{wa,wb}));}
    case IA_SDIV:{Term z=mk_bv_val(tm,bits,0),neg1=mk_bv_val(tm,bits,-1);
      return fold_ite(tm,tm.mk_term(Kind::EQUAL,{b,z}),neg1,tm.mk_term(Kind::BV_SDIV,{a,b}));}
    case IA_UDIV:return K(Kind::BV_UDIV,a,b);
    case IA_SREM:return K(Kind::BV_SREM,a,b);
    case IA_UREM:return K(Kind::BV_UREM,a,b);
    case IA_SLL:{Term sh=tm.mk_term(Kind::BV_AND,{b,mk_bv_val(tm,bits,(int64_t)(bits-1))});
      return tm.mk_term(Kind::BV_SHL,{a,sh});}
    case IA_SRL:{Term sh=tm.mk_term(Kind::BV_AND,{b,mk_bv_val(tm,bits,(int64_t)(bits-1))});
      return tm.mk_term(Kind::BV_SHR,{a,sh});}
    case IA_SRA:{Term sh=tm.mk_term(Kind::BV_AND,{b,mk_bv_val(tm,bits,(int64_t)(bits-1))});
      return tm.mk_term(Kind::BV_ASHR,{a,sh});}
  }
  return a;
}
enum GiaUn { IAU_NEG,IAU_NOT,IAU_REV8 };
inline Term _gia_un_lane(TermManager& tm, Term a, size_t bits, GiaUn op){
  if(op==IAU_NEG) return tm.mk_term(Kind::BV_NEG,{a});
  if(op==IAU_NOT) return tm.mk_term(Kind::BV_NOT,{a});
  size_t nb=bits/8; if(nb<=1) return a;
  Term r=fold_bvextract(tm,7,0,a);
  for(size_t k=1;k<nb;k++) r=fold_bvconcat(tm,r,fold_bvextract(tm,8*k+7,8*k,a));
  return r;
}
inline RVVVector _gia_vv(const RVVVector& a,const RVVVector& b,size_t bits,GiaOp op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gia_lane(tm,a.getElement(i),b.getElement(i),bits,op));
  return RVVVector(tm,bits,r);
}
inline RVVVector _gia_vx(const RVVVector& a,int64_t s,size_t bits,GiaOp op,size_t vl){
  auto& tm=g_ctx->tm; Term sb=mk_bv_val(tm,bits,s); std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gia_lane(tm,a.getElement(i),sb,bits,op));
  return RVVVector(tm,bits,r);
}
inline RVVVector _gia_un(const RVVVector& a,size_t bits,GiaUn op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gia_un_lane(tm,a.getElement(i),bits,op));
  return RVVVector(tm,bits,r);
}

inline RVVVector __riscv_vadd_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vadd_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_ADD,vl); }
inline RVVVector __riscv_vand_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vand_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_AND,vl); }
inline RVVVector __riscv_vdiv_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i32m1(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i32m4(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i32m8(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8m1(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8m2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdiv_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vdivu_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UDIV,vl); }
inline RVVVector __riscv_vmax_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmax_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXS,vl); }
inline RVVVector __riscv_vmaxu_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmaxu_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MAXU,vl); }
inline RVVVector __riscv_vmin_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINS,vl); }
inline RVVVector __riscv_vmin_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINS,vl); }
inline RVVVector __riscv_vminu_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vminu_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MINU,vl); }
inline RVVVector __riscv_vmul_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8m1(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8m2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmul_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MUL,vl); }
inline RVVVector __riscv_vmulh_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i32m1(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i32m4(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i32m8(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8m1(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8m2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulh_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHS,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhsu_vx_i8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHSU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vmulhu_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_MULHU,vl); }
inline RVVVector __riscv_vneg_v_i16m1(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i16m2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i16m4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i16m8(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i16mf2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i16mf4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i32m1(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i32m2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i32m4(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i32m8(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i32mf2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i64m1(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i64m2(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i64m4(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i64m8(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8m1(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8m2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8m4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8m8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8mf2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8mf4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vneg_v_i8mf8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NEG,vl); }
inline RVVVector __riscv_vnot_v_i16m1(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i16m2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i16m4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i16m8(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i16mf2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i16mf4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i32m1(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i32m2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i32m4(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i32m8(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i32mf2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i64m1(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i64m2(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i64m4(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i64m8(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8m1(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8m2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8m4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8m8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8mf2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8mf4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_i8mf8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16m1(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16m2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16m4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16m8(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16mf2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u16mf4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u32m1(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u32m2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u32m4(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u32m8(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u32mf2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u64m1(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u64m2(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u64m4(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u64m8(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8m1(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8m2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8m4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8m8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8mf2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8mf4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vnot_v_u8mf8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_NOT,vl); }
inline RVVVector __riscv_vor_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i32m1(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i32m4(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i32m8(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vor_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_OR,vl); }
inline RVVVector __riscv_vrem_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i32m1(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i32m4(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i32m8(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8m1(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8m2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vrem_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SREM,vl); }
inline RVVVector __riscv_vremu_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vremu_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_UREM,vl); }
inline RVVVector __riscv_vrev8_v_u16m1(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u16m2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u16m4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u16m8(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u16mf2(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u16mf4(const RVVVector& a, size_t vl){ return _gia_un(a,16,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u32m1(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u32m2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u32m4(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u32m8(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u32mf2(const RVVVector& a, size_t vl){ return _gia_un(a,32,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u64m1(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u64m2(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u64m4(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u64m8(const RVVVector& a, size_t vl){ return _gia_un(a,64,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8m1(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8m2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8m4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8m8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8mf2(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8mf4(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrev8_v_u8mf8(const RVVVector& a, size_t vl){ return _gia_un(a,8,IAU_REV8,vl); }
inline RVVVector __riscv_vrsub_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i32m8(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vrsub_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_RSUB,vl); }
inline RVVVector __riscv_vsll_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i16m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i16mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i16mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i32mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i64m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i64m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i64m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i64m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i8m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i8m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i8mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i8mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_i8mf8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u16m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u16m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u16mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u16mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u32mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u64m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u64m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u64m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u64m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u8m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u8m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u8mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u8mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsll_vx_u8mf8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SLL,vl); }
inline RVVVector __riscv_vsra_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i16m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i16m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i16mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i16mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i32mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i64m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i64m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i64m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i64m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsra_vx_i8mf8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRA,vl); }
inline RVVVector __riscv_vsrl_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u16m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u16mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u16mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u32m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u32m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u32mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u64m1(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u64m2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u64m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u64m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u8m4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u8m8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u8mf2(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u8mf4(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsrl_vx_u8mf8(const RVVVector& a, size_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SRL,vl); }
inline RVVVector __riscv_vsub_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vsub_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_SUB,vl); }
inline RVVVector __riscv_vxor_vv_i16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_i8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u16mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u32m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u32m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u32m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u32m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u32mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u64m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u64m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u64m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u64m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8m1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8m2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8m4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8m8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8mf2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8mf4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vv_u8mf8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gia_vv(a,b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16m1(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16m2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16m4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16m8(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16mf2(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i16mf4(const RVVVector& a, int16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i32m1(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i32m2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i32mf2(const RVVVector& a, int32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i64m1(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i64m2(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i64m4(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i64m8(const RVVVector& a, int64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i8m4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i8m8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i8mf2(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i8mf4(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_i8mf8(const RVVVector& a, int8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16m1(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16m2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16m4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16m8(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16mf2(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u16mf4(const RVVVector& a, uint16_t b, size_t vl){ return _gia_vx(a,(int64_t)b,16,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u32m1(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u32m4(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u32m8(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u32mf2(const RVVVector& a, uint32_t b, size_t vl){ return _gia_vx(a,(int64_t)b,32,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u64m1(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u64m2(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u64m4(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u64m8(const RVVVector& a, uint64_t b, size_t vl){ return _gia_vx(a,(int64_t)b,64,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8m1(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8m2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8m4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8m8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8mf2(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8mf4(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }
inline RVVVector __riscv_vxor_vx_u8mf8(const RVVVector& a, uint8_t b, size_t vl){ return _gia_vx(a,(int64_t)b,8,IA_XOR,vl); }

} // namespace salt
