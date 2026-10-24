From Coq Require Import ZArith Lia Strings.String.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain RowValues ActiveVector.
From FullRvvAccMath Require Import AccSteps ClampFacts ClampRows ActiveNan.
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
Lemma proof_of_test_rvv_entail_wit_4_4 : test_rvv_entail_wit_4_4.
Proof.
 unfold test_rvv_entail_wit_4_4;left;intros.
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
 assert(Hhi:Binary.is_nan 24 128 hi=true)by(apply fp32_self_ne_nan;assumption).
 assert(Hrem:Z.modulo(nc_pre-nc)8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 assert(Hdiv:(nc_pre-nc)÷8=(nc_pre-nc)/8)by(apply Z.quot_div_nonneg;lia).
 pose proof(active8_repaired_max vl lo z0 z1 z2 z3 z4 z5 z6 z7 z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5 m0 m1 m2 m3 m4 m5 m6 m7 z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6 Hlo PreH15 PreH16 PreH13)as Hmax0.
 pose proof(active8_max_nan_result vl lo z0 z1 z2 z3 z4 z5 z6 z7 z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6 PreH25 Hmax0)as Hnan0.
 assert(Hrow0:row_result_values A W(kc_pre÷4)(row_alias mr_pre 0)(nc_pre-nc)lo hi vl z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6)by(eapply row_result_upper_nan;[exact Hhi|exact Hnan0]).
 pose proof(active8_repaired_max vl lo z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z0_7 z1_7 z2_7 z3_7 z4_7 z5_7 z6_7 z7_7 m0_2 m1_2 m2_2 m3_2 m4_2 m5_2 m6_2 m7_2 z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8 Hlo PreH11 PreH12 PreH9)as Hmax1.
 pose proof(active8_max_nan_result vl lo z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8 PreH23 Hmax1)as Hnan1.
 assert(Hrow1:row_result_values A W(kc_pre÷4)(row_alias mr_pre 1)(nc_pre-nc)lo hi vl z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8)by(eapply row_result_upper_nan;[exact Hhi|exact Hnan1]).
 pose proof(active8_repaired_max vl lo z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3 z0_9 z1_9 z2_9 z3_9 z4_9 z5_9 z6_9 z7_9 m0_3 m1_3 m2_3 m3_3 m4_3 m5_3 m6_3 m7_3 z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10 Hlo PreH7 PreH8 PreH5)as Hmax2.
 pose proof(active8_max_nan_result vl lo z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3 z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10 PreH21 Hmax2)as Hnan2.
 assert(Hrow2:row_result_values A W(kc_pre÷4)(row_alias mr_pre 2)(nc_pre-nc)lo hi vl z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10)by(eapply row_result_upper_nan;[exact Hhi|exact Hnan2]).
 pose proof(active8_repaired_max vl lo z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 z0_11 z1_11 z2_11 z3_11 z4_11 z5_11 z6_11 z7_11 m0_4 m1_4 m2_4 m3_4 m4_4 m5_4 m6_4 m7_4 z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12 Hlo PreH3 PreH4 PreH1)as Hmax3.
 pose proof(active8_max_nan_result vl lo z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12 PreH19 Hmax3)as Hnan3.
 assert(Hrow3:row_result_values A W(kc_pre÷4)(row_alias mr_pre 3)(nc_pre-nc)lo hi vl z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12)by(eapply row_result_upper_nan;[exact Hhi|exact Hnan3]).
 Exists z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12.
 Exists z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10.
 Exists z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8.
 Exists z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - sep_apply store_uint64_undef_store_uint64.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_4.
