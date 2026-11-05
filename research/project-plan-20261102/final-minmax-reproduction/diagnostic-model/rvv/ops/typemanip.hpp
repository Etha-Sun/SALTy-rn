#pragma once
// RVV type-manipulation (reinterpret/lmul/get/set/create) — cvc5.
#include "../intrinsics.hpp"
namespace salt_cvc5 {
// ---- shared helpers (prefix _gtm_ to avoid ODR collisions) ----
// Concat all lanes of v (lane0 = least-significant) into one BV of width nbits.
inline Term _gtm_pack(const RVVVector& v, size_t sew){
  auto& tm = g_ctx->tm;
  size_t n = v.getVL();
  if(n==0) return mk_bv_val(tm,sew,0);
  Term acc = v.getElement(0);
  for(size_t i=1;i<n;i++) acc = fold_bvconcat(tm, v.getElement(i), acc); // hi=lane i, lo=acc
  return acc;
}
// Reinterpret data->data across SEW: pack to big BV, re-split into dstSEW lanes LE.
inline RVVVector _gtm_reinterp(const RVVVector& v, size_t srcSEW, size_t dstSEW){
  auto& tm = g_ctx->tm;
  size_t n = v.getVL();
  size_t total = n*srcSEW;
  std::vector<Term> r;
  if(total==0) return RVVVector(tm,dstSEW,r);
  Term big = _gtm_pack(v, srcSEW);
  size_t lanes = total/dstSEW; // total is a multiple of dstSEW for valid reinterprets
  r.reserve(lanes);
  for(size_t j=0;j<lanes;j++)
    r.push_back(fold_bvextract(tm, (uint32_t)(j*dstSEW+dstSEW-1), (uint32_t)(j*dstSEW), big));
  return RVVVector(tm,dstSEW,r);
}
// bool->data: mask bit i -> bit i of a packed BV; re-split into dstSEW lanes LE.
inline RVVVector _gtm_mask_to_vec(const MaskVector& m, size_t dstSEW){
  auto& tm = g_ctx->tm;
  size_t nbits = m.size();
  std::vector<Term> r;
  if(nbits==0) return RVVVector(tm,dstSEW,r);
  Term packed = m.getBit(0);
  for(size_t i=1;i<nbits;i++) packed = fold_bvconcat(tm, m.getBit(i), packed); // bit i in pos i
  // pad up to a multiple of dstSEW with zeros (high bits)
  size_t rem = nbits % dstSEW;
  if(rem!=0){ size_t pad=dstSEW-rem; packed = fold_bvzext(tm,(uint32_t)pad,packed); nbits+=pad; }
  size_t lanes = nbits/dstSEW;
  r.reserve(lanes);
  for(size_t j=0;j<lanes;j++)
    r.push_back(fold_bvextract(tm,(uint32_t)(j*dstSEW+dstSEW-1),(uint32_t)(j*dstSEW),packed));
  return RVVVector(tm,dstSEW,r);
}
// data->bool: pack data lanes to BV, each mask bit i = bit i of that BV.
inline MaskVector _gtm_vec_to_mask(const RVVVector& v, size_t srcSEW){
  auto& tm = g_ctx->tm;
  size_t total = v.getVL()*srcSEW;
  std::vector<Term> bits;
  if(total==0) return MaskVector(tm,bits);
  Term big = _gtm_pack(v, srcSEW);
  bits.reserve(total);
  for(size_t i=0;i<total;i++)
    bits.push_back(fold_bvextract(tm,(uint32_t)i,(uint32_t)i,big));
  return MaskVector(tm,bits);
}
// vget non-tuple: slice src into `ratio` equal parts, return part `index`.
inline RVVVector _gtm_vget_slice(const RVVVector& src, size_t ratio, size_t index, size_t sew){
  auto& tm = g_ctx->tm;
  size_t k = (ratio? src.getVL()/ratio : src.getVL());
  std::vector<Term> r; r.reserve(k);
  size_t base = index*k;
  for(size_t i=0;i<k && base+i<src.getVL();i++) r.push_back(src.getElement(base+i));
  return RVVVector(tm,sew,r);
}
// vset non-tuple: overwrite slice [index*k, index*k+val.getVL()) of dest with val.
inline RVVVector _gtm_vset_slice(RVVVector dest, size_t ratio, size_t index,
                                 const RVVVector& val, size_t sew){
  auto& tm = g_ctx->tm;
  size_t k = (ratio? dest.getVL()/ratio : dest.getVL());
  std::vector<Term> r = dest.elements();
  size_t base = index*k;
  for(size_t i=0;i<val.getVL() && base+i<r.size();i++) r[base+i]=val.getElement(i);
  return RVVVector(tm,sew,r);
}

inline RVVVector __riscv_vcreate_v_f16m1_f16m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_f16m1_f16m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_f16m1_f16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f16m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f16m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f16m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f16m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f16m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f16m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f16m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_f16m2_f16m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_f16m2_f16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f16m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f16m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f16m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_f16m4_f16m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f16m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f16mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f16mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f16mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f16mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f16mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f16mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f16mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f16mf4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f16mf4x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f16mf4x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f16mf4x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f16mf4x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f16mf4x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f16mf4x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_f32m1_f32m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_f32m1_f32m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_f32m1_f32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f32m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f32m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f32m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f32m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f32m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f32m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f32m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_f32m2_f32m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_f32m2_f32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f32m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f32m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f32m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_f32m4_f32m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f32m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f32mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f32mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f32mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f32mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f32mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f32mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f32mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_f64m1_f64m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_f64m1_f64m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_f64m1_f64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f64m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f64m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f64m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_f64m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_f64m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_f64m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_f64m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_f64m2_f64m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_f64m2_f64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f64m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_f64m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_f64m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_f64m4_f64m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_f64m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline RVVVector __riscv_vcreate_v_i16m1_i16m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_i16m1_i16m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_i16m1_i16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i16m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i16m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i16m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i16m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i16m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i16m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i16m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i16m2_i16m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_i16m2_i16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i16m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i16m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i16m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_i16m4_i16m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i16m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i16mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i16mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i16mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i16mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i16mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i16mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i16mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i16mf4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i16mf4x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i16mf4x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i16mf4x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i16mf4x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i16mf4x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i16mf4x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i32m1_i32m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_i32m1_i32m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_i32m1_i32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i32m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i32m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i32m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i32m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i32m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i32m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i32m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i32m2_i32m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_i32m2_i32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i32m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i32m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i32m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_i32m4_i32m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i32m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i32mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i32mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i32mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i32mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i32mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i32mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i32mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i64m1_i64m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_i64m1_i64m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_i64m1_i64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i64m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i64m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i64m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i64m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i64m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i64m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i64m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i64m2_i64m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_i64m2_i64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i64m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i64m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i64m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_i64m4_i64m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i64m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline RVVVector __riscv_vcreate_v_i8m1_i8m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_i8m1_i8m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_i8m1_i8m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i8m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i8m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i8m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i8m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i8m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i8m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_i8m2_i8m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_i8m2_i8m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i8m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i8m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_i8m4_i8m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i8mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i8mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i8mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i8mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i8mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i8mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8mf4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i8mf4x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i8mf4x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i8mf4x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i8mf4x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i8mf4x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i8mf4x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_i8mf8x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_i8mf8x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_i8mf8x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_i8mf8x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_i8mf8x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_i8mf8x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_i8mf8x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u16m1_u16m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_u16m1_u16m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_u16m1_u16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u16m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u16m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u16m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u16m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u16m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u16m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u16m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u16m2_u16m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline RVVVector __riscv_vcreate_v_u16m2_u16m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u16m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u16m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u16m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_u16m4_u16m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,16,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u16m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u16mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u16mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u16mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u16mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u16mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u16mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u16mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u16mf4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u16mf4x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u16mf4x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u16mf4x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u16mf4x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u16mf4x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u16mf4x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u32m1_u32m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_u32m1_u32m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_u32m1_u32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u32m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u32m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u32m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u32m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u32m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u32m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u32m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u32m2_u32m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline RVVVector __riscv_vcreate_v_u32m2_u32m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u32m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u32m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u32m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_u32m4_u32m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,32,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u32m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u32mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u32mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u32mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u32mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u32mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u32mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u32mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u64m1_u64m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_u64m1_u64m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_u64m1_u64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u64m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u64m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u64m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u64m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u64m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u64m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u64m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u64m2_u64m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline RVVVector __riscv_vcreate_v_u64m2_u64m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u64m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u64m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u64m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_u64m4_u64m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,64,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u64m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline RVVVector __riscv_vcreate_v_u8m1_u8m2(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_u8m1_u8m4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_u8m1_u8m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); for(auto&e:v4.elements()) r.push_back(e); for(auto&e:v5.elements()) r.push_back(e); for(auto&e:v6.elements()) r.push_back(e); for(auto&e:v7.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8m1x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u8m1x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u8m1x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u8m1x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u8m1x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u8m1x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u8m1x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vcreate_v_u8m2_u8m4(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline RVVVector __riscv_vcreate_v_u8m2_u8m8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); for(auto&e:v2.elements()) r.push_back(e); for(auto&e:v3.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8m2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u8m2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u8m2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline RVVVector __riscv_vcreate_v_u8m4_u8m8(const RVVVector& v0, const RVVVector& v1){ std::vector<Term> r; for(auto&e:v0.elements()) r.push_back(e); for(auto&e:v1.elements()) r.push_back(e); return RVVVector(g_ctx->tm,8,r); }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8m4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8mf2x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u8mf2x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u8mf2x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u8mf2x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u8mf2x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u8mf2x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u8mf2x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8mf4x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u8mf4x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u8mf4x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u8mf4x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u8mf4x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u8mf4x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u8mf4x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline VectorTuple<RVVVector,2> __riscv_vcreate_v_u8mf8x2(const RVVVector& v0, const RVVVector& v1){ return VectorTuple<RVVVector,2>{{v0, v1}}; }
inline VectorTuple<RVVVector,3> __riscv_vcreate_v_u8mf8x3(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2){ return VectorTuple<RVVVector,3>{{v0, v1, v2}}; }
inline VectorTuple<RVVVector,4> __riscv_vcreate_v_u8mf8x4(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3){ return VectorTuple<RVVVector,4>{{v0, v1, v2, v3}}; }
inline VectorTuple<RVVVector,5> __riscv_vcreate_v_u8mf8x5(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4){ return VectorTuple<RVVVector,5>{{v0, v1, v2, v3, v4}}; }
inline VectorTuple<RVVVector,6> __riscv_vcreate_v_u8mf8x6(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5){ return VectorTuple<RVVVector,6>{{v0, v1, v2, v3, v4, v5}}; }
inline VectorTuple<RVVVector,7> __riscv_vcreate_v_u8mf8x7(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6){ return VectorTuple<RVVVector,7>{{v0, v1, v2, v3, v4, v5, v6}}; }
inline VectorTuple<RVVVector,8> __riscv_vcreate_v_u8mf8x8(const RVVVector& v0, const RVVVector& v1, const RVVVector& v2, const RVVVector& v3, const RVVVector& v4, const RVVVector& v5, const RVVVector& v6, const RVVVector& v7){ return VectorTuple<RVVVector,8>{{v0, v1, v2, v3, v4, v5, v6, v7}}; }
inline RVVVector __riscv_vget_v_f16m1x2_f16m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m1x4_f16m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m1x5_f16m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m1x6_f16m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m1x7_f16m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m1x8_f16m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m2_f16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_f16m2x2_f16m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m2x3_f16m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m2x4_f16m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m4_f16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_f16m4_f16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_f16m4x2_f16m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16m8_f16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,16); }
inline RVVVector __riscv_vget_v_f16m8_f16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_f16m8_f16m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_f16mf2x2_f16mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x3_f16mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x4_f16mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x5_f16mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x6_f16mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x7_f16mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf2x8_f16mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x2_f16mf4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x3_f16mf4(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x4_f16mf4(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x5_f16mf4(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x6_f16mf4(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x7_f16mf4(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f16mf4x8_f16mf4(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x2_f32m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x3_f32m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x4_f32m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x5_f32m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x6_f32m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x7_f32m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m1x8_f32m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m2_f32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_f32m2x2_f32m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m2x3_f32m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m2x4_f32m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m4_f32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_f32m4_f32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_f32m4x2_f32m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32m8_f32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,32); }
inline RVVVector __riscv_vget_v_f32m8_f32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_f32m8_f32m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_f32mf2x2_f32mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x3_f32mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x4_f32mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x5_f32mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x6_f32mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x7_f32mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f32mf2x8_f32mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x2_f64m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x3_f64m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x4_f64m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x5_f64m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x6_f64m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x7_f64m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m1x8_f64m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m2_f64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_f64m2x2_f64m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m2x3_f64m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m2x4_f64m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m4_f64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_f64m4_f64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_f64m4x2_f64m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_f64m8_f64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,64); }
inline RVVVector __riscv_vget_v_f64m8_f64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_f64m8_f64m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_i16m1x2_i16m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x3_i16m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x4_i16m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x5_i16m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x6_i16m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x7_i16m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m1x8_i16m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m2_i16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_i16m2x2_i16m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m2x3_i16m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m2x4_i16m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m4_i16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_i16m4_i16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_i16m4x2_i16m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16m8_i16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,16); }
inline RVVVector __riscv_vget_v_i16m8_i16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_i16m8_i16m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_i16mf2x2_i16mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x3_i16mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x4_i16mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x5_i16mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x6_i16mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x7_i16mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf2x8_i16mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x2_i16mf4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x3_i16mf4(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x4_i16mf4(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x5_i16mf4(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x6_i16mf4(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x7_i16mf4(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i16mf4x8_i16mf4(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x2_i32m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x3_i32m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x4_i32m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x5_i32m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x6_i32m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x7_i32m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m1x8_i32m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m2_i32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_i32m2x2_i32m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m2x3_i32m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m2x4_i32m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m4_i32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_i32m4_i32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_i32m4x2_i32m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32m8_i32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,32); }
inline RVVVector __riscv_vget_v_i32m8_i32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_i32m8_i32m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_i32mf2x2_i32mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x3_i32mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x4_i32mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x5_i32mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x6_i32mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x7_i32mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i32mf2x8_i32mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x2_i64m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x3_i64m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x4_i64m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x5_i64m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x6_i64m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x7_i64m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m1x8_i64m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m2_i64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_i64m2x2_i64m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m2x3_i64m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m2x4_i64m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m4_i64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_i64m4_i64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_i64m4x2_i64m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i64m8_i64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,64); }
inline RVVVector __riscv_vget_v_i64m8_i64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_i64m8_i64m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_i8m1x2_i8m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x3_i8m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x4_i8m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x5_i8m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x6_i8m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x7_i8m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m1x8_i8m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m2_i8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_i8m2x2_i8m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m2x3_i8m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m2x4_i8m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m4_i8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,8); }
inline RVVVector __riscv_vget_v_i8m4_i8m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_i8m4x2_i8m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8m8_i8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,8); }
inline RVVVector __riscv_vget_v_i8m8_i8m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,8); }
inline RVVVector __riscv_vget_v_i8m8_i8m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_i8mf2x2_i8mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x3_i8mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x4_i8mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x5_i8mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x6_i8mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x7_i8mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf2x8_i8mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x2_i8mf4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x3_i8mf4(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x4_i8mf4(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x5_i8mf4(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x6_i8mf4(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x7_i8mf4(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf4x8_i8mf4(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x2_i8mf8(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x3_i8mf8(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x4_i8mf8(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x5_i8mf8(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x6_i8mf8(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x7_i8mf8(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_i8mf8x8_i8mf8(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x2_u16m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x3_u16m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x4_u16m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x5_u16m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x6_u16m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x7_u16m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m1x8_u16m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m2_u16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_u16m2x2_u16m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m2x3_u16m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m2x4_u16m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m4_u16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_u16m4_u16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_u16m4x2_u16m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16m8_u16m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,16); }
inline RVVVector __riscv_vget_v_u16m8_u16m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,16); }
inline RVVVector __riscv_vget_v_u16m8_u16m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,16); }
inline RVVVector __riscv_vget_v_u16mf2x2_u16mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x3_u16mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x4_u16mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x5_u16mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x6_u16mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x7_u16mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf2x8_u16mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x2_u16mf4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x3_u16mf4(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x4_u16mf4(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x5_u16mf4(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x6_u16mf4(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x7_u16mf4(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u16mf4x8_u16mf4(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x2_u32m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x3_u32m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x4_u32m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x5_u32m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x6_u32m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x7_u32m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m1x8_u32m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m2_u32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_u32m2x2_u32m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m2x3_u32m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m2x4_u32m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m4_u32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_u32m4_u32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_u32m4x2_u32m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32m8_u32m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,32); }
inline RVVVector __riscv_vget_v_u32m8_u32m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,32); }
inline RVVVector __riscv_vget_v_u32m8_u32m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,32); }
inline RVVVector __riscv_vget_v_u32mf2x2_u32mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x3_u32mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x4_u32mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x5_u32mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x6_u32mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x7_u32mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u32mf2x8_u32mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x2_u64m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x3_u64m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x4_u64m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x5_u64m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x6_u64m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x7_u64m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m1x8_u64m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m2_u64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_u64m2x2_u64m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m2x3_u64m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m2x4_u64m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m4_u64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_u64m4_u64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_u64m4x2_u64m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u64m8_u64m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,64); }
inline RVVVector __riscv_vget_v_u64m8_u64m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,64); }
inline RVVVector __riscv_vget_v_u64m8_u64m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,64); }
inline RVVVector __riscv_vget_v_u8m1x2_u8m1(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x3_u8m1(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x4_u8m1(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x5_u8m1(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x6_u8m1(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x7_u8m1(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m1x8_u8m1(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m2_u8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_u8m2x2_u8m2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m2x3_u8m2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m2x4_u8m2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m4_u8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,8); }
inline RVVVector __riscv_vget_v_u8m4_u8m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_u8m4x2_u8m4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8m8_u8m1(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,8,index,8); }
inline RVVVector __riscv_vget_v_u8m8_u8m2(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,4,index,8); }
inline RVVVector __riscv_vget_v_u8m8_u8m4(const RVVVector& src, size_t index){ return _gtm_vget_slice(src,2,index,8); }
inline RVVVector __riscv_vget_v_u8mf2x2_u8mf2(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x3_u8mf2(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x4_u8mf2(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x5_u8mf2(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x6_u8mf2(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x7_u8mf2(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf2x8_u8mf2(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x2_u8mf4(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x3_u8mf4(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x4_u8mf4(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x5_u8mf4(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x6_u8mf4(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x7_u8mf4(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf4x8_u8mf4(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x2_u8mf8(const VectorTuple<RVVVector,2>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x3_u8mf8(const VectorTuple<RVVVector,3>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x4_u8mf8(const VectorTuple<RVVVector,4>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x5_u8mf8(const VectorTuple<RVVVector,5>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x6_u8mf8(const VectorTuple<RVVVector,6>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x7_u8mf8(const VectorTuple<RVVVector,7>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vget_v_u8mf8x8_u8mf8(const VectorTuple<RVVVector,8>& src, size_t index){ return src.val[index]; }
inline RVVVector __riscv_vlmul_ext_v_f16m1_f16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16m1_f16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16m1_f16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16m2_f16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16m2_f16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16m4_f16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf2_f16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf2_f16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf2_f16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf2_f16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf4_f16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf4_f16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf4_f16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf4_f16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f16mf4_f16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m1_f32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m1_f32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m1_f32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m2_f32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m2_f32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32m4_f32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32mf2_f32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32mf2_f32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32mf2_f32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f32mf2_f32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m1_f64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m1_f64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m1_f64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m2_f64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m2_f64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_f64m4_f64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m1_i16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m1_i16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m1_i16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m2_i16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m2_i16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16m4_i16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf2_i16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf2_i16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf2_i16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf2_i16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf4_i16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf4_i16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf4_i16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf4_i16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i16mf4_i16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m1_i32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m1_i32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m1_i32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m2_i32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m2_i32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32m4_i32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32mf2_i32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32mf2_i32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32mf2_i32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i32mf2_i32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m1_i64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m1_i64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m1_i64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m2_i64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m2_i64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i64m4_i64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m1_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m1_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m1_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m2_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m2_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8m4_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf2_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf2_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf2_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf2_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf4_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf4_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf4_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf4_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf4_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_i8mf8_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m1_u16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m1_u16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m1_u16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m2_u16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m2_u16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16m4_u16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf2_u16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf2_u16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf2_u16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf4_u16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf4_u16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf4_u16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf4_u16m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u16mf4_u16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32m1_u32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32m1_u32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32m2_u32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32m2_u32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32m4_u32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32mf2_u32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32mf2_u32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32mf2_u32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u32mf2_u32m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m1_u64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m1_u64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m1_u64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m2_u64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m2_u64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u64m4_u64m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m1_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m1_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m1_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m2_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m2_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8m4_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf2_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf2_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf2_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf2_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf4_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf4_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf4_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf4_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf4_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8m8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_ext_v_u8mf8_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m1_f16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m1_f16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m2_f16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m2_f16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m2_f16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m4_f16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m4_f16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m4_f16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m4_f16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m8_f16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m8_f16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m8_f16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m8_f16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16m8_f16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f16mf2_f16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m1_f32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m2_f32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m4_f32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m4_f32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m4_f32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m8_f32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m8_f32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m8_f32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f32m8_f32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f64m2_f64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f64m4_f64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f64m8_f64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f64m8_f64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_f64m8_f64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m1_i16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m1_i16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m2_i16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m2_i16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m2_i16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m4_i16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m4_i16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m4_i16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m4_i16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m8_i16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m8_i16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m8_i16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m8_i16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16m8_i16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i16mf2_i16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m1_i32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m2_i32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m2_i32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m4_i32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m4_i32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m8_i32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m8_i32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m8_i32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i32m8_i32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m2_i64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m4_i64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m4_i64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m8_i64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m8_i64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i64m8_i64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m1_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m1_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m1_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m2_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m2_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m2_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m2_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m4_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m4_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m4_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m4_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m4_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8m8_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8mf2_i8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8mf2_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_i8mf4_i8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m1_u16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m2_u16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m2_u16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m2_u16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m4_u16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m4_u16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m4_u16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m4_u16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m8_u16m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m8_u16m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m8_u16m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m8_u16mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16m8_u16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u16mf2_u16mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,16,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m1_u32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m2_u32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m4_u32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m4_u32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m4_u32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m8_u32m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m8_u32m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m8_u32m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u32m8_u32mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,32,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m2_u64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m4_u64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m4_u64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m8_u64m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m8_u64m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u64m8_u64m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,64,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m1_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m1_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m1_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m2_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m2_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m2_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m2_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m4_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m4_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m4_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m4_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m4_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8m1(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8m2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8m4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8mf2(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8m8_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8mf2_u8mf4(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8mf2_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vlmul_trunc_v_u8mf4_u8mf8(const RVVVector& op1){ return RVVVector(g_ctx->tm,8,op1.elements()); }
inline RVVVector __riscv_vreinterpret_v_b16_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b16_i32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b16_i64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b16_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b16_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b16_u32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b16_u64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b16_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b1_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b1_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b2_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b2_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b2_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b2_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b32_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b32_i32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b32_i64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b32_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b32_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b32_u32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b32_u64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b32_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b4_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b4_i32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b4_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b4_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b4_u32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b4_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b64_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b64_i32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b64_i64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b64_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b64_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b64_u32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b64_u64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b64_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b8_i16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b8_i32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b8_i64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b8_i8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_b8_u16m1(const MaskVector& src){ return _gtm_mask_to_vec(src,16); }
inline RVVVector __riscv_vreinterpret_v_b8_u32m1(const MaskVector& src){ return _gtm_mask_to_vec(src,32); }
inline RVVVector __riscv_vreinterpret_v_b8_u64m1(const MaskVector& src){ return _gtm_mask_to_vec(src,64); }
inline RVVVector __riscv_vreinterpret_v_b8_u8m1(const MaskVector& src){ return _gtm_mask_to_vec(src,8); }
inline RVVVector __riscv_vreinterpret_v_f16m1_i16m1(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16m2_i16m2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16m2_u16m2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16mf2_i16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16mf2_u16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16mf4_i16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f16mf4_u16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32m1_i32m1(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32m2_i32m2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32m4_i32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32m4_u32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32m8_u32m8(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32mf2_i32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f32mf2_u32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m1_i64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m1_u64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m2_i64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m2_u64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m4_i64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m4_u64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m8_i64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_f64m8_u64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b2(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_i16m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline RVVVector __riscv_vreinterpret_v_i16m1_f16m1(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16m1_i32m1(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_i16m1_i64m1(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_i16m1_i8m1(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16m1_u16m1(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16m2_f16m2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16m2_i32m2(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_i16m2_i64m2(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_i16m2_i8m2(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16m4_i32m4(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_i16m4_i64m4(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_i16m4_i8m4(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16m4_u16m4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16m8_i32m8(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_i16m8_i64m8(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_i16m8_i8m8(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16m8_u16m8(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16mf2_f16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16mf2_i32mf2(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_i16mf2_i8mf2(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16mf2_u16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16mf4_f16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i16mf4_i8mf4(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_i16mf4_u16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline MaskVector __riscv_vreinterpret_v_i32m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_i32m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_i32m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_i32m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_i32m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline RVVVector __riscv_vreinterpret_v_i32m1_f32m1(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32m1_i16m1(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_i32m1_i64m1(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_i32m1_i8m1(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_i32m1_u32m1(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32m2_f32m2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32m2_i16m2(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_i32m2_i64m2(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_i32m2_i8m2(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_i32m4_f32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32m4_i16m4(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_i32m4_i64m4(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_i32m4_i8m4(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_i32m4_u32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32m8_i16m8(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_i32m8_i64m8(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_i32m8_i8m8(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_i32mf2_f32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i32mf2_i16mf2(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_i32mf2_i8mf2(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_i32mf2_u32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline MaskVector __riscv_vreinterpret_v_i64m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_i64m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_i64m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_i64m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline RVVVector __riscv_vreinterpret_v_i64m1_f64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m1_i16m1(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_i64m1_i32m1(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_i64m1_i8m1(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_i64m1_u64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m2_f64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m2_i16m2(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_i64m2_i32m2(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_i64m2_i8m2(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_i64m2_u64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m4_f64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m4_i16m4(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_i64m4_i32m4(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_i64m4_i8m4(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_i64m4_u64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m8_f64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i64m8_i16m8(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_i64m8_i32m8(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_i64m8_i8m8(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_i64m8_u64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b1(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b2(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_i8m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline RVVVector __riscv_vreinterpret_v_i8m1_i16m1(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8m1_i32m1(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_i8m1_i64m1(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_i8m2_i16m2(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8m2_i32m2(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_i8m2_i64m2(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_i8m2_u8m2(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i8m4_i16m4(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8m4_i32m4(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_i8m4_i64m4(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_i8m4_u8m4(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i8m8_i16m8(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8m8_i32m8(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_i8m8_i64m8(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_i8m8_u8m8(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i8mf2_i16mf2(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8mf2_i32mf2(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_i8mf2_u8mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i8mf4_i16mf4(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_i8mf4_u8mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_i8mf8_u8mf8(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b2(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline MaskVector __riscv_vreinterpret_v_u16m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,16); }
inline RVVVector __riscv_vreinterpret_v_u16m1_i16m1(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16m1_u32m1(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_u16m1_u64m1(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_u16m1_u8m1(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_u16m2_f16m2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16m2_u32m2(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_u16m2_u64m2(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_u16m2_u8m2(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_u16m4_i16m4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16m4_u32m4(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_u16m4_u64m4(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_u16m4_u8m4(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_u16m8_i16m8(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16m8_u32m8(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_u16m8_u64m8(const RVVVector& src){ return _gtm_reinterp(src,16,64); }
inline RVVVector __riscv_vreinterpret_v_u16m8_u8m8(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_u16mf2_f16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16mf2_i16mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16mf2_u32mf2(const RVVVector& src){ return _gtm_reinterp(src,16,32); }
inline RVVVector __riscv_vreinterpret_v_u16mf2_u8mf2(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline RVVVector __riscv_vreinterpret_v_u16mf4_f16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16mf4_i16mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,16,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u16mf4_u8mf4(const RVVVector& src){ return _gtm_reinterp(src,16,8); }
inline MaskVector __riscv_vreinterpret_v_u32m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_u32m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_u32m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_u32m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline MaskVector __riscv_vreinterpret_v_u32m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,32); }
inline RVVVector __riscv_vreinterpret_v_u32m1_i32m1(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32m1_u16m1(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_u32m1_u64m1(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_u32m1_u8m1(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_u32m2_u16m2(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_u32m2_u64m2(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_u32m2_u8m2(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_u32m4_f32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32m4_i32m4(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32m4_u16m4(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_u32m4_u64m4(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_u32m4_u8m4(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_u32m8_f32m8(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32m8_i32m8(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32m8_u16m8(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_u32m8_u64m8(const RVVVector& src){ return _gtm_reinterp(src,32,64); }
inline RVVVector __riscv_vreinterpret_v_u32m8_u8m8(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline RVVVector __riscv_vreinterpret_v_u32mf2_f32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32mf2_i32mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,32,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u32mf2_u16mf2(const RVVVector& src){ return _gtm_reinterp(src,32,16); }
inline RVVVector __riscv_vreinterpret_v_u32mf2_u8mf2(const RVVVector& src){ return _gtm_reinterp(src,32,8); }
inline MaskVector __riscv_vreinterpret_v_u64m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_u64m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_u64m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline MaskVector __riscv_vreinterpret_v_u64m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,64); }
inline RVVVector __riscv_vreinterpret_v_u64m1_f64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m1_i64m1(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m1_u16m1(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_u64m1_u32m1(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_u64m1_u8m1(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_u64m2_f64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m2_i64m2(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m2_u16m2(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_u64m2_u32m2(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_u64m2_u8m2(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_u64m4_f64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m4_i64m4(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m4_u16m4(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_u64m4_u32m4(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_u64m4_u8m4(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline RVVVector __riscv_vreinterpret_v_u64m8_f64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m8_i64m8(const RVVVector& src){ return RVVVector(g_ctx->tm,64,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u64m8_u16m8(const RVVVector& src){ return _gtm_reinterp(src,64,16); }
inline RVVVector __riscv_vreinterpret_v_u64m8_u32m8(const RVVVector& src){ return _gtm_reinterp(src,64,32); }
inline RVVVector __riscv_vreinterpret_v_u64m8_u8m8(const RVVVector& src){ return _gtm_reinterp(src,64,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b1(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b16(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b2(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b32(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b4(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b64(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline MaskVector __riscv_vreinterpret_v_u8m1_b8(const RVVVector& src){ return _gtm_vec_to_mask(src,8); }
inline RVVVector __riscv_vreinterpret_v_u8m1_u16m1(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8m1_u32m1(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_u8m1_u64m1(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_u8m2_i8m2(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u8m2_u16m2(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8m2_u32m2(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_u8m2_u64m2(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_u8m4_i8m4(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u8m4_u16m4(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8m4_u32m4(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_u8m4_u64m4(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_u8m8_i8m8(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u8m8_u16m8(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8m8_u32m8(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_u8m8_u64m8(const RVVVector& src){ return _gtm_reinterp(src,8,64); }
inline RVVVector __riscv_vreinterpret_v_u8mf2_i8mf2(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u8mf2_u16mf2(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8mf2_u32mf2(const RVVVector& src){ return _gtm_reinterp(src,8,32); }
inline RVVVector __riscv_vreinterpret_v_u8mf4_i8mf4(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline RVVVector __riscv_vreinterpret_v_u8mf4_u16mf4(const RVVVector& src){ return _gtm_reinterp(src,8,16); }
inline RVVVector __riscv_vreinterpret_v_u8mf8_i8mf8(const RVVVector& src){ return RVVVector(g_ctx->tm,8,src.elements()); }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f16m1_f16m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f16m1_f16m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f16m1_f16m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f16m1_f16m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f16m1_f16m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f16m1_f16m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f16m1_f16m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_f16m1_f16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline RVVVector __riscv_vset_v_f16m1_f16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f16m2_f16m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f16m2_f16m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f16m2_f16m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f16m2_f16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_f16m2_f16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f16m4_f16m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f16m4_f16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f16mf2_f16mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f16mf2_f16mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f16mf2_f16mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f16mf2_f16mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f16mf2_f16mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f16mf2_f16mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f16mf2_f16mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f16mf4_f16mf4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f16mf4_f16mf4x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f16mf4_f16mf4x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f16mf4_f16mf4x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f16mf4_f16mf4x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f16mf4_f16mf4x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f16mf4_f16mf4x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f32m1_f32m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f32m1_f32m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f32m1_f32m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f32m1_f32m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f32m1_f32m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f32m1_f32m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f32m1_f32m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f32m1_f32m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_f32m1_f32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline RVVVector __riscv_vset_v_f32m1_f32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f32m2_f32m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f32m2_f32m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f32m2_f32m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f32m2_f32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_f32m2_f32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f32m4_f32m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f32m4_f32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f32mf2_f32mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f32mf2_f32mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f32mf2_f32mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f32mf2_f32mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f32mf2_f32mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f32mf2_f32mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f32mf2_f32mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f64m1_f64m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f64m1_f64m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f64m1_f64m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_f64m1_f64m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_f64m1_f64m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_f64m1_f64m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_f64m1_f64m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f64m1_f64m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_f64m1_f64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline RVVVector __riscv_vset_v_f64m1_f64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f64m2_f64m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_f64m2_f64m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_f64m2_f64m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f64m2_f64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_f64m2_f64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_f64m4_f64m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_f64m4_f64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i16m1_i16m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i16m1_i16m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i16m1_i16m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i16m1_i16m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i16m1_i16m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i16m1_i16m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i16m1_i16m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i16m1_i16m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_i16m1_i16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline RVVVector __riscv_vset_v_i16m1_i16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i16m2_i16m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i16m2_i16m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i16m2_i16m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i16m2_i16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_i16m2_i16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i16m4_i16m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i16m4_i16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i16mf2_i16mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i16mf2_i16mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i16mf2_i16mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i16mf2_i16mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i16mf2_i16mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i16mf2_i16mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i16mf2_i16mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i16mf4_i16mf4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i16mf4_i16mf4x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i16mf4_i16mf4x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i16mf4_i16mf4x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i16mf4_i16mf4x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i16mf4_i16mf4x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i16mf4_i16mf4x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i32m1_i32m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i32m1_i32m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i32m1_i32m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i32m1_i32m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i32m1_i32m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i32m1_i32m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i32m1_i32m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i32m1_i32m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_i32m1_i32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline RVVVector __riscv_vset_v_i32m1_i32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i32m2_i32m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i32m2_i32m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i32m2_i32m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i32m2_i32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_i32m2_i32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i32m4_i32m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i32m4_i32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i32mf2_i32mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i32mf2_i32mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i32mf2_i32mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i32mf2_i32mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i32mf2_i32mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i32mf2_i32mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i32mf2_i32mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i64m1_i64m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i64m1_i64m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i64m1_i64m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i64m1_i64m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i64m1_i64m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i64m1_i64m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i64m1_i64m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i64m1_i64m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_i64m1_i64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline RVVVector __riscv_vset_v_i64m1_i64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i64m2_i64m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i64m2_i64m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i64m2_i64m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i64m2_i64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_i64m2_i64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i64m4_i64m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i64m4_i64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8m1_i8m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i8m1_i8m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i8m1_i8m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i8m1_i8m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i8m1_i8m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i8m1_i8m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i8m1_i8m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i8m1_i8m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline RVVVector __riscv_vset_v_i8m1_i8m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,8); }
inline RVVVector __riscv_vset_v_i8m1_i8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8m2_i8m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i8m2_i8m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i8m2_i8m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i8m2_i8m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline RVVVector __riscv_vset_v_i8m2_i8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8m4_i8m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_i8m4_i8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8mf2_i8mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i8mf2_i8mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i8mf2_i8mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i8mf2_i8mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i8mf2_i8mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i8mf2_i8mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i8mf2_i8mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8mf4_i8mf4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i8mf4_i8mf4x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i8mf4_i8mf4x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i8mf4_i8mf4x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i8mf4_i8mf4x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i8mf4_i8mf4x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i8mf4_i8mf4x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_i8mf8_i8mf8x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_i8mf8_i8mf8x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_i8mf8_i8mf8x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_i8mf8_i8mf8x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_i8mf8_i8mf8x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_i8mf8_i8mf8x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_i8mf8_i8mf8x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u16m1_u16m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u16m1_u16m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u16m1_u16m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u16m1_u16m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u16m1_u16m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u16m1_u16m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u16m1_u16m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u16m1_u16m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_u16m1_u16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline RVVVector __riscv_vset_v_u16m1_u16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u16m2_u16m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u16m2_u16m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u16m2_u16m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u16m2_u16m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline RVVVector __riscv_vset_v_u16m2_u16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u16m4_u16m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u16m4_u16m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,16); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u16mf2_u16mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u16mf2_u16mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u16mf2_u16mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u16mf2_u16mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u16mf2_u16mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u16mf2_u16mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u16mf2_u16mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u16mf4_u16mf4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u16mf4_u16mf4x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u16mf4_u16mf4x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u16mf4_u16mf4x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u16mf4_u16mf4x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u16mf4_u16mf4x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u16mf4_u16mf4x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u32m1_u32m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u32m1_u32m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u32m1_u32m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u32m1_u32m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u32m1_u32m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u32m1_u32m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u32m1_u32m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u32m1_u32m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_u32m1_u32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline RVVVector __riscv_vset_v_u32m1_u32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u32m2_u32m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u32m2_u32m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u32m2_u32m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u32m2_u32m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline RVVVector __riscv_vset_v_u32m2_u32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u32m4_u32m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u32m4_u32m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,32); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u32mf2_u32mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u32mf2_u32mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u32mf2_u32mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u32mf2_u32mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u32mf2_u32mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u32mf2_u32mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u32mf2_u32mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u64m1_u64m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u64m1_u64m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u64m1_u64m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u64m1_u64m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u64m1_u64m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u64m1_u64m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u64m1_u64m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u64m1_u64m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_u64m1_u64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline RVVVector __riscv_vset_v_u64m1_u64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u64m2_u64m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u64m2_u64m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u64m2_u64m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u64m2_u64m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline RVVVector __riscv_vset_v_u64m2_u64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u64m4_u64m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u64m4_u64m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,64); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8m1_u8m1x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u8m1_u8m1x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u8m1_u8m1x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u8m1_u8m1x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u8m1_u8m1x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u8m1_u8m1x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u8m1_u8m1x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u8m1_u8m2(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline RVVVector __riscv_vset_v_u8m1_u8m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,8); }
inline RVVVector __riscv_vset_v_u8m1_u8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,8,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8m2_u8m2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u8m2_u8m2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u8m2_u8m2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u8m2_u8m4(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline RVVVector __riscv_vset_v_u8m2_u8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,4,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8m4_u8m4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline RVVVector __riscv_vset_v_u8m4_u8m8(RVVVector dest, size_t index, const RVVVector& val){ return _gtm_vset_slice(dest,2,index,val,8); }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8mf2_u8mf2x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u8mf2_u8mf2x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u8mf2_u8mf2x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u8mf2_u8mf2x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u8mf2_u8mf2x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u8mf2_u8mf2x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u8mf2_u8mf2x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8mf4_u8mf4x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u8mf4_u8mf4x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u8mf4_u8mf4x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u8mf4_u8mf4x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u8mf4_u8mf4x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u8mf4_u8mf4x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u8mf4_u8mf4x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,2> __riscv_vset_v_u8mf8_u8mf8x2(VectorTuple<RVVVector,2> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,3> __riscv_vset_v_u8mf8_u8mf8x3(VectorTuple<RVVVector,3> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,4> __riscv_vset_v_u8mf8_u8mf8x4(VectorTuple<RVVVector,4> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,5> __riscv_vset_v_u8mf8_u8mf8x5(VectorTuple<RVVVector,5> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,6> __riscv_vset_v_u8mf8_u8mf8x6(VectorTuple<RVVVector,6> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,7> __riscv_vset_v_u8mf8_u8mf8x7(VectorTuple<RVVVector,7> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
inline VectorTuple<RVVVector,8> __riscv_vset_v_u8mf8_u8mf8x8(VectorTuple<RVVVector,8> dest, size_t index, const RVVVector& val){ dest.val[index]=val; return dest; }
} // namespace salt_cvc5
