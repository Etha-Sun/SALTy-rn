From Coq Require Import ZArith Lia List Ring.
From ExpMinusMax Require Export NeonMemoryPart11 NeonTailFootprintFacts Frame MemoryInterface.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma emm_open_sum:forall F W P M Q S N O,
 em_valid F W P M Q S N->em_output W O|--
 S # Float |->_ ** em_output(em_removed W S)O.
Proof.
 intros F W P M Q S N O H;unfold em_valid in H.
 assert(Hnd:NoDup W)by tauto;assert(Hs:In S W)by tauto.
 unfold em_output,em_removed.
 eapply derivable1_trans;[exact(proj1(em_cells_pop fp32 em_output_cell W O S Hnd Hs))|].
 sep_apply(em_output_forget_cell S(O S));entailer!.
Qed.
Lemma emm_prefix_zero:forall F P M Q O,em_arm_output_prefix F P M Q 0 O=O.
Proof. reflexivity. Qed.
Lemma emm_low0:forall V,em_get_float32x2_t(em_neon_low V)0=em_get_float32x4_t V 0.
Proof. reflexivity. Qed.
Lemma emm_high0:forall V,em_get_float32x2_t(em_neon_high V)0=em_get_float32x4_t V 2.
Proof. reflexivity. Qed.
Lemma emm_reduce_low:forall V,em_neon_reduce2(em_neon_low V)=em_arm_add(em_get_float32x4_t V 0)(em_get_float32x4_t V 1).
Proof. reflexivity. Qed.
Print Assumptions emm_open_sum.
Print Assumptions emm_prefix_zero.
Print Assumptions emm_low0.
Print Assumptions emm_high0.
Print Assumptions emm_reduce_low.
