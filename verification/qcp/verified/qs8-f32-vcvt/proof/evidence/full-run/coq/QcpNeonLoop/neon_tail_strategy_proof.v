Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import NeonLoopBridge neon_tail_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonTail : neon_tail_Strategy_Correct.
Lemma neon_tail_strategy1_correctness : neon_tail_strategy1.
Proof.
 pre_process_default; subst q.
 sep_apply_l_atomic (float_undef_open2 p n).
 - dump_pre_spatial. lia.
 - cancel (FloatArray.undef_seg p 2 n). apply_sepcon_adjoint. entailer!.
Qed.
Lemma neon_tail_strategy2_correctness : neon_tail_strategy2.
Proof.
 pre_process_default; subst q.
 sep_apply_l_atomic (float_undef_open1 p n).
 - dump_pre_spatial. lia.
 - replace (p+0*sizeof(FLOAT)) with p by lia.
   cancel (FloatArray.undef_seg p 1 n). apply_sepcon_adjoint. entailer!.
Qed.
Lemma neon_tail_strategy3_correctness : neon_tail_strategy3.
Proof.
 pre_process_default; subst q.
 sep_apply_l_atomic (FloatArray.undef_seg_unfold p lo hi).
 - dump_pre_spatial. lia.
 - unfold StoreFloatAsElement.undefstoreA.
   cancel (FloatArray.undef_seg p (lo+1) hi). apply_sepcon_adjoint. entailer!.
Qed.
End CheckedNeonTail.
Include CheckedNeonTail.
Print Assumptions CheckedNeonTail.neon_tail_strategy1_correctness.
Print Assumptions CheckedNeonTail.neon_tail_strategy2_correctness.
Print Assumptions CheckedNeonTail.neon_tail_strategy3_correctness.
