From Coq Require Import ZArith Lia.
From Qs8Mul Require Import KernelFacts vl_control_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedVlControl : Qs8Mul.vl_control_goal.VC_Correct.
Lemma proof_of_qm_setvl_positive_return_wit_1 : Qs8Mul.vl_control_goal.qm_setvl_positive_return_wit_1.
Proof.
 unfold Qs8Mul.vl_control_goal.qm_setvl_positive_return_wit_1;left;intros n r Hallowed Hn.
 pose proof(qm_vl_bounds n r Hn Hallowed)as[[Hlo Hhi]Hle].
 unfold derivable1,andp,coq_prop;intros m [_ Hempty];repeat first[assumption|reflexivity|split];lia.
Qed.
Lemma proof_of_qm_setvl_positive_partial_solve_wit_1 : Qs8Mul.vl_control_goal.qm_setvl_positive_partial_solve_wit_1.
Proof. unfold Qs8Mul.vl_control_goal.qm_setvl_positive_partial_solve_wit_1;intros;entailer!. Qed.
End CheckedVlControl.
Print Assumptions CheckedVlControl.proof_of_qm_setvl_positive_return_wit_1.
Print Assumptions CheckedVlControl.proof_of_qm_setvl_positive_partial_solve_wit_1.
