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
Lemma proof_of_test_rvv_entail_wit_4_1 : test_rvv_entail_wit_4_1.
Proof.
 unfold test_rvv_entail_wit_4_1;left;intros.
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
 assert(Hlo:Binary.is_nan 24 128 lo=true)by(apply fp32_self_ne_nan;assumption).
 assert(Hhi:Binary.is_nan 24 128 hi=false)by(apply fp32_self_eq_not_nan;assumption).
 assert(Hrem:Z.modulo(nc_pre-nc)8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 assert(Hdiv:(nc_pre-nc)÷8=(nc_pre-nc)/8)by(apply Z.quot_div_nonneg;lia).
 assert(Hrow0:row_result_values A W(kc_pre÷4)(row_alias mr_pre 0)(nc_pre-nc)lo hi vl z0_9 z1_9 z2_9 z3_9 z4_9 z5_9 z6_9 z7_9)by(eapply row_result_lower_nan;[exact Hlo|exact PreH7]).
 assert(Hrow1:row_result_values A W(kc_pre÷4)(row_alias mr_pre 1)(nc_pre-nc)lo hi vl z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10)by(eapply row_result_lower_nan;[exact Hlo|exact PreH5]).
 assert(Hrow2:row_result_values A W(kc_pre÷4)(row_alias mr_pre 2)(nc_pre-nc)lo hi vl z0_11 z1_11 z2_11 z3_11 z4_11 z5_11 z6_11 z7_11)by(eapply row_result_lower_nan;[exact Hlo|exact PreH3]).
 assert(Hrow3:row_result_values A W(kc_pre÷4)(row_alias mr_pre 3)(nc_pre-nc)lo hi vl z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12)by(eapply row_result_lower_nan;[exact Hlo|exact PreH1]).
 Exists z0_12 z1_12 z2_12 z3_12 z4_12 z5_12 z6_12 z7_12.
 Exists z0_11 z1_11 z2_11 z3_11 z4_11 z5_11 z6_11 z7_11.
 Exists z0_10 z1_10 z2_10 z3_10 z4_10 z5_10 z6_10 z7_10.
 Exists z0_9 z1_9 z2_9 z3_9 z4_9 z5_9 z6_9 z7_9.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - sep_apply store_uint64_undef_store_uint64.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_1.
