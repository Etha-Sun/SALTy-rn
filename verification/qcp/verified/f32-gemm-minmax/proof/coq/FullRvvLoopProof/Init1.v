From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState.
From GemmRvv Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1_1 : test_rvv_entail_wit_1_1.
Proof.
 unfold test_rvv_entail_wit_1_1;left;intros.
 assert(mr_pre=1)by lia;subst mr_pre.
 subst a_stride_pre cm_stride_pre cn_stride_pre.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 rewrite !Z.sub_diag.
 pose proof(Z.quot_rem kc_pre 4 ltac:(lia))as Q.
 match goal with HR:Z.rem kc_pre 4=0|-_=>rewrite HR in Q end.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];try lia.
   all: replace(row_alias 1 0)with 0 by reflexivity.
   all: replace(row_alias 1 1)with 0 by reflexivity.
   all: replace(row_alias 1 2)with 0 by reflexivity.
   all: replace(row_alias 1 3)with 0 by reflexivity.
   all: rewrite ?Z.mul_0_l,?Z.mul_1_l,?Z.add_0_l,?Z.add_0_r;nia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1_1.
