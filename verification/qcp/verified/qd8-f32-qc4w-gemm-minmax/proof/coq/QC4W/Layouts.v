From Coq Require Import ZArith String.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredint8x8_t(p:Z):Assertion:=
(&(p # "int8x8_t" ->ₛ "s0")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s1")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s2")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s3")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s4")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s5")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s6")) # Char |->_ **
(&(p # "int8x8_t" ->ₛ "s7")) # Char |->_.
Definition UndefStructPredint16x8_t(p:Z):Assertion:=
(&(p # "int16x8_t" ->ₛ "s0")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s1")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s2")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s3")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s4")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s5")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s6")) # Short |->_ **
(&(p # "int16x8_t" ->ₛ "s7")) # Short |->_.
Definition UndefStructPredint16x4_t(p:Z):Assertion:=
(&(p # "int16x4_t" ->ₛ "s0")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s1")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s2")) # Short |->_ **
(&(p # "int16x4_t" ->ₛ "s3")) # Short |->_.
Definition UndefStructPredint32x4_t(p:Z):Assertion:=
(&(p # "int32x4_t" ->ₛ "s0")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s1")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s2")) # Int |->_ **
(&(p # "int32x4_t" ->ₛ "s3")) # Int |->_.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion:=
(&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion:=
(&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPredvint8m2_t(p:Z):Assertion:=
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
(&(p # "vint8m2_t" ->ₛ "s15")) # Char |->_.
Definition UndefStructPredvint16m4_t(p:Z):Assertion:=
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
(&(p # "vint16m4_t" ->ₛ "s15")) # Short |->_.
Definition UndefStructPredvint32m8_t(p:Z):Assertion:=
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
(&(p # "vint32m8_t" ->ₛ "s15")) # Int |->_.
Definition UndefStructPredvfloat32m8_t(p:Z):Assertion:=
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
(&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |->_.
Definition UndefStructPredvbool4_t(p:Z):Assertion:=
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
(&(p # "vbool4_t" ->ₛ "s15")) # Int |->_.
