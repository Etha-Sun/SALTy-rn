#pragma once
// RVV integer compare -> mask — generated (ns salt_cvc5). Signed/unsigned per op suffix.
#include "../intrinsics.hpp"
namespace salt_cvc5 {
enum CmpOp { C_EQ,C_NE,C_SLT,C_ULT,C_SLE,C_ULE,C_SGT,C_UGT,C_SGE,C_UGE };
inline Term _gcmp_lane(TermManager& tm, Term a, Term b, CmpOp op){
  Term one=mk_bv_val(tm,1,1), zero=mk_bv_val(tm,1,0), c;
  switch(op){
    case C_EQ:  c=tm.mkTerm(Kind::EQUAL,{a,b}); break;
    case C_NE:  return fold_ite(tm,tm.mkTerm(Kind::EQUAL,{a,b}),zero,one);
    case C_SLT: c=tm.mkTerm(Kind::BITVECTOR_SLT,{a,b}); break;
    case C_ULT: c=tm.mkTerm(Kind::BITVECTOR_ULT,{a,b}); break;
    case C_SLE: c=tm.mkTerm(Kind::BITVECTOR_SLE,{a,b}); break;
    case C_ULE: c=tm.mkTerm(Kind::BITVECTOR_ULE,{a,b}); break;
    case C_SGT: c=tm.mkTerm(Kind::BITVECTOR_SGT,{a,b}); break;
    case C_UGT: c=tm.mkTerm(Kind::BITVECTOR_UGT,{a,b}); break;
    case C_SGE: c=tm.mkTerm(Kind::BITVECTOR_SGE,{a,b}); break;
    case C_UGE: c=tm.mkTerm(Kind::BITVECTOR_UGE,{a,b}); break;
    default: c=tm.mkTerm(Kind::EQUAL,{a,b});
  }
  return fold_ite(tm,c,one,zero);
}
inline MaskVector _gcmp_vv(const RVVVector& a,const RVVVector& b,CmpOp op,size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gcmp_lane(tm,a.getElement(i),b.getElement(i),op));
  return MaskVector(tm,r);
}
inline MaskVector _gcmp_vx(const RVVVector& a,int64_t s,size_t bits,CmpOp op,size_t vl){
  auto& tm=g_ctx->tm; Term sb=mk_bv_val(tm,bits,s); std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++) r.push_back(_gcmp_lane(tm,a.getElement(i),sb,op));
  return MaskVector(tm,r);
}
inline MaskVector __riscv_vmseq_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16m4_b4(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i32m8_b4(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u32m4_b8(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8m1_b8(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmseq_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_EQ,vl); }
inline MaskVector __riscv_vmsge_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16m4_b4(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i32m8_b4(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsge_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16m1_b16(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u32m1_b32(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u32m2_b16(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u32m4_b8(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8m1_b8(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgeu_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGE,vl); }
inline MaskVector __riscv_vmsgt_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16m4_b4(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i32m8_b4(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgt_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16m1_b16(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u32m1_b32(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u32m2_b16(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u32m4_b8(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8m1_b8(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsgtu_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_UGT,vl); }
inline MaskVector __riscv_vmsle_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16m4_b4(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i32m8_b4(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsle_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16m1_b16(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u32m1_b32(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u32m2_b16(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u32m4_b8(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8m1_b8(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmsleu_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULE,vl); }
inline MaskVector __riscv_vmslt_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmslt_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_SLT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u32m1_b32(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u32m2_b16(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsltu_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_ULT,vl); }
inline MaskVector __riscv_vmsne_vv_i16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_i8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16m1_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16m2_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16m4_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16m8_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16mf2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u16mf4_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u32m1_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u32m2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u32m4_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u32m8_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u32mf2_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u64m1_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u64m2_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u64m4_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u64m8_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8m1_b8(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8m2_b4(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8m4_b2(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8m8_b1(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8mf2_b16(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8mf4_b32(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vv_u8mf8_b64(const RVVVector& a, const RVVVector& b, size_t vl){ return _gcmp_vv(a,b,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16m1_b16(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16m2_b8(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16m4_b4(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16m8_b2(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16mf2_b32(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i16mf4_b64(const RVVVector& a, int16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i32m1_b32(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i32m4_b8(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i32m8_b4(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i32mf2_b64(const RVVVector& a, int32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i64m1_b64(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i64m2_b32(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i64m4_b16(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i64m8_b8(const RVVVector& a, int64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8m1_b8(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8m2_b4(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8m4_b2(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8m8_b1(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8mf2_b16(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8mf4_b32(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_i8mf8_b64(const RVVVector& a, int8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u16m2_b8(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u16m4_b4(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u16m8_b2(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u16mf2_b32(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u16mf4_b64(const RVVVector& a, uint16_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,16,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u32m2_b16(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u32m4_b8(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u32m8_b4(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u32mf2_b64(const RVVVector& a, uint32_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,32,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u64m1_b64(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u64m2_b32(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u64m4_b16(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u64m8_b8(const RVVVector& a, uint64_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,64,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8m1_b8(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8m2_b4(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8m4_b2(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8m8_b1(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8mf2_b16(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8mf4_b32(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
inline MaskVector __riscv_vmsne_vx_u8mf8_b64(const RVVVector& a, uint8_t b, size_t vl){ return _gcmp_vx(a,(int64_t)b,8,C_NE,vl); }
} // namespace salt_cvc5
