From Coq Require Import ZArith Strings.String.
From ArgmaxPool Require Export RvvVectorRecords.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.
(* Faithful unsigned32 physical fields; never the rejected generic R/Int view. *)
Record Recordvuint32m8_t : Type := make_record_vuint32m8_t {
 vuint32m8_t_s0:Z;
 vuint32m8_t_s1:Z;
 vuint32m8_t_s2:Z;
 vuint32m8_t_s3:Z;
 vuint32m8_t_s4:Z;
 vuint32m8_t_s5:Z;
 vuint32m8_t_s6:Z;
 vuint32m8_t_s7:Z;
 vuint32m8_t_s8:Z;
 vuint32m8_t_s9:Z;
 vuint32m8_t_s10:Z;
 vuint32m8_t_s11:Z;
 vuint32m8_t_s12:Z;
 vuint32m8_t_s13:Z;
 vuint32m8_t_s14:Z;
 vuint32m8_t_s15:Z;
 vuint32m8_t_s16:Z;
 vuint32m8_t_s17:Z;
 vuint32m8_t_s18:Z;
 vuint32m8_t_s19:Z;
 vuint32m8_t_s20:Z;
 vuint32m8_t_s21:Z;
 vuint32m8_t_s22:Z;
 vuint32m8_t_s23:Z;
 vuint32m8_t_s24:Z;
 vuint32m8_t_s25:Z;
 vuint32m8_t_s26:Z;
 vuint32m8_t_s27:Z;
 vuint32m8_t_s28:Z;
 vuint32m8_t_s29:Z;
 vuint32m8_t_s30:Z;
 vuint32m8_t_s31:Z
}.
Definition StructPredvuint32m8_t(p:Z)(v:Recordvuint32m8_t):Assertion :=
 (&(p # "vuint32m8_t" ->ₛ "s0")) # UInt |-> v.(vuint32m8_t_s0) **
 (&(p # "vuint32m8_t" ->ₛ "s1")) # UInt |-> v.(vuint32m8_t_s1) **
 (&(p # "vuint32m8_t" ->ₛ "s2")) # UInt |-> v.(vuint32m8_t_s2) **
 (&(p # "vuint32m8_t" ->ₛ "s3")) # UInt |-> v.(vuint32m8_t_s3) **
 (&(p # "vuint32m8_t" ->ₛ "s4")) # UInt |-> v.(vuint32m8_t_s4) **
 (&(p # "vuint32m8_t" ->ₛ "s5")) # UInt |-> v.(vuint32m8_t_s5) **
 (&(p # "vuint32m8_t" ->ₛ "s6")) # UInt |-> v.(vuint32m8_t_s6) **
 (&(p # "vuint32m8_t" ->ₛ "s7")) # UInt |-> v.(vuint32m8_t_s7) **
 (&(p # "vuint32m8_t" ->ₛ "s8")) # UInt |-> v.(vuint32m8_t_s8) **
 (&(p # "vuint32m8_t" ->ₛ "s9")) # UInt |-> v.(vuint32m8_t_s9) **
 (&(p # "vuint32m8_t" ->ₛ "s10")) # UInt |-> v.(vuint32m8_t_s10) **
 (&(p # "vuint32m8_t" ->ₛ "s11")) # UInt |-> v.(vuint32m8_t_s11) **
 (&(p # "vuint32m8_t" ->ₛ "s12")) # UInt |-> v.(vuint32m8_t_s12) **
 (&(p # "vuint32m8_t" ->ₛ "s13")) # UInt |-> v.(vuint32m8_t_s13) **
 (&(p # "vuint32m8_t" ->ₛ "s14")) # UInt |-> v.(vuint32m8_t_s14) **
 (&(p # "vuint32m8_t" ->ₛ "s15")) # UInt |-> v.(vuint32m8_t_s15) **
 (&(p # "vuint32m8_t" ->ₛ "s16")) # UInt |-> v.(vuint32m8_t_s16) **
 (&(p # "vuint32m8_t" ->ₛ "s17")) # UInt |-> v.(vuint32m8_t_s17) **
 (&(p # "vuint32m8_t" ->ₛ "s18")) # UInt |-> v.(vuint32m8_t_s18) **
 (&(p # "vuint32m8_t" ->ₛ "s19")) # UInt |-> v.(vuint32m8_t_s19) **
 (&(p # "vuint32m8_t" ->ₛ "s20")) # UInt |-> v.(vuint32m8_t_s20) **
 (&(p # "vuint32m8_t" ->ₛ "s21")) # UInt |-> v.(vuint32m8_t_s21) **
 (&(p # "vuint32m8_t" ->ₛ "s22")) # UInt |-> v.(vuint32m8_t_s22) **
 (&(p # "vuint32m8_t" ->ₛ "s23")) # UInt |-> v.(vuint32m8_t_s23) **
 (&(p # "vuint32m8_t" ->ₛ "s24")) # UInt |-> v.(vuint32m8_t_s24) **
 (&(p # "vuint32m8_t" ->ₛ "s25")) # UInt |-> v.(vuint32m8_t_s25) **
 (&(p # "vuint32m8_t" ->ₛ "s26")) # UInt |-> v.(vuint32m8_t_s26) **
 (&(p # "vuint32m8_t" ->ₛ "s27")) # UInt |-> v.(vuint32m8_t_s27) **
 (&(p # "vuint32m8_t" ->ₛ "s28")) # UInt |-> v.(vuint32m8_t_s28) **
 (&(p # "vuint32m8_t" ->ₛ "s29")) # UInt |-> v.(vuint32m8_t_s29) **
 (&(p # "vuint32m8_t" ->ₛ "s30")) # UInt |-> v.(vuint32m8_t_s30) **
 (&(p # "vuint32m8_t" ->ₛ "s31")) # UInt |-> v.(vuint32m8_t_s31).
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
Definition ap_update_um32(j i:Recordvuint32m8_t)(m:Recordvbool4_t)(index vl:Z):Prop :=
 apr_int_lane 0 vl j.(vuint32m8_t_s0) (ap_rvv_select_u32 m.(vbool4_t_s0) i.(vuint32m8_t_s0) (ap_u32 index)) /\
 apr_int_lane 1 vl j.(vuint32m8_t_s1) (ap_rvv_select_u32 m.(vbool4_t_s1) i.(vuint32m8_t_s1) (ap_u32 index)) /\
 apr_int_lane 2 vl j.(vuint32m8_t_s2) (ap_rvv_select_u32 m.(vbool4_t_s2) i.(vuint32m8_t_s2) (ap_u32 index)) /\
 apr_int_lane 3 vl j.(vuint32m8_t_s3) (ap_rvv_select_u32 m.(vbool4_t_s3) i.(vuint32m8_t_s3) (ap_u32 index)) /\
 apr_int_lane 4 vl j.(vuint32m8_t_s4) (ap_rvv_select_u32 m.(vbool4_t_s4) i.(vuint32m8_t_s4) (ap_u32 index)) /\
 apr_int_lane 5 vl j.(vuint32m8_t_s5) (ap_rvv_select_u32 m.(vbool4_t_s5) i.(vuint32m8_t_s5) (ap_u32 index)) /\
 apr_int_lane 6 vl j.(vuint32m8_t_s6) (ap_rvv_select_u32 m.(vbool4_t_s6) i.(vuint32m8_t_s6) (ap_u32 index)) /\
 apr_int_lane 7 vl j.(vuint32m8_t_s7) (ap_rvv_select_u32 m.(vbool4_t_s7) i.(vuint32m8_t_s7) (ap_u32 index)) /\
 apr_int_lane 8 vl j.(vuint32m8_t_s8) (ap_rvv_select_u32 m.(vbool4_t_s8) i.(vuint32m8_t_s8) (ap_u32 index)) /\
 apr_int_lane 9 vl j.(vuint32m8_t_s9) (ap_rvv_select_u32 m.(vbool4_t_s9) i.(vuint32m8_t_s9) (ap_u32 index)) /\
 apr_int_lane 10 vl j.(vuint32m8_t_s10) (ap_rvv_select_u32 m.(vbool4_t_s10) i.(vuint32m8_t_s10) (ap_u32 index)) /\
 apr_int_lane 11 vl j.(vuint32m8_t_s11) (ap_rvv_select_u32 m.(vbool4_t_s11) i.(vuint32m8_t_s11) (ap_u32 index)) /\
 apr_int_lane 12 vl j.(vuint32m8_t_s12) (ap_rvv_select_u32 m.(vbool4_t_s12) i.(vuint32m8_t_s12) (ap_u32 index)) /\
 apr_int_lane 13 vl j.(vuint32m8_t_s13) (ap_rvv_select_u32 m.(vbool4_t_s13) i.(vuint32m8_t_s13) (ap_u32 index)) /\
 apr_int_lane 14 vl j.(vuint32m8_t_s14) (ap_rvv_select_u32 m.(vbool4_t_s14) i.(vuint32m8_t_s14) (ap_u32 index)) /\
 apr_int_lane 15 vl j.(vuint32m8_t_s15) (ap_rvv_select_u32 m.(vbool4_t_s15) i.(vuint32m8_t_s15) (ap_u32 index)) /\
 apr_int_lane 16 vl j.(vuint32m8_t_s16) (ap_rvv_select_u32 m.(vbool4_t_s16) i.(vuint32m8_t_s16) (ap_u32 index)) /\
 apr_int_lane 17 vl j.(vuint32m8_t_s17) (ap_rvv_select_u32 m.(vbool4_t_s17) i.(vuint32m8_t_s17) (ap_u32 index)) /\
 apr_int_lane 18 vl j.(vuint32m8_t_s18) (ap_rvv_select_u32 m.(vbool4_t_s18) i.(vuint32m8_t_s18) (ap_u32 index)) /\
 apr_int_lane 19 vl j.(vuint32m8_t_s19) (ap_rvv_select_u32 m.(vbool4_t_s19) i.(vuint32m8_t_s19) (ap_u32 index)) /\
 apr_int_lane 20 vl j.(vuint32m8_t_s20) (ap_rvv_select_u32 m.(vbool4_t_s20) i.(vuint32m8_t_s20) (ap_u32 index)) /\
 apr_int_lane 21 vl j.(vuint32m8_t_s21) (ap_rvv_select_u32 m.(vbool4_t_s21) i.(vuint32m8_t_s21) (ap_u32 index)) /\
 apr_int_lane 22 vl j.(vuint32m8_t_s22) (ap_rvv_select_u32 m.(vbool4_t_s22) i.(vuint32m8_t_s22) (ap_u32 index)) /\
 apr_int_lane 23 vl j.(vuint32m8_t_s23) (ap_rvv_select_u32 m.(vbool4_t_s23) i.(vuint32m8_t_s23) (ap_u32 index)) /\
 apr_int_lane 24 vl j.(vuint32m8_t_s24) (ap_rvv_select_u32 m.(vbool4_t_s24) i.(vuint32m8_t_s24) (ap_u32 index)) /\
 apr_int_lane 25 vl j.(vuint32m8_t_s25) (ap_rvv_select_u32 m.(vbool4_t_s25) i.(vuint32m8_t_s25) (ap_u32 index)) /\
 apr_int_lane 26 vl j.(vuint32m8_t_s26) (ap_rvv_select_u32 m.(vbool4_t_s26) i.(vuint32m8_t_s26) (ap_u32 index)) /\
 apr_int_lane 27 vl j.(vuint32m8_t_s27) (ap_rvv_select_u32 m.(vbool4_t_s27) i.(vuint32m8_t_s27) (ap_u32 index)) /\
 apr_int_lane 28 vl j.(vuint32m8_t_s28) (ap_rvv_select_u32 m.(vbool4_t_s28) i.(vuint32m8_t_s28) (ap_u32 index)) /\
 apr_int_lane 29 vl j.(vuint32m8_t_s29) (ap_rvv_select_u32 m.(vbool4_t_s29) i.(vuint32m8_t_s29) (ap_u32 index)) /\
 apr_int_lane 30 vl j.(vuint32m8_t_s30) (ap_rvv_select_u32 m.(vbool4_t_s30) i.(vuint32m8_t_s30) (ap_u32 index)) /\
 apr_int_lane 31 vl j.(vuint32m8_t_s31) (ap_rvv_select_u32 m.(vbool4_t_s31) i.(vuint32m8_t_s31) (ap_u32 index)).
(* Active lanes implement the original GT and both original merges. Inactive
   lanes retain typed ownership while their values remain arbitrary. *)
Definition ap_rvv_update32(r:Recordvfloat32m8_t)(j:Recordvuint32m8_t)
 (a:Recordvfloat32m8_t)(i:Recordvuint32m8_t)(b:Recordvfloat32m8_t)(index vl:Z):Prop :=
 exists m:Recordvbool4_t, ap_record_gt32 m b a vl /\ ap_record_mask32 m vl /\
 ap_record_merge32 r m a b vl /\ ap_update_um32 j i m index vl.
