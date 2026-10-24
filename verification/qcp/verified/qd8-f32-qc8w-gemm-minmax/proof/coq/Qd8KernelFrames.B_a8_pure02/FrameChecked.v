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
Lemma proof_of_test_neon_partial_solve_wit_20_pure:neon_full_goal.test_neon_partial_solve_wit_20_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_20_pure;left;intros.
 rewrite ?sizeof_char in *.
 assert(Hd:0<=kc_pre-k<kc_pre)by lia.
 assert(Hr:Z.rem(kc_pre-k)8=0)by assumption.
 pose proof(qd8_aligned_last_window kc_pre (kc_pre-k) Hd Hr)as Hcap.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_A_window;lia]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_121_pure:neon_full_goal.test_neon_partial_solve_wit_121_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_121_pure;left;intros.
 rewrite ?sizeof_char in *.
 assert(Hd:0<=kc_pre-k<kc_pre)by lia.
 assert(Hr:Z.rem(kc_pre-k)8=0)by assumption.
 pose proof(qd8_aligned_last_window kc_pre (kc_pre-k) Hd Hr)as Hcap.
 unfold derivable1,andp,coq_prop;intros;repeat apply conj;first[assumption|apply qd8_A_window;lia]. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_20_pure.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_121_pure.
