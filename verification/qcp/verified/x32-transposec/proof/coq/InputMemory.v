From Coq Require Import ZArith Bool List Lia.
From X32Transpose Require Export WordModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition XTMap:Type:=list(Z*Z).
Definition xt_zero:Z:=0.
Fixpoint xt_get(F:XTMap)(p:Z):Z:=
 match F with []=>xt_zero |(q,v)::rest=>if Z.eqb p q then v else xt_get rest p end.
Fixpoint xt_data(F:XTMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # UInt |-> v) ** xt_data rest end.
Definition xt_present(F:XTMap)(p:Z):Prop:=In(p,xt_get F p)F.
Definition xt_window(F:XTMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->xt_present F(p+4*i).
Definition xt_load_lane(F:XTMap)(p lane:Z):Z:=xt_get F(p+4*lane).

Lemma xt_get_cons_same:forall F p v,xt_get((p,v)::F)p=v.
Proof. intros;unfold xt_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma xt_present_cons_same:forall F p v,xt_present((p,v)::F)p.
Proof. intros;unfold xt_present;rewrite xt_get_cons_same;left;reflexivity. Qed.
Lemma xt_window_lane:forall F p count lane,
 xt_window F p count->0<=lane<count->xt_present F(p+4*lane).
Proof. unfold xt_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions xt_get_cons_same.
Print Assumptions xt_present_cons_same.
Print Assumptions xt_window_lane.
