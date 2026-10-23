From Coq Require Import ZArith Lia.
From FMax Require Import Bits Model Types VectorModel VectorFastFrame vector_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac vector_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredvfloat32m8_t, UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;
  repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedVectorMerge.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_1 : __riscv_vmerge_vvm_f32m8_safety_wit_1.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_1; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_2 : __riscv_vmerge_vvm_f32m8_safety_wit_2.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_2; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_3 : __riscv_vmerge_vvm_f32m8_safety_wit_3.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_3; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_4 : __riscv_vmerge_vvm_f32m8_safety_wit_4.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_4; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_5 : __riscv_vmerge_vvm_f32m8_safety_wit_5.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_5; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_6 : __riscv_vmerge_vvm_f32m8_safety_wit_6.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_6; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_7 : __riscv_vmerge_vvm_f32m8_safety_wit_7.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_7; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_8 : __riscv_vmerge_vvm_f32m8_safety_wit_8.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_8; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_9 : __riscv_vmerge_vvm_f32m8_safety_wit_9.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_9; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_10 : __riscv_vmerge_vvm_f32m8_safety_wit_10.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_10; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_11 : __riscv_vmerge_vvm_f32m8_safety_wit_11.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_11; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_12 : __riscv_vmerge_vvm_f32m8_safety_wit_12.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_12; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_13 : __riscv_vmerge_vvm_f32m8_safety_wit_13.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_13; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_14 : __riscv_vmerge_vvm_f32m8_safety_wit_14.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_14; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_15 : __riscv_vmerge_vvm_f32m8_safety_wit_15.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_15; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_16 : __riscv_vmerge_vvm_f32m8_safety_wit_16.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_16; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_17 : __riscv_vmerge_vvm_f32m8_safety_wit_17.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_17; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_18 : __riscv_vmerge_vvm_f32m8_safety_wit_18.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_18; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_19 : __riscv_vmerge_vvm_f32m8_safety_wit_19.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_19; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_20 : __riscv_vmerge_vvm_f32m8_safety_wit_20.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_20; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_21 : __riscv_vmerge_vvm_f32m8_safety_wit_21.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_21; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_22 : __riscv_vmerge_vvm_f32m8_safety_wit_22.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_22; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_23 : __riscv_vmerge_vvm_f32m8_safety_wit_23.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_23; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_24 : __riscv_vmerge_vvm_f32m8_safety_wit_24.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_24; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_25 : __riscv_vmerge_vvm_f32m8_safety_wit_25.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_25; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_26 : __riscv_vmerge_vvm_f32m8_safety_wit_26.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_26; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_27 : __riscv_vmerge_vvm_f32m8_safety_wit_27.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_27; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_28 : __riscv_vmerge_vvm_f32m8_safety_wit_28.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_28; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_29 : __riscv_vmerge_vvm_f32m8_safety_wit_29.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_29; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_30 : __riscv_vmerge_vvm_f32m8_safety_wit_30.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_30; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_31 : __riscv_vmerge_vvm_f32m8_safety_wit_31.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_31; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_safety_wit_32 : __riscv_vmerge_vvm_f32m8_safety_wit_32.
Proof. unfold __riscv_vmerge_vvm_f32m8_safety_wit_32; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_return_wit_1 : __riscv_vmerge_vvm_f32m8_return_wit_1.
Proof. unfold __riscv_vmerge_vvm_f32m8_return_wit_1; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_1_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_1_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_1_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_1 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_1.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_1, __riscv_vmerge_vvm_f32m8_partial_solve_wit_1_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_2_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_2_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_2_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_2 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_2.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_2, __riscv_vmerge_vvm_f32m8_partial_solve_wit_2_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_3_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_3_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_3_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_3 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_3.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_3, __riscv_vmerge_vvm_f32m8_partial_solve_wit_3_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_4_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_4_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_4_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_4 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_4.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_4, __riscv_vmerge_vvm_f32m8_partial_solve_wit_4_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_5_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_5_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_5_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_5 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_5.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_5, __riscv_vmerge_vvm_f32m8_partial_solve_wit_5_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_6_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_6_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_6_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_6 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_6.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_6, __riscv_vmerge_vvm_f32m8_partial_solve_wit_6_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_7_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_7_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_7_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_7 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_7.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_7, __riscv_vmerge_vvm_f32m8_partial_solve_wit_7_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_8_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_8_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_8_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_8 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_8.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_8, __riscv_vmerge_vvm_f32m8_partial_solve_wit_8_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_9_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_9_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_9_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_9 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_9.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_9, __riscv_vmerge_vvm_f32m8_partial_solve_wit_9_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_10_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_10_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_10_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_10 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_10.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_10, __riscv_vmerge_vvm_f32m8_partial_solve_wit_10_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_11_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_11_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_11_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_11 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_11.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_11, __riscv_vmerge_vvm_f32m8_partial_solve_wit_11_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_12_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_12_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_12_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_12 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_12.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_12, __riscv_vmerge_vvm_f32m8_partial_solve_wit_12_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_13_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_13_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_13_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_13 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_13.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_13, __riscv_vmerge_vvm_f32m8_partial_solve_wit_13_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_14_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_14_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_14_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_14 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_14.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_14, __riscv_vmerge_vvm_f32m8_partial_solve_wit_14_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_15_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_15_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_15_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_15 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_15.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_15, __riscv_vmerge_vvm_f32m8_partial_solve_wit_15_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_16_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_16_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_16_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_16 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_16.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_16, __riscv_vmerge_vvm_f32m8_partial_solve_wit_16_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_17_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_17_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_17_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_17 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_17.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_17, __riscv_vmerge_vvm_f32m8_partial_solve_wit_17_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_18_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_18_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_18_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_18 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_18.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_18, __riscv_vmerge_vvm_f32m8_partial_solve_wit_18_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_19_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_19_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_19_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_19 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_19.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_19, __riscv_vmerge_vvm_f32m8_partial_solve_wit_19_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_20_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_20_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_20_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_20 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_20.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_20, __riscv_vmerge_vvm_f32m8_partial_solve_wit_20_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_21_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_21_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_21_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_21 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_21.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_21, __riscv_vmerge_vvm_f32m8_partial_solve_wit_21_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_22_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_22_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_22_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_22 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_22.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_22, __riscv_vmerge_vvm_f32m8_partial_solve_wit_22_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_23_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_23_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_23_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_23 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_23.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_23, __riscv_vmerge_vvm_f32m8_partial_solve_wit_23_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_24_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_24_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_24_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_24 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_24.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_24, __riscv_vmerge_vvm_f32m8_partial_solve_wit_24_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_25_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_25_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_25_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_25 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_25.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_25, __riscv_vmerge_vvm_f32m8_partial_solve_wit_25_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_26_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_26_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_26_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_26 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_26.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_26, __riscv_vmerge_vvm_f32m8_partial_solve_wit_26_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_27_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_27_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_27_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_27 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_27.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_27, __riscv_vmerge_vvm_f32m8_partial_solve_wit_27_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_28_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_28_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_28_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_28 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_28.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_28, __riscv_vmerge_vvm_f32m8_partial_solve_wit_28_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_29_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_29_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_29_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_29 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_29.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_29, __riscv_vmerge_vvm_f32m8_partial_solve_wit_29_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_30_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_30_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_30_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_30 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_30.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_30, __riscv_vmerge_vvm_f32m8_partial_solve_wit_30_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_31_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_31_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_31_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_31 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_31.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_31, __riscv_vmerge_vvm_f32m8_partial_solve_wit_31_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_32_pure : __riscv_vmerge_vvm_f32m8_partial_solve_wit_32_pure.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_32_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_32 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_32.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_32, __riscv_vmerge_vvm_f32m8_partial_solve_wit_32_aux; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of___riscv_vmerge_vvm_f32m8_partial_solve_wit_33 : __riscv_vmerge_vvm_f32m8_partial_solve_wit_33.
Proof. unfold __riscv_vmerge_vvm_f32m8_partial_solve_wit_33; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
End CheckedVectorMerge.
