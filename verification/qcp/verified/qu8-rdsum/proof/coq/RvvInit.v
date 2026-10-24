From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import CallerCaps NeonInit NeonInitFacts RvvLoopFacts LoopZero rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_2;left;intros;rd_limits.
 subst input output input_increment retval.
 assert(Hvl:0<rd_vl channels /\rd_vl channels<=channels)by(apply rd_vl_active;lia).
 rewrite Z.sub_diag;rewrite !rd_acc32_zero,!rd_splat_zero.
 unfold rd_progress,rd_mod252,rd_ptr_gate.
 rd_initial_pointers(channels_pre-channels);entailer!;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_3;left;intros;rd_limits.
 repeat match goal with H:rd_ptr_gate ?live ?p ?expected |- _=>apply rd_gate_live in H;[|lia]end.
 repeat match goal with H:rd_progress ?rows ?r |- _=>apply rd_progress_live in H;[|lia]end.
 subst;rexists r;pose proof(rd_min252_range r ltac:(lia))as Hbatch;assert(Hpositive:0<rd_min252 r)by(unfold rd_min252;apply Z.min_glb_lt;lia);rewrite unsigned_last_nbits_eq by(change(0<=r-rd_min252 r<18446744073709551616);lia);rewrite !rd_done_initial by lia;rewrite !rd_acc16_zero,!rd_splat_zero.
 rewrite ?Z.sub_diag;rd_limits;unfold rd_inner_gate;rd_record_caller_cap.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2.
Print Assumptions proof_of_test_rvv_entail_wit_3.
