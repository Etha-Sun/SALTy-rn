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

Inductive ig_div_seen(x b:Z):Prop:=ig_div_seen_intro:ig_div_seen x b.
Ltac ig_one_div x b :=
 lazymatch goal with _:ig_div_seen x b |- _=>fail|_=>
 let Hb:=fresh in assert(Hb:0<b)by lia;
 let E:=fresh "Hdiv" in pose proof(Z.div_mod x b ltac:(lia))as E;
 let B:=fresh "Hrem" in pose proof(Z.mod_pos_bound x b Hb)as B;
 let M:=fresh in assert(M:ig_div_seen x b)by constructor
 end.
Ltac ig_div_facts := repeat multimatch goal with
 |H:context[Z.div ?x ?b] |- _=>ig_one_div x b
 | |-context[Z.div ?x ?b]=>ig_one_div x b
 end.


Ltac ig_after_pure :=
 repeat first[assumption|reflexivity|apply conj];
 repeat rewrite Z.rem_mod_nonneg in * by lia;
 unfold packed_length,total_depth in *;nia.
Lemma float_borrow : forall x i n xs,0<=i<n ->
 FloatArray.full x n xs |-- FloatArray.missing_i x i 0 n xs ** store_float (x+i*4) (Znth i xs fp32_zero).
Proof. intros;sep_apply (FloatArray.full_split_to_missing_i x i n xs fp32_zero H).
 unfold StoreFloatAsElement.storeA;rewrite sizeof_float;entailer!. Qed.
Lemma ptr_borrow : forall x i n xs,0<=i<n ->
 PtrArray.full x n xs |-- PtrArray.missing_i x i 0 n xs ** store_ptr (x+i*8) (Znth i xs 0).
Proof. intros;sep_apply (PtrArray.full_split_to_missing_i x i n xs 0 H).
 unfold StorePtrAsElement.storeA;change (ptr_size_Z) with 8;entailer!. Qed.
Ltac igemm_borrow :=
 repeat first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[FloatArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[FloatArray.full x n xs] =>
    sep_apply (float_borrow x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[PtrArray.full x n xs] =>
    sep_apply (ptr_borrow x i n xs ltac:(lia)) end end end].
Lemma float_restore : forall x i n xs,0<=i<n ->
 FloatArray.missing_i x i 0 n xs ** store_float (x+i*4) (Znth i xs fp32_zero) |-- FloatArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (FloatArray.missing_i_merge_to_full x i n (Znth i xs fp32_zero) xs H) as HM.
 unfold StoreFloatAsElement.storeA in HM.
 rewrite sizeof_float,replace_Znth_Znth in HM by lia;exact HM.
Qed.
Lemma ptr_restore : forall x i n xs,0<=i<n ->
 PtrArray.missing_i x i 0 n xs ** store_ptr (x+i*8) (Znth i xs 0) |-- PtrArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (PtrArray.missing_i_merge_to_full x i n (Znth i xs 0) xs H) as HM.
 unfold StorePtrAsElement.storeA in HM;change (ptr_size_Z) with 8 in HM.
 rewrite replace_Znth_Znth in HM by lia;exact HM.
Qed.
Ltac igemm_restore :=
 repeat first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[FloatArray.full ?x ?n ?xs] =>
   multimatch P with context[FloatArray.missing_i x ?i 0 n xs] =>
    sep_apply (float_restore x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.full ?x ?n ?xs] =>
   multimatch P with context[PtrArray.missing_i x ?i 0 n xs] =>
    sep_apply (ptr_restore x i n xs ltac:(lia)) end end end].

Ltac ig_math_frame :=
 rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;
 rvv_subst;rvv_normalize;ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;ig_after_pure
 |igemm_borrow;igemm_restore;rvv_normalize;ig_cancel]|igemm_borrow;igemm_restore;rvv_normalize;ig_cancel].
Ltac ig_zero_selected := repeat match goal with
 H : ?e = ?z |- context [selected_address ?e ?z ?off] =>
 rewrite H;rewrite ig_selected_zero
 end.
