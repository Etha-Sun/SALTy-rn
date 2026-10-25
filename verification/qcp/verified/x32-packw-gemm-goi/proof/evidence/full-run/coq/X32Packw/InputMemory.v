From Coq Require Import ZArith Bool List Lia.
From X32Packw Require Export RawWords.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition PWMap:Type:=list(Z*Z).
Definition pw_zero:Z:=0.
Fixpoint pw_get(F:PWMap)(p:Z):Z:=
 match F with []=>pw_zero |(q,v)::rest=>if Z.eqb p q then v else pw_get rest p end.
Fixpoint pw_data(F:PWMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # UInt |-> v) ** pw_data rest end.
Definition pw_present(F:PWMap)(p:Z):Prop:=In(p,pw_get F p)F.
Definition pw_window(F:PWMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->pw_present F(p+4*i).
Definition pw_load_lane(F:PWMap)(p lane:Z):Z:=pw_get F(p+4*lane).

Lemma pw_get_cons_same:forall F p v,pw_get((p,v)::F)p=v.
Proof. intros;unfold pw_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma pw_present_cons_same:forall F p v,pw_present((p,v)::F)p.
Proof. intros;unfold pw_present;rewrite pw_get_cons_same;left;reflexivity. Qed.
Lemma pw_window_lane:forall F p count lane,
 pw_window F p count->0<=lane<count->pw_present F(p+4*lane).
Proof. unfold pw_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions pw_get_cons_same.
Print Assumptions pw_present_cons_same.
Print Assumptions pw_window_lane.
