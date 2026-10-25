From Coq Require Import ZArith String.
From Qs8Mul Require Export Types VectorValues.
Import Snaive_C_Rules64. Local Open Scope string_scope. Local Open Scope Z_scope. Local Open Scope sac.
Record Recordvint16m4_t : Type := make_record_vint16m4_t {
 vint16m4_t_s0:Z;
 vint16m4_t_s1:Z;
 vint16m4_t_s2:Z;
 vint16m4_t_s3:Z;
 vint16m4_t_s4:Z;
 vint16m4_t_s5:Z;
 vint16m4_t_s6:Z;
 vint16m4_t_s7:Z;
 vint16m4_t_s8:Z;
 vint16m4_t_s9:Z;
 vint16m4_t_s10:Z;
 vint16m4_t_s11:Z;
 vint16m4_t_s12:Z;
 vint16m4_t_s13:Z;
 vint16m4_t_s14:Z;
 vint16m4_t_s15:Z;
 vint16m4_t_s16:Z;
 vint16m4_t_s17:Z;
 vint16m4_t_s18:Z;
 vint16m4_t_s19:Z;
 vint16m4_t_s20:Z;
 vint16m4_t_s21:Z;
 vint16m4_t_s22:Z;
 vint16m4_t_s23:Z;
 vint16m4_t_s24:Z;
 vint16m4_t_s25:Z;
 vint16m4_t_s26:Z;
 vint16m4_t_s27:Z;
 vint16m4_t_s28:Z;
 vint16m4_t_s29:Z;
 vint16m4_t_s30:Z;
 vint16m4_t_s31:Z
}.
Definition StructPredvint16m4_t(p:Z)(a:Recordvint16m4_t):Assertion :=
 (&(p # "vint16m4_t" ->ₛ "s0")) # Short |-> a.(vint16m4_t_s0) **
 (&(p # "vint16m4_t" ->ₛ "s1")) # Short |-> a.(vint16m4_t_s1) **
 (&(p # "vint16m4_t" ->ₛ "s2")) # Short |-> a.(vint16m4_t_s2) **
 (&(p # "vint16m4_t" ->ₛ "s3")) # Short |-> a.(vint16m4_t_s3) **
 (&(p # "vint16m4_t" ->ₛ "s4")) # Short |-> a.(vint16m4_t_s4) **
 (&(p # "vint16m4_t" ->ₛ "s5")) # Short |-> a.(vint16m4_t_s5) **
 (&(p # "vint16m4_t" ->ₛ "s6")) # Short |-> a.(vint16m4_t_s6) **
 (&(p # "vint16m4_t" ->ₛ "s7")) # Short |-> a.(vint16m4_t_s7) **
 (&(p # "vint16m4_t" ->ₛ "s8")) # Short |-> a.(vint16m4_t_s8) **
 (&(p # "vint16m4_t" ->ₛ "s9")) # Short |-> a.(vint16m4_t_s9) **
 (&(p # "vint16m4_t" ->ₛ "s10")) # Short |-> a.(vint16m4_t_s10) **
 (&(p # "vint16m4_t" ->ₛ "s11")) # Short |-> a.(vint16m4_t_s11) **
 (&(p # "vint16m4_t" ->ₛ "s12")) # Short |-> a.(vint16m4_t_s12) **
 (&(p # "vint16m4_t" ->ₛ "s13")) # Short |-> a.(vint16m4_t_s13) **
 (&(p # "vint16m4_t" ->ₛ "s14")) # Short |-> a.(vint16m4_t_s14) **
 (&(p # "vint16m4_t" ->ₛ "s15")) # Short |-> a.(vint16m4_t_s15) **
 (&(p # "vint16m4_t" ->ₛ "s16")) # Short |-> a.(vint16m4_t_s16) **
 (&(p # "vint16m4_t" ->ₛ "s17")) # Short |-> a.(vint16m4_t_s17) **
 (&(p # "vint16m4_t" ->ₛ "s18")) # Short |-> a.(vint16m4_t_s18) **
 (&(p # "vint16m4_t" ->ₛ "s19")) # Short |-> a.(vint16m4_t_s19) **
 (&(p # "vint16m4_t" ->ₛ "s20")) # Short |-> a.(vint16m4_t_s20) **
 (&(p # "vint16m4_t" ->ₛ "s21")) # Short |-> a.(vint16m4_t_s21) **
 (&(p # "vint16m4_t" ->ₛ "s22")) # Short |-> a.(vint16m4_t_s22) **
 (&(p # "vint16m4_t" ->ₛ "s23")) # Short |-> a.(vint16m4_t_s23) **
 (&(p # "vint16m4_t" ->ₛ "s24")) # Short |-> a.(vint16m4_t_s24) **
 (&(p # "vint16m4_t" ->ₛ "s25")) # Short |-> a.(vint16m4_t_s25) **
 (&(p # "vint16m4_t" ->ₛ "s26")) # Short |-> a.(vint16m4_t_s26) **
 (&(p # "vint16m4_t" ->ₛ "s27")) # Short |-> a.(vint16m4_t_s27) **
 (&(p # "vint16m4_t" ->ₛ "s28")) # Short |-> a.(vint16m4_t_s28) **
 (&(p # "vint16m4_t" ->ₛ "s29")) # Short |-> a.(vint16m4_t_s29) **
 (&(p # "vint16m4_t" ->ₛ "s30")) # Short |-> a.(vint16m4_t_s30) **
 (&(p # "vint16m4_t" ->ₛ "s31")) # Short |-> a.(vint16m4_t_s31).
Definition qm_record_lanes_vint16m4_t(a:Recordvint16m4_t):Z->Z:=qm_vec32 a.(vint16m4_t_s0) a.(vint16m4_t_s1) a.(vint16m4_t_s2) a.(vint16m4_t_s3) a.(vint16m4_t_s4) a.(vint16m4_t_s5) a.(vint16m4_t_s6) a.(vint16m4_t_s7) a.(vint16m4_t_s8) a.(vint16m4_t_s9) a.(vint16m4_t_s10) a.(vint16m4_t_s11) a.(vint16m4_t_s12) a.(vint16m4_t_s13) a.(vint16m4_t_s14) a.(vint16m4_t_s15) a.(vint16m4_t_s16) a.(vint16m4_t_s17) a.(vint16m4_t_s18) a.(vint16m4_t_s19) a.(vint16m4_t_s20) a.(vint16m4_t_s21) a.(vint16m4_t_s22) a.(vint16m4_t_s23) a.(vint16m4_t_s24) a.(vint16m4_t_s25) a.(vint16m4_t_s26) a.(vint16m4_t_s27) a.(vint16m4_t_s28) a.(vint16m4_t_s29) a.(vint16m4_t_s30) a.(vint16m4_t_s31).
Record Recordvint32m8_t : Type := make_record_vint32m8_t {
 vint32m8_t_s0:Z;
 vint32m8_t_s1:Z;
 vint32m8_t_s2:Z;
 vint32m8_t_s3:Z;
 vint32m8_t_s4:Z;
 vint32m8_t_s5:Z;
 vint32m8_t_s6:Z;
 vint32m8_t_s7:Z;
 vint32m8_t_s8:Z;
 vint32m8_t_s9:Z;
 vint32m8_t_s10:Z;
 vint32m8_t_s11:Z;
 vint32m8_t_s12:Z;
 vint32m8_t_s13:Z;
 vint32m8_t_s14:Z;
 vint32m8_t_s15:Z;
 vint32m8_t_s16:Z;
 vint32m8_t_s17:Z;
 vint32m8_t_s18:Z;
 vint32m8_t_s19:Z;
 vint32m8_t_s20:Z;
 vint32m8_t_s21:Z;
 vint32m8_t_s22:Z;
 vint32m8_t_s23:Z;
 vint32m8_t_s24:Z;
 vint32m8_t_s25:Z;
 vint32m8_t_s26:Z;
 vint32m8_t_s27:Z;
 vint32m8_t_s28:Z;
 vint32m8_t_s29:Z;
 vint32m8_t_s30:Z;
 vint32m8_t_s31:Z
}.
Definition StructPredvint32m8_t(p:Z)(a:Recordvint32m8_t):Assertion :=
 (&(p # "vint32m8_t" ->ₛ "s0")) # Int |-> a.(vint32m8_t_s0) **
 (&(p # "vint32m8_t" ->ₛ "s1")) # Int |-> a.(vint32m8_t_s1) **
 (&(p # "vint32m8_t" ->ₛ "s2")) # Int |-> a.(vint32m8_t_s2) **
 (&(p # "vint32m8_t" ->ₛ "s3")) # Int |-> a.(vint32m8_t_s3) **
 (&(p # "vint32m8_t" ->ₛ "s4")) # Int |-> a.(vint32m8_t_s4) **
 (&(p # "vint32m8_t" ->ₛ "s5")) # Int |-> a.(vint32m8_t_s5) **
 (&(p # "vint32m8_t" ->ₛ "s6")) # Int |-> a.(vint32m8_t_s6) **
 (&(p # "vint32m8_t" ->ₛ "s7")) # Int |-> a.(vint32m8_t_s7) **
 (&(p # "vint32m8_t" ->ₛ "s8")) # Int |-> a.(vint32m8_t_s8) **
 (&(p # "vint32m8_t" ->ₛ "s9")) # Int |-> a.(vint32m8_t_s9) **
 (&(p # "vint32m8_t" ->ₛ "s10")) # Int |-> a.(vint32m8_t_s10) **
 (&(p # "vint32m8_t" ->ₛ "s11")) # Int |-> a.(vint32m8_t_s11) **
 (&(p # "vint32m8_t" ->ₛ "s12")) # Int |-> a.(vint32m8_t_s12) **
 (&(p # "vint32m8_t" ->ₛ "s13")) # Int |-> a.(vint32m8_t_s13) **
 (&(p # "vint32m8_t" ->ₛ "s14")) # Int |-> a.(vint32m8_t_s14) **
 (&(p # "vint32m8_t" ->ₛ "s15")) # Int |-> a.(vint32m8_t_s15) **
 (&(p # "vint32m8_t" ->ₛ "s16")) # Int |-> a.(vint32m8_t_s16) **
 (&(p # "vint32m8_t" ->ₛ "s17")) # Int |-> a.(vint32m8_t_s17) **
 (&(p # "vint32m8_t" ->ₛ "s18")) # Int |-> a.(vint32m8_t_s18) **
 (&(p # "vint32m8_t" ->ₛ "s19")) # Int |-> a.(vint32m8_t_s19) **
 (&(p # "vint32m8_t" ->ₛ "s20")) # Int |-> a.(vint32m8_t_s20) **
 (&(p # "vint32m8_t" ->ₛ "s21")) # Int |-> a.(vint32m8_t_s21) **
 (&(p # "vint32m8_t" ->ₛ "s22")) # Int |-> a.(vint32m8_t_s22) **
 (&(p # "vint32m8_t" ->ₛ "s23")) # Int |-> a.(vint32m8_t_s23) **
 (&(p # "vint32m8_t" ->ₛ "s24")) # Int |-> a.(vint32m8_t_s24) **
 (&(p # "vint32m8_t" ->ₛ "s25")) # Int |-> a.(vint32m8_t_s25) **
 (&(p # "vint32m8_t" ->ₛ "s26")) # Int |-> a.(vint32m8_t_s26) **
 (&(p # "vint32m8_t" ->ₛ "s27")) # Int |-> a.(vint32m8_t_s27) **
 (&(p # "vint32m8_t" ->ₛ "s28")) # Int |-> a.(vint32m8_t_s28) **
 (&(p # "vint32m8_t" ->ₛ "s29")) # Int |-> a.(vint32m8_t_s29) **
 (&(p # "vint32m8_t" ->ₛ "s30")) # Int |-> a.(vint32m8_t_s30) **
 (&(p # "vint32m8_t" ->ₛ "s31")) # Int |-> a.(vint32m8_t_s31).
Definition qm_record_lanes_vint32m8_t(a:Recordvint32m8_t):Z->Z:=qm_vec32 a.(vint32m8_t_s0) a.(vint32m8_t_s1) a.(vint32m8_t_s2) a.(vint32m8_t_s3) a.(vint32m8_t_s4) a.(vint32m8_t_s5) a.(vint32m8_t_s6) a.(vint32m8_t_s7) a.(vint32m8_t_s8) a.(vint32m8_t_s9) a.(vint32m8_t_s10) a.(vint32m8_t_s11) a.(vint32m8_t_s12) a.(vint32m8_t_s13) a.(vint32m8_t_s14) a.(vint32m8_t_s15) a.(vint32m8_t_s16) a.(vint32m8_t_s17) a.(vint32m8_t_s18) a.(vint32m8_t_s19) a.(vint32m8_t_s20) a.(vint32m8_t_s21) a.(vint32m8_t_s22) a.(vint32m8_t_s23) a.(vint32m8_t_s24) a.(vint32m8_t_s25) a.(vint32m8_t_s26) a.(vint32m8_t_s27) a.(vint32m8_t_s28) a.(vint32m8_t_s29) a.(vint32m8_t_s30) a.(vint32m8_t_s31).
Definition qm_record_wmul_match(vl:Z)(r:Recordvint32m8_t)(a b:Recordvint16m4_t):Prop:=
 forall i,0<=i<vl->qm_record_lanes_vint32m8_t r i=qm_record_lanes_vint16m4_t a i*qm_record_lanes_vint16m4_t b i.
Lemma qm_record_wmul_active:forall vl r a b i,0<=i<vl->qm_record_wmul_match vl r a b->qm_record_lanes_vint32m8_t r i=qm_record_lanes_vint16m4_t a i*qm_record_lanes_vint16m4_t b i.
Proof. intros;apply H0;assumption. Qed.
Print Assumptions qm_record_wmul_active.
