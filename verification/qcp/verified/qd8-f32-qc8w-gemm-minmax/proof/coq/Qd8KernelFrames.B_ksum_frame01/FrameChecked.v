From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_10:neon_full_goal.test_neon_partial_solve_wit_10.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_10,neon_full_goal.test_neon_partial_solve_wit_10_aux;intros.
 assert(Hpan:0<panels nc_pre)by(unfold panels;apply Z.div_str_pos;lia).
 assert(Hlen:0<Zlength Ps)by(unfold domain_shape in *;intuition lia).
 assert(Hmatrix:qd8_matrix_wf kc_pre Ps)by(unfold qd8_matrix_wf;unfold domain_shape in *;tauto).
 rewrite ?Z.sub_diag;replace (0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_int;qd8_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12:neon_full_goal.test_neon_partial_solve_wit_12.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_12,neon_full_goal.test_neon_partial_solve_wit_12_aux;intros.
 assert(Hpan:0<panels nc_pre)by(unfold panels;apply Z.div_str_pos;lia).
 assert(Hlen:0<Zlength Ps)by(unfold domain_shape in *;intuition lia).
 assert(Hmatrix:qd8_matrix_wf kc_pre Ps)by(unfold qd8_matrix_wf;unfold domain_shape in *;tauto).
 rewrite ?Z.sub_diag;replace (0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_int;qd8_frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_10.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_12.
