From Coq Require Import ZArith Lia Ring.
From ExpMinusMax Require Export NeonExpressionFacts ProgramMemoryFacts.
Local Open Scope Z_scope.
Lemma emm_load_expression:forall F P M G j,0<=j<4->
 em_get_float32x4_t(em_neon_expression(em_load_record4 F(P+16*G))(em_neon_dup(em_get F M)))j=
 em_arm_value(em_get F(P+4*(4*G+j)))(em_get F M).
Proof.
 intros;rewrite em_neon_expression_lane by exact H.
 unfold em_load_record4,em_neon_dup.
 rewrite !em_get_make_float32x4_t by exact H.
 replace(P+16*G+4*j)with(P+4*(4*G+j))by ring;reflexivity.
Qed.
Lemma emm_acc_last:forall g get m a k,
 em_arm_accumulate(S g)get m a k=
 em_arm_acc_step(em_arm_accumulate g get m a k)
 (em_arm_value(get(k+4*Z.of_nat g))m)
 (em_arm_value(get(k+4*Z.of_nat g+1))m)
 (em_arm_value(get(k+4*Z.of_nat g+2))m)
 (em_arm_value(get(k+4*Z.of_nat g+3))m).
Proof.
 induction g;intros get m a k.
 - cbn[em_arm_accumulate];replace(k+4*Z.of_nat 0)with k by ring;reflexivity.
 - change(em_arm_accumulate(S g)get m
    (em_arm_acc_step a(em_arm_value(get k)m)(em_arm_value(get(k+1))m)
      (em_arm_value(get(k+2))m)(em_arm_value(get(k+3))m))(k+4)=
    em_arm_acc_step(em_arm_accumulate(S g)get m a k)
    (em_arm_value(get(k+4*Z.of_nat(S g)))m)
    (em_arm_value(get(k+4*Z.of_nat(S g)+1))m)
    (em_arm_value(get(k+4*Z.of_nat(S g)+2))m)
    (em_arm_value(get(k+4*Z.of_nat(S g)+3))m)).
   rewrite (IHg get m(em_arm_acc_step a(em_arm_value(get k)m)
    (em_arm_value(get(k+1))m)(em_arm_value(get(k+2))m)(em_arm_value(get(k+3))m))(k+4)).
   cbn[em_arm_accumulate].
   rewrite Nat2Z.inj_succ.
   replace(k+4+4*Z.of_nat g)with(k+4*Z.succ(Z.of_nat g))by lia.
   reflexivity.
Qed.
Lemma emm_acc_record_step:forall F P M G,0<=G->
 em_neon_add(em_arm_acc_record F P M G)
 (em_neon_expression(em_load_record4 F(P+16*G))(em_neon_dup(em_get F M)))=
 em_arm_acc_record F P M(G+1).
Proof.
 intros F P M G HG;unfold em_arm_acc_record.
 rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r.
 rewrite emm_acc_last,Z2Nat.id by lia.
 unfold em_neon_add,em_acc_record,em_arm_acc_step,em_make_float32x4_t.
 rewrite !emm_load_expression by lia.
 cbn[em_get_float32x4_t];unfold em_input.
 replace(P+4*(4*G+0))with(P+4*(0+4*G))by ring.
 reflexivity.
Qed.
Print Assumptions emm_load_expression.
Print Assumptions emm_acc_last.
Print Assumptions emm_acc_record_step.
