From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From VMulc Require Import Model neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac generic_copy :=
 unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1, andp, coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel]
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel].
From VMulc Require Import NeonResult.
Import ListNotations.
Module CheckedNeonVcs.
Lemma proof_of_test_neon_safety_wit_1 : test_neon_safety_wit_1.
Proof. unfold test_neon_safety_wit_1; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_2 : test_neon_safety_wit_2.
Proof. unfold test_neon_safety_wit_2; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_3 : test_neon_safety_wit_3.
Proof. unfold test_neon_safety_wit_3; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_4 : test_neon_safety_wit_4.
Proof. unfold test_neon_safety_wit_4; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_5 : test_neon_safety_wit_5.
Proof. unfold test_neon_safety_wit_5; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_6 : test_neon_safety_wit_6.
Proof. unfold test_neon_safety_wit_6; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_7 : test_neon_safety_wit_7.
Proof. unfold test_neon_safety_wit_7; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_8 : test_neon_safety_wit_8.
Proof. unfold test_neon_safety_wit_8; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_9 : test_neon_safety_wit_9.
Proof. unfold test_neon_safety_wit_9; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_10 : test_neon_safety_wit_10.
Proof. unfold test_neon_safety_wit_10; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_11 : test_neon_safety_wit_11.
Proof. unfold test_neon_safety_wit_11; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_12 : test_neon_safety_wit_12.
Proof. unfold test_neon_safety_wit_12; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_13 : test_neon_safety_wit_13.
Proof. unfold test_neon_safety_wit_13; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_14 : test_neon_safety_wit_14.
Proof. unfold test_neon_safety_wit_14; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_15 : test_neon_safety_wit_15.
Proof. unfold test_neon_safety_wit_15; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_16 : test_neon_safety_wit_16.
Proof. unfold test_neon_safety_wit_16; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_17 : test_neon_safety_wit_17.
Proof. unfold test_neon_safety_wit_17; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_18 : test_neon_safety_wit_18.
Proof. unfold test_neon_safety_wit_18; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_19 : test_neon_safety_wit_19.
Proof. unfold test_neon_safety_wit_19; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_20 : test_neon_safety_wit_20.
Proof. unfold test_neon_safety_wit_20; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_21 : test_neon_safety_wit_21.
Proof. unfold test_neon_safety_wit_21; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_22 : test_neon_safety_wit_22.
Proof. unfold test_neon_safety_wit_22; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_23 : test_neon_safety_wit_23.
Proof. unfold test_neon_safety_wit_23; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_24 : test_neon_safety_wit_24.
Proof. unfold test_neon_safety_wit_24; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_25 : test_neon_safety_wit_25.
Proof. unfold test_neon_safety_wit_25; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_26 : test_neon_safety_wit_26.
Proof. unfold test_neon_safety_wit_26; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_27 : test_neon_safety_wit_27.
Proof. unfold test_neon_safety_wit_27; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_28 : test_neon_safety_wit_28.
Proof. unfold test_neon_safety_wit_28; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_29 : test_neon_safety_wit_29.
Proof. unfold test_neon_safety_wit_29; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_30 : test_neon_safety_wit_30.
Proof. unfold test_neon_safety_wit_30; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_31 : test_neon_safety_wit_31.
Proof. unfold test_neon_safety_wit_31; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_32 : test_neon_safety_wit_32.
Proof. unfold test_neon_safety_wit_32; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_33 : test_neon_safety_wit_33.
Proof. unfold test_neon_safety_wit_33; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_34 : test_neon_safety_wit_34.
Proof. unfold test_neon_safety_wit_34; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_35 : test_neon_safety_wit_35.
Proof. unfold test_neon_safety_wit_35; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_36 : test_neon_safety_wit_36.
Proof. unfold test_neon_safety_wit_36; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; subst batch; repeat match goal with H: context[Z.land] |- _ => vm_compute in H end; exfalso; congruence. Qed.

Lemma proof_of_test_neon_safety_wit_37 : test_neon_safety_wit_37.
Proof. unfold test_neon_safety_wit_37; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_38 : test_neon_safety_wit_38.
Proof. unfold test_neon_safety_wit_38; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_39 : test_neon_safety_wit_39.
Proof. unfold test_neon_safety_wit_39; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_40 : test_neon_safety_wit_40.
Proof. unfold test_neon_safety_wit_40; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_41 : test_neon_safety_wit_41.
Proof. unfold test_neon_safety_wit_41; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_42 : test_neon_safety_wit_42.
Proof. unfold test_neon_safety_wit_42; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_43 : test_neon_safety_wit_43.
Proof. unfold test_neon_safety_wit_43; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_44 : test_neon_safety_wit_44.
Proof. unfold test_neon_safety_wit_44; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; subst batch; repeat match goal with H: context[Z.land] |- _ => vm_compute in H end; exfalso; congruence. Qed.

Lemma proof_of_test_neon_safety_wit_45 : test_neon_safety_wit_45.
Proof. unfold test_neon_safety_wit_45; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_46 : test_neon_safety_wit_46.
Proof. unfold test_neon_safety_wit_46; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_47 : test_neon_safety_wit_47.
Proof. unfold test_neon_safety_wit_47; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_safety_wit_48 : test_neon_safety_wit_48.
Proof. unfold test_neon_safety_wit_48; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Ltac choose_initial_case :=
 first [solve [Exists 0;
    unfold FloatArray.full, store_array;
    cbn [store_array_rec]; entailer!;
    cbn [vmulc_values List.firstn Z.to_nat store_array_rec]; try entailer!;
    subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].

Lemma proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Proof.
 unfold test_neon_entail_wit_1; intros.
 prop_apply (FloatArray.full_Zlength input_a_pre (batch_pre ÷ 4 + 3) A). Intros_p HA.
 unfold fp32_length.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 pose proof (byte_batch_tail_cases batch_pre ltac:(lia) PreH8) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]]; try lia.
 all: sep_apply (float_initial_split input_a_pre (batch_pre ÷ 4 + 3) A).
 all: choose_initial_case.
Qed.

Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].

Lemma proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k_2 + batch ÷ 4).
 { replace batch_pre with ((k_2 + batch ÷ 4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewq: (batch-16) ÷ 4 = batch ÷ 4-4).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewrem: (batch-16) % 4 = 0).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.rem_mul by lia. reflexivity. }
 prop_apply (float_address_nonnegative (input_a+0*4)
   (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)). Intros_p HAaddr.
 prop_apply (float_address_nonnegative (output+0*4)
   (fp32_mul (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)
             c)). Intros_p HOaddr.
 subst input_a output.
 pose proof (float_input_step_four input_a_pre k_2 (batch_pre ÷ 4+3) A __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HstepA.
 pose proof (vmulc_output_step_four output_pre k_2 (batch_pre ÷ 4) (batch_pre ÷ 4+3) A c __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HstepO.
 unfold float_cells4 in HstepA,HstepO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HstepA,HstepO.
 replace (batch_pre ÷ 4+3-k_2) with (batch ÷ 4+3) in HstepA by lia.
 replace (batch_pre ÷ 4-k_2) with (batch ÷ 4) in HstepO by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HstepA, HstepO.
 sep_apply HstepA. sep_apply HstepO.
 replace (4*4) with 16 by lia.
 rewrite Hnewq.
 replace (batch_pre ÷ 4+3-(k_2+4)) with (batch ÷ 4-4+3) by lia.
 replace (batch_pre ÷ 4-(k_2+4)) with (batch ÷ 4-4) by lia.
 replace (input_a_pre+(k_2+4)*4) with (input_a_pre+k_2*4+16) by lia.
 replace (output_pre+(k_2+4)*4) with (output_pre+k_2*4+16) by lia.
 pose proof (byte_batch_tail_cases (batch-16) ltac:(lia) Hnewrem) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]].
 all: choose_step_case k_2.
Qed.

Lemma proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Proof. unfold test_neon_entail_wit_3_1; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; subst batch; repeat match goal with H: context[Z.land] |- _ => vm_compute in H end; exfalso; congruence. Qed.

Lemma proof_of_test_neon_entail_wit_3_2 : test_neon_entail_wit_3_2.
Proof. unfold test_neon_entail_wit_3_2; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_3_3 : test_neon_entail_wit_3_3.
Proof. unfold test_neon_entail_wit_3_3; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_4_1 : test_neon_entail_wit_4_1.
Proof. unfold test_neon_entail_wit_4_1; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_4_2 : test_neon_entail_wit_4_2.
Proof. unfold test_neon_entail_wit_4_2; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_4_3 : test_neon_entail_wit_4_3.
Proof. unfold test_neon_entail_wit_4_3; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Proof. unfold test_neon_entail_wit_5_1; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Proof. unfold test_neon_entail_wit_5_2; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; subst batch; repeat match goal with H: context[Z.land] |- _ => vm_compute in H end; exfalso; congruence. Qed.

Lemma proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Proof. unfold test_neon_entail_wit_5_3; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Proof. unfold test_neon_entail_wit_6_1; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_6_2 : test_neon_entail_wit_6_2.
Proof. unfold test_neon_entail_wit_6_2; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_entail_wit_6_3 : test_neon_entail_wit_6_3.
Proof. unfold test_neon_entail_wit_6_3; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 3).
 { replace batch_pre with ((k+3)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold LoopMemory.float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 pose proof (float_prefix_append3 output_pre k (vmulc_values k A c) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) (fp32_mul (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) (fp32_mul (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vmulc_tail_four k 3 A c __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HM by lia.
 replace (Z.to_nat 3) with 3%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 3 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.

Lemma proof_of_test_neon_return_wit_2 : test_neon_return_wit_2.
Proof.
 unfold test_neon_return_wit_2; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 1).
 { replace batch_pre with ((k+1)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold LoopMemory.float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 pose proof (float_prefix_append1 output_pre k (vmulc_values k A c) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vmulc_tail_four k 1 A c __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HM by lia.
 replace (Z.to_nat 1) with 1%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 1 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.

Lemma proof_of_test_neon_return_wit_3 : test_neon_return_wit_3.
Proof.
 unfold test_neon_return_wit_3; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 2).
 { replace batch_pre with ((k+2)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold LoopMemory.float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 pose proof (float_prefix_append2 output_pre k (vmulc_values k A c) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) (fp32_mul (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vmulc_tail_four k 2 A c __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HM by lia.
 replace (Z.to_nat 2) with 2%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 2 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.

Lemma proof_of_test_neon_return_wit_4 : test_neon_return_wit_4.
Proof.
 unfold test_neon_return_wit_4; left; intros.
 unfold fp32_length in *.
 subst batch input_a output.
 assert (Htotal: batch_pre ÷ 4 = k).
 { replace batch_pre with (k*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 rewrite Htotal in *.
 replace (0 ÷ 4) with 0 by reflexivity.
 replace (0+3) with 3 by reflexivity.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (float_input_merge input_a_pre k (k+3) A ltac:(lia) ltac:(lia)) as HA.
 replace (k+3-k) with 3 in HA by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 sep_apply HA.
 unfold FloatArray.undef_full, store_undef_array.
 cbn [Z.to_nat store_undef_array_rec]. entailer!.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_1_pure : test_neon_partial_solve_wit_1_pure.
Proof. unfold test_neon_partial_solve_wit_1_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_1 : test_neon_partial_solve_wit_1.
Proof. unfold test_neon_partial_solve_wit_1, test_neon_partial_solve_wit_1_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_2_pure : test_neon_partial_solve_wit_2_pure.
Proof. unfold test_neon_partial_solve_wit_2_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_2 : test_neon_partial_solve_wit_2.
Proof. unfold test_neon_partial_solve_wit_2, test_neon_partial_solve_wit_2_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_3_pure : test_neon_partial_solve_wit_3_pure.
Proof. unfold test_neon_partial_solve_wit_3_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_3 : test_neon_partial_solve_wit_3.
Proof. unfold test_neon_partial_solve_wit_3, test_neon_partial_solve_wit_3_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_4_pure : test_neon_partial_solve_wit_4_pure.
Proof. unfold test_neon_partial_solve_wit_4_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_4 : test_neon_partial_solve_wit_4.
Proof. unfold test_neon_partial_solve_wit_4, test_neon_partial_solve_wit_4_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_5_pure : test_neon_partial_solve_wit_5_pure.
Proof. unfold test_neon_partial_solve_wit_5_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_5 : test_neon_partial_solve_wit_5.
Proof. unfold test_neon_partial_solve_wit_5, test_neon_partial_solve_wit_5_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_6 : test_neon_partial_solve_wit_6.
Proof. unfold test_neon_partial_solve_wit_6; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_7 : test_neon_partial_solve_wit_7.
Proof. unfold test_neon_partial_solve_wit_7; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_8 : test_neon_partial_solve_wit_8.
Proof. unfold test_neon_partial_solve_wit_8; intros; unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;rewrite sizeof_float in *;lia|unfold fp32_slice;generic_copy]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Proof. unfold test_neon_partial_solve_wit_9; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Proof. unfold test_neon_partial_solve_wit_10; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_11 : test_neon_partial_solve_wit_11.
Proof. unfold test_neon_partial_solve_wit_11; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Proof. unfold test_neon_partial_solve_wit_12; intros; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial;lia|replace (output+0*sizeof(FLOAT)) with output by lia;generic_copy]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_13 : test_neon_partial_solve_wit_13.
Proof. unfold test_neon_partial_solve_wit_13; intros; unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;rewrite sizeof_float in *;lia|unfold fp32_slice;generic_copy]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_14 : test_neon_partial_solve_wit_14.
Proof. unfold test_neon_partial_solve_wit_14; intros; unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;rewrite sizeof_float in *;lia|unfold fp32_slice;generic_copy]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_15 : test_neon_partial_solve_wit_15.
Proof. unfold test_neon_partial_solve_wit_15; intros; unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;rewrite sizeof_float in *;lia|unfold fp32_slice;generic_copy]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_16 : test_neon_partial_solve_wit_16.
Proof. unfold test_neon_partial_solve_wit_16; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_17 : test_neon_partial_solve_wit_17.
Proof. unfold test_neon_partial_solve_wit_17; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_18 : test_neon_partial_solve_wit_18.
Proof. unfold test_neon_partial_solve_wit_18; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_19 : test_neon_partial_solve_wit_19.
Proof. unfold test_neon_partial_solve_wit_19; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_20 : test_neon_partial_solve_wit_20.
Proof. unfold test_neon_partial_solve_wit_20; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_21 : test_neon_partial_solve_wit_21.
Proof. unfold test_neon_partial_solve_wit_21; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_22 : test_neon_partial_solve_wit_22.
Proof. unfold test_neon_partial_solve_wit_22; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_23 : test_neon_partial_solve_wit_23.
Proof. unfold test_neon_partial_solve_wit_23; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_24 : test_neon_partial_solve_wit_24.
Proof. unfold test_neon_partial_solve_wit_24; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_25 : test_neon_partial_solve_wit_25.
Proof. unfold test_neon_partial_solve_wit_25; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_26 : test_neon_partial_solve_wit_26.
Proof. unfold test_neon_partial_solve_wit_26; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_27 : test_neon_partial_solve_wit_27.
Proof. unfold test_neon_partial_solve_wit_27; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_28 : test_neon_partial_solve_wit_28.
Proof. unfold test_neon_partial_solve_wit_28; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_29 : test_neon_partial_solve_wit_29.
Proof. unfold test_neon_partial_solve_wit_29; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_30 : test_neon_partial_solve_wit_30.
Proof. unfold test_neon_partial_solve_wit_30; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_31 : test_neon_partial_solve_wit_31.
Proof. unfold test_neon_partial_solve_wit_31; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_32 : test_neon_partial_solve_wit_32.
Proof. unfold test_neon_partial_solve_wit_32; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_33 : test_neon_partial_solve_wit_33.
Proof. unfold test_neon_partial_solve_wit_33; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_34 : test_neon_partial_solve_wit_34.
Proof. unfold test_neon_partial_solve_wit_34; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_35 : test_neon_partial_solve_wit_35.
Proof. unfold test_neon_partial_solve_wit_35; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_36 : test_neon_partial_solve_wit_36.
Proof. unfold test_neon_partial_solve_wit_36; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_37_pure : test_neon_partial_solve_wit_37_pure.
Proof. unfold test_neon_partial_solve_wit_37_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_37 : test_neon_partial_solve_wit_37.
Proof. unfold test_neon_partial_solve_wit_37, test_neon_partial_solve_wit_37_aux; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_38_pure : test_neon_partial_solve_wit_38_pure.
Proof. unfold test_neon_partial_solve_wit_38_pure; first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]. Qed.

Lemma proof_of_test_neon_partial_solve_wit_38 : test_neon_partial_solve_wit_38.
Proof. unfold test_neon_partial_solve_wit_38; intros _; unfold test_neon_partial_solve_wit_38_aux; intros; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial;lia|unfold StoreFloatAsElement.undefstoreA;replace (output+0*sizeof(FLOAT)) with output by lia;generic_copy]. Qed.

End CheckedNeonVcs.
