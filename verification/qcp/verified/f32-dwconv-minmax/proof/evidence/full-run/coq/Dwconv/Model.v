From Coq Require Import ZArith Bool List.
From SimpleC.SL Require Export Mem SeparationLogic.
From Dwconv Require Export FmaModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition dw_abs_bits(u:Z):Z:=Z.land u 2147483647.
Definition dw_nan_bits(u:Z):Z:=if Z.ltb 2139095040(dw_abs_bits u)then 1 else 0.
Definition dw_snan_bits(u:Z):Z:=if Z.eqb(dw_nan_bits u)1 then if Z.eqb(Z.land u 4194304)0 then 1 else 0 else 0.
Definition dw_quiet(x:fp32):fp32:=fp32_of_bits(Z.lor(bits_of_fp32 x)4194304).
Definition dw_nan(x:fp32):bool:=Binary.is_nan 24 128 x.
Definition dw_snan(x:fp32):bool:=andb(dw_nan x)(Z.eqb(Z.land(bits_of_fp32 x)4194304)0).
Definition canonical_qnan:fp32:=fp32_of_bits 2143289344.
Definition dw_canonicalize(x:fp32):fp32:=if dw_nan x then canonical_qnan else x.
Definition dw_arm_nan2(a b:fp32):fp32:=
 if dw_snan a then dw_quiet a else if dw_snan b then dw_quiet b else
 if dw_nan a then dw_quiet a else dw_quiet b.
Definition dw_arm_nan3(c a b:fp32):fp32:=
 if dw_snan c then dw_quiet c else if dw_snan a then dw_quiet a else
 if dw_snan b then dw_quiet b else if dw_nan c then dw_quiet c else
 if dw_nan a then dw_quiet a else dw_quiet b.
Definition dw_arm_binary(a b r:fp32):fp32:=
 if orb(dw_nan a)(dw_nan b)then dw_arm_nan2 a b else dw_canonicalize r.
Definition dw_arm_add(a b:fp32):fp32:=dw_arm_binary a b(fp32_add a b).
Definition dw_arm_mul(a b:fp32):fp32:=dw_arm_binary a b(fp32_mul a b).
Definition dw_inf(x:fp32):bool:=match x with Binary.B754_infinity _ _ _=>true|_=>false end.
Definition dw_zero_test(x:fp32):bool:=match x with Binary.B754_zero _ _ _=>true|_=>false end.
Definition dw_arm_fma(c a b:fp32):fp32:=
 if andb(andb(dw_nan c)(negb(dw_snan c)))(orb(andb(dw_inf a)(dw_zero_test b))(andb(dw_zero_test a)(dw_inf b)))
 then canonical_qnan else
 if orb(dw_nan c)(orb(dw_nan a)(dw_nan b))then dw_arm_nan3 c a b else dw_canonicalize(fma_rne a b c).
Definition dw_rvv_add(a b:fp32):fp32:=dw_canonicalize(fp32_add a b).
Definition dw_rvv_mul(a b:fp32):fp32:=dw_canonicalize(fp32_mul a b).
Definition dw_rvv_fma(c a b:fp32):fp32:=dw_canonicalize(fma_rne a b c).
Definition fp32_zero_test (a : fp32) : bool :=
  orb (Z.eqb (bits_of_fp32 a) 0) (Z.eqb (bits_of_fp32 a) 2147483648).
Definition fp32_min_number (a b : fp32) : fp32 :=
  if Binary.is_nan 24 128 a then
    if Binary.is_nan 24 128 b then canonical_qnan else b
  else if Binary.is_nan 24 128 b then a
  else if andb (fp32_zero_test a) (fp32_zero_test b) then
    if orb (Binary.Bsign 24 128 a) (Binary.Bsign 24 128 b)
    then fp32_neg_zero else fp32_zero
  else match fp32_compare a b with Some Lt => a | _ => b end.
Definition fp32_max_number (a b : fp32) : fp32 :=
  if Binary.is_nan 24 128 a then
    if Binary.is_nan 24 128 b then canonical_qnan else b
  else if Binary.is_nan 24 128 b then a
  else if andb (fp32_zero_test a) (fp32_zero_test b) then
    if andb (Binary.Bsign 24 128 a) (Binary.Bsign 24 128 b)
    then fp32_neg_zero else fp32_zero
  else match fp32_compare a b with Some Gt => a | _ => b end.

Definition dw_arm_max(a b:fp32):fp32:=if orb(dw_nan a)(dw_nan b)then dw_arm_nan2 a b else fp32_max_number a b.
Definition dw_arm_min(a b:fp32):fp32:=if orb(dw_nan a)(dw_nan b)then dw_arm_nan2 a b else fp32_min_number a b.
Definition dw_rvv_merge(a b:fp32)(mask:Z):fp32:=if Z.eqb mask 0 then a else b.
Definition dw_rvv_nanmask(a:fp32):Z:=if dw_nan a then 1 else 0.
Definition dw_repaired_max(a b:fp32):fp32:=dw_rvv_merge(dw_rvv_merge(fp32_max_number a b)a(dw_rvv_nanmask a))b(dw_rvv_nanmask b).
Definition dw_repaired_min(a b:fp32):fp32:=dw_rvv_merge(dw_rvv_merge(fp32_min_number a b)a(dw_rvv_nanmask a))b(dw_rvv_nanmask b).
Definition dw_neon_lane(bias i0 k0 i1 k1 i2 k2 lo hi:fp32):fp32:=
 dw_arm_min(dw_arm_max(dw_arm_add(dw_arm_fma(dw_arm_fma bias i0 k0)i2 k2)(dw_arm_mul i1 k1))lo)hi.
Definition dw_rvv_lane(bias i0 k0 i1 k1 i2 k2 lo hi:fp32):fp32:=
 dw_repaired_min(dw_repaired_max(dw_rvv_add(dw_rvv_fma(dw_rvv_fma bias i0 k0)i2 k2)(dw_rvv_mul i1 k1))lo)hi.
Definition dw_rel(a b:fp32):Prop:=a=b \/ (fp32_isNaN a /\ fp32_isNaN b).
Definition dw_observe(a b:fp32):Prop:=fp32_eq a b \/ (fp32_isNaN a /\ fp32_isNaN b).
