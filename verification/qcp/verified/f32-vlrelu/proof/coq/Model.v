From Coq Require Import ZArith Reals Strings.String List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From QcpRvv32 Require Export RvvLoopModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition fp32_bits_equal (x y:fp32) : Prop := x=y.
Definition vlrelu_signed32 (u:Z) : Z := if Z.ltb u 2147483648 then u else u-4294967296.
Definition vlrelu_scalar (x c:fp32) : fp32 :=
 if Z.ltb 2147483647 (bits_of_fp32 x) then fp32_mul x c else x.
Definition vlrelu_values (n:Z) (a:list fp32) (c:fp32) : list fp32 :=
 firstn (Z.to_nat n) (map (fun x=>vlrelu_scalar x c) a).
Definition vlrelu_active_mul (i vl:Z) (x c:fp32) : fp32 :=
 if Z.ltb i vl then fp32_mul x c else fp32_zero.
Definition vlrelu_compare_mask (x y:Z) : Z := if Z.ltb x y then 4294967295 else 0.
Definition vlrelu_bitselect (m:Z) (a b:fp32) : fp32 :=
 fp32_of_bits (Z.lor (Z.land m (bits_of_fp32 a))
  (Z.land (Z.lxor m 4294967295) (bits_of_fp32 b))).
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
Definition UndefStructPredint32x4_t (p:Z) : Assertion :=
 (&(p # "int32x4_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s3")) # Int |->_.
Definition UndefStructPreduint32x4_t (p:Z) : Assertion :=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
