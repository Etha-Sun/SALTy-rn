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
Ltac ig_math_frame :=
 rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;ig_after_pure
 |ig_cancel]|ig_cancel].
Ltac ig_zero_selected := repeat match goal with
 H : ?e = ?z |- context [selected_address ?e ?z ?off] =>
 rewrite H;rewrite ig_selected_zero
 end.

Lemma ig_empty_output : forall c N D A W lo hi,
 FloatArray.undef_full c N |-- ig_output_prefix c N 0 D A W lo hi.
Proof.
 intros;unfold ig_output_prefix,ig_write_state,igemm_output.
 cbn [Z.to_nat seq map];rewrite FloatArray.full_empty.
 sep_apply FloatArray.undef_full_to_undef_seg;entailer!.
Qed.
Lemma ig_bias_initial : forall D col A W,0<=col<8 ->
 igemm_acc 0 D col A W=rvv_at W col.
Proof.
 intros;rewrite igemm_acc_zero;unfold packed_bias_index,rvv_at.
 rewrite Z.div_small,Z.mod_small by lia;unfold panel_wbase;rewrite Z.mul_0_r,Z.add_0_l;reflexivity.
Qed.
Ltac ig_full_shape :=
 match goal with H:igemm_shape ?mr ?N ?K ?ks ?entries ?refs ?blocks ?zero ?off ?W |- _ =>
 let Hcopy:=fresh in pose proof H as Hcopy;unfold igemm_shape in Hcopy;
 decompose [and] Hcopy;clear Hcopy
 end.
Ltac ig_initial :=
 rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;
 rvv_normalize;try lia;ig_extra;ig_full_shape;
 match goal with H:active8 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ |- _ =>
 unfold active8 in H;decompose [and] H;clear H end;
 rewrite ?ig_bias_initial by lia;
 try match goal with
 |- context[ig_output_prefix ?c ?N 0 ?D ?A ?W ?lo ?hi] =>
 sep_apply(ig_empty_output c N D A W lo hi) end;
 try ig_math_frame.

Lemma ig_finished_output : forall c N D A W lo hi,
 ig_output_prefix c N N D A W lo hi |-- ig_output_ref c D N A W lo hi.
Proof.
 intros;unfold ig_output_prefix,ig_write_state,ig_output_ref.
 rewrite FloatArray.undef_seg_empty.
 Exists (igemm_output N D A W lo hi).
 assert(Hrel:Forall2 matches_reference (igemm_output N D A W lo hi) (igemm_output N D A W lo hi)).
 { induction (igemm_output N D A W lo hi);constructor;auto. left;reflexivity. }
 entailer!.
Qed.
