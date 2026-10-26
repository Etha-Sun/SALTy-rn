From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export PackModel.
Local Open Scope Z_scope.
(* Output/index loads are available only after the actual prior write. *)
Definition ap_output_readable(O:APOutput)(p n:Z):Prop:=
 forall j,0<=j<n->exists x,O(p+4*j)=Some x.
Definition ap_index_readable(O:APIndex)(p n:Z):Prop:=
 forall j,0<=j<n->exists x,O(p+4*j)=Some x.
Lemma ap_output_readable_loaded:forall O p n j v,
 ap_output_readable O p n->0<=j<n->ap_output_loaded_lane O p j v->
 O(p+4*j)=Some v.
Proof.
 intros O p n j v Hr Hj Hl;destruct(Hr j Hj)as[x Hx].
 unfold ap_output_loaded_lane in Hl.
 pose proof(ap_loaded_initialized O(p+4*j)x v Hx Hl)as E;subst v;exact Hx.
Qed.
Lemma ap_index_readable_loaded:forall O p n j v,
 ap_index_readable O p n->0<=j<n->ap_index_loaded_lane O p j v->
 O(p+4*j)=Some v.
Proof.
 intros O p n j v Hr Hj Hl;destruct(Hr j Hj)as[x Hx].
 unfold ap_index_loaded_lane,ap_index_loaded in Hl;rewrite Hx in Hl;subst v;exact Hx.
Qed.
Print Assumptions ap_output_readable_loaded.
Print Assumptions ap_index_readable_loaded.
