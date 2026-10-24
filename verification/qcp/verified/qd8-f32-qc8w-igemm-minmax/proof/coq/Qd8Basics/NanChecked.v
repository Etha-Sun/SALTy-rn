From Coq Require Import ZArith Bool Lia.
From Qd8Nan Require Import abi_probe_goal.
From Qd8RvvMath Require Import RvvMath.
From Qd8API Require Import copy_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: abi_probe_goal.VC_Correct.
Include copy_strategy_proof.Checked.
Lemma proof_of_qcp_qd8_identity_return_wit_1:qcp_qd8_identity_return_wit_1.
Proof. unfold qcp_qd8_identity_return_wit_1;left;intros;unfold qd8_bit_same;entailer!. Qed.
Lemma proof_of_qcp_qd8_isnan_return_wit_1:qcp_qd8_isnan_return_wit_1.
Proof. unfold qcp_qd8_isnan_return_wit_1;left;intros.
 unfold qd8_bit_same in PreH2;subst retval.
 apply qd8_self_eq_nan_false in PreH1;unfold qd8_nan_flag;rewrite PreH1;entailer!.
Qed.
Lemma proof_of_qcp_qd8_isnan_return_wit_2:qcp_qd8_isnan_return_wit_2.
Proof. unfold qcp_qd8_isnan_return_wit_2;left;intros.
 unfold qd8_bit_same in PreH2;subst retval.
 apply qd8_self_ne_nan_true in PreH1;unfold qd8_nan_flag;rewrite PreH1;entailer!.
Qed.
Lemma proof_of_qcp_qd8_isnan_partial_solve_wit_1:qcp_qd8_isnan_partial_solve_wit_1.
Proof. unfold qcp_qd8_isnan_partial_solve_wit_1;reflexivity. Qed.
Ltac bounds_cases lo_pre hi_pre :=
 unfold qd8_nan_flag,qd8_bounds_flag in *;
 destruct (Binary.is_nan 24 128 lo_pre);
 destruct (Binary.is_nan 24 128 hi_pre);cbn in *;try contradiction;try discriminate;entailer!.
Lemma proof_of_bounds_probe_return_wit_1:bounds_probe_return_wit_1.
Proof. unfold bounds_probe_return_wit_1;left;intros;subst retval;bounds_cases lo_pre hi_pre. Qed.
Lemma proof_of_bounds_probe_return_wit_2:bounds_probe_return_wit_2.
Proof. unfold bounds_probe_return_wit_2;left;intros;subst retval retval_2;bounds_cases lo_pre hi_pre. Qed.
Lemma proof_of_bounds_probe_return_wit_3:bounds_probe_return_wit_3.
Proof. unfold bounds_probe_return_wit_3;left;intros;subst retval retval_2;bounds_cases lo_pre hi_pre. Qed.
Lemma proof_of_bounds_probe_partial_solve_wit_1:bounds_probe_partial_solve_wit_1.
Proof. unfold bounds_probe_partial_solve_wit_1;reflexivity. Qed.
Lemma proof_of_bounds_probe_partial_solve_wit_2:bounds_probe_partial_solve_wit_2.
Proof. unfold bounds_probe_partial_solve_wit_2;intros;entailer!. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_qd8_isnan_return_wit_1.
Print Assumptions Checked.proof_of_qcp_qd8_isnan_return_wit_2.
