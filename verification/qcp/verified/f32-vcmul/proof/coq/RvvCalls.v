From Coq Require Import ZArith Lia.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import FastFrame.
From ByValue Require Import neon_copy_checked.
From VCMul Require Import Model ComplexModel RvvMemoryModel RvvStoreModel rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque vcmul_mla vcmul_mls vcmul_active_mul vcmul_active_add vcmul_active_sub vcmul_read_lane_model vcmul_pack16 fp32_mul fp32_add fp32_sub complex_real_prefix complex_imag_prefix.
Ltac quotient_facts :=
 repeat match goal with |- context[Z.quot ?x ?d] =>
  let Hx:=fresh in assert(Hx:0<=x)by lia;
  let Hd:=fresh in assert(Hd:0<d)by lia;
  pose proof(Z.quot_rem' x d);
  pose proof(Z.rem_bound_pos x d Hx Hd);
  let q:=fresh "q" in let E:=fresh in remember(Z.quot x d)as q eqn:E in *;clear E
 end.
Ltac pure_finish :=
 try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold same_fp32,fp32_bits_equal in *; subst;
 rewrite ?sizeof_float in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress match goal with H:context[Z.land ?x ?y] |- _ =>
  let T:=type of H in let Tred:=eval vm_compute in T in change Tred in H end;
 try solve [congruence];
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];quotient_facts;lia.
Ltac open_undef :=
 match goal with |- ?P |-- ?Q =>
 multimatch Q with context[FloatArray.undef_seg ?p ?k ?n] =>
 lazymatch P with context[FloatArray.undef_full p n] =>
 first [constr_eq k 4;sep_apply_l_atomic(float_undef_open4 p n)
 |constr_eq k 2;sep_apply_l_atomic(float_undef_open2 p n)
 |constr_eq k 1;sep_apply_l_atomic(float_undef_open1 p n)];
 [dump_pre_spatial;lia|idtac]
 end end end.
Ltac copy_finish :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;rewrite ?sizeof_float in *;
 unfold same_fp32,fp32_bits_equal in *; subst;
 try open_undef;rewrite ?sizeof_float;
 unfold VCMul.Model.UndefStructPredvfloat32m4_t;
 rewrite ?VCMul.Model.local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;repeat first[assumption|split|reflexivity];quotient_facts;lia
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedRvvCalls.
Lemma proof_of_test_rvv_partial_solve_wit_1 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_1, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_2.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_2, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_2_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_3.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_3, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_3_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_4, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_5.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_5, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_5_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_6; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_7.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_7, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_7_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_8.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_8; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_9, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_9_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_10; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_11.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_11, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_11_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_12; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_13, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_13_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_14; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_15.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_15, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_15_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_16; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_17, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_17_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_18 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_18; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_19.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_19, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_19_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_20.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_20; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_21.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_21, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_21_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_22 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_22.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_22; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_23, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_23_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_24 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_24.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_24; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_25 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_25.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_25, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_25_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_26 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_26.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_26; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_27 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_27.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_27, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_27_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_28 : VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_28.
Proof. unfold VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_28, VCMul.rvv_unit_goal.test_rvv_partial_solve_wit_28_aux; try left;intros;copy_finish. Qed.
End CheckedRvvCalls.
