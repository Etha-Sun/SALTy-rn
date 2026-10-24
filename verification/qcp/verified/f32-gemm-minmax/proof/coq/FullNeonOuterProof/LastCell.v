From Coq Require Import ZArith Lia.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullState.
From GemmNeon Require Import KernelModel.
From GemmKernelBridge Require Import ScheduleBridge.
From FullNeonOuterProof Require Import FinishCell.
Local Open Scope Z_scope.
Lemma last_step_clamped : forall A W k row col lo hi,0<k ->
 fp32_neon_max(fp32_neon_min
 (fma_rne(gget(row*k+(k-1))A)(gget(weight_index k col(k-1))W)
 (fulln_acc(k-1)k row col A W))hi)lo =full_cell A W k row col lo hi.
Proof.
 intros A W k row col lo hi Hk.
 pose proof(fulln_acc_step (k-1)k row col A W ltac:(lia))as E.
 replace(k-1+1)with k in E by lia.
 rewrite <-E;apply clamped_acc_cell.
Qed.
Print Assumptions last_step_clamped.
