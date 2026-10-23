From Coq Require Import ZArith String.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qu8Cvt Require Export UnsignedModel.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPreduint8x8_t(p:Z):Assertion :=
(&(p # "uint8x8_t" ->ₛ "s0")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s1")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s2")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s3")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s4")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s5")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s6")) # UChar |->_ **
(&(p # "uint8x8_t" ->ₛ "s7")) # UChar |->_.
Definition UndefStructPredint16x8_t(p:Z):Assertion :=
(&(p # "int16x8_t" ->ₛ "s0")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s1")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s2")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s3")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s4")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s5")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s6")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s7")) # Short |->_.
Definition UndefStructPredint16x4_t(p:Z):Assertion :=
(&(p # "int16x4_t" ->ₛ "s0")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s1")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s2")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s3")) # Short |->_.
Definition UndefStructPredint32x4_t(p:Z):Assertion :=
(&(p # "int32x4_t" ->ₛ "s0")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s1")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s2")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s3")) # Int |->_.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion :=
(&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion :=
(&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
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
Definition UndefStructPredvint16m4_t(p:Z):Assertion :=
(&(p # "vint16m4_t" ->ₛ "s0")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s1")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s2")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s3")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s4")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s5")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s6")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s7")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s8")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s9")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s10")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s11")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s12")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s13")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s14")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s15")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s16")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s17")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s18")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s19")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s20")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s21")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s22")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s23")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s24")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s25")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s26")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s27")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s28")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s29")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s30")) # Short |->_ **
(&(p # "vint16m4_t" ->ₛ "s31")) # Short |->_.
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
Definition UndefStructPredvfloat32m8_t(p:Z):Assertion :=
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

Lemma local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Print Assumptions local_field_address.
Definition UndefStructPreduint16x8_t(p:Z):Assertion :=
(&(p # "uint16x8_t" ->ₛ "s0")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s1")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s2")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s3")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s4")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s5")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s6")) # UShort |->_ **
(&(p # "uint16x8_t" ->ₛ "s7")) # UShort |->_.
Definition UndefStructPredvuint16m4_t(p:Z):Assertion :=
(&(p # "vuint16m4_t" ->ₛ "s0")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s1")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s2")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s3")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s4")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s5")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s6")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s7")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s8")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s9")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s10")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s11")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s12")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s13")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s14")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s15")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s16")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s17")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s18")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s19")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s20")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s21")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s22")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s23")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s24")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s25")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s26")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s27")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s28")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s29")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s30")) # UShort |->_ **
(&(p # "vuint16m4_t" ->ₛ "s31")) # UShort |->_.
