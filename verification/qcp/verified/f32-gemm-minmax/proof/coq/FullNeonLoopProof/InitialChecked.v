From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullModel.
From GemmNeon Require Import CopyFacts.
From SimpleC.SL Require Import SeparationLogic.
From LeaderAutomation Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma panel_count_tail : forall n r, 0<r<8 -> r<=n -> Z.rem (n-r) 8=0 -> panel_count n=Z.quot(n-r)8+1.
Proof.
 intros n r Hr Hnr Hrem.
 pose proof(Z.quot_rem(n-r)8 ltac:(lia)) as Q.
 rewrite Hrem in Q.
 pose proof(Z.quot_pos(n-r)8 ltac:(lia) ltac:(lia)) as Hq.
 unfold panel_count.
 symmetry;apply Z.div_unique with (r:=r-1);lia.
Qed.
Lemma row_alias_one : forall r,0<=r ->row_alias 1 r=0.
Proof. intros;unfold row_alias;apply Z.min_r;lia. Qed.
Module InitialChecked.
Lemma proof_of_test_neon_entail_wit_1_1 : test_neon_entail_wit_1_1.
Proof.
 unfold test_neon_entail_wit_1_1; left; intros.
 assert(mr_pre=1)by lia; subst mr_pre.
 subst a_stride_pre cm_stride_pre cn_stride_pre.
 rewrite !Z.sub_diag.
 cbn [panel_count fulln_outer_ptrs row_alias Z.min Z.compare Pos.compare Pos.compare_cont
 sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop; intros;
   repeat first [assumption|split|reflexivity|right]; try lia.
   all: rewrite ?row_alias_one by lia.
   all: replace (panel_count 0) with 0 by reflexivity.
   all: rewrite ?Z.sub_diag; try reflexivity; try ring.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Lemma proof_of_test_neon_entail_wit_9_2 : test_neon_entail_wit_9_2.
Proof.
 unfold test_neon_entail_wit_9_2;left;intros.
 assert(Hpanel:panel_count nc_pre=(nc_pre-nc)÷8+1)by(apply panel_count_tail;lia).
 rewrite !Z.sub_0_r,Hpanel.
 replace (nc_pre-nc+nc) with nc_pre by lia.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;
   repeat first [assumption|split|reflexivity|unfold fulln_outer_ptrs;left];lia.
 - apply derivable1_refl.
Qed.
End InitialChecked.
Print Assumptions panel_count_tail.
Print Assumptions InitialChecked.proof_of_test_neon_entail_wit_1_1.
Print Assumptions InitialChecked.proof_of_test_neon_entail_wit_9_2.
