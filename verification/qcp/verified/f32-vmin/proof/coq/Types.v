From Coq Require Import ZArith String.
From FMin Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t (p:Z) : Assertion :=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
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
Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
