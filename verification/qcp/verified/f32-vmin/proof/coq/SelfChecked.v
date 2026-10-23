From Coq Require Import ZArith Lia.
From FMin Require Import Bits Types VectorModel VectorFastFrame self_compare_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac self_frame :=
 unfold UndefStructPredvbool4_t;rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedSelf : self_compare_goal.VC_Correct.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_1 : qcp_fmin_vmfne_self_borrow_safety_wit_1.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_1;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_2 : qcp_fmin_vmfne_self_borrow_safety_wit_2.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_2;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_3 : qcp_fmin_vmfne_self_borrow_safety_wit_3.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_3;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_4 : qcp_fmin_vmfne_self_borrow_safety_wit_4.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_4;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_5 : qcp_fmin_vmfne_self_borrow_safety_wit_5.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_5;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_6 : qcp_fmin_vmfne_self_borrow_safety_wit_6.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_6;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_7 : qcp_fmin_vmfne_self_borrow_safety_wit_7.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_7;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_8 : qcp_fmin_vmfne_self_borrow_safety_wit_8.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_8;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_9 : qcp_fmin_vmfne_self_borrow_safety_wit_9.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_9;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_10 : qcp_fmin_vmfne_self_borrow_safety_wit_10.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_10;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_11 : qcp_fmin_vmfne_self_borrow_safety_wit_11.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_11;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_12 : qcp_fmin_vmfne_self_borrow_safety_wit_12.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_12;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_13 : qcp_fmin_vmfne_self_borrow_safety_wit_13.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_13;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_14 : qcp_fmin_vmfne_self_borrow_safety_wit_14.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_14;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_15 : qcp_fmin_vmfne_self_borrow_safety_wit_15.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_15;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_16 : qcp_fmin_vmfne_self_borrow_safety_wit_16.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_16;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_17 : qcp_fmin_vmfne_self_borrow_safety_wit_17.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_17;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_18 : qcp_fmin_vmfne_self_borrow_safety_wit_18.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_18;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_19 : qcp_fmin_vmfne_self_borrow_safety_wit_19.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_19;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_20 : qcp_fmin_vmfne_self_borrow_safety_wit_20.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_20;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_21 : qcp_fmin_vmfne_self_borrow_safety_wit_21.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_21;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_22 : qcp_fmin_vmfne_self_borrow_safety_wit_22.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_22;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_23 : qcp_fmin_vmfne_self_borrow_safety_wit_23.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_23;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_24 : qcp_fmin_vmfne_self_borrow_safety_wit_24.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_24;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_25 : qcp_fmin_vmfne_self_borrow_safety_wit_25.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_25;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_26 : qcp_fmin_vmfne_self_borrow_safety_wit_26.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_26;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_27 : qcp_fmin_vmfne_self_borrow_safety_wit_27.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_27;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_28 : qcp_fmin_vmfne_self_borrow_safety_wit_28.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_28;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_29 : qcp_fmin_vmfne_self_borrow_safety_wit_29.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_29;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_30 : qcp_fmin_vmfne_self_borrow_safety_wit_30.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_30;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_31 : qcp_fmin_vmfne_self_borrow_safety_wit_31.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_31;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_safety_wit_32 : qcp_fmin_vmfne_self_borrow_safety_wit_32.
Proof. unfold qcp_fmin_vmfne_self_borrow_safety_wit_32;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_return_wit_1 : qcp_fmin_vmfne_self_borrow_return_wit_1.
Proof. unfold qcp_fmin_vmfne_self_borrow_return_wit_1;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_1 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_1.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_1;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_2_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_2_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_2_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_2 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_2.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_2, qcp_fmin_vmfne_self_borrow_partial_solve_wit_2_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_3 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_3.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_3;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_4_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_4_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_4_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_4 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_4.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_4, qcp_fmin_vmfne_self_borrow_partial_solve_wit_4_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_5 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_5.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_5;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_6_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_6_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_6_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_6 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_6.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_6, qcp_fmin_vmfne_self_borrow_partial_solve_wit_6_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_7 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_7.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_7;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_8_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_8_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_8_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_8 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_8.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_8, qcp_fmin_vmfne_self_borrow_partial_solve_wit_8_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_9 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_9.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_9;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_10_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_10_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_10_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_10 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_10.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_10, qcp_fmin_vmfne_self_borrow_partial_solve_wit_10_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_11 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_11.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_11;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_12_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_12_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_12_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_12 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_12.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_12, qcp_fmin_vmfne_self_borrow_partial_solve_wit_12_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_13 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_13.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_13;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_14_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_14_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_14_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_14 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_14.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_14, qcp_fmin_vmfne_self_borrow_partial_solve_wit_14_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_15 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_15.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_15;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_16_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_16_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_16_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_16 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_16.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_16, qcp_fmin_vmfne_self_borrow_partial_solve_wit_16_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_17 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_17.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_17;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_18_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_18_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_18_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_18 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_18.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_18, qcp_fmin_vmfne_self_borrow_partial_solve_wit_18_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_19 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_19.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_19;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_20_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_20_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_20_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_20 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_20.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_20, qcp_fmin_vmfne_self_borrow_partial_solve_wit_20_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_21 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_21.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_21;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_22_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_22_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_22_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_22 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_22.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_22, qcp_fmin_vmfne_self_borrow_partial_solve_wit_22_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_23 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_23.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_23;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_24_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_24_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_24_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_24 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_24.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_24, qcp_fmin_vmfne_self_borrow_partial_solve_wit_24_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_25 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_25.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_25;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_26_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_26_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_26_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_26 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_26.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_26, qcp_fmin_vmfne_self_borrow_partial_solve_wit_26_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_27 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_27.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_27;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_28_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_28_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_28_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_28 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_28.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_28, qcp_fmin_vmfne_self_borrow_partial_solve_wit_28_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_29 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_29.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_29;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_30_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_30_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_30_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_30 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_30.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_30, qcp_fmin_vmfne_self_borrow_partial_solve_wit_30_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_31 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_31.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_31;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_32_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_32_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_32_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_32 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_32.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_32, qcp_fmin_vmfne_self_borrow_partial_solve_wit_32_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_33 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_33.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_33;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_34_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_34_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_34_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_34 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_34.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_34, qcp_fmin_vmfne_self_borrow_partial_solve_wit_34_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_35 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_35.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_35;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_36_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_36_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_36_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_36 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_36.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_36, qcp_fmin_vmfne_self_borrow_partial_solve_wit_36_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_37 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_37.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_37;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_38_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_38_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_38_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_38 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_38.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_38, qcp_fmin_vmfne_self_borrow_partial_solve_wit_38_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_39 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_39.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_39;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_40_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_40_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_40_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_40 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_40.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_40, qcp_fmin_vmfne_self_borrow_partial_solve_wit_40_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_41 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_41.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_41;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_42_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_42_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_42_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_42 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_42.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_42, qcp_fmin_vmfne_self_borrow_partial_solve_wit_42_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_43 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_43.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_43;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_44_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_44_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_44_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_44 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_44.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_44, qcp_fmin_vmfne_self_borrow_partial_solve_wit_44_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_45 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_45.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_45;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_46_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_46_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_46_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_46 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_46.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_46, qcp_fmin_vmfne_self_borrow_partial_solve_wit_46_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_47 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_47.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_47;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_48_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_48_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_48_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_48 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_48.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_48, qcp_fmin_vmfne_self_borrow_partial_solve_wit_48_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_49 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_49.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_49;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_50_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_50_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_50_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_50 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_50.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_50, qcp_fmin_vmfne_self_borrow_partial_solve_wit_50_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_51 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_51.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_51;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_52_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_52_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_52_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_52 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_52.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_52, qcp_fmin_vmfne_self_borrow_partial_solve_wit_52_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_53 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_53.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_53;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_54_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_54_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_54_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_54 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_54.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_54, qcp_fmin_vmfne_self_borrow_partial_solve_wit_54_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_55 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_55.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_55;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_56_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_56_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_56_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_56 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_56.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_56, qcp_fmin_vmfne_self_borrow_partial_solve_wit_56_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_57 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_57.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_57;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_58_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_58_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_58_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_58 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_58.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_58, qcp_fmin_vmfne_self_borrow_partial_solve_wit_58_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_59 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_59.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_59;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_60_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_60_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_60_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_60 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_60.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_60, qcp_fmin_vmfne_self_borrow_partial_solve_wit_60_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_61 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_61.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_61;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_62_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_62_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_62_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_62 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_62.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_62, qcp_fmin_vmfne_self_borrow_partial_solve_wit_62_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_63 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_63.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_63;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_64_pure : qcp_fmin_vmfne_self_borrow_partial_solve_wit_64_pure.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_64_pure;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_64 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_64.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_64, qcp_fmin_vmfne_self_borrow_partial_solve_wit_64_aux;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
Lemma proof_of_qcp_fmin_vmfne_self_borrow_partial_solve_wit_65 : qcp_fmin_vmfne_self_borrow_partial_solve_wit_65.
Proof. unfold qcp_fmin_vmfne_self_borrow_partial_solve_wit_65;try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
End CheckedSelf.
