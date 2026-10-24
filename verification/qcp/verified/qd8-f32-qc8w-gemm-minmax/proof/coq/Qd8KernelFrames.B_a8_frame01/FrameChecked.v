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
Lemma proof_of_test_neon_partial_solve_wit_20:neon_full_goal.test_neon_partial_solve_wit_20.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_20,neon_full_goal.test_neon_partial_solve_wit_20_aux;intros.
 rewrite ?sizeof_char in *.
 assert(Hd:0<=kc_pre-k<kc_pre)by lia.
 assert(Hr:Z.rem(kc_pre-k)8=0)by assumption.
 pose proof(qd8_aligned_last_window kc_pre (kc_pre-k) Hd Hr)as Hcap.
 assert(Haddr:qd8_i8_address_ok 0 a0 a_pre w_pre kc_pre ((nc_pre-nc)÷8)(kc_pre-k) Ps)by(apply qd8_A_window;lia).
 assert(Haddr2:qd8_i8_address_ok 0 (a_pre+(kc_pre-k)*1) a_pre w_pre kc_pre ((nc_pre-nc)÷8)(kc_pre-k) Ps)by(apply qd8_A_window;lia).
 qd8_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_121:neon_full_goal.test_neon_partial_solve_wit_121.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_121,neon_full_goal.test_neon_partial_solve_wit_121_aux;intros.
 rewrite ?sizeof_char in *.
 assert(Hd:0<=kc_pre-k<kc_pre)by lia.
 assert(Hr:Z.rem(kc_pre-k)8=0)by assumption.
 pose proof(qd8_aligned_last_window kc_pre (kc_pre-k) Hd Hr)as Hcap.
 assert(Haddr:qd8_i8_address_ok 0 a0 a_pre w_pre kc_pre ((nc_pre-nc)÷8)(kc_pre-k) Ps)by(apply qd8_A_window;lia).
 assert(Haddr2:qd8_i8_address_ok 0 (a_pre+(kc_pre-k)*1) a_pre w_pre kc_pre ((nc_pre-nc)÷8)(kc_pre-k) Ps)by(apply qd8_A_window;lia).
 qd8_frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_20.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_121.
