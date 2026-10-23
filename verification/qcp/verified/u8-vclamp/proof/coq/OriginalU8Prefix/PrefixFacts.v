From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_prefix_compose : forall lo hi A,
 u8_min_list hi (u8_max_list lo A)=u8_prefix_list lo hi A.
Proof. intros;unfold u8_min_list,u8_max_list,u8_prefix_list,u8_prefix;rewrite map_map;reflexivity. Qed.
Lemma u8_seg_concat_at : forall p off step (old fresh:list Z),
 0<=off -> 0<=step ->
 UCharArray.seg (p+off) 0 step fresh ** UCharArray.seg p 0 off old |--
 UCharArray.seg p 0 (off+step) (old++fresh).
Proof.
 intros.
 pose proof(UCharArray.seg_0_shift p off (off+step) fresh) as HS.
 unfold StoreUCharAsElement.sizeA in HS;rewrite sizeof_uchar in HS.
 replace(p+off*1) with(p+off) in HS by lia.
 replace(off+step-off) with step in HS by lia;rewrite <- HS.
 sep_apply_l_atomic(UCharArray.seg_merge_to_seg p 0 off (off+step) old fresh ltac:(lia));entailer!.
Qed.
Lemma u8_next64_prefix : forall n off,
 0<=off -> off+64<=n -> Z.rem off 64=0 ->
 off+64<=u8_prefix_n n /\ Z.rem (off+64) 64=0.
Proof.
 intros n off H0 Hn Hr.
 rewrite Z.rem_mod_nonneg in Hr by lia.
 pose proof(Z.div_mod off 64 ltac:(lia)) as Hd.
 assert(Hnext:Z.div off 64+1<=Z.div n 64).
 { apply Z.div_le_lower_bound;lia. }
 split;[unfold u8_prefix_n;lia|].
 rewrite Z.rem_mod_nonneg by lia.
 rewrite Z.add_mod by lia;rewrite Hr;vm_compute;reflexivity.
Qed.
Print Assumptions u8_seg_concat_at.
Print Assumptions u8_next64_prefix.

Lemma u8_prefix_pack16 : forall lo hi (A:list Z),
 16 <= Zlength A ->
 (u8_min (u8_max (Znth 0 A 0) lo) hi :: u8_min (u8_max (Znth 1 A 0) lo) hi :: u8_min (u8_max (Znth 2 A 0) lo) hi :: u8_min (u8_max (Znth 3 A 0) lo) hi :: u8_min (u8_max (Znth 4 A 0) lo) hi :: u8_min (u8_max (Znth 5 A 0) lo) hi :: u8_min (u8_max (Znth 6 A 0) lo) hi :: u8_min (u8_max (Znth 7 A 0) lo) hi :: u8_min (u8_max (Znth 8 A 0) lo) hi :: u8_min (u8_max (Znth 9 A 0) lo) hi :: u8_min (u8_max (Znth 10 A 0) lo) hi :: u8_min (u8_max (Znth 11 A 0) lo) hi :: u8_min (u8_max (Znth 12 A 0) lo) hi :: u8_min (u8_max (Znth 13 A 0) lo) hi :: u8_min (u8_max (Znth 14 A 0) lo) hi :: u8_min (u8_max (Znth 15 A 0) lo) hi :: nil) = u8_prefix_list lo hi (sublist 0 16 A).
Proof.
 intros lo hi A Hlen.
 do 16 (let x := fresh "x" in destruct A as [|x A];
   [repeat rewrite Zlength_cons in Hlen; rewrite Zlength_nil in Hlen; lia|]).
 reflexivity.
Qed.
Print Assumptions u8_prefix_pack16.

From LeaderAutomation Require Import FastFrame.
Ltac opaque_registers_rec l :=
 lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   lazymatch v with
   | UCharArray.full _ _ _ => idtac
   | UCharArray.undef_full _ _ => idtac
   | UCharArray.seg _ _ _ _ => idtac
   | UCharArray.undef_seg _ _ _ => idtac
   | _ => let cell := fresh "cell" in let H := fresh "Ecell" in
          remember v as cell eqn:H; clear H
   end;
   opaque_registers_rec tail
 end.
Ltac opaque_registers := match goal with |- ?P |-- ?Q =>
 let leaves := All_listasrts P in opaque_registers_rec leaves end.
