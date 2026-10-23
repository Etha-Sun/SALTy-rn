From Coq Require Import ZArith Lia.
From GemmSpec Require Import IntrinsicModel.
From FullDomainRvv Require Import FullState.
Local Open Scope Z_scope.

Lemma panel_coordinates : forall b j, 0<=j<8 ->
 (8*b+j)/8=b /\ (8*b+j) mod 8=j.
Proof.
 intros b j Hj; replace (8*b+j) with (j+b*8) by ring.
 rewrite Z.div_add, Z.mod_add by lia.
 rewrite Z.div_small, Z.mod_small by lia; lia.
Qed.

Lemma full_cell_at_panel : forall A W k row b j lo hi,
 0<=j<8 ->
 full_cell A W k row (8*b+j) lo hi =
 neon_clamp (full_acc A W k row b j k) lo hi.
Proof.
 intros; unfold full_cell; destruct (panel_coordinates b j H) as [Hdiv Hmod].
 rewrite Hdiv,Hmod; reflexivity.
Qed.

Lemma full_cell_at_aligned_offset : forall A W k row done j lo hi,
 done mod 8=0 -> 0<=j<8 ->
 full_cell A W k row (done+j) lo hi =
 neon_clamp (full_acc A W k row (done/8) j k) lo hi.
Proof.
 intros A W k row done j lo hi Hmod Hj.
 pose proof (Z.div_mod done 8 ltac:(lia)).
 replace (done+j) with (8*(done/8)+j) by lia.
 apply full_cell_at_panel; exact Hj.
Qed.

Print Assumptions panel_coordinates.
Print Assumptions full_cell_at_panel.
Print Assumptions full_cell_at_aligned_offset.
