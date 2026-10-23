From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From FullDomainRvv Require Import FullState MachineDomain.
From FullDomainCaller Require Import CallContractBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(** Contract-level normalization only. There is no C/ISA semantic theorem here. *)
Lemma positive_aligned_kc : forall kc,
 0 < kc -> kc mod 4 = 0 -> 4 <= kc.
Proof.
 intros kc Hpos Hmod.
 pose proof (Z.mod_pos_bound kc 4 ltac:(lia)).
 pose proof (Z.div_mod kc 4 ltac:(lia)). lia.
Qed.

Lemma rem_mod_agree_for_legal_kc : forall kc,
 0 < kc -> Z.rem kc 4 = 0 -> kc mod 4 = 0.
Proof. intros; rewrite <- Z.rem_mod_nonneg by lia; assumption. Qed.

Lemma caller_entry_pure_satisfies_neon : forall mr nc kc a w c params,
 1 <= mr <= 4 -> 0 < nc -> 0 < kc -> kc mod 4 = 0 ->
 machine_capacity a w c params kc nc ->
 1 <= mr <= 4 /\ 1 <= nc /\ 4 <= kc /\
 neon_allocation_bounds a w c kc nc.
Proof.
 intros mr nc kc a w c params Hmr Hnc Hkc Hmod Hcap.
 pose proof (positive_aligned_kc kc Hkc Hmod) as Hfour.
 pose proof (caller_capacity_satisfies_neon_bounds a w c params kc nc Hcap) as Hbounds.
 split; [exact Hmr|].
 split; [lia|]. split; assumption.
Qed.

(** Treat all arguments here as caller entry values. Frame includes both
    unchanged params fields; the same statement permits any extra legal frame.
    It does not assert that a callee's current locals equal its entry locals. *)
Lemma neon_post_memory_satisfies_caller :
 forall a w c kc nc mr A W lo hi (frame:Assertion),
 kc mod 4 = 0 ->
 FloatArray.full a kc A **
 FloatArray.full w (8*(kc/4+1)*panel_count nc) W **
 output_state c mr nc (kc/4) nc A W lo hi ** frame |--
 FloatArray.full a (4*(kc/4)) A **
 FloatArray.full w (panel_count nc*8*(kc/4+1)) W **
 output_state c mr nc (kc/4) nc A W lo hi ** frame.
Proof.
 intros a w c kc nc mr A W lo hi frame Hmod.
 rewrite (aligned_kc_cells kc Hmod), packed_cell_count_normalization.
 apply derivable1_refl.
Qed.

Print Assumptions positive_aligned_kc.
Print Assumptions rem_mod_agree_for_legal_kc.
Print Assumptions caller_entry_pure_satisfies_neon.
Print Assumptions neon_post_memory_satisfies_caller.
