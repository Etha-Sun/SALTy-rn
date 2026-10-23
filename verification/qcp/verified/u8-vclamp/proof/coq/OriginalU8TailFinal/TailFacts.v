From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_map_Zlength : forall (X Y:Type) (f:X->Y) A,
 Zlength (map f A)=Zlength A.
Proof. intros X Y f A; induction A as [|a A IH]; [reflexivity|].
 change (Zlength (f a :: map f A)=Zlength (a::A)).
 rewrite !Zlength_cons; rewrite IH; reflexivity. Qed.
Lemma u8_sublist_suffix : forall lo hi A i j,
 sublist i j (u8_suffix_list lo hi A)=u8_suffix_list lo hi (sublist i j A).
Proof. intros;unfold u8_suffix_list,sublist;rewrite firstn_map,skipn_map;reflexivity. Qed.
Lemma u8_tail_slice : forall n off lo hi A,
 0<=off<=n -> 0<=n-off<=8 ->
 sublist 0 (n-off) (u8_max_list lo (u8_min_list hi (sublist 0 8 (sublist off (n+7) A))))=
 u8_suffix_list lo hi (sublist off n A).
Proof.
 intros. rewrite u8_suffix_compose,u8_sublist_suffix.
 rewrite Zsublist_Zsublist0 by lia.
 rewrite Zsublist_Zsublist by lia.
 replace(0+off) with off by lia;replace(n-off+off) with n by lia;reflexivity.
Qed.
Lemma u8_tail_input_restore : forall p n t A,
 Zlength A=n+7 -> 1<=t<=7 -> t<=n ->
 UCharArray.seg (p+(n-t)) 0 8 (sublist 0 8 (sublist (n-t) (n+7) A)) **
 UCharArray.full (p+(n-t)+8) (t+7-8) (sublist 8 (t+7) (sublist (n-t) (n+7) A)) **
 UCharArray.seg p 0 (n-t) (sublist 0 (n-t) A) |--
 UCharArray.full p (n+7) A.
Proof.
 intros p n t A HA Ht Hn.
 assert(HS:Zlength(sublist (n-t) (n+7) A)=t+7) by (rewrite Zlength_sublist by lia;lia).
 pose proof(u8_input_restore (p+(n-t)) t 8 (sublist (n-t) (n+7) A) HS ltac:(lia)) as Hlocal.
 unfold u8_input_view in Hlocal.
 sep_apply_l_atomic Hlocal.
 pose proof(u8_input_restore p n (n-t) A HA ltac:(lia)) as Hglobal.
 unfold u8_input_view in Hglobal.
 replace(n+7-(n-t)) with(t+7) in Hglobal by lia.
 sep_apply_l_atomic Hglobal;entailer!.
Qed.
Lemma u8_tail_output_finish : forall p n t lo hi A,
 Zlength A=n+7 -> 1<=t<=7 -> t<=n -> u8_prefix_n n<=n-t ->
 UCharArray.seg (p+(n-t)) 0 t
  (sublist 0 t (u8_max_list lo (u8_min_list hi (sublist 0 8 (sublist (n-t) (n+7) A))))) **
 UCharArray.seg p 0 (n-t)
  (u8_prefix_list lo hi (sublist 0 (u8_prefix_n n) A) ++
   u8_suffix_list lo hi (sublist (u8_prefix_n n) (n-t) A)) |--
 UCharArray.full p n (u8_phase_all n lo hi A).
Proof.
 intros p n t lo hi A HA Ht Hn Hp.
 assert(Hpn:0<=u8_prefix_n n). { unfold u8_prefix_n;apply Z.mul_nonneg_nonneg;[apply Z.div_pos;lia|lia]. }
 pose proof(u8_tail_slice n (n-t) lo hi A ltac:(lia) ltac:(lia)) as HT.
 replace(n-(n-t)) with t in HT by lia. rewrite HT.
 sep_apply_l_atomic(u8_seg_concat_at p (n-t) t
  (u8_prefix_list lo hi (sublist 0 (u8_prefix_n n) A) ++ u8_suffix_list lo hi (sublist (u8_prefix_n n) (n-t) A))
  (u8_suffix_list lo hi (sublist (n-t) n A)) ltac:(lia) ltac:(lia)).
 replace(n-t+t) with n by lia.
 rewrite <- app_assoc.
 rewrite u8_suffix_append by lia.
 unfold u8_phase_all.
 sep_apply_l_atomic(UCharArray.seg_to_full p 0 n (u8_prefix_list lo hi (sublist 0 (u8_prefix_n n) A) ++ u8_suffix_list lo hi (sublist (u8_prefix_n n) n A))).
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r;entailer!.
Qed.
Print Assumptions u8_tail_input_restore.
Print Assumptions u8_tail_output_finish.

Lemma u8_tail_pack_0_4 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 0 A 0) hi) lo :: u8_max (u8_min (Znth 1 A 0) hi) lo :: u8_max (u8_min (Znth 2 A 0) hi) lo :: u8_max (u8_min (Znth 3 A 0) hi) lo :: nil) =
 sublist 0 4
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_0_4.

Lemma u8_tail_pack_4_2 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 4 A 0) hi) lo :: u8_max (u8_min (Znth 5 A 0) hi) lo :: nil) =
 sublist 4 6
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_4_2.

Lemma u8_tail_pack_6_1 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 6 A 0) hi) lo :: nil) =
 sublist 6 7
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_6_1.

Lemma u8_tail_pack_4_1 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 4 A 0) hi) lo :: nil) =
 sublist 4 5
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_4_1.

Lemma u8_tail_pack_0_2 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 0 A 0) hi) lo :: u8_max (u8_min (Znth 1 A 0) hi) lo :: nil) =
 sublist 0 2
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_0_2.

Lemma u8_tail_pack_2_1 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 2 A 0) hi) lo :: nil) =
 sublist 2 3
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_2_1.

Lemma u8_tail_pack_0_1 : forall lo hi (A:list Z),
 8 <= Zlength A -> (u8_max (u8_min (Znth 0 A 0) hi) lo :: nil) =
 sublist 0 1
 (u8_max_list lo (u8_min_list hi (sublist 0 8 A))).
Proof. intros lo hi A Hlen.
 do 8 (let x := fresh "x" in destruct A as [|x A];
  [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_tail_pack_0_1.

Ltac tail_case batch_2 t :=
 assert (batch_2=t) by
 (assert (Hcases: batch_2=0 \/ batch_2=1 \/ batch_2=2 \/ batch_2=3 \/
    batch_2=4 \/ batch_2=5 \/ batch_2=6 \/ batch_2=7) by lia;
  repeat destruct Hcases as [Hcases|Hcases]; subst batch_2;
  repeat match goal with H:context[Z.land _ _] |- _ => vm_compute in H end;
  congruence).
