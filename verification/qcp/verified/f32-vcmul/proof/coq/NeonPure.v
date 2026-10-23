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
Module CheckedNeonPure.
Lemma proof_of_test_neon_safety_wit_1 : VCMul.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_1; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_2 : VCMul.neon_unit_goal.test_neon_safety_wit_2.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_2; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_3 : VCMul.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_3; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_4 : VCMul.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_4; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_5 : VCMul.neon_unit_goal.test_neon_safety_wit_5.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_5; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_6 : VCMul.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_6; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_7 : VCMul.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_7; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_8 : VCMul.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_8; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_9 : VCMul.neon_unit_goal.test_neon_safety_wit_9.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_9; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_10 : VCMul.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_10; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_11 : VCMul.neon_unit_goal.test_neon_safety_wit_11.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_11; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_12 : VCMul.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_12; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_13 : VCMul.neon_unit_goal.test_neon_safety_wit_13.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_13; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_14 : VCMul.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_14; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_15 : VCMul.neon_unit_goal.test_neon_safety_wit_15.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_15; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_16 : VCMul.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_16; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_17 : VCMul.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_17; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_18 : VCMul.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_18; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_19 : VCMul.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_19; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_20 : VCMul.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_20; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_21 : VCMul.neon_unit_goal.test_neon_safety_wit_21.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_21; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_22 : VCMul.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_22; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_23 : VCMul.neon_unit_goal.test_neon_safety_wit_23.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_23; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_24 : VCMul.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_24; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_25 : VCMul.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_25; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_26 : VCMul.neon_unit_goal.test_neon_safety_wit_26.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_26; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_27 : VCMul.neon_unit_goal.test_neon_safety_wit_27.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_27; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_28 : VCMul.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_28; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_29 : VCMul.neon_unit_goal.test_neon_safety_wit_29.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_29; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_30 : VCMul.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_30; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_31 : VCMul.neon_unit_goal.test_neon_safety_wit_31.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_31; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_32 : VCMul.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_32; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_33 : VCMul.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_33; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_34 : VCMul.neon_unit_goal.test_neon_safety_wit_34.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_34; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_35 : VCMul.neon_unit_goal.test_neon_safety_wit_35.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_35; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_36 : VCMul.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_36; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_37 : VCMul.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_37; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_38 : VCMul.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_38; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_39 : VCMul.neon_unit_goal.test_neon_safety_wit_39.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_39; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_40 : VCMul.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_40; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_41 : VCMul.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_41; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_42 : VCMul.neon_unit_goal.test_neon_safety_wit_42.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_42; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_43 : VCMul.neon_unit_goal.test_neon_safety_wit_43.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_43; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_44 : VCMul.neon_unit_goal.test_neon_safety_wit_44.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_44; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_45 : VCMul.neon_unit_goal.test_neon_safety_wit_45.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_45; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_46 : VCMul.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_46; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_47 : VCMul.neon_unit_goal.test_neon_safety_wit_47.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_47; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_48 : VCMul.neon_unit_goal.test_neon_safety_wit_48.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_48; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_49 : VCMul.neon_unit_goal.test_neon_safety_wit_49.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_49; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_50 : VCMul.neon_unit_goal.test_neon_safety_wit_50.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_50; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_51 : VCMul.neon_unit_goal.test_neon_safety_wit_51.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_51; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_52 : VCMul.neon_unit_goal.test_neon_safety_wit_52.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_52; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_53 : VCMul.neon_unit_goal.test_neon_safety_wit_53.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_53; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_54 : VCMul.neon_unit_goal.test_neon_safety_wit_54.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_54; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_55 : VCMul.neon_unit_goal.test_neon_safety_wit_55.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_55; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_56 : VCMul.neon_unit_goal.test_neon_safety_wit_56.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_56; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_57 : VCMul.neon_unit_goal.test_neon_safety_wit_57.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_57; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_58 : VCMul.neon_unit_goal.test_neon_safety_wit_58.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_58; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_59 : VCMul.neon_unit_goal.test_neon_safety_wit_59.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_59; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_60 : VCMul.neon_unit_goal.test_neon_safety_wit_60.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_60; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_61 : VCMul.neon_unit_goal.test_neon_safety_wit_61.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_61; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_62 : VCMul.neon_unit_goal.test_neon_safety_wit_62.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_62; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_63 : VCMul.neon_unit_goal.test_neon_safety_wit_63.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_63; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_64 : VCMul.neon_unit_goal.test_neon_safety_wit_64.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_64; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_65 : VCMul.neon_unit_goal.test_neon_safety_wit_65.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_65; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_66 : VCMul.neon_unit_goal.test_neon_safety_wit_66.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_66; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_67 : VCMul.neon_unit_goal.test_neon_safety_wit_67.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_67; pure_finish. Qed.
Lemma proof_of_test_neon_safety_wit_68 : VCMul.neon_unit_goal.test_neon_safety_wit_68.
Proof. unfold VCMul.neon_unit_goal.test_neon_safety_wit_68; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_1_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_2_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_2_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_3_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_4_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_5_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_6_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_6_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_8_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_8_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_10_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_10_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_12_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_12_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_24_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_24_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_25_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_25_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_26_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_26_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_30_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_30_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_31_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_31_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_32_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_32_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_36_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_36_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_37_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_37_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_38_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_38_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_42_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_42_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_43_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_43_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_44_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_44_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_96_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_96_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_97_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_97_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_97_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_98_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_98_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_98_pure; pure_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_99_pure : VCMul.neon_unit_goal.test_neon_partial_solve_wit_99_pure.
Proof. unfold VCMul.neon_unit_goal.test_neon_partial_solve_wit_99_pure; pure_finish. Qed.
End CheckedNeonPure.
