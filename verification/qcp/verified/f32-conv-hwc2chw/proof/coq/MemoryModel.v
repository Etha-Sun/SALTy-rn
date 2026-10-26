From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From HwcConv Require Export FmaModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition HwcROMap:Type:=list(Z*fp32).
Definition hc_zero:fp32:=@Binary.B754_zero 24 128 false.
Fixpoint hc_get(F:HwcROMap)(p:Z):fp32:=
 match F with []=>hc_zero |(q,v)::rest=>if Z.eqb p q then v else hc_get rest p end.
Fixpoint hc_data(F:HwcROMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # Float |-> v) ** hc_data rest end.
Definition hc_present(F:HwcROMap)(p:Z):Prop:=In(p,hc_get F p)F.
Definition hc_window(F:HwcROMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->hc_present F(p+4*i).
Definition hc_load_lane(F:HwcROMap)(p lane:Z):fp32:=hc_get F(p+4*lane).

Lemma hc_get_cons_same:forall F p v,hc_get((p,v)::F)p=v.
Proof. intros;unfold hc_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma hc_present_cons_same:forall F p v,hc_present((p,v)::F)p.
Proof. intros;unfold hc_present;rewrite hc_get_cons_same;left;reflexivity. Qed.
Lemma hc_window_lane:forall F p count lane,
 hc_window F p count->0<=lane<count->hc_present F(p+4*lane).
Proof. unfold hc_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions hc_get_cons_same.
Print Assumptions hc_present_cons_same.
Print Assumptions hc_window_lane.

Definition HwcPtrMap:Type:=list(Z*Z).
Fixpoint hc_ptr_get(P:HwcPtrMap)(p:Z):Z:=
 match P with []=>0|(q,v)::rest=>if Z.eqb p q then v else hc_ptr_get rest p end.
Fixpoint hc_ptr_data(P:HwcPtrMap):Assertion:=
 match P with []=>emp|(p,v)::rest=>(p # Ptr |-> v)**hc_ptr_data rest end.
Definition hc_ptr_present(P:HwcPtrMap)(p:Z):Prop:=In(p,hc_ptr_get P p)P.
Definition hc_ptr_window(P:HwcPtrMap)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->hc_ptr_present P(p+8*j).
