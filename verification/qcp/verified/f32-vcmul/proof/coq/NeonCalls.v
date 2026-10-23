From Coq Require Import ZArith Lia.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import FastFrame.
From ByValue Require Import neon_copy_checked.
From VCMul Require Import Model ComplexModel neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque vcmul_mla vcmul_mls fp32_mul fp32_add fp32_sub complex_real_prefix complex_imag_prefix.
Ltac quotient_facts :=
 repeat match goal with |- context[Z.quot ?x ?d] =>
  let Hx:=fresh in assert(Hx:0<=x)by lia;
  let Hd:=fresh in assert(Hd:0<d)by lia;
  pose proof(Z.quot_rem' x d);
  pose proof(Z.rem_bound_pos x d Hx Hd);
  let q:=fresh "q" in let E:=fresh in remember(Z.quot x d)as q eqn:E in *;clear E
 end.
Ltac land_facts :=
 repeat progress match goal with |- context[Z.land ?x ?y] =>
 let z:=eval vm_compute in (Z.land x y) in change (Z.land x y) with z end.
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
 repeat first [assumption|split|reflexivity];land_facts;quotient_facts;lia.
Ltac open_undef :=
 match goal with |- ?P |-- ?Q =>
 multimatch Q with context[FloatArray.undef_seg ?p ?k ?n] =>
 lazymatch P with context[FloatArray.undef_full p n] =>
 let kred:=eval vm_compute in k in
 first [constr_eq kred 4;sep_apply_l_atomic(float_undef_open4 p n)
 |constr_eq kred 2;sep_apply_l_atomic(float_undef_open2 p n)
 |constr_eq kred 1;sep_apply_l_atomic(float_undef_open1 p n)];
 [dump_pre_spatial;lia|idtac]
 end end end.
Ltac open_undef_tail :=
 match goal with |- ?P |-- ?Q =>
 multimatch P with context[FloatArray.undef_seg ?p 2 ?n] =>
 multimatch Q with context[FloatArray.undef_seg p ?j n] =>
 let jred:=eval vm_compute in j in constr_eq jred 3;
 sep_apply_l_atomic(FloatArray.undef_seg_unfold p 2 n);
 [dump_pre_spatial;lia|unfold StoreFloatAsElement.undefstoreA]
 end end end.
Ltac copy_finish :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;rewrite ?sizeof_float in *;
 unfold same_fp32,fp32_bits_equal in *; subst;
 try open_undef;try open_undef_tail;rewrite ?sizeof_float;
 unfold VCMul.Model.UndefStructPredfloat32x4_t,
 QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 VCMul.Model.UndefStructPredfloat32x2_t,QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
 rewrite ?VCMul.Model.local_field_address; try csimpl;
 rewrite ?Z.mul_0_l,?Z.add_0_r;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;repeat first[assumption|split|reflexivity];land_facts;quotient_facts;lia
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedNeonCalls.
Lemma proof_of_test_neon_partial_solve_wit_1 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_1, VCMul.neon_unit_goal.test_neon_partial_solve_wit_1_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_2, VCMul.neon_unit_goal.test_neon_partial_solve_wit_2_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_3, VCMul.neon_unit_goal.test_neon_partial_solve_wit_3_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_4, VCMul.neon_unit_goal.test_neon_partial_solve_wit_4_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_5, VCMul.neon_unit_goal.test_neon_partial_solve_wit_5_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_6, VCMul.neon_unit_goal.test_neon_partial_solve_wit_6_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_7; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_8, VCMul.neon_unit_goal.test_neon_partial_solve_wit_8_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_9; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_10, VCMul.neon_unit_goal.test_neon_partial_solve_wit_10_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_11; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_12, VCMul.neon_unit_goal.test_neon_partial_solve_wit_12_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_13; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_14; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_15; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_16; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_17; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_18; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_19; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_20; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_21; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_22; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_23; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_24, VCMul.neon_unit_goal.test_neon_partial_solve_wit_24_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_25, VCMul.neon_unit_goal.test_neon_partial_solve_wit_25_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_26, VCMul.neon_unit_goal.test_neon_partial_solve_wit_26_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_27; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_28; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_29; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_30, VCMul.neon_unit_goal.test_neon_partial_solve_wit_30_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_31, VCMul.neon_unit_goal.test_neon_partial_solve_wit_31_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_32, VCMul.neon_unit_goal.test_neon_partial_solve_wit_32_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_33; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_34; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_35; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_36, VCMul.neon_unit_goal.test_neon_partial_solve_wit_36_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_37, VCMul.neon_unit_goal.test_neon_partial_solve_wit_37_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_38, VCMul.neon_unit_goal.test_neon_partial_solve_wit_38_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_39; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_40; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_41; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_42, VCMul.neon_unit_goal.test_neon_partial_solve_wit_42_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_43, VCMul.neon_unit_goal.test_neon_partial_solve_wit_43_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_44, VCMul.neon_unit_goal.test_neon_partial_solve_wit_44_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_45; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_46 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_46; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_47 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_47; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_48 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_48; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_49 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_49; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_50 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_50.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_50; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_51; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_52 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_52.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_52; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_53; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_54.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_54; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_55; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_56 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_56; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_57 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_57.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_57; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_58 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_58; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_59 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_59; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_60 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_60.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_60; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_61 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_61.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_61; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_62; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_63 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_63.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_63; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_64; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_65; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_66.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_66; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_67 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_67; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_68.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_68; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_69 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_69; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_70 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_70.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_70; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_71 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_71.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_71; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_72 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_72.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_72; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_73 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_73.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_73; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_74 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_74.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_74; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_75 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_75.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_75; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_76; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_77 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_77.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_77; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_78; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_79 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_79; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_80.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_80; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_81 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_81.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_81; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_82.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_82; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_83 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_83.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_83; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_84 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_84.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_84; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_85 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_85.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_85; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_86 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_86.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_86; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_87 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_87; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_88 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_88.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_88; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_89 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_89.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_89; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_90 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_90; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_91 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_91.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_91; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_92 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_92.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_92; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_93 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_93.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_93; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_94 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_94.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_94; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_95 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_95.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_95; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_96.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_96, VCMul.neon_unit_goal.test_neon_partial_solve_wit_96_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_97 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_97.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_97, VCMul.neon_unit_goal.test_neon_partial_solve_wit_97_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_98 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_98.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_98, VCMul.neon_unit_goal.test_neon_partial_solve_wit_98_aux; try left;intros;copy_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_99 : VCMul.neon_unit_goal.test_neon_partial_solve_wit_99.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_99, VCMul.neon_unit_goal.test_neon_partial_solve_wit_99_aux; try left;intros;copy_finish. Qed.
End CheckedNeonCalls.
