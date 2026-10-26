From Coq Require Import ZArith Bool List Lia.
From ArgmaxPool Require Export Model.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition APMap:Type:=list(Z*fp32).
Definition ap_zero:fp32:=@Binary.B754_zero 24 128 false.
Fixpoint ap_get(F:APMap)(p:Z):fp32:=
 match F with []=>ap_zero |(q,v)::rest=>if Z.eqb p q then v else ap_get rest p end.
Fixpoint ap_data(F:APMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # Float |-> v) ** ap_data rest end.
Definition ap_present(F:APMap)(p:Z):Prop:=In(p,ap_get F p)F.
Definition ap_window(F:APMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->ap_present F(p+4*i).
Definition ap_load_lane(F:APMap)(p lane:Z):fp32:=ap_get F(p+4*lane).

Lemma ap_get_cons_same:forall F p v,ap_get((p,v)::F)p=v.
Proof. intros;unfold ap_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma ap_present_cons_same:forall F p v,ap_present((p,v)::F)p.
Proof. intros;unfold ap_present;rewrite ap_get_cons_same;left;reflexivity. Qed.
Lemma ap_window_lane:forall F p count lane,
 ap_window F p count->0<=lane<count->ap_present F(p+4*lane).
Proof. unfold ap_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions ap_get_cons_same.
Print Assumptions ap_present_cons_same.
Print Assumptions ap_window_lane.
