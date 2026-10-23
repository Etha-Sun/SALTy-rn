From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_element_size : StoreUCharAsElement.sizeA=1.
Proof. unfold StoreUCharAsElement.sizeA;apply sizeof_uchar. Qed.
Definition u8_input_view p n off (A:list Z) :=
 UCharArray.seg p 0 off (sublist 0 off A) **
 UCharArray.full (p+off) (n+7-off) (sublist off (n+7) A).
Lemma u8_input_split : forall p n off A,
  Zlength A=n+7 -> 0<=off<=n+7 ->
  UCharArray.full p (n+7) A |-- u8_input_view p n off A.
Proof.
 intros. unfold u8_input_view.
 sep_apply_l_atomic(UCharArray.full_split_to_seg p off (n+7) A ltac:(lia)).
 sep_apply_l_atomic(UCharArray.seg_to_full p off (n+7) (sublist off (n+7) A)).
 rewrite ?u8_element_size, ?sizeof_uchar. replace(p+off*1) with(p+off) by lia;entailer!.
Qed.
Lemma u8_input_restore : forall p n off A,
  Zlength A=n+7 -> 0<=off<=n+7 ->
  u8_input_view p n off A |-- UCharArray.full p (n+7) A.
Proof.
 intros. unfold u8_input_view.
 sep_apply_l_atomic(UCharArray.full_to_seg (p+off) (n+7-off) (sublist off (n+7) A)).
 pose proof(UCharArray.seg_0_shift p off (n+7) (sublist off (n+7) A)) as HS.
 rewrite ?u8_element_size, ?sizeof_uchar in HS. replace(p+off*1) with(p+off) in HS by lia.
 rewrite <- HS.
 sep_apply_l_atomic(UCharArray.seg_merge_to_full p 0 off (n+7) (sublist 0 off A) (sublist off (n+7) A) ltac:(lia)).
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r.
 rewrite <- sublist_split by lia. rewrite sublist_self by lia;entailer!.
Qed.
Lemma u8_input_advance : forall p n off step A,
 Zlength A=n+7 -> 0<=off -> 0<=step -> off+step<=n ->
 u8_input_view p n off A |-- u8_input_view p n (off+step) A.
Proof.
 intros. eapply derivable1_trans;[apply u8_input_restore;[eauto|lia]|].
 apply u8_input_split;[eauto|lia].
Qed.
Lemma u8_output_advance : forall p n off step old fresh,
 0<=off -> 0<=step -> off+step<=n ->
 UCharArray.seg (p+off) 0 step fresh **
 UCharArray.undef_seg (p+off) step (n-off) **
 UCharArray.seg p 0 off old |--
 UCharArray.seg p 0 (off+step) (old++fresh) **
 UCharArray.undef_full (p+(off+step)) (n-(off+step)).
Proof.
 intros.
 pose proof(UCharArray.seg_0_shift p off (off+step) fresh) as HS.
 rewrite ?u8_element_size, ?sizeof_uchar in HS.
 replace(p+off*1) with(p+off) in HS by lia.
 replace(off+step-off) with step in HS by lia. rewrite <- HS.
 sep_apply_l_atomic(UCharArray.undef_seg_to_undef_full (p+off) step (n-off)).
 rewrite ?u8_element_size, ?sizeof_uchar.
 replace(p+off+step*1) with(p+(off+step)) by lia.
 replace(n-off-step) with(n-(off+step)) by lia.
 sep_apply_l_atomic(UCharArray.seg_merge_to_seg p 0 off (off+step) old fresh ltac:(lia));entailer!.
Qed.
Lemma u8_prefix_compose : forall lo hi A,
 u8_min_list hi (u8_max_list lo A)=u8_prefix_list lo hi A.
Proof. intros;unfold u8_min_list,u8_max_list,u8_prefix_list,u8_prefix;rewrite map_map;reflexivity. Qed.
Lemma u8_suffix_compose : forall lo hi A,
 u8_max_list lo (u8_min_list hi A)=u8_suffix_list lo hi A.
Proof. intros;unfold u8_min_list,u8_max_list,u8_suffix_list,u8_suffix;rewrite map_map;reflexivity. Qed.
Lemma u8_prefix_append : forall lo hi (A:list Z) i j,
 0<=i<=j -> j<=Zlength A ->
 u8_prefix_list lo hi (sublist 0 i A) ++ u8_prefix_list lo hi (sublist i j A) =
 u8_prefix_list lo hi (sublist 0 j A).
Proof. intros;unfold u8_prefix_list;rewrite <- map_app;rewrite <- sublist_split by lia;reflexivity. Qed.
Lemma u8_suffix_append : forall lo hi (A:list Z) k i j,
 0<=k<=i -> i<=j -> j<=Zlength A ->
 u8_suffix_list lo hi (sublist k i A) ++ u8_suffix_list lo hi (sublist i j A) =
 u8_suffix_list lo hi (sublist k j A).
Proof. intros;unfold u8_suffix_list;rewrite <- map_app;rewrite <- sublist_split by lia;reflexivity. Qed.
Print Assumptions u8_input_advance.
Print Assumptions u8_output_advance.

Lemma u8_suffix_pack8 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 0 A 0) hi) lo :: u8_max (u8_min (Znth 1 A 0) hi) lo :: u8_max (u8_min (Znth 2 A 0) hi) lo :: u8_max (u8_min (Znth 3 A 0) hi) lo :: u8_max (u8_min (Znth 4 A 0) hi) lo :: u8_max (u8_min (Znth 5 A 0) hi) lo :: u8_max (u8_min (Znth 6 A 0) hi) lo :: u8_max (u8_min (Znth 7 A 0) hi) lo :: nil) = u8_suffix_list lo hi (sublist 0 8 A).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_suffix_pack8.
