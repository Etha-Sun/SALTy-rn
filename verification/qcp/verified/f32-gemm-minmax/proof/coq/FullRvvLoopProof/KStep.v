From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain RowValues ActiveVector.
From FullRvvAccMath Require Import AccSteps StepLane.
From GemmRvv Require Import Model FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3 : test_rvv_entail_wit_3.
Proof.
 unfold test_rvv_entail_wit_3;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 subst vl.
 assert(Hd:0<=(kc_pre-k)÷4)by(apply Z.quot_pos;lia).
 assert(Hbase:0<=panel_wbase(kc_pre÷4)((nc_pre-nc)÷8)+8*((kc_pre-k)÷4+1)).
 { unfold panel_wbase;pose proof(Z.quot_pos kc_pre 4 ltac:(lia)ltac:(lia));pose proof(Z.quot_pos(nc_pre-nc)8 ltac:(lia)ltac:(lia));nia. }
 unfold row_acc_values in PreH123,PreH124,PreH125,PreH126.
 unfold active8 in PreH1,PreH2,PreH3,PreH4,PreH16,PreH123,PreH124,PreH125,PreH126.
 decompose [and] PreH1;clear PreH1.
 decompose [and] PreH2;clear PreH2.
 decompose [and] PreH3;clear PreH3.
 decompose [and] PreH4;clear PreH4.
 decompose [and] PreH16;clear PreH16.
 decompose [and] PreH123;clear PreH123.
 decompose [and] PreH124;clear PreH124.
 decompose [and] PreH125;clear PreH125.
 decompose [and] PreH126;clear PreH126.
 assert(Hrow0:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 0)((nc_pre-nc)÷8)((kc_pre-k)÷4+1)(panel_cols nc_pre((nc_pre-nc)÷8)) z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2).
 { unfold row_acc_values,active8;repeat split.
   all:eapply active_lane_fma_step;[exact Hd|exact Hbase|lia|eassumption|eassumption|eassumption]. }
 assert(Hrow1:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 1)((nc_pre-nc)÷8)((kc_pre-k)÷4+1)(panel_cols nc_pre((nc_pre-nc)÷8)) z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3).
 { unfold row_acc_values,active8;repeat split.
   all:eapply active_lane_fma_step;[exact Hd|exact Hbase|lia|eassumption|eassumption|eassumption]. }
 assert(Hrow2:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 2)((nc_pre-nc)÷8)((kc_pre-k)÷4+1)(panel_cols nc_pre((nc_pre-nc)÷8)) z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4).
 { unfold row_acc_values,active8;repeat split.
   all:eapply active_lane_fma_step;[exact Hd|exact Hbase|lia|eassumption|eassumption|eassumption]. }
 assert(Hrow3:row_acc_values A W (kc_pre÷4)(row_alias mr_pre 3)((nc_pre-nc)÷8)((kc_pre-k)÷4+1)(panel_cols nc_pre((nc_pre-nc)÷8)) z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5).
 { unfold row_acc_values,active8;repeat split.
   all:eapply active_lane_fma_step;[exact Hd|exact Hbase|lia|eassumption|eassumption|eassumption]. }
 assert(Hk4:4<=k).
 { pose proof(Z.quot_rem k 4 ltac:(lia))as E;rewrite PreH14 in E;nia. }
 match goal with HCp:machine_capacity _ _ _ _ _ _|-_=>pose proof HCp as Hcapacity end.
 unfold machine_capacity in Hcapacity;decompose [and] Hcapacity.
 assert(Hnowrap:unsigned_last_nbits(k-4)64=k-4)by(apply unsigned_last_nbits_eq;change(0<=k-4<18446744073709551616);nia).
 rewrite Hnowrap.
 assert(Hstep:(kc_pre-(k-4))÷4=(kc_pre-k)÷4+1).
 { replace(kc_pre-(k-4))with((kc_pre-k)+1*4)by ring;rewrite Z.quot_add by nia;ring. }
 rewrite Hstep.
 assert(Hrem:Z.rem(k-4)4=0).
 { rewrite Z.rem_mod_nonneg by lia;rewrite Z.rem_mod_nonneg in PreH14 by lia;rewrite Zminus_mod,PreH14;reflexivity. }
 Exists z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5.
 Exists z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4.
 Exists z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3.
 Exists z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3.
