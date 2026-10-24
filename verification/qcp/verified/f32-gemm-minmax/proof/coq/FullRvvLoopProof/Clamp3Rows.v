From Coq Require Import ZArith Lia Strings.String.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain RowValues ActiveVector.
From FullRvvAccMath Require Import AccSteps ClampFacts ClampRows.
From GemmPanelCell Require Import PanelCell.
From GemmRvv Require Import Model FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Local Opaque fma_rne full_acc full_cell fp32_min_number fp32_max_number fp32_neon_min fp32_neon_max neon_clamp rvv_merge rvv_nanth.
Ltac rewrite_active_lane :=
 repeat multimatch goal with
 | H:(?i < ?vl -> ?x = ?y) |-context[?x]=>is_var x;progress(rewrite(H ltac:(lia)))
 end.
Lemma proof_of_test_rvv_entail_wit_4_3 : test_rvv_entail_wit_4_3.
Proof.
 unfold test_rvv_entail_wit_4_3;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 assert(k=0)by lia;subst k;rewrite !Z.sub_0_r in *.
 unfold bit_same in *.
 try subst retval.
 try subst retval_2.
 try subst retval_3.
 try subst retval_4.
 try subst retval_5.
 try subst retval_6.
 try subst retval_7.
 try subst retval_8.
 try subst retval_9.
 try subst retval_10.
 assert(Hlo:Binary.is_nan 24 128 lo=false)by(apply fp32_self_eq_not_nan;assumption).
 assert(Hhi:Binary.is_nan 24 128 hi=false)by(apply fp32_self_eq_not_nan;assumption).
 assert(Hrem:Z.modulo(nc_pre-nc)8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 assert(Hdiv:(nc_pre-nc)÷8=(nc_pre-nc)/8)by(apply Z.quot_div_nonneg;lia).
 pose proof(active8_repaired_min vl hi x00 x01 x02 x03 x04 x05 x06 x07 z0 z1 z2 z3 z4 z5 z6 z7 m0 m1 m2 m3 m4 m5 m6 m7 z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 Hhi PreH33 PreH34 PreH31)as Hmin0.
 pose proof(active8_repaired_max vl lo z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z0_9 z1_9 z2_9 z3_9 z4_9 z5_9 z6_9 z7_9 m0_5 m1_5 m2_5 m3_5 m4_5 m5_5 m6_5 m7_5 z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10 Hlo PreH15 PreH16 PreH13)as Hmax0.
 assert(Hrow0:row_result_values A W(kc_pre÷4)(row_alias mr_pre 0)(nc_pre-nc)lo hi vl z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10).
 { eapply(row_result_from_clamp_stages A W(kc_pre÷4)(row_alias mr_pre 0)(nc_pre-nc)lo hi vl x00 x01 x02 x03 x04 x05 x06 x07 z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10);[lia|exact Hrem|exact PreH68|exact Hmin0|exact Hmax0]. }
 pose proof(active8_repaired_min vl hi x10 x11 x12 x13 x14 x15 x16 x17 z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3 m0_2 m1_2 m2_2 m3_2 m4_2 m5_2 m6_2 m7_2 z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 Hhi PreH29 PreH30 PreH27)as Hmin1.
 pose proof(active8_repaired_max vl lo z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 z0_11 z1_11 z2_11 z3_11 z4_11 z5_11 z6_11 z7_11 m0_6 m1_6 m2_6 m3_6 m4_6 m5_6 m6_6 m7_6 z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12 Hlo PreH11 PreH12 PreH9)as Hmax1.
 assert(Hrow1:row_result_values A W(kc_pre÷4)(row_alias mr_pre 1)(nc_pre-nc)lo hi vl z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12).
 { eapply(row_result_from_clamp_stages A W(kc_pre÷4)(row_alias mr_pre 1)(nc_pre-nc)lo hi vl x10 x11 x12 x13 x14 x15 x16 x17 z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12);[lia|exact Hrem|exact PreH69|exact Hmin1|exact Hmax1]. }
 pose proof(active8_repaired_min vl hi x20 x21 x22 x23 x24 x25 x26 x27 z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5 m0_3 m1_3 m2_3 m3_3 m4_3 m5_3 m6_3 m7_3 z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6 Hhi PreH25 PreH26 PreH23)as Hmin2.
 pose proof(active8_repaired_max vl lo z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6 z0_13 z1_13 z2_13 z3_13 z4_13 z5_13 z6_13 z7_13 m0_7 m1_7 m2_7 m3_7 m4_7 m5_7 m6_7 m7_7 z0_14 z1_14 z2_14 z3_14 z4_14 z5_14 z6_14 z7_14 Hlo PreH7 PreH8 PreH5)as Hmax2.
 assert(Hrow2:row_result_values A W(kc_pre÷4)(row_alias mr_pre 2)(nc_pre-nc)lo hi vl z0_14 z1_14 z2_14 z3_14 z4_14 z5_14 z6_14 z7_14).
 { eapply(row_result_from_clamp_stages A W(kc_pre÷4)(row_alias mr_pre 2)(nc_pre-nc)lo hi vl x20 x21 x22 x23 x24 x25 x26 x27 z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6 z0_14 z1_14 z2_14 z3_14 z4_14 z5_14 z6_14 z7_14);[lia|exact Hrem|exact PreH70|exact Hmin2|exact Hmax2]. }
 pose proof(active8_repaired_min vl hi x30 x31 x32 x33 x34 x35 x36 x37 z0_7 z1_7 z2_7 z3_7 z4_7 z5_7 z6_7 z7_7 m0_4 m1_4 m2_4 m3_4 m4_4 m5_4 m6_4 m7_4 z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8 Hhi PreH21 PreH22 PreH19)as Hmin3.
 pose proof(active8_repaired_max vl lo z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8 z0_15 z1_15 z2_15 z3_15 z4_15 z5_15 z6_15 z7_15 m0_8 m1_8 m2_8 m3_8 m4_8 m5_8 m6_8 m7_8 z0_16 z1_16 z2_16 z3_16 z4_16 z5_16 z6_16 z7_16 Hlo PreH3 PreH4 PreH1)as Hmax3.
 assert(Hrow3:row_result_values A W(kc_pre÷4)(row_alias mr_pre 3)(nc_pre-nc)lo hi vl z0_16 z1_16 z2_16 z3_16 z4_16 z5_16 z6_16 z7_16).
 { eapply(row_result_from_clamp_stages A W(kc_pre÷4)(row_alias mr_pre 3)(nc_pre-nc)lo hi vl x30 x31 x32 x33 x34 x35 x36 x37 z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8 z0_16 z1_16 z2_16 z3_16 z4_16 z5_16 z6_16 z7_16);[lia|exact Hrem|exact PreH71|exact Hmin3|exact Hmax3]. }
 Exists z0_16 z1_16 z2_16 z3_16 z4_16 z5_16 z6_16 z7_16.
 Exists z0_14 z1_14 z2_14 z3_14 z4_14 z5_14 z6_14 z7_14.
 Exists z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12.
 Exists z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - sep_apply store_uint64_undef_store_uint64.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_3.
