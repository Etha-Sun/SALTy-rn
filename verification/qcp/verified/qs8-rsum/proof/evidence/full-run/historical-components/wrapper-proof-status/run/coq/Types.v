From Coq Require Import ZArith String.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qs8Rsum Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredint8x16_t(p:Z):Assertion :=
(&(p # "int8x16_t" ->ₛ "s0")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s1")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s2")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s3")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s4")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s5")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s6")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s7")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s8")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s9")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s10")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s11")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s12")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s13")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s14")) # Char |->_ **
(&(p # "int8x16_t" ->ₛ "s15")) # Char |->_.
Definition UndefStructPredint16x8_t(p:Z):Assertion :=
(&(p # "int16x8_t" ->ₛ "s0")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s1")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s2")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s3")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s4")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s5")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s6")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s7")) # Short |->_.
Definition UndefStructPredint32x4_t(p:Z):Assertion :=
(&(p # "int32x4_t" ->ₛ "s0")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s1")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s2")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s3")) # Int |->_.
Definition UndefStructPredvint8m2_t(p:Z):Assertion :=
(&(p # "vint8m2_t" ->ₛ "s0")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s1")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s2")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s3")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s4")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s5")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s6")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s7")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s8")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s9")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s10")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s11")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s12")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s13")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s14")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s15")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s16")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s17")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s18")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s19")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s20")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s21")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s22")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s23")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s24")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s25")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s26")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s27")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s28")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s29")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s30")) # Char |->_ **
(&(p # "vint8m2_t" ->ₛ "s31")) # Char |->_.
Definition UndefStructPredvint32m8_t(p:Z):Assertion :=
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
Definition UndefStructPredvint32m1_t(p:Z):Assertion :=
(&(p # "vint32m1_t" ->ₛ "s0")) # Int |->_ **
(&(p # "vint32m1_t" ->ₛ "s1")) # Int |->_ **
(&(p # "vint32m1_t" ->ₛ "s2")) # Int |->_ **
(&(p # "vint32m1_t" ->ₛ "s3")) # Int |->_.
Lemma local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Print Assumptions local_field_address.

