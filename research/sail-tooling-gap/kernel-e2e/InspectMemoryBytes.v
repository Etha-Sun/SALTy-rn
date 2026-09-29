Require Import isla.riscv64.riscv64 RvvMemory NeonTail NeonLoop KernelSpec LanePacking.
Lemma byte_mapsto_equiv `{!islaG Σ} (p : Z) (b : bv 8) :
  p ↦ₘ b ⊣⊢ mem_mapsto_byte heap_mem_name p (DfracOwn 1) b.
Proof.
 iSplit; [|iIntros "Hb"; iApply (mem_mapsto_byte_to_mapsto with "Hb")].
 rewrite mem_mapsto_eq. iDestruct 1 as (len Hlen Hrange) "Hm".
 assert (len=1)%nat by lia. subst len.
 cbn [bv_to_little_endian Z_to_little_endian fmap list_fmap] in *.
 iEval (simpl) in "Hm".
 iEval (rewrite ?Z.add_0_r -(bv_wrap_land 8) bv_wrap_bv_unsigned Z_to_bv_bv_unsigned) in "Hm".
 iDestruct "Hm" as "[$ _]".
Qed.
Definition word64_bytes (w : bv 64) : list (bv 8) := bv_to_little_endian 8 8 (bv_unsigned w).
Lemma word64_bytes_length w : length (word64_bytes w) = 8%nat.
Proof. unfold word64_bytes. rewrite length_bv_to_little_endian; [reflexivity|lia]. Qed.
Lemma word64_memory_as_bytes `{!islaG Σ} p (w : bv 64) :
 p ↦ₘ w ⊣⊢ p ↦ₘ∗ word64_bytes w.
Proof.
 rewrite mem_mapsto_eq mem_mapsto_array_eq. iSplit.
 - iDestruct 1 as (len Hlen Hrange) "Hm".
   assert (len=8)%nat by lia. subst len.
   iExists 1%N. iSplit; [done|]. iSplit.
   { iPureIntro. rewrite word64_bytes_length. lia. }
   iApply (big_sepL_mono with "Hm"). intros i b Hb.
   replace (p + Z.of_nat i * Z.of_N 1)%Z with (p+Z.of_nat i)%Z by lia.
   iApply mem_mapsto_byte_to_mapsto.
 - iDestruct 1 as (len Hlen Hrange) "Hm".
   assert (len=1)%N by lia. subst len.
   iExists 8%nat. iSplit; [done|]. iSplit.
   { iPureIntro. rewrite word64_bytes_length in Hrange. lia. }
   iApply (big_sepL_mono with "Hm"). intros i b Hb.
   replace (p + Z.of_nat i * Z.of_N 1)%Z with (p+Z.of_nat i)%Z by lia.
   rewrite byte_mapsto_equiv. done.
Qed.
Lemma byte_array_single `{!islaG Σ} p (b : bv 8) :
 p ↦ₘ∗ [b] ⊣⊢ p ↦ₘ b.
Proof.
 rewrite mem_mapsto_array_eq. iSplit.
 - iDestruct 1 as (len Hlen Hrange) "Hm".
   assert (len=1)%N by lia. subst len. cbn. rewrite Z.add_0_r. iDestruct "Hm" as "[$ _]".
 - iIntros "Hb". iDestruct (mem_mapsto_in_range with "Hb") as %Hrange.
   iExists 1%N. iSplit; [done|]. iSplit; [done|]. cbn. rewrite Z.add_0_r. iFrame.
Qed.
Lemma byte_memory_as_array `{!islaG Σ} `{!threadG} p xs :
 (0 <= p /\ p + Z.of_nat (length xs) <= 2^64)%Z ->
 byte_memory p xs ⊣⊢ p ↦ₘ∗ xs.
Proof.
 revert p. induction xs as [|x xs IH]; intros p Hrange.
 - cbn [byte_memory]. rewrite mem_mapsto_array_eq. iSplit.
   + iIntros "_". iExists 1%N. iSplit; [done|]. iSplit; [done|]. done.
   + iIntros "_". done.
 - change (p ↦ₘ x ∗ byte_memory (p+1) xs ⊣⊢ p ↦ₘ∗ ([x]++xs))%I.
   rewrite byte_array_append byte_array_single. cbn [length].
   rewrite (IH (p+1)%Z ltac:(cbn [length] in Hrange; lia)). reflexivity.
Qed.
Print Assumptions word64_memory_as_bytes.
Print Assumptions byte_memory_as_array.
Lemma word64_bytes_extract w : word64_bytes w =
 [bv_extract 0 8 w; bv_extract 8 8 w; bv_extract 16 8 w; bv_extract 24 8 w;
  bv_extract 32 8 w; bv_extract 40 8 w; bv_extract 48 8 w; bv_extract 56 8 w].
Proof.
 apply list_eq. intros i.
 destruct (decide (i < 8)%nat) as [Hi|Hi].
 - assert (i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7)%nat as Hcases by lia.
   repeat destruct Hcases as [Hcases|Hcases]; subst i;
   unfold word64_bytes; cbn [list_lookup];
   (apply (proj2 (bv_to_little_endian_lookup_Some 8 8 (bv_unsigned w) _ _ ltac:(lia))); split; [lia|reflexivity]).
 - rewrite !lookup_ge_None_2; [reflexivity|cbn; lia|rewrite word64_bytes_length; lia].
Qed.
Lemma extract_concat_low m n1 n2 s l (b1 : bv n1) (b2 : bv n2) :
 (s+l <= n2)%N -> (m=n1+n2)%N ->
 bv_extract s l (bv_concat m b1 b2) = bv_extract s l b2.
Proof.
 intros Hs ->. apply bv_eq.
 rewrite !bv_extract_unsigned bv_concat_unsigned.
Show. Abort.