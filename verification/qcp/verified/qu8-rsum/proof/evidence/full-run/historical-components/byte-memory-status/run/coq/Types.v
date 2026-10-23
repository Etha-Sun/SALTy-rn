From Coq Require Import ZArith String.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qu8Rsum Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPreduint8x16_t(p:Z):Assertion :=
(&(p # "uint8x16_t" ->ₛ "s0")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s1")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s2")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s3")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s4")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s5")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s6")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s7")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s8")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s9")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s10")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s11")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s12")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s13")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s14")) # UChar |->_ **
(&(p # "uint8x16_t" ->ₛ "s15")) # UChar |->_.
Definition UndefStructPreduint16x8_t(p:Z):Assertion :=
(&(p # "uint16x8_t" ->ₛ "s0")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s1")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s2")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s3")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s4")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s5")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s6")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s7")) # UShort |->_.
Definition UndefStructPreduint32x4_t(p:Z):Assertion :=
(&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Definition UndefStructPredvuint8m2_t(p:Z):Assertion :=
(&(p # "vuint8m2_t" ->ₛ "s0")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s1")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s2")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s3")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s4")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s5")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s6")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s7")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s8")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s9")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s10")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s11")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s12")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s13")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s14")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s15")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s16")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s17")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s18")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s19")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s20")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s21")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s22")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s23")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s24")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s25")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s26")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s27")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s28")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s29")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s30")) # UChar |->_ **
(&(p # "vuint8m2_t" ->ₛ "s31")) # UChar |->_.
Definition UndefStructPredvuint32m8_t(p:Z):Assertion :=
(&(p # "vuint32m8_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s3")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s4")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s5")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s6")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s7")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s8")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s9")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s10")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s11")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s12")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s13")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s14")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s15")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s16")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s17")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s18")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s19")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s20")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s21")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s22")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s23")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s24")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s25")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s26")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s27")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s28")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s29")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s30")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s31")) # UInt |->_.
Definition UndefStructPredvuint32m1_t(p:Z):Assertion :=
(&(p # "vuint32m1_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s3")) # UInt |->_.
Lemma local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Print Assumptions local_field_address.

