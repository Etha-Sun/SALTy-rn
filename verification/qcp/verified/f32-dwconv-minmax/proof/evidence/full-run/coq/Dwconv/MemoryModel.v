From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From Dwconv Require Export FmaModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owned cell per distinct input address permits repeated and overlapping
   read windows without duplicating spatial ownership. No constant/empty-map
   replacement of input memory is permitted. *)
Definition DwROMap:Type:=list(Z*fp32).
Definition dw_zero:fp32:=@Binary.B754_zero 24 128 false.
Fixpoint dw_get(F:DwROMap)(p:Z):fp32:=
 match F with []=>dw_zero |(q,v)::rest=>if Z.eqb p q then v else dw_get rest p end.
Fixpoint dw_data(F:DwROMap):Assertion:=
 match F with []=>emp |(p,v)::rest=>(p # Float |-> v) ** dw_data rest end.
Definition dw_present(F:DwROMap)(p:Z):Prop:=In(p,dw_get F p)F.
Definition dw_window(F:DwROMap)(p count:Z):Prop:=
 0<p /\ 0<=count /\ forall i:Z,0<=i<count->dw_present F(p+4*i).
Definition dw_load_lane(F:DwROMap)(p lane:Z):fp32:=dw_get F(p+4*lane).

Lemma dw_get_cons_same:forall F p v,dw_get((p,v)::F)p=v.
Proof. intros;unfold dw_get;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma dw_present_cons_same:forall F p v,dw_present((p,v)::F)p.
Proof. intros;unfold dw_present;rewrite dw_get_cons_same;left;reflexivity. Qed.
Lemma dw_window_lane:forall F p count lane,
 dw_window F p count->0<=lane<count->dw_present F(p+4*lane).
Proof. unfold dw_window;intros F p count lane[? [? H]]Hlane;apply H;assumption. Qed.
Print Assumptions dw_get_cons_same.
Print Assumptions dw_present_cons_same.
Print Assumptions dw_window_lane.

Definition DwPtrMap:Type:=list(Z*Z).
Fixpoint dw_ptr_get(P:DwPtrMap)(p:Z):Z:=
 match P with []=>0|(q,v)::rest=>if Z.eqb p q then v else dw_ptr_get rest p end.
Fixpoint dw_ptr_data(P:DwPtrMap):Assertion:=
 match P with []=>emp|(p,v)::rest=>(p # Ptr |-> v)**dw_ptr_data rest end.
Definition dw_ptr_present(P:DwPtrMap)(p:Z):Prop:=In(p,dw_ptr_get P p)P.
Definition dw_ptr_window(P:DwPtrMap)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->dw_ptr_present P(p+8*j).
