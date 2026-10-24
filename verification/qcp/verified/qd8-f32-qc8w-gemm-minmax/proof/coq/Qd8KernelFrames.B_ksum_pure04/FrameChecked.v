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
Lemma proof_of_test_neon_partial_solve_wit_10_pure:neon_full_goal.test_neon_partial_solve_wit_10_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_10_pure;left;intros.
 assert(Hpan:0<panels nc_pre)by(unfold panels;apply Z.div_str_pos;lia).
 unfold domain_shape,qd8_matrix_wf in *;unfold derivable1,andp,coq_prop;intros.
 rewrite ?Z.sub_diag;replace (0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_int;intuition lia. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12_pure:neon_full_goal.test_neon_partial_solve_wit_12_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_12_pure;left;intros.
 assert(Hpan:0<panels nc_pre)by(unfold panels;apply Z.div_str_pos;lia).
 unfold domain_shape,qd8_matrix_wf in *;unfold derivable1,andp,coq_prop;intros.
 rewrite ?Z.sub_diag;replace (0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_int;intuition lia. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_10_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_12_pure.
