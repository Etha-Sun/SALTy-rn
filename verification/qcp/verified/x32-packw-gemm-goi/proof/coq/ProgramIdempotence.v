From Coq Require Import ZArith List Bool FunctionalExtensionality.
From X32Packw Require Export ProgramModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
(* A fixed sequence of word writes either assigns an initial-state-independent
   result at q, or retains the exact old option value. This property includes
   untouched None holes and arbitrary repeated addresses. *)
Definition pw_static_update(T:PWOutput->PWOutput):Prop:=
 forall O1 O2 q,T O1 q=T O2 q \/(T O1 q=O1 q /\T O2 q=O2 q).
Lemma pw_static_identity:pw_static_update(fun O=>O).
Proof. intros O1 O2 q;right;auto. Qed.
Lemma pw_static_put:forall p x,pw_static_update(fun O=>pw_output_put O p x).
Proof.
 intros p x O1 O2 q;unfold pw_output_put,pw_put.
 destruct(Z.eqb q p);[left;reflexivity|right;auto].
Qed.
Lemma pw_static_compose:forall T S,pw_static_update T->pw_static_update S->
 pw_static_update(fun O=>S(T O)).
Proof.
 intros T S HT HS O1 O2 q;destruct(HS(T O1)(T O2)q)as[Heq|[Hone Htwo]];[left;exact Heq|].
 destruct(HT O1 O2 q)as[Heq|[HTone HTtwo]].
 - left;rewrite Hone,Htwo;exact Heq.
 - right;split;congruence.
Qed.
Lemma pw_static_write_pair:forall p a b,pw_static_update(fun O=>pw_write_pair O p a b).
Proof.
 intros;unfold pw_write_pair.
 apply(pw_static_compose(fun O=>pw_output_put O p a)(fun O=>pw_output_put O(p+4)b));apply pw_static_put.
Qed.
Lemma pw_static_pair_run:forall n F a b p,pw_static_update(fun O=>pw_pair_run n F a b p O).
Proof.
 intros n F a b p;unfold pw_pair_run;induction(Z.to_nat n)as[|k IH].
 - exact pw_static_identity.
 - cbn[pw_pair_run_nat];apply(pw_static_compose(fun O=>pw_pair_run_nat k F a b p O)(fun O=>pw_write_pair O(p+8*Z.of_nat k)(pw_get F(a+4*Z.of_nat k))(pw_get F(b+4*Z.of_nat k))));[exact IH|apply pw_static_write_pair].
Qed.
Lemma pw_static_odd_run:forall n F a p,pw_static_update(fun O=>pw_odd_run n F a p O).
Proof.
 intros n F a p;unfold pw_odd_run;induction(Z.to_nat n)as[|k IH].
 - exact pw_static_identity.
 - cbn[pw_odd_run_nat];apply(pw_static_compose(fun O=>pw_odd_run_nat k F a p O)(fun O=>pw_output_put O(p+8*Z.of_nat k)(pw_get F(a+4*Z.of_nat k))));[exact IH|apply pw_static_put].
Qed.
Lemma pw_static_header:forall F present pair b p,pw_static_update(pw_header F present pair b p).
Proof. intros F[] [] b p;cbn[pw_header];apply pw_static_put||apply pw_static_write_pair. Qed.
Lemma pw_static_tile:forall F G group tile,pw_static_update(pw_tile F G group tile).
Proof.
 intros F G group tile;unfold pw_tile;destruct(Z.ltb(2*tile+1)(pw_channels G)).
 - apply(pw_static_compose(pw_header F(negb(Z.eqb(pw_bias G)0))true(pw_tile_bias G group tile)(pw_tile_output G group tile))
   (fun O=>pw_pair_run(pw_depth G)F(pw_tile_weight G group tile)(pw_tile_weight G group tile+4*pw_depth G)(pw_tile_output G group tile+8)O));
   apply pw_static_header||apply pw_static_pair_run.
 - apply(pw_static_compose(pw_header F(negb(Z.eqb(pw_bias G)0))false(pw_tile_bias G group tile)(pw_tile_output G group tile))
   (fun O=>pw_odd_run(pw_depth G)F(pw_tile_weight G group tile)(pw_tile_output G group tile+8)O));
   apply pw_static_header||apply pw_static_odd_run.
Qed.
Lemma pw_static_tiles:forall n F G group,pw_static_update(pw_tiles_run n F G group).
Proof.
 intros n F G group;unfold pw_tiles_run;induction(Z.to_nat n)as[|k IH].
 - exact pw_static_identity.
 - cbn[pw_tiles_run_nat];apply(pw_static_compose(fun O=>pw_tiles_run_nat k F G group O)(pw_tile F G group(Z.of_nat k)));[exact IH|apply pw_static_tile].
Qed.
Lemma pw_static_groups:forall n F G,pw_static_update(pw_groups_run n F G).
Proof.
 intros n F G;unfold pw_groups_run;induction(Z.to_nat n)as[|k IH].
 - exact pw_static_identity.
 - cbn[pw_groups_run_nat];apply(pw_static_compose(fun O=>pw_groups_run_nat k F G O)(pw_tiles_run(pw_tiles G)F G(Z.of_nat k)));[exact IH|apply pw_static_tiles].
Qed.
Lemma pw_program_static:forall F G,pw_static_update(pw_program F G).
Proof. intros;apply pw_static_groups. Qed.
Lemma pw_static_idempotent:forall T,pw_static_update T->forall O,T(T O)=T O.
Proof.
 intros T HT O;apply functional_extensionality;intro q.
 destruct(HT(T O)O q)as[Heq|[Hone Htwo]];assumption.
Qed.
Theorem pw_program_idempotent:forall F G O,
 pw_program F G(pw_program F G O)=pw_program F G O.
Proof. intros;apply pw_static_idempotent;apply pw_program_static. Qed.
Print Assumptions pw_static_identity.
Print Assumptions pw_static_put.
Print Assumptions pw_static_compose.
Print Assumptions pw_static_write_pair.
Print Assumptions pw_static_pair_run.
Print Assumptions pw_static_odd_run.
Print Assumptions pw_static_header.
Print Assumptions pw_static_tile.
Print Assumptions pw_static_tiles.
Print Assumptions pw_static_groups.
Print Assumptions pw_program_static.
Print Assumptions pw_static_idempotent.
Print Assumptions pw_program_idempotent.
