From Coq Require Import ZArith Lia.
From FMax Require Import Bits Model Types VectorModel VectorFastFrame borrow_compare_goal.
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
Module CheckedBorrow : borrow_compare_goal.VC_Correct.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_1 : qcp_fmax_vmfne_borrow_safety_wit_1.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_1; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_2 : qcp_fmax_vmfne_borrow_safety_wit_2.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_2; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_3 : qcp_fmax_vmfne_borrow_safety_wit_3.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_3; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_4 : qcp_fmax_vmfne_borrow_safety_wit_4.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_4; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_5 : qcp_fmax_vmfne_borrow_safety_wit_5.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_5; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_6 : qcp_fmax_vmfne_borrow_safety_wit_6.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_6; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_7 : qcp_fmax_vmfne_borrow_safety_wit_7.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_7; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_8 : qcp_fmax_vmfne_borrow_safety_wit_8.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_8; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_9 : qcp_fmax_vmfne_borrow_safety_wit_9.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_9; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_10 : qcp_fmax_vmfne_borrow_safety_wit_10.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_10; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_11 : qcp_fmax_vmfne_borrow_safety_wit_11.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_11; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_12 : qcp_fmax_vmfne_borrow_safety_wit_12.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_12; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_13 : qcp_fmax_vmfne_borrow_safety_wit_13.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_13; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_14 : qcp_fmax_vmfne_borrow_safety_wit_14.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_14; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_15 : qcp_fmax_vmfne_borrow_safety_wit_15.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_15; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_16 : qcp_fmax_vmfne_borrow_safety_wit_16.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_16; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_17 : qcp_fmax_vmfne_borrow_safety_wit_17.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_17; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_18 : qcp_fmax_vmfne_borrow_safety_wit_18.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_18; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_19 : qcp_fmax_vmfne_borrow_safety_wit_19.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_19; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_20 : qcp_fmax_vmfne_borrow_safety_wit_20.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_20; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_21 : qcp_fmax_vmfne_borrow_safety_wit_21.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_21; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_22 : qcp_fmax_vmfne_borrow_safety_wit_22.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_22; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_23 : qcp_fmax_vmfne_borrow_safety_wit_23.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_23; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_24 : qcp_fmax_vmfne_borrow_safety_wit_24.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_24; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_25 : qcp_fmax_vmfne_borrow_safety_wit_25.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_25; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_26 : qcp_fmax_vmfne_borrow_safety_wit_26.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_26; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_27 : qcp_fmax_vmfne_borrow_safety_wit_27.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_27; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_28 : qcp_fmax_vmfne_borrow_safety_wit_28.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_28; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_29 : qcp_fmax_vmfne_borrow_safety_wit_29.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_29; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_30 : qcp_fmax_vmfne_borrow_safety_wit_30.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_30; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_31 : qcp_fmax_vmfne_borrow_safety_wit_31.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_31; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_32 : qcp_fmax_vmfne_borrow_safety_wit_32.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_32; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_33 : qcp_fmax_vmfne_borrow_safety_wit_33.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_33; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_34 : qcp_fmax_vmfne_borrow_safety_wit_34.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_34; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_35 : qcp_fmax_vmfne_borrow_safety_wit_35.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_35; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_36 : qcp_fmax_vmfne_borrow_safety_wit_36.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_36; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_37 : qcp_fmax_vmfne_borrow_safety_wit_37.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_37; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_38 : qcp_fmax_vmfne_borrow_safety_wit_38.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_38; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_39 : qcp_fmax_vmfne_borrow_safety_wit_39.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_39; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_40 : qcp_fmax_vmfne_borrow_safety_wit_40.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_40; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_41 : qcp_fmax_vmfne_borrow_safety_wit_41.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_41; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_42 : qcp_fmax_vmfne_borrow_safety_wit_42.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_42; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_43 : qcp_fmax_vmfne_borrow_safety_wit_43.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_43; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_44 : qcp_fmax_vmfne_borrow_safety_wit_44.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_44; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_45 : qcp_fmax_vmfne_borrow_safety_wit_45.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_45; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_46 : qcp_fmax_vmfne_borrow_safety_wit_46.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_46; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_47 : qcp_fmax_vmfne_borrow_safety_wit_47.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_47; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_48 : qcp_fmax_vmfne_borrow_safety_wit_48.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_48; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_49 : qcp_fmax_vmfne_borrow_safety_wit_49.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_49; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_50 : qcp_fmax_vmfne_borrow_safety_wit_50.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_50; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_51 : qcp_fmax_vmfne_borrow_safety_wit_51.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_51; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_52 : qcp_fmax_vmfne_borrow_safety_wit_52.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_52; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_53 : qcp_fmax_vmfne_borrow_safety_wit_53.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_53; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_54 : qcp_fmax_vmfne_borrow_safety_wit_54.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_54; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_55 : qcp_fmax_vmfne_borrow_safety_wit_55.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_55; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_56 : qcp_fmax_vmfne_borrow_safety_wit_56.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_56; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_57 : qcp_fmax_vmfne_borrow_safety_wit_57.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_57; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_58 : qcp_fmax_vmfne_borrow_safety_wit_58.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_58; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_59 : qcp_fmax_vmfne_borrow_safety_wit_59.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_59; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_60 : qcp_fmax_vmfne_borrow_safety_wit_60.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_60; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_61 : qcp_fmax_vmfne_borrow_safety_wit_61.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_61; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_62 : qcp_fmax_vmfne_borrow_safety_wit_62.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_62; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_63 : qcp_fmax_vmfne_borrow_safety_wit_63.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_63; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_64 : qcp_fmax_vmfne_borrow_safety_wit_64.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_64; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_65 : qcp_fmax_vmfne_borrow_safety_wit_65.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_65; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_safety_wit_66 : qcp_fmax_vmfne_borrow_safety_wit_66.
Proof. unfold qcp_fmax_vmfne_borrow_safety_wit_66; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_return_wit_1 : qcp_fmax_vmfne_borrow_return_wit_1.
Proof. unfold qcp_fmax_vmfne_borrow_return_wit_1; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_return_wit_2 : qcp_fmax_vmfne_borrow_return_wit_2.
Proof. unfold qcp_fmax_vmfne_borrow_return_wit_2; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_1_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_1_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_1_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_1 : qcp_fmax_vmfne_borrow_partial_solve_wit_1.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_1, qcp_fmax_vmfne_borrow_partial_solve_wit_1_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_2_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_2_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_2_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_2 : qcp_fmax_vmfne_borrow_partial_solve_wit_2.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_2, qcp_fmax_vmfne_borrow_partial_solve_wit_2_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_3_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_3_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_3_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_3 : qcp_fmax_vmfne_borrow_partial_solve_wit_3.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_3, qcp_fmax_vmfne_borrow_partial_solve_wit_3_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_4_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_4_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_4_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_4 : qcp_fmax_vmfne_borrow_partial_solve_wit_4.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_4, qcp_fmax_vmfne_borrow_partial_solve_wit_4_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_5_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_5_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_5_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_5 : qcp_fmax_vmfne_borrow_partial_solve_wit_5.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_5, qcp_fmax_vmfne_borrow_partial_solve_wit_5_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_6_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_6_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_6_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_6 : qcp_fmax_vmfne_borrow_partial_solve_wit_6.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_6, qcp_fmax_vmfne_borrow_partial_solve_wit_6_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_7_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_7_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_7_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_7 : qcp_fmax_vmfne_borrow_partial_solve_wit_7.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_7, qcp_fmax_vmfne_borrow_partial_solve_wit_7_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_8_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_8_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_8_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_8 : qcp_fmax_vmfne_borrow_partial_solve_wit_8.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_8, qcp_fmax_vmfne_borrow_partial_solve_wit_8_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_9_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_9_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_9_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_9 : qcp_fmax_vmfne_borrow_partial_solve_wit_9.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_9, qcp_fmax_vmfne_borrow_partial_solve_wit_9_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_10_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_10_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_10_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_10 : qcp_fmax_vmfne_borrow_partial_solve_wit_10.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_10, qcp_fmax_vmfne_borrow_partial_solve_wit_10_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_11_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_11_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_11_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_11 : qcp_fmax_vmfne_borrow_partial_solve_wit_11.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_11, qcp_fmax_vmfne_borrow_partial_solve_wit_11_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_12_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_12_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_12_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_12 : qcp_fmax_vmfne_borrow_partial_solve_wit_12.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_12, qcp_fmax_vmfne_borrow_partial_solve_wit_12_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_13_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_13_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_13_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_13 : qcp_fmax_vmfne_borrow_partial_solve_wit_13.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_13, qcp_fmax_vmfne_borrow_partial_solve_wit_13_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_14_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_14_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_14_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_14 : qcp_fmax_vmfne_borrow_partial_solve_wit_14.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_14, qcp_fmax_vmfne_borrow_partial_solve_wit_14_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_15_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_15_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_15_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_15 : qcp_fmax_vmfne_borrow_partial_solve_wit_15.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_15, qcp_fmax_vmfne_borrow_partial_solve_wit_15_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_16_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_16_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_16_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_16 : qcp_fmax_vmfne_borrow_partial_solve_wit_16.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_16, qcp_fmax_vmfne_borrow_partial_solve_wit_16_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_17_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_17_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_17_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_17 : qcp_fmax_vmfne_borrow_partial_solve_wit_17.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_17, qcp_fmax_vmfne_borrow_partial_solve_wit_17_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_18_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_18_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_18_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_18 : qcp_fmax_vmfne_borrow_partial_solve_wit_18.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_18, qcp_fmax_vmfne_borrow_partial_solve_wit_18_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_19_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_19_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_19_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_19 : qcp_fmax_vmfne_borrow_partial_solve_wit_19.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_19, qcp_fmax_vmfne_borrow_partial_solve_wit_19_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_20_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_20_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_20_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_20 : qcp_fmax_vmfne_borrow_partial_solve_wit_20.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_20, qcp_fmax_vmfne_borrow_partial_solve_wit_20_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_21_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_21_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_21_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_21 : qcp_fmax_vmfne_borrow_partial_solve_wit_21.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_21, qcp_fmax_vmfne_borrow_partial_solve_wit_21_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_22_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_22_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_22_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_22 : qcp_fmax_vmfne_borrow_partial_solve_wit_22.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_22, qcp_fmax_vmfne_borrow_partial_solve_wit_22_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_23_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_23_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_23_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_23 : qcp_fmax_vmfne_borrow_partial_solve_wit_23.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_23, qcp_fmax_vmfne_borrow_partial_solve_wit_23_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_24_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_24_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_24_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_24 : qcp_fmax_vmfne_borrow_partial_solve_wit_24.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_24, qcp_fmax_vmfne_borrow_partial_solve_wit_24_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_25_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_25_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_25_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_25 : qcp_fmax_vmfne_borrow_partial_solve_wit_25.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_25, qcp_fmax_vmfne_borrow_partial_solve_wit_25_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_26_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_26_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_26_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_26 : qcp_fmax_vmfne_borrow_partial_solve_wit_26.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_26, qcp_fmax_vmfne_borrow_partial_solve_wit_26_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_27_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_27_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_27_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_27 : qcp_fmax_vmfne_borrow_partial_solve_wit_27.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_27, qcp_fmax_vmfne_borrow_partial_solve_wit_27_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_28_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_28_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_28_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_28 : qcp_fmax_vmfne_borrow_partial_solve_wit_28.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_28, qcp_fmax_vmfne_borrow_partial_solve_wit_28_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_29_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_29_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_29_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_29 : qcp_fmax_vmfne_borrow_partial_solve_wit_29.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_29, qcp_fmax_vmfne_borrow_partial_solve_wit_29_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_30_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_30_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_30_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_30 : qcp_fmax_vmfne_borrow_partial_solve_wit_30.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_30, qcp_fmax_vmfne_borrow_partial_solve_wit_30_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_31_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_31_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_31_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_31 : qcp_fmax_vmfne_borrow_partial_solve_wit_31.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_31, qcp_fmax_vmfne_borrow_partial_solve_wit_31_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_32_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_32_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_32_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_32 : qcp_fmax_vmfne_borrow_partial_solve_wit_32.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_32, qcp_fmax_vmfne_borrow_partial_solve_wit_32_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_33_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_33_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_33_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_33 : qcp_fmax_vmfne_borrow_partial_solve_wit_33.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_33, qcp_fmax_vmfne_borrow_partial_solve_wit_33_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_34_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_34_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_34_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_34 : qcp_fmax_vmfne_borrow_partial_solve_wit_34.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_34, qcp_fmax_vmfne_borrow_partial_solve_wit_34_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_35_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_35_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_35_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_35 : qcp_fmax_vmfne_borrow_partial_solve_wit_35.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_35, qcp_fmax_vmfne_borrow_partial_solve_wit_35_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_36_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_36_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_36_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_36 : qcp_fmax_vmfne_borrow_partial_solve_wit_36.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_36, qcp_fmax_vmfne_borrow_partial_solve_wit_36_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_37_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_37_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_37_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_37 : qcp_fmax_vmfne_borrow_partial_solve_wit_37.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_37, qcp_fmax_vmfne_borrow_partial_solve_wit_37_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_38_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_38_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_38_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_38 : qcp_fmax_vmfne_borrow_partial_solve_wit_38.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_38, qcp_fmax_vmfne_borrow_partial_solve_wit_38_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_39_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_39_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_39_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_39 : qcp_fmax_vmfne_borrow_partial_solve_wit_39.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_39, qcp_fmax_vmfne_borrow_partial_solve_wit_39_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_40_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_40_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_40_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_40 : qcp_fmax_vmfne_borrow_partial_solve_wit_40.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_40, qcp_fmax_vmfne_borrow_partial_solve_wit_40_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_41_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_41_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_41_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_41 : qcp_fmax_vmfne_borrow_partial_solve_wit_41.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_41, qcp_fmax_vmfne_borrow_partial_solve_wit_41_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_42_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_42_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_42_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_42 : qcp_fmax_vmfne_borrow_partial_solve_wit_42.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_42, qcp_fmax_vmfne_borrow_partial_solve_wit_42_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_43_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_43_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_43_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_43 : qcp_fmax_vmfne_borrow_partial_solve_wit_43.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_43, qcp_fmax_vmfne_borrow_partial_solve_wit_43_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_44_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_44_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_44_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_44 : qcp_fmax_vmfne_borrow_partial_solve_wit_44.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_44, qcp_fmax_vmfne_borrow_partial_solve_wit_44_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_45_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_45_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_45_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_45 : qcp_fmax_vmfne_borrow_partial_solve_wit_45.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_45, qcp_fmax_vmfne_borrow_partial_solve_wit_45_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_46_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_46_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_46_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_46 : qcp_fmax_vmfne_borrow_partial_solve_wit_46.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_46, qcp_fmax_vmfne_borrow_partial_solve_wit_46_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_47_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_47_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_47_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_47 : qcp_fmax_vmfne_borrow_partial_solve_wit_47.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_47, qcp_fmax_vmfne_borrow_partial_solve_wit_47_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_48_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_48_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_48_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_48 : qcp_fmax_vmfne_borrow_partial_solve_wit_48.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_48, qcp_fmax_vmfne_borrow_partial_solve_wit_48_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_49_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_49_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_49_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_49 : qcp_fmax_vmfne_borrow_partial_solve_wit_49.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_49, qcp_fmax_vmfne_borrow_partial_solve_wit_49_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_50_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_50_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_50_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_50 : qcp_fmax_vmfne_borrow_partial_solve_wit_50.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_50, qcp_fmax_vmfne_borrow_partial_solve_wit_50_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_51_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_51_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_51_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_51 : qcp_fmax_vmfne_borrow_partial_solve_wit_51.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_51, qcp_fmax_vmfne_borrow_partial_solve_wit_51_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_52_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_52_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_52_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_52 : qcp_fmax_vmfne_borrow_partial_solve_wit_52.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_52, qcp_fmax_vmfne_borrow_partial_solve_wit_52_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_53_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_53_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_53_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_53 : qcp_fmax_vmfne_borrow_partial_solve_wit_53.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_53, qcp_fmax_vmfne_borrow_partial_solve_wit_53_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_54_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_54_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_54_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_54 : qcp_fmax_vmfne_borrow_partial_solve_wit_54.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_54, qcp_fmax_vmfne_borrow_partial_solve_wit_54_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_55_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_55_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_55_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_55 : qcp_fmax_vmfne_borrow_partial_solve_wit_55.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_55, qcp_fmax_vmfne_borrow_partial_solve_wit_55_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_56_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_56_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_56_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_56 : qcp_fmax_vmfne_borrow_partial_solve_wit_56.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_56, qcp_fmax_vmfne_borrow_partial_solve_wit_56_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_57_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_57_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_57_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_57 : qcp_fmax_vmfne_borrow_partial_solve_wit_57.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_57, qcp_fmax_vmfne_borrow_partial_solve_wit_57_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_58_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_58_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_58_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_58 : qcp_fmax_vmfne_borrow_partial_solve_wit_58.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_58, qcp_fmax_vmfne_borrow_partial_solve_wit_58_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_59_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_59_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_59_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_59 : qcp_fmax_vmfne_borrow_partial_solve_wit_59.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_59, qcp_fmax_vmfne_borrow_partial_solve_wit_59_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_60_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_60_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_60_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_60 : qcp_fmax_vmfne_borrow_partial_solve_wit_60.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_60, qcp_fmax_vmfne_borrow_partial_solve_wit_60_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_61_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_61_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_61_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_61 : qcp_fmax_vmfne_borrow_partial_solve_wit_61.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_61, qcp_fmax_vmfne_borrow_partial_solve_wit_61_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_62_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_62_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_62_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_62 : qcp_fmax_vmfne_borrow_partial_solve_wit_62.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_62, qcp_fmax_vmfne_borrow_partial_solve_wit_62_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_63_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_63_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_63_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_63 : qcp_fmax_vmfne_borrow_partial_solve_wit_63.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_63, qcp_fmax_vmfne_borrow_partial_solve_wit_63_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_64_pure : qcp_fmax_vmfne_borrow_partial_solve_wit_64_pure.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_64_pure; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_64 : qcp_fmax_vmfne_borrow_partial_solve_wit_64.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_64, qcp_fmax_vmfne_borrow_partial_solve_wit_64_aux; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_65 : qcp_fmax_vmfne_borrow_partial_solve_wit_65.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_65; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
Lemma proof_of_qcp_fmax_vmfne_borrow_partial_solve_wit_66 : qcp_fmax_vmfne_borrow_partial_solve_wit_66.
Proof. unfold qcp_fmax_vmfne_borrow_partial_solve_wit_66; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]. Qed.
End CheckedBorrow.
