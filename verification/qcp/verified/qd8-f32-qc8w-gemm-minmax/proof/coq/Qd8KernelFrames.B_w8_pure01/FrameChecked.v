From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
From Qd8Input Require Import KernelInputArith.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_24_pure:neon_full_goal.test_neon_partial_solve_wit_24_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_24_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26_pure:neon_full_goal.test_neon_partial_solve_wit_26_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_26_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28_pure:neon_full_goal.test_neon_partial_solve_wit_28_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_28_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30_pure:neon_full_goal.test_neon_partial_solve_wit_30_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_30_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32_pure:neon_full_goal.test_neon_partial_solve_wit_32_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_32_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34_pure:neon_full_goal.test_neon_partial_solve_wit_34_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_34_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36_pure:neon_full_goal.test_neon_partial_solve_wit_36_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_36_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38_pure:neon_full_goal.test_neon_partial_solve_wit_38_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_38_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_125_pure:neon_full_goal.test_neon_partial_solve_wit_125_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_125_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137_pure:neon_full_goal.test_neon_partial_solve_wit_137_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_137_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_149_pure:neon_full_goal.test_neon_partial_solve_wit_149_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_149_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_161_pure:neon_full_goal.test_neon_partial_solve_wit_161_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_161_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_173_pure:neon_full_goal.test_neon_partial_solve_wit_173_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_173_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_185_pure:neon_full_goal.test_neon_partial_solve_wit_185_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_185_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_197_pure:neon_full_goal.test_neon_partial_solve_wit_197_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_197_pure;left;intros;rewrite ?sizeof_char in *.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_W_window;unfold panel_bytes;nia]. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_24_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_26_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_28_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_30_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_32_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_34_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_36_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_38_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_125_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_137_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_149_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_161_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_173_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_185_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_197_pure.
