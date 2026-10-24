From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QC4Ordinary Require Import ordinary_goal.
From QC4W Require Import NibbleModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: ordinary_goal.VC_Correct.
Lemma proof_of_round_up_po2_safety_wit_1 : ordinary_goal.round_up_po2_safety_wit_1.
Proof. unfold ordinary_goal.round_up_po2_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_round_up_po2_return_wit_1 : ordinary_goal.round_up_po2_return_wit_1.
Proof. unfold ordinary_goal.round_up_po2_return_wit_1;left;intros;subst quantum_pre.
 change (TT && emp |-- “ (Z.land (n_pre+1) (-2)=rounded_depth n_pre) ” && emp).
 rewrite round_up_mask_unbounded;entailer!.
Qed.
Lemma proof_of_qcp_assert_return_wit_1 : ordinary_goal.qcp_assert_return_wit_1.
Proof. unfold ordinary_goal.qcp_assert_return_wit_1;intros;apply derivable1_refl. Qed.
End Checked.
Print Assumptions Checked.proof_of_round_up_po2_safety_wit_1.
Print Assumptions Checked.proof_of_round_up_po2_return_wit_1.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
