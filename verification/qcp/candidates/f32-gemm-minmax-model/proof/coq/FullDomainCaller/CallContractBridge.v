From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From FullDomainRvv Require Import FullState MachineDomain.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(** These are the arithmetic/allocation differences between the public caller
    and the current original-control-flow NEON candidate. This does not assert
    either C body, source refinement, or an ISA theorem. *)
Lemma aligned_kc_cells : forall kc, kc mod 4=0 -> 4*(kc/4)=kc.
Proof.
 intros kc Hmod; pose proof (Z.div_mod kc 4 ltac:(lia)); lia.
Qed.

Definition neon_allocation_bounds (a w c kc nc:Z):Prop :=
 4*kc<=18446744073709551615 /\ a+4*kc<=18446744073709551615 /\
 16*nc<=18446744073709551615 /\ c+16*nc<=18446744073709551615 /\
 32*(kc/4+1)*panel_count nc<=18446744073709551615 /\
 w+32*(kc/4+1)*panel_count nc<=18446744073709551615.

Lemma caller_capacity_satisfies_neon_bounds : forall a w c params kc nc,
 machine_capacity a w c params kc nc -> neon_allocation_bounds a w c kc nc.
Proof.
 intros; unfold machine_capacity in H; unfold neon_allocation_bounds.
 replace (32*(kc/4+1)*panel_count nc)
 with (4*(panel_count nc*8*(kc/4+1))) by ring.
 tauto || (repeat split; lia).
Qed.

Lemma packed_cell_count_normalization : forall kc nc,
 panel_count nc*8*(kc/4+1)=8*(kc/4+1)*panel_count nc.
Proof. intros; ring. Qed.

Lemma caller_memory_satisfies_neon_memory : forall a w c kc nc A W,
 kc mod 4=0 ->
 FloatArray.full a (4*(kc/4)) A **
 FloatArray.full w (panel_count nc*8*(kc/4+1)) W **
 FloatArray.undef_full c (4*nc) |--
 FloatArray.full a kc A **
 FloatArray.full w (8*(kc/4+1)*panel_count nc) W **
 FloatArray.undef_full c (4*nc).
Proof.
 intros a w c kc nc A W Hmod.
 rewrite (aligned_kc_cells kc Hmod), packed_cell_count_normalization.
 apply derivable1_refl.
Qed.

Print Assumptions aligned_kc_cells.
Print Assumptions caller_capacity_satisfies_neon_bounds.
Print Assumptions packed_cell_count_normalization.
Print Assumptions caller_memory_satisfies_neon_memory.
