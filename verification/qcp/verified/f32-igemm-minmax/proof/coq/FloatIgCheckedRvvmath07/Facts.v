From Coq Require Import ZArith List Lia.
From FloatAutomation Require Export Frame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma ig_shape_facts : forall mr N K ks entries refs blocks zero offset W,
 igemm_shape mr N K ks entries refs blocks zero offset W ->
 0<total_depth K refs /\ Z.quot ks 8=Zlength refs /\
 Zlength entries=Zlength refs /\ 0<panel_count N.
Proof.
 intros mr N K ks entries refs blocks zero offset W H.
 destruct H as (Hm&HN&HK&HR&HS&HW&HM).
 destruct HM as [HE HM];unfold total_depth.
 rewrite Z.quot_div_nonneg by lia.
 assert(Hdiv:ks/8=Zlength refs).
 { rewrite HS;replace(8*Zlength refs)with(Zlength refs*8)by ring;rewrite Z.div_mul by lia;reflexivity. }
 rewrite Hdiv.
 repeat split;auto;try nia;now apply panel_count_positive.
Qed.
Lemma ig_selected_zero : forall z off,selected_address z z off=z.
Proof. intros;unfold selected_address;destruct (Z.eq_dec z z);congruence. Qed.
Lemma ig_selected_other : forall entry z off,entry<>z ->
 selected_address entry z off=entry+off.
Proof. intros;unfold selected_address;destruct (Z.eq_dec entry z);congruence. Qed.
Lemma ig_selected_uint64 : forall K zero offset entries refs blocks j,
 input_mapping K zero offset entries refs blocks ->0<=j<Zlength refs ->
 Znth j entries 0<>zero ->
 unsigned_last_nbits(unsigned_last_nbits(Znth j entries 0)64+offset)64=
 selected_address (Znth j entries 0) zero offset.
Proof.
 intros K zero offset entries refs blocks j [_ HM] Hj Hne.
 specialize(HM j Hj);destruct HM as [[Hr [Ho [Ha Hb]]] _].
 rewrite ig_selected_other by assumption.
 destruct Hb as [He|Hb];[contradiction|].
 assert(E:unsigned_last_nbits(Znth j entries 0)64=Znth j entries 0).
 { apply unsigned_last_nbits_eq;change(0<=Znth j entries 0<18446744073709551616);unfold ptr_modulus in Hr;lia. }
 rewrite E;apply unsigned_last_nbits_eq.
 change(0<=Znth j entries 0+offset<18446744073709551616);unfold ptr_modulus in *;lia.
Qed.
Ltac ig_extra :=
 first [match goal with H:igemm_shape ?mr ?N ?K ?ks ?entries ?refs ?blocks ?zero ?offset ?W |- _ =>
  let Hd:=fresh in let Hs:=fresh in let He:=fresh in let Hp:=fresh in
  destruct(ig_shape_facts mr N K ks entries refs blocks zero offset W H)as[Hd[Hs[He Hp]]]
 end|idtac];
 rewrite ?ig_selected_zero in *;
 repeat first [progress(rewrite Z.quot_div_nonneg in * by lia)|progress(rewrite Z.rem_mod_nonneg in * by lia)|progress rvv_normalize].
Ltac ig_math_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 unfold packed_length,total_depth in *;nia.
Print Assumptions ig_shape_facts.
Print Assumptions ig_selected_uint64.

Ltac ig_selected_rewrite :=
 repeat multimatch goal with
 | H:input_mapping ?K ?zero ?off ?entries ?refs ?blocks |-
 context[unsigned_last_nbits(unsigned_last_nbits(Znth ?j ?entries 0)64+?off)64] =>
 let E:=fresh "Hselected" in
 assert(E:unsigned_last_nbits(unsigned_last_nbits(Znth j entries 0)64+off)64=
 selected_address(Znth j entries 0)zero off)
 by(eapply ig_selected_uint64;[exact H|lia|assumption]);rewrite E
 end.
