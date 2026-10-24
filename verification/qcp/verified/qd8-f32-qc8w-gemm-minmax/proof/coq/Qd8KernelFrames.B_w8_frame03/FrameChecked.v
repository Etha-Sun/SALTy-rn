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
Lemma proof_of_test_neon_partial_solve_wit_125:neon_full_goal.test_neon_partial_solve_wit_125.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_125,neon_full_goal.test_neon_partial_solve_wit_125_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137:neon_full_goal.test_neon_partial_solve_wit_137.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_137,neon_full_goal.test_neon_partial_solve_wit_137_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_149:neon_full_goal.test_neon_partial_solve_wit_149.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_149,neon_full_goal.test_neon_partial_solve_wit_149_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_161:neon_full_goal.test_neon_partial_solve_wit_161.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_161,neon_full_goal.test_neon_partial_solve_wit_161_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_173:neon_full_goal.test_neon_partial_solve_wit_173.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_173,neon_full_goal.test_neon_partial_solve_wit_173_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_185:neon_full_goal.test_neon_partial_solve_wit_185.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_185,neon_full_goal.test_neon_partial_solve_wit_185_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
Lemma proof_of_test_neon_partial_solve_wit_197:neon_full_goal.test_neon_partial_solve_wit_197.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_197,neon_full_goal.test_neon_partial_solve_wit_197_aux;intros;rewrite ?sizeof_char in *.
 qd8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];first[apply qd8_W_window;unfold panel_bytes;nia|lia].
 - qd8_cancel. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_125.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_137.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_149.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_161.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_173.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_185.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_197.
