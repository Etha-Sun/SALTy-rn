From Coq Require Import ZArith Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
From F32F16 Require Import Types.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac. Local Open Scope string_scope.
Lemma f16_forget_vfloat32m8_t:forall(p:Z)(x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:fp32),
 (&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |-> x0 **
 (&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |-> x1 **
 (&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |-> x2 **
 (&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |-> x3 **
 (&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |-> x4 **
 (&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |-> x5 **
 (&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |-> x6 **
 (&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |-> x7 **
 (&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |-> x8 **
 (&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |-> x9 **
 (&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |-> x10 **
 (&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |-> x11 **
 (&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |-> x12 **
 (&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |-> x13 **
 (&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |-> x14 **
 (&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |-> x15 **
 (&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |-> x16 **
 (&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |-> x17 **
 (&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |-> x18 **
 (&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |-> x19 **
 (&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |-> x20 **
 (&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |-> x21 **
 (&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |-> x22 **
 (&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |-> x23 **
 (&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |-> x24 **
 (&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |-> x25 **
 (&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |-> x26 **
 (&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |-> x27 **
 (&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |-> x28 **
 (&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |-> x29 **
 (&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |-> x30 **
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |-> x31 |-- F32F16.Types.UndefStructPredvfloat32m8_t p.
Proof. intros;unfold F32F16.Types.UndefStructPredvfloat32m8_t;do 31(apply derivable1_sepcon_mono;[|apply store_float_undef_store_float]);apply store_float_undef_store_float. Qed.
Print Assumptions f16_forget_vfloat32m8_t.
Lemma f16_forget_vuint32m8_t:forall(p:Z)(x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:Z),
 (&(p # "vuint32m8_t" ->ₛ "s0")) # UInt |-> x0 **
 (&(p # "vuint32m8_t" ->ₛ "s1")) # UInt |-> x1 **
 (&(p # "vuint32m8_t" ->ₛ "s2")) # UInt |-> x2 **
 (&(p # "vuint32m8_t" ->ₛ "s3")) # UInt |-> x3 **
 (&(p # "vuint32m8_t" ->ₛ "s4")) # UInt |-> x4 **
 (&(p # "vuint32m8_t" ->ₛ "s5")) # UInt |-> x5 **
 (&(p # "vuint32m8_t" ->ₛ "s6")) # UInt |-> x6 **
 (&(p # "vuint32m8_t" ->ₛ "s7")) # UInt |-> x7 **
 (&(p # "vuint32m8_t" ->ₛ "s8")) # UInt |-> x8 **
 (&(p # "vuint32m8_t" ->ₛ "s9")) # UInt |-> x9 **
 (&(p # "vuint32m8_t" ->ₛ "s10")) # UInt |-> x10 **
 (&(p # "vuint32m8_t" ->ₛ "s11")) # UInt |-> x11 **
 (&(p # "vuint32m8_t" ->ₛ "s12")) # UInt |-> x12 **
 (&(p # "vuint32m8_t" ->ₛ "s13")) # UInt |-> x13 **
 (&(p # "vuint32m8_t" ->ₛ "s14")) # UInt |-> x14 **
 (&(p # "vuint32m8_t" ->ₛ "s15")) # UInt |-> x15 **
 (&(p # "vuint32m8_t" ->ₛ "s16")) # UInt |-> x16 **
 (&(p # "vuint32m8_t" ->ₛ "s17")) # UInt |-> x17 **
 (&(p # "vuint32m8_t" ->ₛ "s18")) # UInt |-> x18 **
 (&(p # "vuint32m8_t" ->ₛ "s19")) # UInt |-> x19 **
 (&(p # "vuint32m8_t" ->ₛ "s20")) # UInt |-> x20 **
 (&(p # "vuint32m8_t" ->ₛ "s21")) # UInt |-> x21 **
 (&(p # "vuint32m8_t" ->ₛ "s22")) # UInt |-> x22 **
 (&(p # "vuint32m8_t" ->ₛ "s23")) # UInt |-> x23 **
 (&(p # "vuint32m8_t" ->ₛ "s24")) # UInt |-> x24 **
 (&(p # "vuint32m8_t" ->ₛ "s25")) # UInt |-> x25 **
 (&(p # "vuint32m8_t" ->ₛ "s26")) # UInt |-> x26 **
 (&(p # "vuint32m8_t" ->ₛ "s27")) # UInt |-> x27 **
 (&(p # "vuint32m8_t" ->ₛ "s28")) # UInt |-> x28 **
 (&(p # "vuint32m8_t" ->ₛ "s29")) # UInt |-> x29 **
 (&(p # "vuint32m8_t" ->ₛ "s30")) # UInt |-> x30 **
 (&(p # "vuint32m8_t" ->ₛ "s31")) # UInt |-> x31 |-- F32F16.Types.UndefStructPredvuint32m8_t p.
Proof. intros;unfold F32F16.Types.UndefStructPredvuint32m8_t;do 31(apply derivable1_sepcon_mono;[|apply store_uint_undef_store_uint]);apply store_uint_undef_store_uint. Qed.
Print Assumptions f16_forget_vuint32m8_t.
Lemma f16_forget_vuint16m4_t:forall(p:Z)(x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:Z),
 (&(p # "vuint16m4_t" ->ₛ "s0")) # UShort |-> x0 **
 (&(p # "vuint16m4_t" ->ₛ "s1")) # UShort |-> x1 **
 (&(p # "vuint16m4_t" ->ₛ "s2")) # UShort |-> x2 **
 (&(p # "vuint16m4_t" ->ₛ "s3")) # UShort |-> x3 **
 (&(p # "vuint16m4_t" ->ₛ "s4")) # UShort |-> x4 **
 (&(p # "vuint16m4_t" ->ₛ "s5")) # UShort |-> x5 **
 (&(p # "vuint16m4_t" ->ₛ "s6")) # UShort |-> x6 **
 (&(p # "vuint16m4_t" ->ₛ "s7")) # UShort |-> x7 **
 (&(p # "vuint16m4_t" ->ₛ "s8")) # UShort |-> x8 **
 (&(p # "vuint16m4_t" ->ₛ "s9")) # UShort |-> x9 **
 (&(p # "vuint16m4_t" ->ₛ "s10")) # UShort |-> x10 **
 (&(p # "vuint16m4_t" ->ₛ "s11")) # UShort |-> x11 **
 (&(p # "vuint16m4_t" ->ₛ "s12")) # UShort |-> x12 **
 (&(p # "vuint16m4_t" ->ₛ "s13")) # UShort |-> x13 **
 (&(p # "vuint16m4_t" ->ₛ "s14")) # UShort |-> x14 **
 (&(p # "vuint16m4_t" ->ₛ "s15")) # UShort |-> x15 **
 (&(p # "vuint16m4_t" ->ₛ "s16")) # UShort |-> x16 **
 (&(p # "vuint16m4_t" ->ₛ "s17")) # UShort |-> x17 **
 (&(p # "vuint16m4_t" ->ₛ "s18")) # UShort |-> x18 **
 (&(p # "vuint16m4_t" ->ₛ "s19")) # UShort |-> x19 **
 (&(p # "vuint16m4_t" ->ₛ "s20")) # UShort |-> x20 **
 (&(p # "vuint16m4_t" ->ₛ "s21")) # UShort |-> x21 **
 (&(p # "vuint16m4_t" ->ₛ "s22")) # UShort |-> x22 **
 (&(p # "vuint16m4_t" ->ₛ "s23")) # UShort |-> x23 **
 (&(p # "vuint16m4_t" ->ₛ "s24")) # UShort |-> x24 **
 (&(p # "vuint16m4_t" ->ₛ "s25")) # UShort |-> x25 **
 (&(p # "vuint16m4_t" ->ₛ "s26")) # UShort |-> x26 **
 (&(p # "vuint16m4_t" ->ₛ "s27")) # UShort |-> x27 **
 (&(p # "vuint16m4_t" ->ₛ "s28")) # UShort |-> x28 **
 (&(p # "vuint16m4_t" ->ₛ "s29")) # UShort |-> x29 **
 (&(p # "vuint16m4_t" ->ₛ "s30")) # UShort |-> x30 **
 (&(p # "vuint16m4_t" ->ₛ "s31")) # UShort |-> x31 |-- F32F16.Types.UndefStructPredvuint16m4_t p.
Proof. intros;unfold F32F16.Types.UndefStructPredvuint16m4_t;do 31(apply derivable1_sepcon_mono;[|apply store_ushort_undef_store_ushort]);apply store_ushort_undef_store_ushort. Qed.
Print Assumptions f16_forget_vuint16m4_t.
Lemma f16_forget_vbool4_t:forall(p:Z)(x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:Z),
 (&(p # "vbool4_t" ->ₛ "s0")) # Int |-> x0 **
 (&(p # "vbool4_t" ->ₛ "s1")) # Int |-> x1 **
 (&(p # "vbool4_t" ->ₛ "s2")) # Int |-> x2 **
 (&(p # "vbool4_t" ->ₛ "s3")) # Int |-> x3 **
 (&(p # "vbool4_t" ->ₛ "s4")) # Int |-> x4 **
 (&(p # "vbool4_t" ->ₛ "s5")) # Int |-> x5 **
 (&(p # "vbool4_t" ->ₛ "s6")) # Int |-> x6 **
 (&(p # "vbool4_t" ->ₛ "s7")) # Int |-> x7 **
 (&(p # "vbool4_t" ->ₛ "s8")) # Int |-> x8 **
 (&(p # "vbool4_t" ->ₛ "s9")) # Int |-> x9 **
 (&(p # "vbool4_t" ->ₛ "s10")) # Int |-> x10 **
 (&(p # "vbool4_t" ->ₛ "s11")) # Int |-> x11 **
 (&(p # "vbool4_t" ->ₛ "s12")) # Int |-> x12 **
 (&(p # "vbool4_t" ->ₛ "s13")) # Int |-> x13 **
 (&(p # "vbool4_t" ->ₛ "s14")) # Int |-> x14 **
 (&(p # "vbool4_t" ->ₛ "s15")) # Int |-> x15 **
 (&(p # "vbool4_t" ->ₛ "s16")) # Int |-> x16 **
 (&(p # "vbool4_t" ->ₛ "s17")) # Int |-> x17 **
 (&(p # "vbool4_t" ->ₛ "s18")) # Int |-> x18 **
 (&(p # "vbool4_t" ->ₛ "s19")) # Int |-> x19 **
 (&(p # "vbool4_t" ->ₛ "s20")) # Int |-> x20 **
 (&(p # "vbool4_t" ->ₛ "s21")) # Int |-> x21 **
 (&(p # "vbool4_t" ->ₛ "s22")) # Int |-> x22 **
 (&(p # "vbool4_t" ->ₛ "s23")) # Int |-> x23 **
 (&(p # "vbool4_t" ->ₛ "s24")) # Int |-> x24 **
 (&(p # "vbool4_t" ->ₛ "s25")) # Int |-> x25 **
 (&(p # "vbool4_t" ->ₛ "s26")) # Int |-> x26 **
 (&(p # "vbool4_t" ->ₛ "s27")) # Int |-> x27 **
 (&(p # "vbool4_t" ->ₛ "s28")) # Int |-> x28 **
 (&(p # "vbool4_t" ->ₛ "s29")) # Int |-> x29 **
 (&(p # "vbool4_t" ->ₛ "s30")) # Int |-> x30 **
 (&(p # "vbool4_t" ->ₛ "s31")) # Int |-> x31 |-- F32F16.Types.UndefStructPredvbool4_t p.
Proof. intros;unfold F32F16.Types.UndefStructPredvbool4_t;do 31(apply derivable1_sepcon_mono;[|apply store_int_undef_store_int]);apply store_int_undef_store_int. Qed.
Print Assumptions f16_forget_vbool4_t.
