From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import NaNBridge.
From GemmRvv.runs.helper02 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: unit_goal.VC_Correct.
Lemma proof_of_qcp_identity_return_wit_1:qcp_identity_return_wit_1.
Proof. unfold qcp_identity_return_wit_1;left;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
Lemma proof_of_nanbranch_safety_wit_1:nanbranch_safety_wit_1.
Proof. unfold nanbranch_safety_wit_1;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
Lemma proof_of_nanbranch_safety_wit_2:nanbranch_safety_wit_2.
Proof. unfold nanbranch_safety_wit_2;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
Lemma proof_of_nanbranch_return_wit_1:nanbranch_return_wit_1.
Proof. unfold nanbranch_return_wit_1;left;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
Lemma proof_of_nanbranch_return_wit_2:nanbranch_return_wit_2.
Proof. unfold nanbranch_return_wit_2;left;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
Lemma proof_of_nanbranch_partial_solve_wit_1:nanbranch_partial_solve_wit_1.
Proof. unfold nanbranch_partial_solve_wit_1;pre_process;unfold bit_same,nan_branch_observation in *;subst;entailer!;auto. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_identity_return_wit_1.
Print Assumptions Checked.proof_of_nanbranch_safety_wit_1.
Print Assumptions Checked.proof_of_nanbranch_safety_wit_2.
Print Assumptions Checked.proof_of_nanbranch_return_wit_1.
Print Assumptions Checked.proof_of_nanbranch_return_wit_2.
Print Assumptions Checked.proof_of_nanbranch_partial_solve_wit_1.
