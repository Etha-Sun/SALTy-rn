From Coq Require Import ZArith Lia Lra List Reals Strings.String.
From VLRelu Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition rvv_signed_bits (x:fp32) : Z :=
 if Z.ltb (bits_of_fp32 x) 2147483648 then bits_of_fp32 x else bits_of_fp32 x - 4294967296.
Definition rvv_mask (i vl x b:Z) : Z :=
 if Z.ltb i vl then if Z.ltb x b then 1 else 0 else 0.
Definition rvv_merge (i vl:Z) (a b:fp32) (m:Z) : fp32 :=
 if Z.ltb i vl then if Z.eqb m 0 then a else b else fp32_zero.
Definition UndefStructPredvint32m8_t (p:Z) : Assertion :=
 (&(p # "vint32m8_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s3")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s4")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s5")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s6")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s7")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s8")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s9")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s10")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s11")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s12")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s13")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s14")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s15")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s16")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s17")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s18")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s19")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s20")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s21")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s22")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s23")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s24")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s25")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s26")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s27")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s28")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s29")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s30")) # Int |->_ **
 (&(p # "vint32m8_t" ->ₛ "s31")) # Int |->_.
Definition UndefStructPredvbool4_t (p:Z) : Assertion :=
 (&(p # "vbool4_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s3")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s4")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s5")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s6")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s7")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s8")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s9")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s10")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s11")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s12")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s13")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s14")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s15")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s16")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s17")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s18")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s19")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s20")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s21")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s22")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s23")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s24")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s25")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s26")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s27")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s28")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s29")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s30")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s31")) # Int |->_.

Lemma rvv_c_zero : fp32_of_real (0.0%R) = fp32_zero.
Proof.
 replace (0.0%R) with (0%R) by (unfold Q2R; simpl; ring).
 unfold fp32_of_real, rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0, Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra.
 reflexivity.
Qed.
