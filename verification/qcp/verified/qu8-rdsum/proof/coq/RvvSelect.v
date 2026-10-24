From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import CallerCaps SelectFacts ProgressFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_4_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_4_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_4_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 1) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_4_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_4_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_4_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 1) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_5_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_5_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_5_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 2) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_5_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_5_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_5_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 2) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_6_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_6_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_6_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 3) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_6_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_6_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_6_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 3) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_7_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_7_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_7_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 4) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_7_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_7_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_7_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 4) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_8_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_8_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_8_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 5) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_8_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_8_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_8_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 5) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_9_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_9_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_9_1;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_zero current_batch 6) by lia;rd_record_caller_cap. Qed.
Lemma proof_of_test_rvv_entail_wit_9_2 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_9_2.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_9_2;try left;intros;rd_limits;
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rexists orig_r_2;rewrite (rd_select_live current_batch 6) by lia;rd_record_caller_cap. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_1.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.
Print Assumptions proof_of_test_rvv_entail_wit_5_1.
Print Assumptions proof_of_test_rvv_entail_wit_5_2.
Print Assumptions proof_of_test_rvv_entail_wit_6_1.
Print Assumptions proof_of_test_rvv_entail_wit_6_2.
Print Assumptions proof_of_test_rvv_entail_wit_7_1.
Print Assumptions proof_of_test_rvv_entail_wit_7_2.
Print Assumptions proof_of_test_rvv_entail_wit_8_1.
Print Assumptions proof_of_test_rvv_entail_wit_8_2.
Print Assumptions proof_of_test_rvv_entail_wit_9_1.
Print Assumptions proof_of_test_rvv_entail_wit_9_2.
