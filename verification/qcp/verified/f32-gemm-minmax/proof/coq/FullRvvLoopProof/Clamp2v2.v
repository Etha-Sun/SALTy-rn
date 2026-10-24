From Coq Require Import ZArith Lia Strings.String.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain RowValues ActiveVector.
From FullRvvAccMath Require Import AccSteps ClampFacts.
From GemmPanelCell Require Import PanelCell.
From GemmRvv Require Import Model FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Ltac rewrite_active_lane :=
 repeat multimatch goal with
 | H:(?i < ?vl -> ?x = ?y) |-context[?x]=>rewrite(H ltac:(lia))
 end.
Lemma proof_of_test_rvv_entail_wit_4_2 : test_rvv_entail_wit_4_2.
Proof.
 unfold test_rvv_entail_wit_4_2;left;intros.
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
 assert(Hhi:Binary.is_nan 24 128 hi=true)by(apply fp32_self_ne_nan;assumption).
 assert(Hrem:Z.modulo(nc_pre-nc)8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 assert(Hdiv:(nc_pre-nc)÷8=(nc_pre-nc)/8)by(apply Z.quot_div_nonneg;lia).
 unfold row_acc_values,active8,mask8,active_value,active_mask,bit_same in *.
 repeat match goal with H:_ /\ _|-_=>destruct H end.
 assert(Hrow0:row_result_values A W (kc_pre÷4)(row_alias mr_pre 0)(nc_pre-nc)lo hi vl z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5).
 { unfold row_result_values,active8,active_value,bit_same;repeat split;intros Hlane.
   all:rewrite full_cell_at_aligned_offset by (assumption||lia).
   all:rewrite <-Hdiv;rewrite_active_lane.
   all:rewrite neon_clamp_lower_nan by assumption;reflexivity.
 }
 assert(Hrow1:row_result_values A W (kc_pre÷4)(row_alias mr_pre 1)(nc_pre-nc)lo hi vl z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6).
 { unfold row_result_values,active8,active_value,bit_same;repeat split;intros Hlane.
   all:rewrite full_cell_at_aligned_offset by (assumption||lia).
   all:rewrite <-Hdiv;rewrite_active_lane.
   all:rewrite neon_clamp_lower_nan by assumption;reflexivity.
 }
 assert(Hrow2:row_result_values A W (kc_pre÷4)(row_alias mr_pre 2)(nc_pre-nc)lo hi vl z0_7 z1_7 z2_7 z3_7 z4_7 z5_7 z6_7 z7_7).
 { unfold row_result_values,active8,active_value,bit_same;repeat split;intros Hlane.
   all:rewrite full_cell_at_aligned_offset by (assumption||lia).
   all:rewrite <-Hdiv;rewrite_active_lane.
   all:rewrite neon_clamp_lower_nan by assumption;reflexivity.
 }
 assert(Hrow3:row_result_values A W (kc_pre÷4)(row_alias mr_pre 3)(nc_pre-nc)lo hi vl z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8).
 { unfold row_result_values,active8,active_value,bit_same;repeat split;intros Hlane.
   all:rewrite full_cell_at_aligned_offset by (assumption||lia).
   all:rewrite <-Hdiv;rewrite_active_lane.
   all:rewrite neon_clamp_lower_nan by assumption;reflexivity.
 }
 Exists z0_8 z1_8 z2_8 z3_8 z4_8 z5_8 z6_8 z7_8.
 Exists z0_7 z1_7 z2_7 z3_7 z4_7 z5_7 z6_7 z7_7.
 Exists z0_6 z1_6 z2_6 z3_6 z4_6 z5_6 z6_6 z7_6.
 Exists z0_5 z1_5 z2_5 z3_5 z4_5 z5_5 z6_5 z7_5.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - sep_apply store_uint64_undef_store_uint64.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.
