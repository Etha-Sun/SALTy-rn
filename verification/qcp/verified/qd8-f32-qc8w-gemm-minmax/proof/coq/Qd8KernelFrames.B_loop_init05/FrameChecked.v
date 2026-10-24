From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
From Qd8Init Require Import KernelInit.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_1:neon_full_goal.test_neon_entail_wit_1.
Proof. unfold neon_full_goal.test_neon_entail_wit_1;left;intros.
 subst mr_pre;assert(Hpan:0<panels nc_pre)by(unfold panels;apply Z.div_str_pos;lia).
 assert(Hlen:0<Zlength Ps)by(unfold domain_shape in *;intuition lia).
 assert(Hmatrix:qd8_matrix_wf kc_pre Ps)by(unfold qd8_matrix_wf;unfold domain_shape in *;tauto).
 rewrite ?Z.sub_diag;replace(0 % 8)with 0 by reflexivity;replace(0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;rewrite ?qd8_init_acc_lane.
 rewrite ?qd8_output_prefix_zero.
 rewrite ?Z.add_0_l,?Z.add_0_r;replace(4+1)with 5 by reflexivity;replace(4+2)with 6 by reflexivity;replace(4+3)with 7 by reflexivity;qd8_frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_1.
