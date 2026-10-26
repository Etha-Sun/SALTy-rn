From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport NeonKernelMemoryFinishSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_1.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_1;apb_intro.
 match goal with H:app_arguments _ _ _ _ _ _ _ _ _ _ _ _|-_=>unfold app_arguments in H;
 repeat match type of H with _ /\ _=>let HA:=fresh in destruct H as[HA H]end end.
 match goal with H:app_valid ?F ?P ?W ?WI ?D|-_=>
 pose proof(app_valid_positive F P W WI D H)as[HP[HK HC]]end.
 apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
