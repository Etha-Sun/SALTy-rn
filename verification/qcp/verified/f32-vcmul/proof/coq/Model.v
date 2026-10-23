From Coq Require Import ZArith Lia Lra List Reals Strings.String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition same_fp32 (a b:fp32) : Prop := a=b.
Definition vcmul_mla (a b c:fp32) : fp32 := fp32_add a (fp32_mul b c).
Definition vcmul_mls (a b c:fp32) : fp32 := fp32_sub a (fp32_mul b c).
Definition vcmul_active_mul (i vl:Z)(a b:fp32) : fp32 := if Z.ltb i vl then fp32_mul a b else fp32_of_bits 0.
Definition vcmul_active_add (i vl:Z)(a b:fp32) : fp32 := if Z.ltb i vl then fp32_add a b else fp32_of_bits 0.
Definition vcmul_active_sub (i vl:Z)(a b:fp32) : fp32 := if Z.ltb i vl then fp32_sub a b else fp32_of_bits 0.
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t (p:Z) : Assertion :=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPredvfloat32m4_t (p:Z) : Assertion :=
 (&(p # "vfloat32m4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s3")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s4")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s5")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s6")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s7")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s8")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s9")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s10")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s11")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s12")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s13")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s14")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s15")) # Float |->_.
Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
Lemma vcmul_c_zero : fp32_of_real (0.0%R) = fp32_of_bits 0.
Proof.
 change (fp32_of_real (0.0%R) = fp32_zero).
 replace (0.0%R) with (0%R) by (unfold Q2R; simpl; ring).
 unfold fp32_of_real, rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0, Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra.
 reflexivity.
Qed.
