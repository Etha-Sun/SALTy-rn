From Coq Require Import ZArith Bool List.
From SimpleC.SL Require Export Mem SeparationLogic.
From ExpMinusMax Require Export FmaModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition em_abs_bits(u:Z):Z:=Z.land u 2147483647.
Definition em_nan_bits(u:Z):Z:=if Z.ltb 2139095040(em_abs_bits u)then 1 else 0.
Definition em_snan_bits(u:Z):Z:=if Z.eqb(em_nan_bits u)1 then if Z.eqb(Z.land u 4194304)0 then 1 else 0 else 0.
Definition em_quiet(x:fp32):fp32:=fp32_of_bits(Z.lor(bits_of_fp32 x)4194304).
Definition em_nan(x:fp32):bool:=Binary.is_nan 24 128 x.
Definition em_snan(x:fp32):bool:=andb(em_nan x)(Z.eqb(Z.land(bits_of_fp32 x)4194304)0).
Definition canonical_qnan:fp32:=fp32_of_bits 2143289344.
Definition em_canonicalize(x:fp32):fp32:=if em_nan x then canonical_qnan else x.
Definition em_arm_nan2(a b:fp32):fp32:=
 if em_snan a then em_quiet a else if em_snan b then em_quiet b else
 if em_nan a then em_quiet a else em_quiet b.
Definition em_arm_nan3(c a b:fp32):fp32:=
 if em_snan c then em_quiet c else if em_snan a then em_quiet a else
 if em_snan b then em_quiet b else if em_nan c then em_quiet c else
 if em_nan a then em_quiet a else em_quiet b.
Definition em_arm_binary(a b r:fp32):fp32:=
 if orb(em_nan a)(em_nan b)then em_arm_nan2 a b else em_canonicalize r.
Definition em_arm_add(a b:fp32):fp32:=em_arm_binary a b(fp32_add a b).
Definition em_arm_mul(a b:fp32):fp32:=em_arm_binary a b(fp32_mul a b).
Definition em_inf(x:fp32):bool:=match x with Binary.B754_infinity _ _ _=>true|_=>false end.
Definition em_zero_test(x:fp32):bool:=match x with Binary.B754_zero _ _ _=>true|_=>false end.
Definition em_arm_fma(c a b:fp32):fp32:=
 if andb(andb(em_nan c)(negb(em_snan c)))(orb(andb(em_inf a)(em_zero_test b))(andb(em_zero_test a)(em_inf b)))
 then canonical_qnan else
 if orb(em_nan c)(orb(em_nan a)(em_nan b))then em_arm_nan3 c a b else em_canonicalize(fma_rne a b c).
Definition em_rvv_add(a b:fp32):fp32:=em_canonicalize(fp32_add a b).
Definition em_rvv_mul(a b:fp32):fp32:=em_canonicalize(fp32_mul a b).
Definition em_rvv_fma(c a b:fp32):fp32:=em_canonicalize(fma_rne a b c).
Definition em_rel(a b:fp32):Prop:=a=b \/ (fp32_isNaN a /\ fp32_isNaN b).
Definition em_observe(a b:fp32):Prop:=fp32_eq a b \/ (fp32_isNaN a /\ fp32_isNaN b).

(* FPSub processes NaNs before finite subtraction; no NaN sign flip. *)
Definition em_arm_sub(a b:fp32):fp32:=em_arm_binary a b(fp32_sub a b).
Definition em_rvv_sub(a b:fp32):fp32:=em_canonicalize(fp32_sub a b).
