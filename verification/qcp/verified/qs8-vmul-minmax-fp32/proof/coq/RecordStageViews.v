From Coq Require Import ZArith String List.
From Qs8Mul Require Export RecordViews.
Import Snaive_C_Rules64. Local Open Scope string_scope. Local Open Scope Z_scope. Local Open Scope sac.
(* All32 physical fields are preserved. Every active semantic predicate is
   explicitly bounded by0<=i<VL<=32; arbitrary inactive fields are retained.
   This is a representation of source-reviewed primitive specs, not a new ISA proof. *)
Record Recordvint8m2_t:Type:=make_record_vint8m2_t{
 vint8m2_t_s0:Z;
 vint8m2_t_s1:Z;
 vint8m2_t_s2:Z;
 vint8m2_t_s3:Z;
 vint8m2_t_s4:Z;
 vint8m2_t_s5:Z;
 vint8m2_t_s6:Z;
 vint8m2_t_s7:Z;
 vint8m2_t_s8:Z;
 vint8m2_t_s9:Z;
 vint8m2_t_s10:Z;
 vint8m2_t_s11:Z;
 vint8m2_t_s12:Z;
 vint8m2_t_s13:Z;
 vint8m2_t_s14:Z;
 vint8m2_t_s15:Z;
 vint8m2_t_s16:Z;
 vint8m2_t_s17:Z;
 vint8m2_t_s18:Z;
 vint8m2_t_s19:Z;
 vint8m2_t_s20:Z;
 vint8m2_t_s21:Z;
 vint8m2_t_s22:Z;
 vint8m2_t_s23:Z;
 vint8m2_t_s24:Z;
 vint8m2_t_s25:Z;
 vint8m2_t_s26:Z;
 vint8m2_t_s27:Z;
 vint8m2_t_s28:Z;
 vint8m2_t_s29:Z;
 vint8m2_t_s30:Z;
 vint8m2_t_s31:Z
}.
Definition StructPredvint8m2_t(p:Z)(a:Recordvint8m2_t):Assertion:=
 (&(p # "vint8m2_t" ->ₛ "s0")) # Char |-> a.(vint8m2_t_s0) **
 (&(p # "vint8m2_t" ->ₛ "s1")) # Char |-> a.(vint8m2_t_s1) **
 (&(p # "vint8m2_t" ->ₛ "s2")) # Char |-> a.(vint8m2_t_s2) **
 (&(p # "vint8m2_t" ->ₛ "s3")) # Char |-> a.(vint8m2_t_s3) **
 (&(p # "vint8m2_t" ->ₛ "s4")) # Char |-> a.(vint8m2_t_s4) **
 (&(p # "vint8m2_t" ->ₛ "s5")) # Char |-> a.(vint8m2_t_s5) **
 (&(p # "vint8m2_t" ->ₛ "s6")) # Char |-> a.(vint8m2_t_s6) **
 (&(p # "vint8m2_t" ->ₛ "s7")) # Char |-> a.(vint8m2_t_s7) **
 (&(p # "vint8m2_t" ->ₛ "s8")) # Char |-> a.(vint8m2_t_s8) **
 (&(p # "vint8m2_t" ->ₛ "s9")) # Char |-> a.(vint8m2_t_s9) **
 (&(p # "vint8m2_t" ->ₛ "s10")) # Char |-> a.(vint8m2_t_s10) **
 (&(p # "vint8m2_t" ->ₛ "s11")) # Char |-> a.(vint8m2_t_s11) **
 (&(p # "vint8m2_t" ->ₛ "s12")) # Char |-> a.(vint8m2_t_s12) **
 (&(p # "vint8m2_t" ->ₛ "s13")) # Char |-> a.(vint8m2_t_s13) **
 (&(p # "vint8m2_t" ->ₛ "s14")) # Char |-> a.(vint8m2_t_s14) **
 (&(p # "vint8m2_t" ->ₛ "s15")) # Char |-> a.(vint8m2_t_s15) **
 (&(p # "vint8m2_t" ->ₛ "s16")) # Char |-> a.(vint8m2_t_s16) **
 (&(p # "vint8m2_t" ->ₛ "s17")) # Char |-> a.(vint8m2_t_s17) **
 (&(p # "vint8m2_t" ->ₛ "s18")) # Char |-> a.(vint8m2_t_s18) **
 (&(p # "vint8m2_t" ->ₛ "s19")) # Char |-> a.(vint8m2_t_s19) **
 (&(p # "vint8m2_t" ->ₛ "s20")) # Char |-> a.(vint8m2_t_s20) **
 (&(p # "vint8m2_t" ->ₛ "s21")) # Char |-> a.(vint8m2_t_s21) **
 (&(p # "vint8m2_t" ->ₛ "s22")) # Char |-> a.(vint8m2_t_s22) **
 (&(p # "vint8m2_t" ->ₛ "s23")) # Char |-> a.(vint8m2_t_s23) **
 (&(p # "vint8m2_t" ->ₛ "s24")) # Char |-> a.(vint8m2_t_s24) **
 (&(p # "vint8m2_t" ->ₛ "s25")) # Char |-> a.(vint8m2_t_s25) **
 (&(p # "vint8m2_t" ->ₛ "s26")) # Char |-> a.(vint8m2_t_s26) **
 (&(p # "vint8m2_t" ->ₛ "s27")) # Char |-> a.(vint8m2_t_s27) **
 (&(p # "vint8m2_t" ->ₛ "s28")) # Char |-> a.(vint8m2_t_s28) **
 (&(p # "vint8m2_t" ->ₛ "s29")) # Char |-> a.(vint8m2_t_s29) **
 (&(p # "vint8m2_t" ->ₛ "s30")) # Char |-> a.(vint8m2_t_s30) **
 (&(p # "vint8m2_t" ->ₛ "s31")) # Char |-> a.(vint8m2_t_s31).
Definition qm_record_lanes_vint8m2_t(a:Recordvint8m2_t):Z->Z:=qm_vec32 a.(vint8m2_t_s0) a.(vint8m2_t_s1) a.(vint8m2_t_s2) a.(vint8m2_t_s3) a.(vint8m2_t_s4) a.(vint8m2_t_s5) a.(vint8m2_t_s6) a.(vint8m2_t_s7) a.(vint8m2_t_s8) a.(vint8m2_t_s9) a.(vint8m2_t_s10) a.(vint8m2_t_s11) a.(vint8m2_t_s12) a.(vint8m2_t_s13) a.(vint8m2_t_s14) a.(vint8m2_t_s15) a.(vint8m2_t_s16) a.(vint8m2_t_s17) a.(vint8m2_t_s18) a.(vint8m2_t_s19) a.(vint8m2_t_s20) a.(vint8m2_t_s21) a.(vint8m2_t_s22) a.(vint8m2_t_s23) a.(vint8m2_t_s24) a.(vint8m2_t_s25) a.(vint8m2_t_s26) a.(vint8m2_t_s27) a.(vint8m2_t_s28) a.(vint8m2_t_s29) a.(vint8m2_t_s30) a.(vint8m2_t_s31).
Record Recordvfloat32m8_t:Type:=make_record_vfloat32m8_t{
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
Definition StructPredvfloat32m8_t(p:Z)(a:Recordvfloat32m8_t):Assertion:=
 (&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |-> a.(vfloat32m8_t_s0) **
 (&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |-> a.(vfloat32m8_t_s1) **
 (&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |-> a.(vfloat32m8_t_s2) **
 (&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |-> a.(vfloat32m8_t_s3) **
 (&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |-> a.(vfloat32m8_t_s4) **
 (&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |-> a.(vfloat32m8_t_s5) **
 (&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |-> a.(vfloat32m8_t_s6) **
 (&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |-> a.(vfloat32m8_t_s7) **
 (&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |-> a.(vfloat32m8_t_s8) **
 (&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |-> a.(vfloat32m8_t_s9) **
 (&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |-> a.(vfloat32m8_t_s10) **
 (&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |-> a.(vfloat32m8_t_s11) **
 (&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |-> a.(vfloat32m8_t_s12) **
 (&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |-> a.(vfloat32m8_t_s13) **
 (&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |-> a.(vfloat32m8_t_s14) **
 (&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |-> a.(vfloat32m8_t_s15) **
 (&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |-> a.(vfloat32m8_t_s16) **
 (&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |-> a.(vfloat32m8_t_s17) **
 (&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |-> a.(vfloat32m8_t_s18) **
 (&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |-> a.(vfloat32m8_t_s19) **
 (&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |-> a.(vfloat32m8_t_s20) **
 (&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |-> a.(vfloat32m8_t_s21) **
 (&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |-> a.(vfloat32m8_t_s22) **
 (&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |-> a.(vfloat32m8_t_s23) **
 (&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |-> a.(vfloat32m8_t_s24) **
 (&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |-> a.(vfloat32m8_t_s25) **
 (&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |-> a.(vfloat32m8_t_s26) **
 (&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |-> a.(vfloat32m8_t_s27) **
 (&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |-> a.(vfloat32m8_t_s28) **
 (&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |-> a.(vfloat32m8_t_s29) **
 (&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |-> a.(vfloat32m8_t_s30) **
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |-> a.(vfloat32m8_t_s31).
Definition qm_record_lanes_vfloat32m8_t(a:Recordvfloat32m8_t):Z->fp32:=qm_fpvec32 a.(vfloat32m8_t_s0) a.(vfloat32m8_t_s1) a.(vfloat32m8_t_s2) a.(vfloat32m8_t_s3) a.(vfloat32m8_t_s4) a.(vfloat32m8_t_s5) a.(vfloat32m8_t_s6) a.(vfloat32m8_t_s7) a.(vfloat32m8_t_s8) a.(vfloat32m8_t_s9) a.(vfloat32m8_t_s10) a.(vfloat32m8_t_s11) a.(vfloat32m8_t_s12) a.(vfloat32m8_t_s13) a.(vfloat32m8_t_s14) a.(vfloat32m8_t_s15) a.(vfloat32m8_t_s16) a.(vfloat32m8_t_s17) a.(vfloat32m8_t_s18) a.(vfloat32m8_t_s19) a.(vfloat32m8_t_s20) a.(vfloat32m8_t_s21) a.(vfloat32m8_t_s22) a.(vfloat32m8_t_s23) a.(vfloat32m8_t_s24) a.(vfloat32m8_t_s25) a.(vfloat32m8_t_s26) a.(vfloat32m8_t_s27) a.(vfloat32m8_t_s28) a.(vfloat32m8_t_s29) a.(vfloat32m8_t_s30) a.(vfloat32m8_t_s31).
Definition qm_record_sext_match(vl:Z)(a:Recordvint8m2_t)(r:Recordvint16m4_t):Prop:=
 let A:=qm_record_lanes_vint8m2_t a in forall i,0<=i<vl -> qm_record_lanes_vint16m4_t r i=A i.
Definition qm_record_sub16_match(vl:Z)(a:Recordvint16m4_t)(r:Recordvint16m4_t)(x:Z):Prop:=
 let A:=qm_record_lanes_vint16m4_t a in forall i,0<=i<vl -> qm_record_lanes_vint16m4_t r i=qm_sub16(A i)x.
Definition qm_record_cvt_match(vl:Z)(a:Recordvint32m8_t)(r:Recordvfloat32m8_t):Prop:=
 let A:=qm_record_lanes_vint32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vfloat32m8_t r i=qm_of_int(A i).
Definition qm_record_fmul_match(vl:Z)(a:Recordvfloat32m8_t)(r:Recordvfloat32m8_t)(x:fp32):Prop:=
 let A:=qm_record_lanes_vfloat32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vfloat32m8_t r i=qm_rvv_mul(A i)x.
Definition qm_record_fadd_match(vl:Z)(a:Recordvfloat32m8_t)(r:Recordvfloat32m8_t)(x:fp32):Prop:=
 let A:=qm_record_lanes_vfloat32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vfloat32m8_t r i=qm_rvv_add(A i)x.
Definition qm_record_sgnj_match(vl:Z)(a:Recordvfloat32m8_t)(r:Recordvfloat32m8_t)(x:fp32):Prop:=
 let A:=qm_record_lanes_vfloat32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vfloat32m8_t r i=qm_sign(A i)x.
Definition qm_record_reinterpret_match(vl:Z)(a:Recordvfloat32m8_t)(r:Recordvint32m8_t):Prop:=
 let A:=qm_record_lanes_vfloat32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vint32m8_t r i=qm_signed_bits(bits_of_fp32(A i)).
Definition qm_record_ssub_match(vl:Z)(a:Recordvint32m8_t)(r:Recordvint32m8_t)(x:Z):Prop:=
 let A:=qm_record_lanes_vint32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vint32m8_t r i=qm_sat32(A i-x).
Definition qm_record_clip16_match(vl:Z)(a:Recordvint32m8_t)(r:Recordvint16m4_t):Prop:=
 let A:=qm_record_lanes_vint32m8_t a in forall i,0<=i<vl -> qm_record_lanes_vint16m4_t r i=qm_sat16(A i).
Definition qm_record_clip8_match(vl:Z)(a:Recordvint16m4_t)(r:Recordvint8m2_t):Prop:=
 let A:=qm_record_lanes_vint16m4_t a in forall i,0<=i<vl -> qm_record_lanes_vint8m2_t r i=qm_sat8(A i).
Definition qm_record_min8_match(vl:Z)(a:Recordvint8m2_t)(r:Recordvint8m2_t)(x:Z):Prop:=
 let A:=qm_record_lanes_vint8m2_t a in forall i,0<=i<vl -> qm_record_lanes_vint8m2_t r i=qm_min(A i)x.
Definition qm_record_max8_match(vl:Z)(a:Recordvint8m2_t)(r:Recordvint8m2_t)(x:Z):Prop:=
 let A:=qm_record_lanes_vint8m2_t a in forall i,0<=i<vl -> qm_record_lanes_vint8m2_t r i=qm_max(A i)x.
Definition qm_record_float_pair_match(vl:Z)(a r:Recordvfloat32m8_t)(x y:fp32):Prop:=
 forall i,0<=i<vl->qm_record_lanes_vfloat32m8_t r i=
 qm_rvv_add(qm_rvv_mul(qm_record_lanes_vfloat32m8_t a i)x)y.
