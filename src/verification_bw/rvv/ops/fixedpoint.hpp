#pragma once
// RVV fixed-point family (bitwuzla): saturating/averaging add-sub, vsmul, scaling
// shifts (vssra/vssrl), narrowing clip (vnclip/vnclipu). Bitvector-only.
// vxrm rounding: 0=rnu 1=rne 2=rdn(trunc) 3=rod. Shift amount masked per RVV.
#include "../intrinsics.hpp"
namespace salt {

// rounding increment (bits-wide) added to `value` before a right shift by `s`,
// per vxrm. RNU=+round_bit; RNE=+round_bit&(lower!=0||result_odd); RDN=+0.
// ROD is not additive — handled in _gfx_rshift. s>=1 required.
inline Term _gfx_round_incr(TermManager& tm, Term value, size_t s, unsigned vxrm, size_t bits){
  Term round_bit = tm.mk_term(Kind::BV_EXTRACT, {value},
    {static_cast<uint64_t>(s-1), static_cast<uint64_t>(s-1)});
  Term round_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {round_bit}, {static_cast<uint64_t>(bits-1)});
  if(vxrm==__RISCV_VXRM_RDN) return mk_bv_val(tm, bits, 0);
  if(vxrm==__RISCV_VXRM_RNU) return round_ext;
  if(vxrm==__RISCV_VXRM_RNE){
    // round up iff round_bit && (any lower bit set || quotient odd)
    Term q0 = tm.mk_term(Kind::BV_EXTRACT, {value},
      {static_cast<uint64_t>(s), static_cast<uint64_t>(s)});  // bit s = LSB of quotient
    Term q_odd = fold_eq(tm, q0, mk_bv_val(tm, 1, 1));
    Term tie;
    if(s>=2){
      Term low = tm.mk_term(Kind::BV_EXTRACT, {value}, {static_cast<uint64_t>(s-2), 0UL});
      Term low_zero = fold_eq(tm, low, mk_bv_val(tm, s-1, 0));
      tie = tm.mk_term(Kind::OR, {tm.mk_term(Kind::NOT, {low_zero}), q_odd});
    } else {
      tie = q_odd;
    }
    Term up = tm.mk_term(Kind::AND, {fold_eq(tm, round_bit, mk_bv_val(tm,1,1)), tie});
    return fold_ite(tm, up, mk_bv_val(tm, bits, 1), mk_bv_val(tm, bits, 0));
  }
  return mk_bv_val(tm, bits, 0); // ROD handled by caller
}

// rounded right shift of `val` (width bits) by concrete `s`, per vxrm.
inline Term _gfx_rshift(TermManager& tm, Term val, size_t s, size_t bits,
                        unsigned vxrm, bool is_signed){
  if(s==0) return val;
  Term sh = mk_bv_val(tm, bits, static_cast<int64_t>(s));
  Term shifted = is_signed ? tm.mk_term(Kind::BV_ASHR, {val, sh})
                           : fold_bvlshr(tm, val, sh);
  if(vxrm==__RISCV_VXRM_ROD){
    Term truncated = tm.mk_term(Kind::BV_EXTRACT, {val}, {static_cast<uint64_t>(s-1), 0UL});
    Term trunc_zero = fold_eq(tm, truncated, mk_bv_val(tm, s, 0));
    Term bit0_set = fold_bvor(tm, shifted, mk_bv_val(tm, bits, 1));
    return fold_ite(tm, trunc_zero, shifted, bit0_set);
  }
  return fold_bvadd(tm, shifted, _gfx_round_incr(tm, val, s, vxrm, bits));
}

// symbolic-shift right shift: cascade over concrete s in [0, maxsh].
inline Term _gfx_rshift_sym(TermManager& tm, Term val, Term shift_term, size_t bits,
                            size_t maxsh, unsigned vxrm, bool is_signed){
  Term result = val;
  for(size_t s=maxsh; s>=1; s--){
    Term c = _gfx_rshift(tm, val, s, bits, vxrm, is_signed);
    Term eq = fold_eq(tm, shift_term, mk_bv_val(tm, bits, static_cast<int64_t>(s)));
    result = fold_ite(tm, eq, c, result);
  }
  return result;
}

inline Term _gfx_sclip(TermManager& tm, Term wide, size_t wbits, size_t nbits){
  return signed_clip(tm, wide, wbits, nbits);
}
inline Term _gfx_uclip(TermManager& tm, Term wide, size_t wbits, size_t nbits){
  return unsigned_clip(tm, wide, wbits, nbits);
}

// ---- saturating add (vsadd/vsaddu) ----
inline RVVVector _gfx_sadd(const RVVVector& a, const RVVVector& b, size_t bits, bool is_signed, unsigned, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term sum = fold_bvadd(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), tm.mk_term(ext,{b.getElement(i)},{1UL}));
    r.push_back(is_signed?_gfx_sclip(tm,sum,W,bits):_gfx_uclip(tm,sum,W,bits));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_sadd(const RVVVector& a, int64_t b, size_t bits, bool is_signed, unsigned, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  Term be = tm.mk_term(ext,{mk_bv_val(tm,bits,b)},{1UL});
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term sum = fold_bvadd(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), be);
    r.push_back(is_signed?_gfx_sclip(tm,sum,W,bits):_gfx_uclip(tm,sum,W,bits));
  }
  return RVVVector(tm,bits,r);
}

// unsigned saturating-sub clamp: borrow (high bit of the (bits+1) diff) -> 0.
inline Term _gfx_usub_clamp(TermManager& tm, Term diff, size_t bits){
  Term borrow=fold_bvextract(tm,bits,bits,diff), low=fold_bvextract(tm,bits-1,0,diff);
  return fold_ite(tm, fold_eq(tm,borrow,mk_bv_val(tm,1,1)), mk_bv_val(tm,bits,0), low);
}
// ---- saturating sub (vssub/vssubu) ----
inline RVVVector _gfx_ssub(const RVVVector& a, const RVVVector& b, size_t bits, bool is_signed, unsigned, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term diff = fold_bvsub(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), tm.mk_term(ext,{b.getElement(i)},{1UL}));
    r.push_back(is_signed?_gfx_sclip(tm,diff,W,bits):_gfx_usub_clamp(tm,diff,bits));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_ssub(const RVVVector& a, int64_t b, size_t bits, bool is_signed, unsigned, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  Term be = tm.mk_term(ext,{mk_bv_val(tm,bits,b)},{1UL});
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term diff = fold_bvsub(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), be);
    r.push_back(is_signed?_gfx_sclip(tm,diff,W,bits):_gfx_usub_clamp(tm,diff,bits));
  }
  return RVVVector(tm,bits,r);
}

// ---- averaging add (vaadd/vaaddu): (a+b+round)>>1 in bits+1 ----
inline RVVVector _gfx_aadd(const RVVVector& a, const RVVVector& b, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term sum = fold_bvadd(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), tm.mk_term(ext,{b.getElement(i)},{1UL}));
    Term sh = _gfx_rshift(tm, sum, 1, W, vxrm, is_signed);
    r.push_back(tm.mk_term(Kind::BV_EXTRACT, {sh}, {static_cast<uint64_t>(bits-1), 0UL}));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_aadd(const RVVVector& a, int64_t b, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  Term be = tm.mk_term(ext,{mk_bv_val(tm,bits,b)},{1UL});
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term sum = fold_bvadd(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), be);
    Term sh = _gfx_rshift(tm, sum, 1, W, vxrm, is_signed);
    r.push_back(tm.mk_term(Kind::BV_EXTRACT, {sh}, {static_cast<uint64_t>(bits-1), 0UL}));
  }
  return RVVVector(tm,bits,r);
}

// ---- averaging sub (vasub/vasubu): (a-b+round)>>1 in bits+1 ----
inline RVVVector _gfx_asub(const RVVVector& a, const RVVVector& b, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term diff = fold_bvsub(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), tm.mk_term(ext,{b.getElement(i)},{1UL}));
    Term sh = _gfx_rshift(tm, diff, 1, W, vxrm, is_signed);
    r.push_back(tm.mk_term(Kind::BV_EXTRACT, {sh}, {static_cast<uint64_t>(bits-1), 0UL}));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_asub(const RVVVector& a, int64_t b, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits+1;
  Kind ext = is_signed?Kind::BV_SIGN_EXTEND:Kind::BV_ZERO_EXTEND;
  Term be = tm.mk_term(ext,{mk_bv_val(tm,bits,b)},{1UL});
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term diff = fold_bvsub(tm, tm.mk_term(ext,{a.getElement(i)},{1UL}), be);
    Term sh = _gfx_rshift(tm, diff, 1, W, vxrm, is_signed);
    r.push_back(tm.mk_term(Kind::BV_EXTRACT, {sh}, {static_cast<uint64_t>(bits-1), 0UL}));
  }
  return RVVVector(tm,bits,r);
}

// ---- vsmul: signed fractional mul. sat(round((a*b)>>(bits-1))) in 2*bits ----
inline RVVVector _gfx_smul(const RVVVector& a, const RVVVector& b, size_t bits, bool, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits*2;
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {static_cast<uint64_t>(bits)});
    Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {static_cast<uint64_t>(bits)});
    Term prod = fold_bvmul(tm, ae, be);
    Term shifted = _gfx_rshift(tm, prod, bits-1, W, vxrm, true);
    r.push_back(_gfx_sclip(tm, shifted, W, bits));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_smul(const RVVVector& a, int64_t b, size_t bits, bool, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits*2;
  Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {mk_bv_val(tm,bits,b)}, {static_cast<uint64_t>(bits)});
  std::vector<Term> r; r.reserve(vl);
  for(size_t i=0;i<vl;i++){
    Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {static_cast<uint64_t>(bits)});
    Term prod = fold_bvmul(tm, ae, be);
    Term shifted = _gfx_rshift(tm, prod, bits-1, W, vxrm, true);
    r.push_back(_gfx_sclip(tm, shifted, W, bits));
  }
  return RVVVector(tm,bits,r);
}

// ---- scaling shift right (vssra signed / vssrl unsigned) ----
// vv: shift is a per-lane vector, masked to bits-1 (symbolic cascade).
inline RVVVector _gfx_ssr(const RVVVector& a, const RVVVector& sh, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  Term mask = mk_bv_val(tm, bits, static_cast<int64_t>(bits-1));
  for(size_t i=0;i<vl;i++){
    Term s = tm.mk_term(Kind::BV_AND, {sh.getElement(i), mask});
    r.push_back(_gfx_rshift_sym(tm, a.getElement(i), s, bits, bits-1, vxrm, is_signed));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_ssr(const RVVVector& a, int64_t shift, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; std::vector<Term> r; r.reserve(vl);
  size_t s = static_cast<size_t>(shift) & (bits-1);
  for(size_t i=0;i<vl;i++)
    r.push_back(_gfx_rshift(tm, a.getElement(i), s, bits, vxrm, is_signed));
  return RVVVector(tm,bits,r);
}

// ---- narrowing clip (vnclip signed / vnclipu unsigned) ----
// src elements are 2*bits wide; shift masked to 2*bits-1; saturate to bits.
inline RVVVector _gfx_nclip(const RVVVector& a, const RVVVector& sh, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits*2; std::vector<Term> r; r.reserve(vl);
  Term mask = mk_bv_val(tm, W, static_cast<int64_t>(W-1));
  for(size_t i=0;i<vl;i++){
    Term shw = tm.mk_term(Kind::BV_ZERO_EXTEND, {sh.getElement(i)}, {static_cast<uint64_t>(bits)});
    Term s = tm.mk_term(Kind::BV_AND, {shw, mask});
    Term shifted = _gfx_rshift_sym(tm, a.getElement(i), s, W, W-1, vxrm, is_signed);
    r.push_back(is_signed?_gfx_sclip(tm,shifted,W,bits):_gfx_uclip(tm,shifted,W,bits));
  }
  return RVVVector(tm,bits,r);
}
inline RVVVector _gfx_nclip(const RVVVector& a, int64_t shift, size_t bits, bool is_signed, unsigned vxrm, size_t vl){
  auto& tm=g_ctx->tm; size_t W=bits*2; std::vector<Term> r; r.reserve(vl);
  size_t s = static_cast<size_t>(shift) & (W-1);
  for(size_t i=0;i<vl;i++){
    Term shifted = _gfx_rshift(tm, a.getElement(i), s, W, vxrm, is_signed);
    r.push_back(is_signed?_gfx_sclip(tm,shifted,W,bits):_gfx_uclip(tm,shifted,W,bits));
  }
  return RVVVector(tm,bits,r);
}

// ===== generated wrappers =====
inline RVVVector __riscv_vaadd_vv_i16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i16m1(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i16m2(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i16m8(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i16mf2(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i16mf4(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i32m1(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i32m2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i32m4(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i32mf2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i64m1(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i64m2(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i64m4(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i64m8(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8m1(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8m4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8m8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8mf2(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8mf4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaadd_vx_i8mf8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vv_u8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u16m1(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u16m2(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u16m8(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u16mf2(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u16mf4(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u32m1(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u32m2(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u32m4(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u32mf2(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u64m1(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u64m2(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u64m4(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u64m8(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8m1(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8m4(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8m8(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8mf2(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8mf4(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vaaddu_vx_u8mf8(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_aadd(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i32m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16m1(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16m2(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16m4(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16m8(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16mf2(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i16mf4(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i32m1(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i32m2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i32m4(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i32m8(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i32mf2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i64m1(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i64m2(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i64m4(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i64m8(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8m1(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8m2(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8m4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8m8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8mf2(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8mf4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasub_vx_i8mf8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u32m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vv_u8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16m1(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16m2(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16m4(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16m8(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16mf2(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u16mf4(const RVVVector& op1, uint16_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u32m1(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u32m2(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u32m4(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u32m8(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u32mf2(const RVVVector& op1, uint32_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u64m1(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u64m2(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u64m4(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u64m8(const RVVVector& op1, uint64_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8m1(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8m2(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8m4(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8m8(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8mf2(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8mf4(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vasubu_vx_u8mf8(const RVVVector& op1, uint8_t op2, unsigned int vxrm, size_t vl){ return _gfx_asub(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wv_i8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i16m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i16mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i16mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i32m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i32m2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i32m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i32mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i8mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i8mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclip_wx_i8mf8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wv_u8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u16m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u16mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u16mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u32m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u32m2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u32m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u32mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u8m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u8mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u8mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vnclipu_wx_u8mf8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_nclip(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vsadd_vv_i16m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i16m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i16m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i16m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i16m8(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i16mf2(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i16mf4(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i32m2(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i32m8(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i32mf2(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i64m1(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i64m2(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i64m4(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i64m8(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i8m4(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i8m8(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i8mf2(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i8mf4(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsadd_vx_i8mf8(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u16mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vv_u8mf8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16m1(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16m2(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16m4(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16m8(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16mf2(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u16mf4(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_sadd(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u32m1(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u32m2(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u32m4(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u32m8(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u32mf2(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_sadd(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u64m1(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u64m2(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u64m4(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u64m8(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_sadd(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8m1(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8m2(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8m4(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8m8(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8mf2(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8mf4(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsaddu_vx_u8mf8(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_sadd(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vsmul_vv_i16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i32m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i16m8(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i16mf2(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i16mf4(const RVVVector& op1, int16_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i32m2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i32m8(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i32mf2(const RVVVector& op1, int32_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i64m1(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i64m2(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i64m4(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i64m8(const RVVVector& op1, int64_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8m1(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8m2(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8m4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8m8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8mf2(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8mf4(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vsmul_vx_i8mf8(const RVVVector& op1, int8_t op2, unsigned int vxrm, size_t vl){ return _gfx_smul(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i32m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i16m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i16m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i16mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i16mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i32mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i64m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i64m2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i64m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i64m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i8m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i8m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i8mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i8mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssra_vx_i8mf8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, true, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u16mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u32m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u32m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u32m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u32m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u32mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u64m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u64m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u64m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u64m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8m1(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8m2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8m4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8m8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8mf2(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8mf4(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vv_u8mf8(const RVVVector& op1, const RVVVector& op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u16m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u16m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u16mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u16mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 16, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u32m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u32m2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u32m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u32mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 32, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u64m1(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u64m2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u64m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u64m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 64, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u8m4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u8m8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u8mf2(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u8mf4(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssrl_vx_u8mf8(const RVVVector& op1, size_t op2, unsigned int vxrm, size_t vl){ return _gfx_ssr(op1, op2, 8, false, vxrm, vl); }
inline RVVVector __riscv_vssub_vv_i16m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i16m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i16m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i16m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i16mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i16mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vv_i8mf8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i16m8(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i16mf2(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i16mf4(const RVVVector& op1, int16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i32m2(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i32m8(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i32mf2(const RVVVector& op1, int32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i64m1(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i64m2(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i64m4(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i64m8(const RVVVector& op1, int64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8m1(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8m2(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8m4(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8m8(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8mf2(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8mf4(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssub_vx_i8mf8(const RVVVector& op1, int8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, true, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u16mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u32m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u32m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u32m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u32m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u32mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u64m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u64m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u64m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u64m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8m1(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8m2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8m4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8m8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8mf2(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8mf4(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vv_u8mf8(const RVVVector& op1, const RVVVector& op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16m1(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16m2(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16m4(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16m8(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16mf2(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u16mf4(const RVVVector& op1, uint16_t op2, size_t vl){ return _gfx_ssub(op1, op2, 16, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u32m1(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u32m2(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u32m4(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u32m8(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u32mf2(const RVVVector& op1, uint32_t op2, size_t vl){ return _gfx_ssub(op1, op2, 32, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u64m1(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u64m2(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u64m4(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u64m8(const RVVVector& op1, uint64_t op2, size_t vl){ return _gfx_ssub(op1, op2, 64, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8m1(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8m2(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8m4(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8m8(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8mf2(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8mf4(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }
inline RVVVector __riscv_vssubu_vx_u8mf8(const RVVVector& op1, uint8_t op2, size_t vl){ return _gfx_ssub(op1, op2, 8, false, 0, vl); }

} // namespace salt
