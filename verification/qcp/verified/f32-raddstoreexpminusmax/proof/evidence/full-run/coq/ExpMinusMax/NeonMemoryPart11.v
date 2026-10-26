From Coq Require Import ZArith Lia Ring.
From ExpMinusMax Require Export NeonMemoryPart10.
Local Open Scope Z_scope.
Lemma emm_reduce_acc:forall F P M G,
 em_neon_reduce4(em_arm_acc_record F P M G)=
 em_arm_pair_sum(em_arm_accumulate(Z.to_nat G)(em_input F P)(em_get F M)em_acc_zero 0).
Proof. intros;reflexivity. Qed.
Lemma emm_sum_tail:forall F P M N,0<=N->
 em_arm_sum N(em_input F P)(em_get F M)=
 em_arm_tail(em_neon_reduce4(em_arm_acc_record F P M(Z.quot N 4)))(Z.rem N 4)
 (em_get_float32x4_t(em_neon_expression(em_load_record4 F(P+16*Z.quot N 4))(em_neon_dup(em_get F M)))0)
 (em_get_float32x4_t(em_neon_expression(em_load_record4 F(P+16*Z.quot N 4))(em_neon_dup(em_get F M)))1)
 (em_get_float32x4_t(em_neon_expression(em_load_record4 F(P+16*Z.quot N 4))(em_neon_dup(em_get F M)))2).
Proof.
 intros;rewrite !emm_load_expression by lia.
 rewrite Z.quot_div_nonneg,Z.rem_mod_nonneg by lia.
 unfold em_arm_sum,em_input;rewrite emm_reduce_acc.
 unfold em_input;rewrite Z.add_0_r;reflexivity.
Qed.
Print Assumptions emm_reduce_acc.
Print Assumptions emm_sum_tail.
