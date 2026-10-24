From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import CallerCaps ProgressFacts ControlLoopFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_3;left;intros;rd_limits.
 repeat match goal with H:rd_ptr_gate ?live ?p ?expected |- _=>apply rd_gate_live in H;[|lia]end.
 repeat match goal with H:rd_progress ?rows ?r |- _=>apply rd_progress_live in H;[|lia]end.
 subst;rewrite !rd_done_initial by lia;rewrite !rd_acc16_zero;rewrite ?Z.sub_diag;rd_limits.
 unfold rd_inner_gate;rd_record_caller_cap.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
Lemma proof_of_test_neon_entail_wit_19 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_19.
Proof.
 unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_19;left;intros;rd_limits.
 assert(Hr:0<r)by(destruct(Z.eq_dec r 0);[subst r;rewrite rd_ceil252_zero in *;lia|lia]).
 repeat match goal with H:rd_ptr_gate ?live ?p ?expected |- _=>apply rd_gate_live in H;[|lia]end.
 repeat match goal with H:rd_progress ?rows ?r |- _=>apply rd_progress_live in H;[|lia]end.
 subst;rewrite !rd_done_initial by lia;rewrite !rd_acc16_zero;rewrite ?Z.sub_diag;rd_limits.
 unfold rd_inner_gate;rd_record_caller_cap.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_19.
