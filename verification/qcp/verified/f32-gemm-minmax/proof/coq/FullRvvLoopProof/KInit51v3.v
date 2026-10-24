From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain RowValues ActiveVector.
From FullRvvAccMath Require Import AccSteps BiasInit.
From GemmRvv Require Import Model FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_5_1 : test_rvv_entail_wit_5_1.
Proof.
 unfold test_rvv_entail_wit_5_1;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 match goal with HP:outer_cursor_state _ _ _ _ _ _ _ _ _ _ _ _ _ _|-_ =>unfold outer_cursor_state in HP;destruct HP as[Hz|Hp];[lia|];decompose [and] Hp;clear Hp end.
 assert(HKq:kc_pre÷4=kc_pre/4)by(apply Z.quot_div_nonneg;lia);rewrite <-HKq in *.
 assert(Hpc:panel_count(nc_pre-nc)=(nc_pre-nc)÷8).
 { unfold panel_count;pose proof(Z.quot_rem(nc_pre-nc)8 ltac:(lia))as E;rewrite PreH3 in E;symmetry;apply Z.div_unique with(r:=7);lia. }
 rewrite Hpc in *.
 rewrite !Z.sub_diag in *;rewrite !Z.quot_0_l in * by lia.
 assert(Hbase:0<=panel_wbase(kc_pre÷4)((nc_pre-nc)÷8)).
 { unfold panel_wbase;pose proof(Z.quot_pos kc_pre 4 ltac:(lia)ltac:(lia));pose proof(Z.quot_pos(nc_pre-nc)8 ltac:(lia)ltac:(lia));nia. }
 assert(Hrow0:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 0) ((nc_pre-nc)÷8) 0 (panel_cols nc_pre ((nc_pre-nc)÷8)) z0 z1 z2 z3 z4 z5 z6 z7)by(eapply row_acc_from_bias;[exact Hbase|lia|assumption]).
 assert(Hrow1:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 1) ((nc_pre-nc)÷8) 0 (panel_cols nc_pre ((nc_pre-nc)÷8)) z0 z1 z2 z3 z4 z5 z6 z7)by(eapply row_acc_from_bias;[exact Hbase|lia|assumption]).
 assert(Hrow2:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 2) ((nc_pre-nc)÷8) 0 (panel_cols nc_pre ((nc_pre-nc)÷8)) z0 z1 z2 z3 z4 z5 z6 z7)by(eapply row_acc_from_bias;[exact Hbase|lia|assumption]).
 assert(Hrow3:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 3) ((nc_pre-nc)÷8) 0 (panel_cols nc_pre ((nc_pre-nc)÷8)) z0 z1 z2 z3 z4 z5 z6 z7)by(eapply row_acc_from_bias;[exact Hbase|lia|assumption]).
 Exists z0 z1 z2 z3 z4 z5 z6 z7.
 Exists z0 z1 z2 z3 z4 z5 z6 z7.
 Exists z0 z1 z2 z3 z4 z5 z6 z7.
 Exists z0 z1 z2 z3 z4 z5 z6 z7.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];try lia.
   all: unfold panel_wbase in *;nia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_5_1.
