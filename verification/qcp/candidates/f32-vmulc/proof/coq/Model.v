From Coq Require Import ZArith Reals Strings.String List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition fp32_bits_equal (x y:fp32) : Prop := x=y.
Definition vmulc_active_mul (i vl:Z) (x c:fp32) : fp32 :=
 if Z.ltb i vl then fp32_mul x c else fp32_of_real (0.0%R).
Definition vmulc_values (n:Z) (a:list fp32) (c:fp32) : list fp32 :=
 List.firstn (Z.to_nat n) (List.map (fun x=>fp32_mul x c) a).
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredvfloat32m8_t (p:Z) : Assertion :=
 (&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |->_.
Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof.
 intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity].
Qed.
