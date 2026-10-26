From Coq Require Import ZArith Bool List Lia.
From ExpMinusMax Require Export Model.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition EMMap:Type:=list(Z*fp32).
Definition em_zero:fp32:=@Binary.B754_zero 24 128 false.
Fixpoint em_get(F:EMMap)(p:Z):fp32:=
 match F with []=>em_zero |(q,v)::rest=>if Z.eqb p q then v else em_get rest p end.
Fixpoint em_data(F:EMMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # Float |-> v) ** em_data rest end.
Definition em_present(F:EMMap)(p:Z):Prop:=In(p,em_get F p)F.
Definition em_window(F:EMMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->em_present F(p+4*i).
Definition em_load_lane(F:EMMap)(p lane:Z):fp32:=em_get F(p+4*lane).

Lemma em_get_cons_same:forall F p v,em_get((p,v)::F)p=v.
Proof. intros;unfold em_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma em_present_cons_same:forall F p v,em_present((p,v)::F)p.
Proof. intros;unfold em_present;rewrite em_get_cons_same;left;reflexivity. Qed.
Lemma em_window_lane:forall F p count lane,
 em_window F p count->0<=lane<count->em_present F(p+4*lane).
Proof. unfold em_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions em_get_cons_same.
Print Assumptions em_present_cons_same.
Print Assumptions em_window_lane.
