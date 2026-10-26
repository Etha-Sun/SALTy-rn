From Coq Require Import ZArith Strings.String.
From ArgmaxPool Require Export RvvKernelModel.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.

Record Recordvfloat32m8_t : Type := make_record_vfloat32m8_t {
 vfloat32m8_t_s0:fp32;
 vfloat32m8_t_s1:fp32;
 vfloat32m8_t_s2:fp32;
 vfloat32m8_t_s3:fp32;
 vfloat32m8_t_s4:fp32;
 vfloat32m8_t_s5:fp32;
 vfloat32m8_t_s6:fp32;
 vfloat32m8_t_s7:fp32;
 vfloat32m8_t_s8:fp32;
 vfloat32m8_t_s9:fp32;
 vfloat32m8_t_s10:fp32;
 vfloat32m8_t_s11:fp32;
 vfloat32m8_t_s12:fp32;
 vfloat32m8_t_s13:fp32;
 vfloat32m8_t_s14:fp32;
 vfloat32m8_t_s15:fp32;
 vfloat32m8_t_s16:fp32;
 vfloat32m8_t_s17:fp32;
 vfloat32m8_t_s18:fp32;
 vfloat32m8_t_s19:fp32;
 vfloat32m8_t_s20:fp32;
 vfloat32m8_t_s21:fp32;
 vfloat32m8_t_s22:fp32;
 vfloat32m8_t_s23:fp32;
 vfloat32m8_t_s24:fp32;
 vfloat32m8_t_s25:fp32;
 vfloat32m8_t_s26:fp32;
 vfloat32m8_t_s27:fp32;
 vfloat32m8_t_s28:fp32;
 vfloat32m8_t_s29:fp32;
 vfloat32m8_t_s30:fp32;
 vfloat32m8_t_s31:fp32
}.
Definition StructPredvfloat32m8_t(p:Z)(v:Recordvfloat32m8_t):Assertion :=
 (&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |-> v.(vfloat32m8_t_s0) **
 (&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |-> v.(vfloat32m8_t_s1) **
 (&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |-> v.(vfloat32m8_t_s2) **
 (&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |-> v.(vfloat32m8_t_s3) **
 (&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |-> v.(vfloat32m8_t_s4) **
 (&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |-> v.(vfloat32m8_t_s5) **
 (&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |-> v.(vfloat32m8_t_s6) **
 (&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |-> v.(vfloat32m8_t_s7) **
 (&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |-> v.(vfloat32m8_t_s8) **
 (&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |-> v.(vfloat32m8_t_s9) **
 (&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |-> v.(vfloat32m8_t_s10) **
 (&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |-> v.(vfloat32m8_t_s11) **
 (&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |-> v.(vfloat32m8_t_s12) **
 (&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |-> v.(vfloat32m8_t_s13) **
 (&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |-> v.(vfloat32m8_t_s14) **
 (&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |-> v.(vfloat32m8_t_s15) **
 (&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |-> v.(vfloat32m8_t_s16) **
 (&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |-> v.(vfloat32m8_t_s17) **
 (&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |-> v.(vfloat32m8_t_s18) **
 (&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |-> v.(vfloat32m8_t_s19) **
 (&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |-> v.(vfloat32m8_t_s20) **
 (&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |-> v.(vfloat32m8_t_s21) **
 (&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |-> v.(vfloat32m8_t_s22) **
 (&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |-> v.(vfloat32m8_t_s23) **
 (&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |-> v.(vfloat32m8_t_s24) **
 (&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |-> v.(vfloat32m8_t_s25) **
 (&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |-> v.(vfloat32m8_t_s26) **
 (&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |-> v.(vfloat32m8_t_s27) **
 (&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |-> v.(vfloat32m8_t_s28) **
 (&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |-> v.(vfloat32m8_t_s29) **
 (&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |-> v.(vfloat32m8_t_s30) **
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |-> v.(vfloat32m8_t_s31).
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

Record Recordvbool4_t : Type := make_record_vbool4_t {
 vbool4_t_s0:Z;
 vbool4_t_s1:Z;
 vbool4_t_s2:Z;
 vbool4_t_s3:Z;
 vbool4_t_s4:Z;
 vbool4_t_s5:Z;
 vbool4_t_s6:Z;
 vbool4_t_s7:Z;
 vbool4_t_s8:Z;
 vbool4_t_s9:Z;
 vbool4_t_s10:Z;
 vbool4_t_s11:Z;
 vbool4_t_s12:Z;
 vbool4_t_s13:Z;
 vbool4_t_s14:Z;
 vbool4_t_s15:Z;
 vbool4_t_s16:Z;
 vbool4_t_s17:Z;
 vbool4_t_s18:Z;
 vbool4_t_s19:Z;
 vbool4_t_s20:Z;
 vbool4_t_s21:Z;
 vbool4_t_s22:Z;
 vbool4_t_s23:Z;
 vbool4_t_s24:Z;
 vbool4_t_s25:Z;
 vbool4_t_s26:Z;
 vbool4_t_s27:Z;
 vbool4_t_s28:Z;
 vbool4_t_s29:Z;
 vbool4_t_s30:Z;
 vbool4_t_s31:Z
}.
Definition StructPredvbool4_t(p:Z)(v:Recordvbool4_t):Assertion :=
 (&(p # "vbool4_t" ->ₛ "s0")) # UInt |-> v.(vbool4_t_s0) **
 (&(p # "vbool4_t" ->ₛ "s1")) # UInt |-> v.(vbool4_t_s1) **
 (&(p # "vbool4_t" ->ₛ "s2")) # UInt |-> v.(vbool4_t_s2) **
 (&(p # "vbool4_t" ->ₛ "s3")) # UInt |-> v.(vbool4_t_s3) **
 (&(p # "vbool4_t" ->ₛ "s4")) # UInt |-> v.(vbool4_t_s4) **
 (&(p # "vbool4_t" ->ₛ "s5")) # UInt |-> v.(vbool4_t_s5) **
 (&(p # "vbool4_t" ->ₛ "s6")) # UInt |-> v.(vbool4_t_s6) **
 (&(p # "vbool4_t" ->ₛ "s7")) # UInt |-> v.(vbool4_t_s7) **
 (&(p # "vbool4_t" ->ₛ "s8")) # UInt |-> v.(vbool4_t_s8) **
 (&(p # "vbool4_t" ->ₛ "s9")) # UInt |-> v.(vbool4_t_s9) **
 (&(p # "vbool4_t" ->ₛ "s10")) # UInt |-> v.(vbool4_t_s10) **
 (&(p # "vbool4_t" ->ₛ "s11")) # UInt |-> v.(vbool4_t_s11) **
 (&(p # "vbool4_t" ->ₛ "s12")) # UInt |-> v.(vbool4_t_s12) **
 (&(p # "vbool4_t" ->ₛ "s13")) # UInt |-> v.(vbool4_t_s13) **
 (&(p # "vbool4_t" ->ₛ "s14")) # UInt |-> v.(vbool4_t_s14) **
 (&(p # "vbool4_t" ->ₛ "s15")) # UInt |-> v.(vbool4_t_s15) **
 (&(p # "vbool4_t" ->ₛ "s16")) # UInt |-> v.(vbool4_t_s16) **
 (&(p # "vbool4_t" ->ₛ "s17")) # UInt |-> v.(vbool4_t_s17) **
 (&(p # "vbool4_t" ->ₛ "s18")) # UInt |-> v.(vbool4_t_s18) **
 (&(p # "vbool4_t" ->ₛ "s19")) # UInt |-> v.(vbool4_t_s19) **
 (&(p # "vbool4_t" ->ₛ "s20")) # UInt |-> v.(vbool4_t_s20) **
 (&(p # "vbool4_t" ->ₛ "s21")) # UInt |-> v.(vbool4_t_s21) **
 (&(p # "vbool4_t" ->ₛ "s22")) # UInt |-> v.(vbool4_t_s22) **
 (&(p # "vbool4_t" ->ₛ "s23")) # UInt |-> v.(vbool4_t_s23) **
 (&(p # "vbool4_t" ->ₛ "s24")) # UInt |-> v.(vbool4_t_s24) **
 (&(p # "vbool4_t" ->ₛ "s25")) # UInt |-> v.(vbool4_t_s25) **
 (&(p # "vbool4_t" ->ₛ "s26")) # UInt |-> v.(vbool4_t_s26) **
 (&(p # "vbool4_t" ->ₛ "s27")) # UInt |-> v.(vbool4_t_s27) **
 (&(p # "vbool4_t" ->ₛ "s28")) # UInt |-> v.(vbool4_t_s28) **
 (&(p # "vbool4_t" ->ₛ "s29")) # UInt |-> v.(vbool4_t_s29) **
 (&(p # "vbool4_t" ->ₛ "s30")) # UInt |-> v.(vbool4_t_s30) **
 (&(p # "vbool4_t" ->ₛ "s31")) # UInt |-> v.(vbool4_t_s31).
Definition UndefStructPredvbool4_t(p:Z):Assertion :=
 (&(p # "vbool4_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s3")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s4")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s5")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s6")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s7")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s8")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s9")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s10")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s11")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s12")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s13")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s14")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s15")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s16")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s17")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s18")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s19")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s20")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s21")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s22")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s23")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s24")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s25")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s26")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s27")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s28")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s29")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s30")) # UInt |->_ **
 (&(p # "vbool4_t" ->ₛ "s31")) # UInt |->_.

Definition ap_record_mask32(m:Recordvbool4_t)(vl:Z):Prop :=
 ap_rvv_mask_active 0 vl m.(vbool4_t_s0) /\
 ap_rvv_mask_active 1 vl m.(vbool4_t_s1) /\
 ap_rvv_mask_active 2 vl m.(vbool4_t_s2) /\
 ap_rvv_mask_active 3 vl m.(vbool4_t_s3) /\
 ap_rvv_mask_active 4 vl m.(vbool4_t_s4) /\
 ap_rvv_mask_active 5 vl m.(vbool4_t_s5) /\
 ap_rvv_mask_active 6 vl m.(vbool4_t_s6) /\
 ap_rvv_mask_active 7 vl m.(vbool4_t_s7) /\
 ap_rvv_mask_active 8 vl m.(vbool4_t_s8) /\
 ap_rvv_mask_active 9 vl m.(vbool4_t_s9) /\
 ap_rvv_mask_active 10 vl m.(vbool4_t_s10) /\
 ap_rvv_mask_active 11 vl m.(vbool4_t_s11) /\
 ap_rvv_mask_active 12 vl m.(vbool4_t_s12) /\
 ap_rvv_mask_active 13 vl m.(vbool4_t_s13) /\
 ap_rvv_mask_active 14 vl m.(vbool4_t_s14) /\
 ap_rvv_mask_active 15 vl m.(vbool4_t_s15) /\
 ap_rvv_mask_active 16 vl m.(vbool4_t_s16) /\
 ap_rvv_mask_active 17 vl m.(vbool4_t_s17) /\
 ap_rvv_mask_active 18 vl m.(vbool4_t_s18) /\
 ap_rvv_mask_active 19 vl m.(vbool4_t_s19) /\
 ap_rvv_mask_active 20 vl m.(vbool4_t_s20) /\
 ap_rvv_mask_active 21 vl m.(vbool4_t_s21) /\
 ap_rvv_mask_active 22 vl m.(vbool4_t_s22) /\
 ap_rvv_mask_active 23 vl m.(vbool4_t_s23) /\
 ap_rvv_mask_active 24 vl m.(vbool4_t_s24) /\
 ap_rvv_mask_active 25 vl m.(vbool4_t_s25) /\
 ap_rvv_mask_active 26 vl m.(vbool4_t_s26) /\
 ap_rvv_mask_active 27 vl m.(vbool4_t_s27) /\
 ap_rvv_mask_active 28 vl m.(vbool4_t_s28) /\
 ap_rvv_mask_active 29 vl m.(vbool4_t_s29) /\
 ap_rvv_mask_active 30 vl m.(vbool4_t_s30) /\
 ap_rvv_mask_active 31 vl m.(vbool4_t_s31).
Definition ap_record_gt32(r:Recordvbool4_t)(a b:Recordvfloat32m8_t)(vl:Z):Prop :=
 apr_int_lane 0 vl r.(vbool4_t_s0) (ap_rvv_gt a.(vfloat32m8_t_s0) b.(vfloat32m8_t_s0)) /\
 apr_int_lane 1 vl r.(vbool4_t_s1) (ap_rvv_gt a.(vfloat32m8_t_s1) b.(vfloat32m8_t_s1)) /\
 apr_int_lane 2 vl r.(vbool4_t_s2) (ap_rvv_gt a.(vfloat32m8_t_s2) b.(vfloat32m8_t_s2)) /\
 apr_int_lane 3 vl r.(vbool4_t_s3) (ap_rvv_gt a.(vfloat32m8_t_s3) b.(vfloat32m8_t_s3)) /\
 apr_int_lane 4 vl r.(vbool4_t_s4) (ap_rvv_gt a.(vfloat32m8_t_s4) b.(vfloat32m8_t_s4)) /\
 apr_int_lane 5 vl r.(vbool4_t_s5) (ap_rvv_gt a.(vfloat32m8_t_s5) b.(vfloat32m8_t_s5)) /\
 apr_int_lane 6 vl r.(vbool4_t_s6) (ap_rvv_gt a.(vfloat32m8_t_s6) b.(vfloat32m8_t_s6)) /\
 apr_int_lane 7 vl r.(vbool4_t_s7) (ap_rvv_gt a.(vfloat32m8_t_s7) b.(vfloat32m8_t_s7)) /\
 apr_int_lane 8 vl r.(vbool4_t_s8) (ap_rvv_gt a.(vfloat32m8_t_s8) b.(vfloat32m8_t_s8)) /\
 apr_int_lane 9 vl r.(vbool4_t_s9) (ap_rvv_gt a.(vfloat32m8_t_s9) b.(vfloat32m8_t_s9)) /\
 apr_int_lane 10 vl r.(vbool4_t_s10) (ap_rvv_gt a.(vfloat32m8_t_s10) b.(vfloat32m8_t_s10)) /\
 apr_int_lane 11 vl r.(vbool4_t_s11) (ap_rvv_gt a.(vfloat32m8_t_s11) b.(vfloat32m8_t_s11)) /\
 apr_int_lane 12 vl r.(vbool4_t_s12) (ap_rvv_gt a.(vfloat32m8_t_s12) b.(vfloat32m8_t_s12)) /\
 apr_int_lane 13 vl r.(vbool4_t_s13) (ap_rvv_gt a.(vfloat32m8_t_s13) b.(vfloat32m8_t_s13)) /\
 apr_int_lane 14 vl r.(vbool4_t_s14) (ap_rvv_gt a.(vfloat32m8_t_s14) b.(vfloat32m8_t_s14)) /\
 apr_int_lane 15 vl r.(vbool4_t_s15) (ap_rvv_gt a.(vfloat32m8_t_s15) b.(vfloat32m8_t_s15)) /\
 apr_int_lane 16 vl r.(vbool4_t_s16) (ap_rvv_gt a.(vfloat32m8_t_s16) b.(vfloat32m8_t_s16)) /\
 apr_int_lane 17 vl r.(vbool4_t_s17) (ap_rvv_gt a.(vfloat32m8_t_s17) b.(vfloat32m8_t_s17)) /\
 apr_int_lane 18 vl r.(vbool4_t_s18) (ap_rvv_gt a.(vfloat32m8_t_s18) b.(vfloat32m8_t_s18)) /\
 apr_int_lane 19 vl r.(vbool4_t_s19) (ap_rvv_gt a.(vfloat32m8_t_s19) b.(vfloat32m8_t_s19)) /\
 apr_int_lane 20 vl r.(vbool4_t_s20) (ap_rvv_gt a.(vfloat32m8_t_s20) b.(vfloat32m8_t_s20)) /\
 apr_int_lane 21 vl r.(vbool4_t_s21) (ap_rvv_gt a.(vfloat32m8_t_s21) b.(vfloat32m8_t_s21)) /\
 apr_int_lane 22 vl r.(vbool4_t_s22) (ap_rvv_gt a.(vfloat32m8_t_s22) b.(vfloat32m8_t_s22)) /\
 apr_int_lane 23 vl r.(vbool4_t_s23) (ap_rvv_gt a.(vfloat32m8_t_s23) b.(vfloat32m8_t_s23)) /\
 apr_int_lane 24 vl r.(vbool4_t_s24) (ap_rvv_gt a.(vfloat32m8_t_s24) b.(vfloat32m8_t_s24)) /\
 apr_int_lane 25 vl r.(vbool4_t_s25) (ap_rvv_gt a.(vfloat32m8_t_s25) b.(vfloat32m8_t_s25)) /\
 apr_int_lane 26 vl r.(vbool4_t_s26) (ap_rvv_gt a.(vfloat32m8_t_s26) b.(vfloat32m8_t_s26)) /\
 apr_int_lane 27 vl r.(vbool4_t_s27) (ap_rvv_gt a.(vfloat32m8_t_s27) b.(vfloat32m8_t_s27)) /\
 apr_int_lane 28 vl r.(vbool4_t_s28) (ap_rvv_gt a.(vfloat32m8_t_s28) b.(vfloat32m8_t_s28)) /\
 apr_int_lane 29 vl r.(vbool4_t_s29) (ap_rvv_gt a.(vfloat32m8_t_s29) b.(vfloat32m8_t_s29)) /\
 apr_int_lane 30 vl r.(vbool4_t_s30) (ap_rvv_gt a.(vfloat32m8_t_s30) b.(vfloat32m8_t_s30)) /\
 apr_int_lane 31 vl r.(vbool4_t_s31) (ap_rvv_gt a.(vfloat32m8_t_s31) b.(vfloat32m8_t_s31)).
Definition ap_record_merge32(r:Recordvfloat32m8_t)(m:Recordvbool4_t)(a b:Recordvfloat32m8_t)(vl:Z):Prop :=
 apr_float_lane 0 vl r.(vfloat32m8_t_s0) (ap_rvv_select_f32 m.(vbool4_t_s0) a.(vfloat32m8_t_s0) b.(vfloat32m8_t_s0)) /\
 apr_float_lane 1 vl r.(vfloat32m8_t_s1) (ap_rvv_select_f32 m.(vbool4_t_s1) a.(vfloat32m8_t_s1) b.(vfloat32m8_t_s1)) /\
 apr_float_lane 2 vl r.(vfloat32m8_t_s2) (ap_rvv_select_f32 m.(vbool4_t_s2) a.(vfloat32m8_t_s2) b.(vfloat32m8_t_s2)) /\
 apr_float_lane 3 vl r.(vfloat32m8_t_s3) (ap_rvv_select_f32 m.(vbool4_t_s3) a.(vfloat32m8_t_s3) b.(vfloat32m8_t_s3)) /\
 apr_float_lane 4 vl r.(vfloat32m8_t_s4) (ap_rvv_select_f32 m.(vbool4_t_s4) a.(vfloat32m8_t_s4) b.(vfloat32m8_t_s4)) /\
 apr_float_lane 5 vl r.(vfloat32m8_t_s5) (ap_rvv_select_f32 m.(vbool4_t_s5) a.(vfloat32m8_t_s5) b.(vfloat32m8_t_s5)) /\
 apr_float_lane 6 vl r.(vfloat32m8_t_s6) (ap_rvv_select_f32 m.(vbool4_t_s6) a.(vfloat32m8_t_s6) b.(vfloat32m8_t_s6)) /\
 apr_float_lane 7 vl r.(vfloat32m8_t_s7) (ap_rvv_select_f32 m.(vbool4_t_s7) a.(vfloat32m8_t_s7) b.(vfloat32m8_t_s7)) /\
 apr_float_lane 8 vl r.(vfloat32m8_t_s8) (ap_rvv_select_f32 m.(vbool4_t_s8) a.(vfloat32m8_t_s8) b.(vfloat32m8_t_s8)) /\
 apr_float_lane 9 vl r.(vfloat32m8_t_s9) (ap_rvv_select_f32 m.(vbool4_t_s9) a.(vfloat32m8_t_s9) b.(vfloat32m8_t_s9)) /\
 apr_float_lane 10 vl r.(vfloat32m8_t_s10) (ap_rvv_select_f32 m.(vbool4_t_s10) a.(vfloat32m8_t_s10) b.(vfloat32m8_t_s10)) /\
 apr_float_lane 11 vl r.(vfloat32m8_t_s11) (ap_rvv_select_f32 m.(vbool4_t_s11) a.(vfloat32m8_t_s11) b.(vfloat32m8_t_s11)) /\
 apr_float_lane 12 vl r.(vfloat32m8_t_s12) (ap_rvv_select_f32 m.(vbool4_t_s12) a.(vfloat32m8_t_s12) b.(vfloat32m8_t_s12)) /\
 apr_float_lane 13 vl r.(vfloat32m8_t_s13) (ap_rvv_select_f32 m.(vbool4_t_s13) a.(vfloat32m8_t_s13) b.(vfloat32m8_t_s13)) /\
 apr_float_lane 14 vl r.(vfloat32m8_t_s14) (ap_rvv_select_f32 m.(vbool4_t_s14) a.(vfloat32m8_t_s14) b.(vfloat32m8_t_s14)) /\
 apr_float_lane 15 vl r.(vfloat32m8_t_s15) (ap_rvv_select_f32 m.(vbool4_t_s15) a.(vfloat32m8_t_s15) b.(vfloat32m8_t_s15)) /\
 apr_float_lane 16 vl r.(vfloat32m8_t_s16) (ap_rvv_select_f32 m.(vbool4_t_s16) a.(vfloat32m8_t_s16) b.(vfloat32m8_t_s16)) /\
 apr_float_lane 17 vl r.(vfloat32m8_t_s17) (ap_rvv_select_f32 m.(vbool4_t_s17) a.(vfloat32m8_t_s17) b.(vfloat32m8_t_s17)) /\
 apr_float_lane 18 vl r.(vfloat32m8_t_s18) (ap_rvv_select_f32 m.(vbool4_t_s18) a.(vfloat32m8_t_s18) b.(vfloat32m8_t_s18)) /\
 apr_float_lane 19 vl r.(vfloat32m8_t_s19) (ap_rvv_select_f32 m.(vbool4_t_s19) a.(vfloat32m8_t_s19) b.(vfloat32m8_t_s19)) /\
 apr_float_lane 20 vl r.(vfloat32m8_t_s20) (ap_rvv_select_f32 m.(vbool4_t_s20) a.(vfloat32m8_t_s20) b.(vfloat32m8_t_s20)) /\
 apr_float_lane 21 vl r.(vfloat32m8_t_s21) (ap_rvv_select_f32 m.(vbool4_t_s21) a.(vfloat32m8_t_s21) b.(vfloat32m8_t_s21)) /\
 apr_float_lane 22 vl r.(vfloat32m8_t_s22) (ap_rvv_select_f32 m.(vbool4_t_s22) a.(vfloat32m8_t_s22) b.(vfloat32m8_t_s22)) /\
 apr_float_lane 23 vl r.(vfloat32m8_t_s23) (ap_rvv_select_f32 m.(vbool4_t_s23) a.(vfloat32m8_t_s23) b.(vfloat32m8_t_s23)) /\
 apr_float_lane 24 vl r.(vfloat32m8_t_s24) (ap_rvv_select_f32 m.(vbool4_t_s24) a.(vfloat32m8_t_s24) b.(vfloat32m8_t_s24)) /\
 apr_float_lane 25 vl r.(vfloat32m8_t_s25) (ap_rvv_select_f32 m.(vbool4_t_s25) a.(vfloat32m8_t_s25) b.(vfloat32m8_t_s25)) /\
 apr_float_lane 26 vl r.(vfloat32m8_t_s26) (ap_rvv_select_f32 m.(vbool4_t_s26) a.(vfloat32m8_t_s26) b.(vfloat32m8_t_s26)) /\
 apr_float_lane 27 vl r.(vfloat32m8_t_s27) (ap_rvv_select_f32 m.(vbool4_t_s27) a.(vfloat32m8_t_s27) b.(vfloat32m8_t_s27)) /\
 apr_float_lane 28 vl r.(vfloat32m8_t_s28) (ap_rvv_select_f32 m.(vbool4_t_s28) a.(vfloat32m8_t_s28) b.(vfloat32m8_t_s28)) /\
 apr_float_lane 29 vl r.(vfloat32m8_t_s29) (ap_rvv_select_f32 m.(vbool4_t_s29) a.(vfloat32m8_t_s29) b.(vfloat32m8_t_s29)) /\
 apr_float_lane 30 vl r.(vfloat32m8_t_s30) (ap_rvv_select_f32 m.(vbool4_t_s30) a.(vfloat32m8_t_s30) b.(vfloat32m8_t_s30)) /\
 apr_float_lane 31 vl r.(vfloat32m8_t_s31) (ap_rvv_select_f32 m.(vbool4_t_s31) a.(vfloat32m8_t_s31) b.(vfloat32m8_t_s31)).
Lemma ap_record_gt32_mask:forall r a b vl,ap_record_gt32 r a b vl->ap_record_mask32 r vl.
Proof. unfold ap_record_gt32,ap_record_mask32;intros;repeat match goal with H:_ /\ _ |- _=>destruct H end;repeat split;eapply apr_gt_mask_active;eassumption. Qed.
Print Assumptions ap_record_gt32_mask.
