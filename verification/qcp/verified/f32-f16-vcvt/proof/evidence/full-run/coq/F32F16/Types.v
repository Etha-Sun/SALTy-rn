From Coq Require Import ZArith Strings.String.
From F32F16 Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope sac.
Local Open Scope string_scope.
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t (p:Z) : Assertion :=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPreduint32x4_t (p:Z) : Assertion :=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Definition UndefStructPreduint16x8_t (p:Z) : Assertion :=
 (&(p # "uint16x8_t" ->ₛ "s0")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s1")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s2")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s3")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s4")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s5")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s6")) # UShort |->_ **
 (&(p # "uint16x8_t" ->ₛ "s7")) # UShort |->_.
Definition UndefStructPreduint16x4_t (p:Z) : Assertion :=
 (&(p # "uint16x4_t" ->ₛ "s0")) # UShort |->_ **
 (&(p # "uint16x4_t" ->ₛ "s1")) # UShort |->_ **
 (&(p # "uint16x4_t" ->ₛ "s2")) # UShort |->_ **
 (&(p # "uint16x4_t" ->ₛ "s3")) # UShort |->_.
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
Definition UndefStructPredvuint32m8_t (p:Z) : Assertion :=
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
Definition UndefStructPredvuint16m4_t (p:Z) : Assertion :=
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
