From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain.
From FullRvvLoopProof Require Import AddressFacts.
From GemmRvv Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1_3 : test_rvv_entail_wit_1_3.
Proof.
 unfold test_rvv_entail_wit_1_3;left;intros.
 assert(mr_pre=3)by lia;subst mr_pre.
 subst a_stride_pre cm_stride_pre cn_stride_pre.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 prop_apply(full_nonnegative a_pre (4*(kc_pre÷4)) A ltac:(pose proof(Z.quot_rem kc_pre 4 ltac:(lia));nia));Intros_p HA.
 prop_apply(output_initial_nonnegative c_pre 3 nc_pre (kc_pre÷4) A W lo hi ltac:(lia) ltac:(lia));Intros_p HC.
 match goal with HCp:machine_capacity _ _ _ _ _ _|-_=>pose proof HCp as Hcapacity end;unfold machine_capacity in Hcapacity;decompose [and] Hcapacity.
 repeat multimatch goal with |-context[unsigned_last_nbits ?x 64]=>rewrite(unsigned_last_nbits_eq x 64)by(replace(2^64)with 18446744073709551616 by reflexivity;nia)end.
 rewrite !Z.sub_diag.
 pose proof(Z.quot_rem kc_pre 4 ltac:(lia))as Q.
 match goal with HR:Z.rem kc_pre 4=0|-_=>rewrite HR in Q end.
 split_pure_spatial.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];try lia.
   all: replace(row_alias 3 0)with 0 by reflexivity.
   all: replace(row_alias 3 1)with 1 by reflexivity.
   all: replace(row_alias 3 2)with 2 by reflexivity.
   all: replace(row_alias 3 3)with 2 by reflexivity.
   all: rewrite ?Z.mul_0_l,?Z.mul_1_l,?Z.add_0_l,?Z.add_0_r;nia.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1_3.
