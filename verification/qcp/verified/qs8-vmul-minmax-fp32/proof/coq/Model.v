From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic FloatLib IntLib.
From Flocq.IEEE754 Require Import Binary.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
(* ARM AH/DN/FZ/FIZ=0 and RNE; RVV RNE canonical arithmetic NaNs.
   Exception flags and saturation flags are not observed; traps disabled.
   These public mathematical definitions are the proposed intrinsic boundary;
   no claim of formal ISA correspondence or a complete C proof is made. *)
Definition qm_same_bits(a b:fp32):Prop:=a=b.
Definition qm_abs (x:fp32):fp32:=fp32_of_bits(Z.land(bits_of_fp32 x)2147483647).
Definition qm_sign (a b:fp32):fp32:=fp32_of_bits(Z.lor(Z.land(bits_of_fp32 a)2147483647)(Z.land(bits_of_fp32 b)2147483648)).
Definition qm_quiet(x:fp32):fp32:=fp32_of_bits(Z.lor(bits_of_fp32 x)4194304).
Definition qm_abs_bits (u:Z) : Z := Z.land u 2147483647.
Definition qm_nan_bits (u:Z) : Z := if Z.ltb 2139095040 (qm_abs_bits u) then 1 else 0.
Definition qm_snan_bits (u:Z) : Z := if Z.eqb (qm_nan_bits u) 1 then if Z.eqb (Z.land u 4194304) 0 then 1 else 0 else 0.
Definition qm_key (u:Z) : Z := if Z.eqb (Z.land u 2147483648) 0 then Z.lxor u 2147483648 else Z.lxor u 4294967295.
Definition qm_gt_bits (a b:Z) : Z :=
 if orb (Z.eqb (qm_nan_bits a) 1) (Z.eqb (qm_nan_bits b) 1) then 0 else
 if andb (Z.eqb (qm_abs_bits a) 0) (Z.eqb (qm_abs_bits b) 0) then 0 else
 if Z.ltb (qm_key b) (qm_key a) then 1 else 0.
Definition qm_abs_lt_bits (a b:Z) : Z :=
 if orb (Z.eqb (qm_nan_bits a) 1) (Z.eqb (qm_nan_bits b) 1) then 0 else
 if Z.ltb (qm_abs_bits a) (qm_abs_bits b) then 4294967295 else 0.
Definition qm_ne_bits (a b:Z) : Z :=
 if orb (Z.eqb (qm_nan_bits a) 1) (Z.eqb (qm_nan_bits b) 1) then 1 else
 if andb (Z.eqb (qm_abs_bits a) 0) (Z.eqb (qm_abs_bits b) 0) then 0 else
 if Z.eqb a b then 0 else 1.
Definition qm_gt (a b:fp32) : Z := qm_gt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition qm_abs_lt (a b:fp32) : Z := qm_abs_lt_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition qm_ne (a b:fp32) : Z := qm_ne_bits (bits_of_fp32 a) (bits_of_fp32 b).
Definition qm_arm_nan (a b:fp32) : Z :=
 let ua:=bits_of_fp32 a in let ub:=bits_of_fp32 b in
 if Z.eqb (qm_snan_bits ua) 1 then Z.lor ua 4194304 else
 if Z.eqb (qm_snan_bits ub) 1 then Z.lor ub 4194304 else
 if Z.eqb (qm_nan_bits ua) 1 then ua else ub.
Definition qm_arm_result (a b r:fp32) : fp32 :=
 if orb (Z.eqb (qm_nan_bits (bits_of_fp32 a)) 1) (Z.eqb (qm_nan_bits (bits_of_fp32 b)) 1)
 then fp32_of_bits (qm_arm_nan a b) else
 if Z.eqb (qm_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition qm_rvv_result (r:fp32) : fp32 :=
 if Z.eqb (qm_nan_bits (bits_of_fp32 r)) 1 then fp32_of_bits 2143289344 else r.
Definition qm_arm_add (a b:fp32) : fp32 := qm_arm_result a b (fp32_add a b).
Definition qm_arm_sub (a b:fp32) : fp32 := qm_arm_result a b (fp32_sub a b).
Definition qm_rvv_add (a b:fp32) : fp32 := qm_rvv_result (fp32_add a b).
Definition qm_rvv_sub (a b:fp32) : fp32 := qm_rvv_result (fp32_sub a b).
Definition qm_arm_mul(a b:fp32):fp32:=qm_arm_result a b(fp32_mul a b).
Definition qm_rvv_mul(a b:fp32):fp32:=qm_rvv_result(fp32_mul a b).
Definition qm_of_int(x:Z):fp32:=
 Binary.binary_normalize 24 128 eq_refl eq_refl BinarySingleNaN.mode_NE x 0 false.
Definition qm_magic:fp32:=fp32_of_bits 1262485504.
Definition qm_clip(lo hi x:Z):Z:=Z.max lo(Z.min hi x).
Definition qm_sat32(x:Z):Z:=qm_clip(-2147483648)2147483647 x.
Definition qm_sat16(x:Z):Z:=qm_clip(-32768)32767 x.
Definition qm_sat8(x:Z):Z:=qm_clip(-128)127 x.
Definition qm_signed_bits(u:Z):Z:=if Z.ltb u 2147483648 then u else u-4294967296.
Definition qm_quant_bits(u oz lo hi:Z):Z:=
 Z.min(Z.max(qm_sat8(qm_sat16(qm_sat32(qm_signed_bits u-(1262485504-oz)))))lo)hi.
Definition qm_neon_lane(a b az bz:Z)(scale:fp32)(oz lo hi:Z):Z:=
 let p:=qm_of_int((a-az)*(b-bz)) in
 qm_quant_bits(bits_of_fp32(qm_arm_add(qm_arm_mul p scale)qm_magic))oz lo hi.
Definition qm_rvv_lane(a b az bz:Z)(scale:fp32)(oz lo hi:Z):Z:=
 let p:=qm_of_int((a-az)*(b-bz)) in
 let x:=qm_rvv_add(qm_rvv_mul p scale)qm_magic in
 let y:=if Z.eqb(qm_ne scale scale)0 then x else qm_sign x scale in
 qm_quant_bits(bits_of_fp32 y)oz lo hi.
Definition qm_vl_allowed(avl vl:Z):Prop:=
 (0<=avl<=32 /\ vl=avl) \/
 (32<avl<64 /\ (avl+1)/2<=vl<=32) \/
 (64<=avl /\ vl=32).
