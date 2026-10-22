Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeon Require Import NeonBridge neon_bridge_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonBridge : neon_bridge_Strategy_Correct.
Lemma neon_bridge_strategy1_correctness : neon_bridge_strategy1.
Proof.
  pre_process_default; subst q; unfold fp32_slice.
  prop_apply (FloatArray.full_Zlength p n l). Intros_p Hlen.
  sep_apply_l_atomic (float_full_open4 p n l fp32_zero).
  - dump_pre_spatial. lia.
  - cancel (FloatArray.seg p 4 n (sublist 4 n l)).
    Intros_r x2 x0 x1 __default_fp32 x3.
    apply_sepcon_adjoint. Intros. subst. rename x0 into __default_fp32.
    rewrite (Znth_indep l 0 fp32_zero __default_fp32) by lia.
    rewrite (Znth_indep l 1 fp32_zero __default_fp32) by lia.
    rewrite (Znth_indep l 2 fp32_zero __default_fp32) by lia.
    rewrite (Znth_indep l 3 fp32_zero __default_fp32) by lia.
    cancel.
Qed.
Lemma neon_bridge_strategy2_correctness : neon_bridge_strategy2.
Proof. pre_process_default; subst q; unfold UndefStructPredfloat32x4_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
Lemma neon_bridge_strategy3_correctness : neon_bridge_strategy3.
Proof.
  pre_process_default; subst q.
  sep_apply_l_atomic (float_undef_open4 p n).
  - dump_pre_spatial. lia.
  - cancel (FloatArray.undef_seg p 4 n). apply_sepcon_adjoint. entailer!.
Qed.
Lemma neon_bridge_strategy4_correctness : neon_bridge_strategy4.
Proof.
  pre_process_default; subst q; unfold UndefStructPredfloat32x2_t.
  entailer!; apply_sepcon_adjoint; entailer!.
Qed.
End CheckedNeonBridge.
Include CheckedNeonBridge.
Print Assumptions CheckedNeonBridge.neon_bridge_strategy1_correctness.
Print Assumptions CheckedNeonBridge.neon_bridge_strategy2_correctness.
Print Assumptions CheckedNeonBridge.neon_bridge_strategy3_correctness.
Print Assumptions CheckedNeonBridge.neon_bridge_strategy4_correctness.
