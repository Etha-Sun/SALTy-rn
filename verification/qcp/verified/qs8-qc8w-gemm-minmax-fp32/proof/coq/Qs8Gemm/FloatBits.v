From Coq Require Import ZArith List Lia Reals Strings.String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition f16_same_bits (a b:fp32) : Prop := a=b.
Definition f16_abs (x:fp32) : fp32 := fp32_of_bits (Z.land (bits_of_fp32 x) 2147483647).
Definition f16_sign (a b:fp32) : fp32 := fp32_of_bits (Z.lor (Z.land (bits_of_fp32 a) 2147483647) (Z.land (bits_of_fp32 b) 2147483648)).
Definition f16_select (m:Z) (a b:fp32) : fp32 := fp32_of_bits (Z.lor (Z.land m (bits_of_fp32 a)) (Z.land (Z.lxor m 4294967295) (bits_of_fp32 b))).
Definition f16_quiet (x:fp32) : fp32 := fp32_of_bits (Z.lor (bits_of_fp32 x) 4194304).
Definition f16_abs_bits (u:Z) : Z := Z.land u 2147483647.
Definition f16_nan_bits (u:Z) : Z := if Z.ltb 2139095040 (f16_abs_bits u) then 1 else 0.
Definition f16_snan_bits (u:Z) : Z := if Z.eqb (f16_nan_bits u) 1 then if Z.eqb (Z.land u 4194304) 0 then 1 else 0 else 0.
Definition f16_key (u:Z) : Z := if Z.eqb (Z.land u 2147483648) 0 then Z.lxor u 2147483648 else Z.lxor u 4294967295.
Definition f16_gt_bits (a b:Z) : Z :=
 if orb (Z.eqb (f16_nan_bits a) 1) (Z.eqb (f16_nan_bits b) 1) then 0 else
 if andb (Z.eqb (f16_abs_bits a) 0) (Z.eqb (f16_abs_bits b) 0) then 0 else
 if Z.ltb (f16_key b) (f16_key a) then 1 else 0.
Definition f16_abs_lt_bits (a b:Z) : Z :=
 if orb (Z.eqb (f16_nan_bits a) 1) (Z.eqb (f16_nan_bits b) 1) then 0 else
 if Z.ltb (f16_abs_bits a) (f16_abs_bits b) then 4294967295 else 0.
Definition f16_ne_bits (a b:Z) : Z :=
 if orb (Z.eqb (f16_nan_bits a) 1) (Z.eqb (f16_nan_bits b) 1) then 1 else
 if andb (Z.eqb (f16_abs_bits a) 0) (Z.eqb (f16_abs_bits b) 0) then 0 else
 if Z.eqb a b then 0 else 1.
Definition f16_gt (a b:fp32) : Z := f16_gt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition f16_abs_lt (a b:fp32) : Z := f16_abs_lt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition f16_ne (a b:fp32) : Z := f16_ne_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition f16_arm_nan (a b:fp32) : Z :=
 let ua:=bits_of_fp32 a in let ub:=bits_of_fp32 b in
 if Z.eqb (f16_snan_bits ua) 1 then Z.lor ua 4194304 else
 if Z.eqb (f16_snan_bits ub) 1 then Z.lor ub 4194304 else
 if Z.eqb (f16_nan_bits ua) 1 then ua else ub.
Definition f16_arm_result (a b r:fp32) : fp32 :=
 if orb (Z.eqb (f16_nan_bits (bits_of_fp32 a)) 1) (Z.eqb (f16_nan_bits (bits_of_fp32 b)) 1)
 then fp32_of_bits (f16_arm_nan a b) else
 if Z.eqb (f16_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition f16_rvv_result (r:fp32) : fp32 :=
 if Z.eqb (f16_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition f16_arm_add (a b:fp32) : fp32 := f16_arm_result a b (fp32_add a b).
Definition f16_arm_sub (a b:fp32) : fp32 := f16_arm_result a b (fp32_sub a b).
Definition f16_rvv_add (a b:fp32) : fp32 := f16_rvv_result (fp32_add a b).
Definition f16_rvv_sub (a b:fp32) : fp32 := f16_rvv_result (fp32_sub a b).
Definition f16_arm_mul (a b:fp32) : fp32 := f16_arm_result a b (fp32_mul a b).
Definition f16_rvv_mul (a b:fp32) : fp32 := f16_rvv_result (fp32_mul a b).
