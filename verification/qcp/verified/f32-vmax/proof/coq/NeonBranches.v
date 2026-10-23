From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
Import ListNotations.
From FMax Require Import Bits Types ProgramModel VectorFastFrame NeonSupport neon_unit_goal.
From QcpVadd Require Import VaddBits.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory InvariantFacts NeonLoopBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac neon_frame :=
 unfold FMax.Types.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 FMax.Types.UndefStructPredfloat32x2_t, QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac neon_simple :=
 first [solve[intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold same_bits,fp32_bits_equal in *;subst;
 unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[pre_process;subst;try csimpl;entailer!]
 |solve[intros;unfold same_bits,fp32_bits_equal in *;subst;neon_frame]
 |solve[intros;try csimpl;entailer!]].
Ltac choose_initial_case :=
 first [solve [Exists 0;
    unfold FloatArray.full, store_array;
    cbn [store_array_rec]; entailer!;
    cbn [mm_arm_values List.firstn Z.to_nat store_array_rec]; try entailer!;
    subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].

Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].

Module CheckedNeonBranches.
Lemma proof_of_test_neon_entail_wit_3_1 : FMax.neon_unit_goal.test_neon_entail_wit_3_1.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_1;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_1;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_3_2 : FMax.neon_unit_goal.test_neon_entail_wit_3_2.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_2;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_2;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_3_3 : FMax.neon_unit_goal.test_neon_entail_wit_3_3.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_3;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_3_3;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_1 : FMax.neon_unit_goal.test_neon_entail_wit_4_1.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_1;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_1;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_2 : FMax.neon_unit_goal.test_neon_entail_wit_4_2.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_2;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_2;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_3 : FMax.neon_unit_goal.test_neon_entail_wit_4_3.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_3;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_4_3;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_1 : FMax.neon_unit_goal.test_neon_entail_wit_5_1.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_1;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_1;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_2 : FMax.neon_unit_goal.test_neon_entail_wit_5_2.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_2;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_2;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_3 : FMax.neon_unit_goal.test_neon_entail_wit_5_3.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_3;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_5_3;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : FMax.neon_unit_goal.test_neon_entail_wit_6_1.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_1;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_1;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_2 : FMax.neon_unit_goal.test_neon_entail_wit_6_2.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_2;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_2;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : FMax.neon_unit_goal.test_neon_entail_wit_6_3.
Proof. first[solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_3;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;subst batch;repeat match goal with H: context[Z.land] |- _ => vm_compute in H end;exfalso;congruence]
 |solve[unfold FMax.neon_unit_goal.test_neon_entail_wit_6_3;intros;try(Exists k);try(Exists k_2);cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;entailer!]]. Qed.
End CheckedNeonBranches.
