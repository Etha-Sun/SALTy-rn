From X32Transpose Require Import NeonAutomation ProgressFacts.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac xt_steps_pure :=unfold derivable1,andp,coq_prop;intros;
 repeat first[solve[assumption|reflexivity|lia]|split].
Module CheckedNeonMemoryStepsEntry.
Lemma proof_of_test_neon_entail_wit_3_1:X32Transpose.neon_unit_goal.test_neon_entail_wit_3_1.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_3_1;right;intros.
 assert(Hpositive:0<block_width).
 { unfold xt_doz in PreH23;destruct(Z.ltb_spec k_2(xt_cols G));lia. }
 assert(Hk:k_2<xt_cols G).
 { unfold xt_doz in PreH23;destruct(Z.ltb_spec k_2(xt_cols G));lia. }
 pose proof(xt_progress_row_entry F G old R_2 k_2(xt_neon_batch block_width)PreH28)as Hp.
 assert(Hsecond:xt_neon_second k_2 block_width=k_2).
 { unfold xt_neon_second;destruct(Z.ltb_spec block_width 2);lia. }
 Exists k_2;rewrite<-PreH23;rewrite Z.sub_diag,Hsecond;cbn.
 xt_steps_pure.
Qed.
Lemma proof_of_test_neon_entail_wit_3_2:X32Transpose.neon_unit_goal.test_neon_entail_wit_3_2.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_3_2;right;intros.
 assert(Hk:k_2<xt_cols G).
 { unfold xt_doz in PreH23;destruct(Z.ltb_spec k_2(xt_cols G));lia. }
 pose proof(xt_progress_row_entry F G old R_2 k_2(xt_neon_batch block_width)PreH28)as Hp.
 assert(Hsecond:xt_neon_second k_2 block_width=k_2+1).
 { unfold xt_neon_second;destruct(Z.ltb_spec block_width 2);lia. }
 unfold xt_neon_next in PreH27;destruct PreH27 as[Hbad|Hnext];[lia|].
 Exists k_2;rewrite<-PreH23;rewrite Z.sub_diag,Hsecond;cbn.
 xt_steps_pure.
Qed.
Lemma proof_of_test_neon_entail_wit_5_2:X32Transpose.neon_unit_goal.test_neon_entail_wit_5_2.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_5_2;right;intros.
 assert(bh=1)by lia;subst bh;cbn in PreH34;discriminate.
Qed.
Lemma proof_of_test_neon_entail_wit_5_3:X32Transpose.neon_unit_goal.test_neon_entail_wit_5_3.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_5_3;right;intros;subst bh;rewrite !Z.sub_0_r in *.
 Exists k_2;rewrite<-PreH23;rewrite<-PreH8;xt_steps_pure.
Qed.
End CheckedNeonMemoryStepsEntry.
Print Assumptions CheckedNeonMemoryStepsEntry.proof_of_test_neon_entail_wit_3_1.
Print Assumptions CheckedNeonMemoryStepsEntry.proof_of_test_neon_entail_wit_3_2.
Print Assumptions CheckedNeonMemoryStepsEntry.proof_of_test_neon_entail_wit_5_2.
Print Assumptions CheckedNeonMemoryStepsEntry.proof_of_test_neon_entail_wit_5_3.
