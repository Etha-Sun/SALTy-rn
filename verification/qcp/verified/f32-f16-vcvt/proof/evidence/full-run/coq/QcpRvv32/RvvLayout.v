From Coq Require Import ZArith Strings.String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
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
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |->_ .
Lemma rvv_local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof.
 intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity].
Qed.
Print Assumptions rvv_local_field_address.

Lemma rvv_local_undef_fields : forall (v:string),
 UndefStructPredvfloat32m8_t (&(v)) =
 (&(&(v) ->ₛ "s0")) # Float |->_ **
 (&(&(v) ->ₛ "s1")) # Float |->_ **
 (&(&(v) ->ₛ "s2")) # Float |->_ **
 (&(&(v) ->ₛ "s3")) # Float |->_ **
 (&(&(v) ->ₛ "s4")) # Float |->_ **
 (&(&(v) ->ₛ "s5")) # Float |->_ **
 (&(&(v) ->ₛ "s6")) # Float |->_ **
 (&(&(v) ->ₛ "s7")) # Float |->_ **
 (&(&(v) ->ₛ "s8")) # Float |->_ **
 (&(&(v) ->ₛ "s9")) # Float |->_ **
 (&(&(v) ->ₛ "s10")) # Float |->_ **
 (&(&(v) ->ₛ "s11")) # Float |->_ **
 (&(&(v) ->ₛ "s12")) # Float |->_ **
 (&(&(v) ->ₛ "s13")) # Float |->_ **
 (&(&(v) ->ₛ "s14")) # Float |->_ **
 (&(&(v) ->ₛ "s15")) # Float |->_ **
 (&(&(v) ->ₛ "s16")) # Float |->_ **
 (&(&(v) ->ₛ "s17")) # Float |->_ **
 (&(&(v) ->ₛ "s18")) # Float |->_ **
 (&(&(v) ->ₛ "s19")) # Float |->_ **
 (&(&(v) ->ₛ "s20")) # Float |->_ **
 (&(&(v) ->ₛ "s21")) # Float |->_ **
 (&(&(v) ->ₛ "s22")) # Float |->_ **
 (&(&(v) ->ₛ "s23")) # Float |->_ **
 (&(&(v) ->ₛ "s24")) # Float |->_ **
 (&(&(v) ->ₛ "s25")) # Float |->_ **
 (&(&(v) ->ₛ "s26")) # Float |->_ **
 (&(&(v) ->ₛ "s27")) # Float |->_ **
 (&(&(v) ->ₛ "s28")) # Float |->_ **
 (&(&(v) ->ₛ "s29")) # Float |->_ **
 (&(&(v) ->ₛ "s30")) # Float |->_ **
 (&(&(v) ->ₛ "s31")) # Float |->_.
Proof. intros; unfold UndefStructPredvfloat32m8_t; rewrite !rvv_local_field_address; reflexivity. Qed.
