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
Lemma proof_of_test_neon_partial_solve_wit_24:neon_full_goal.test_neon_partial_solve_wit_24.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_24,neon_full_goal.test_neon_partial_solve_wit_24_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26:neon_full_goal.test_neon_partial_solve_wit_26.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_26,neon_full_goal.test_neon_partial_solve_wit_26_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28:neon_full_goal.test_neon_partial_solve_wit_28.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_28,neon_full_goal.test_neon_partial_solve_wit_28_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30:neon_full_goal.test_neon_partial_solve_wit_30.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_30,neon_full_goal.test_neon_partial_solve_wit_30_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32:neon_full_goal.test_neon_partial_solve_wit_32.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_32,neon_full_goal.test_neon_partial_solve_wit_32_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34:neon_full_goal.test_neon_partial_solve_wit_34.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_34,neon_full_goal.test_neon_partial_solve_wit_34_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36:neon_full_goal.test_neon_partial_solve_wit_36.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_36,neon_full_goal.test_neon_partial_solve_wit_36_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38:neon_full_goal.test_neon_partial_solve_wit_38.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_38,neon_full_goal.test_neon_partial_solve_wit_38_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_24.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_26.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_28.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_30.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_32.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_34.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_36.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_38.
