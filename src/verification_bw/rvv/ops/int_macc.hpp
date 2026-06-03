#pragma once
// RVV integer multiply-accumulate (same-width) — generated (ns salt).
// vmacc: vd+x*y  vnmsac: vd-x*y  vmadd: x*vd+y  vnmsub: y-x*vd
#include "../intrinsics.hpp"
namespace salt {
enum MaccOp { M_MACC,M_NMSAC,M_MADD,M_NMSUB };
inline Term _gmacc_lane(TermManager& tm, Term vd, Term x, Term y, MaccOp op){
  auto MUL=[&](Term p,Term q){return tm.mk_term(Kind::BV_MUL,{p,q});};
  auto ADD=[&](Term p,Term q){return tm.mk_term(Kind::BV_ADD,{p,q});};
  auto SUB=[&](Term p,Term q){return tm.mk_term(Kind::BV_SUB,{p,q});};
  switch(op){
    case M_MACC:  return ADD(vd, MUL(x,y));
    case M_NMSAC: return SUB(vd, MUL(x,y));
    case M_MADD:  return ADD(MUL(x,vd), y);
    case M_NMSUB: return SUB(y, MUL(x,vd));
  } return vd;
}
inline RVVVector _gmacc_vv(const RVVVector& vd,const RVVVector& x,const RVVVector& y,size_t bits,MaccOp op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gmacc_lane(tm,vd.getElement(i),x.getElement(i),y.getElement(i),op));
  return RVVVector(tm,bits,r);
}
inline RVVVector _gmacc_vx(const RVVVector& vd,int64_t s,const RVVVector& y,size_t bits,MaccOp op,size_t vl){
  auto& tm=g_ctx->tm; Term sx=mk_bv_val(tm,bits,s); std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gmacc_lane(tm,vd.getElement(i),sx,y.getElement(i),op));
  return RVVVector(tm,bits,r);
}
inline RVVVector __riscv_vmacc_vv_i16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_i8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vv_u8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16m1(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16m2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16m4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16m8(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16mf2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i16mf4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i32mf2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i64m1(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i64m2(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i64m4(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i64m8(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8m1(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8m2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8m4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8m8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8mf2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8mf4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_i8mf8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16m1(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16m2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16m4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16m8(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16mf2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u16mf4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u32m1(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u32m2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u32m4(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u32m8(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u32mf2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u64m1(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u64m2(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u64m4(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u64m8(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8m1(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8m2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8m4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8m8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8mf2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8mf4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmacc_vx_u8mf8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MACC,vl); }
inline RVVVector __riscv_vmadd_vv_i16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_i8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vv_u8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16m1(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16m2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16m4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16m8(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16mf2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i16mf4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i32m1(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i32m2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i32m4(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i32m8(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i32mf2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i64m1(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i64m2(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i64m4(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i64m8(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8m1(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8m2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8m4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8m8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8mf2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8mf4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_i8mf8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16m1(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16m2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16m4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16m8(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16mf2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u16mf4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u32m1(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u32m2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u32m4(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u32m8(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u32mf2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u64m1(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u64m2(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u64m4(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u64m8(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8m1(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8m2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8m4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8m8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8mf2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8mf4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vmadd_vx_u8mf8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_MADD,vl); }
inline RVVVector __riscv_vnmsac_vv_i16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_i8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vv_u8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16m1(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16m2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16m4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16m8(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16mf2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i16mf4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i32m1(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i32m2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i32m4(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i32m8(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i32mf2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i64m1(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i64m2(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i64m4(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i64m8(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8m1(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8m2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8m4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8m8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8mf2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8mf4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_i8mf8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16m1(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16m2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16m4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16m8(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16mf2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u16mf4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u32m1(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u32m2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u32m4(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u32m8(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u32mf2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u64m1(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u64m2(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u64m4(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u64m8(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8m1(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8m2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8m4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8m8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8mf2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8mf4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsac_vx_u8mf8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSAC,vl); }
inline RVVVector __riscv_vnmsub_vv_i16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_i8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u16mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u32m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u32m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u32m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u32m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u32mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u64m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u64m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u64m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u64m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8m1(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8m2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8m4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8m8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8mf2(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8mf4(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vv_u8mf8(const RVVVector& vd, const RVVVector& x, const RVVVector& y, size_t vl){ return _gmacc_vv(vd,x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16m1(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16m2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16m4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16m8(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16mf2(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i16mf4(const RVVVector& vd, int16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i32m1(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i32m2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i32m4(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i32m8(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i32mf2(const RVVVector& vd, int32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i64m1(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i64m2(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i64m4(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i64m8(const RVVVector& vd, int64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8m1(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8m2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8m4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8m8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8mf2(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8mf4(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_i8mf8(const RVVVector& vd, int8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16m1(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16m2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16m4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16m8(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16mf2(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u16mf4(const RVVVector& vd, uint16_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,16,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u32m1(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u32m2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u32m4(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u32m8(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u32mf2(const RVVVector& vd, uint32_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,32,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u64m1(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u64m2(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u64m4(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u64m8(const RVVVector& vd, uint64_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,64,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8m1(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8m2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8m4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8m8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8mf2(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8mf4(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
inline RVVVector __riscv_vnmsub_vx_u8mf8(const RVVVector& vd, uint8_t x, const RVVVector& y, size_t vl){ return _gmacc_vx(vd,(int64_t)x,y,8,M_NMSUB,vl); }
} // namespace salt
