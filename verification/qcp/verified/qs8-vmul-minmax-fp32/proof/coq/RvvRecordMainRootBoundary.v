From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import KernelFacts FastFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_values qm_lane qm_rvv_at qm_arm_mul qm_arm_add.
Ltac qm_rr_intro:=lazymatch goal with|-?P|--?Q=>idtac| |-forall _,_=>intro;qm_rr_intro end.
Lemma proof_of_test_rvv_entail_wit_1:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_1;right;qm_rr_intro.
 rewrite Z.sub_diag;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size];entailer!;
 first[apply Z.mod_1_r|apply Z.rem_1_r|unfold qm_values;reflexivity].
Qed.
Lemma proof_of_test_rvv_entail_wit_2:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_2;right;qm_rr_intro.
 rewrite Z.sub_diag;entailer!.
Qed.
Lemma proof_of_test_rvv_return_wit_1:Qs8Mul.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_return_wit_1;right;qm_rr_intro.
 assert(batch=0)by lia;subst batch;rewrite Z.sub_0_r;entailer!.
Qed.
Lemma proof_of_test_rvv_return_wit_2:Qs8Mul.rvv_unit_goal.test_rvv_return_wit_2.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_return_wit_2;right;qm_rr_intro.
 subst batch;rewrite Z.sub_0_r;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
Print Assumptions proof_of_test_rvv_entail_wit_2.
Print Assumptions proof_of_test_rvv_return_wit_1.
Print Assumptions proof_of_test_rvv_return_wit_2.
Module RootBoundarySecond.
 Definition exact_init1:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_1:=proof_of_test_rvv_entail_wit_1.
 Definition exact_init2:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_2:=proof_of_test_rvv_entail_wit_2.
 Definition exact_return1:Qs8Mul.rvv_unit_goal.test_rvv_return_wit_1:=proof_of_test_rvv_return_wit_1.
 Definition exact_return2:Qs8Mul.rvv_unit_goal.test_rvv_return_wit_2:=proof_of_test_rvv_return_wit_2.
End RootBoundarySecond.
