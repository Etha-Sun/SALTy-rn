From Coq Require Import ZArith List Lia Reals Strings.String.
From SimpleC.SL Require Export Mem SeparationLogic.
From QcpRvv32 Require Export RvvLoopModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition rndne_same_bits (a b:fp32) : Prop := a=b.
Definition rndne_abs (x:fp32) : fp32 := fp32_of_bits (Z.land (bits_of_fp32 x) 2147483647).
Definition rndne_sign (a b:fp32) : fp32 := fp32_of_bits (Z.lor (Z.land (bits_of_fp32 a) 2147483647) (Z.land (bits_of_fp32 b) 2147483648)).
Definition rndne_select (m:Z) (a b:fp32) : fp32 := fp32_of_bits (Z.lor (Z.land m (bits_of_fp32 a)) (Z.land (Z.lxor m 4294967295) (bits_of_fp32 b))).
Definition rndne_quiet (x:fp32) : fp32 := fp32_of_bits (Z.lor (bits_of_fp32 x) 4194304).
Definition rndne_abs_bits (u:Z) : Z := Z.land u 2147483647.
Definition rndne_nan_bits (u:Z) : Z := if Z.ltb 2139095040 (rndne_abs_bits u) then 1 else 0.
Definition rndne_snan_bits (u:Z) : Z := if Z.eqb (rndne_nan_bits u) 1 then if Z.eqb (Z.land u 4194304) 0 then 1 else 0 else 0.
Definition rndne_key (u:Z) : Z := if Z.eqb (Z.land u 2147483648) 0 then Z.lxor u 2147483648 else Z.lxor u 4294967295.
Definition rndne_gt_bits (a b:Z) : Z :=
 if orb (Z.eqb (rndne_nan_bits a) 1) (Z.eqb (rndne_nan_bits b) 1) then 0 else
 if andb (Z.eqb (rndne_abs_bits a) 0) (Z.eqb (rndne_abs_bits b) 0) then 0 else
 if Z.ltb (rndne_key b) (rndne_key a) then 1 else 0.
Definition rndne_abs_lt_bits (a b:Z) : Z :=
 if orb (Z.eqb (rndne_nan_bits a) 1) (Z.eqb (rndne_nan_bits b) 1) then 0 else
 if Z.ltb (rndne_abs_bits a) (rndne_abs_bits b) then 4294967295 else 0.
Definition rndne_ne_bits (a b:Z) : Z :=
 if orb (Z.eqb (rndne_nan_bits a) 1) (Z.eqb (rndne_nan_bits b) 1) then 1 else
 if andb (Z.eqb (rndne_abs_bits a) 0) (Z.eqb (rndne_abs_bits b) 0) then 0 else
 if Z.eqb a b then 0 else 1.
Definition rndne_gt (a b:fp32) : Z := rndne_gt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition rndne_abs_lt (a b:fp32) : Z := rndne_abs_lt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition rndne_ne (a b:fp32) : Z := rndne_ne_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition rndne_arm_nan (a b:fp32) : Z :=
 let ua:=bits_of_fp32 a in let ub:=bits_of_fp32 b in
 if Z.eqb (rndne_snan_bits ua) 1 then Z.lor ua 4194304 else
 if Z.eqb (rndne_snan_bits ub) 1 then Z.lor ub 4194304 else
 if Z.eqb (rndne_nan_bits ua) 1 then ua else ub.
Definition rndne_arm_result (a b r:fp32) : fp32 :=
 if orb (Z.eqb (rndne_nan_bits (bits_of_fp32 a)) 1) (Z.eqb (rndne_nan_bits (bits_of_fp32 b)) 1)
 then fp32_of_bits (rndne_arm_nan a b) else
 if Z.eqb (rndne_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition rndne_rvv_result (r:fp32) : fp32 :=
 if Z.eqb (rndne_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition rndne_arm_add (a b:fp32) : fp32 := rndne_arm_result a b (fp32_add a b).
Definition rndne_arm_sub (a b:fp32) : fp32 := rndne_arm_result a b (fp32_sub a b).
Definition rndne_rvv_add (a b:fp32) : fp32 := rndne_rvv_result (fp32_add a b).
Definition rndne_rvv_sub (a b:fp32) : fp32 := rndne_rvv_result (fp32_sub a b).
Definition rndne_magic : fp32 := fp32_of_bits 1258291200.
Definition rndne_round_abs (x:fp32) : fp32 := rndne_arm_sub (rndne_arm_add (rndne_abs x) rndne_magic) rndne_magic.
Definition rndne_neon (x:fp32) : fp32 := rndne_select (Z.lor (rndne_abs_lt rndne_magic x) 2147483648) x (rndne_round_abs x).
Definition rndne_rvv (x:fp32) : fp32 := if Z.eqb (rndne_ne x x) 0 then (if Z.eqb (rndne_gt (rndne_abs x) rndne_magic) 0 then rndne_sign (rndne_rvv_sub (rndne_rvv_add (rndne_abs x) rndne_magic) rndne_magic) x else x) else rndne_quiet x.
Definition rndne_observe (a b:fp32) : Prop := fp32_eq a b \/ (fp32_isNaN a /\ fp32_isNaN b).
Definition rndne_values (n:Z) (xs:list fp32) : list fp32 := firstn (Z.to_nat n) (map rndne_neon xs).

Definition rndne_or (a b:Z) : Z := Z.lor a b.
