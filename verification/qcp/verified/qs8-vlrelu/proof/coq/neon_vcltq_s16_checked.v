From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame LreluModel neon_vcltq_s16_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8Lrelu.neon_vcltq_s16_goal.VC_Correct.
Lemma proof_of_vcltq_s16_return_wit_1 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_return_wit_1.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_return_wit_1;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_1_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_1_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_1_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_1 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_1, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_1_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_2_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_2_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_2_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_2 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_2.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_2, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_2_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_3_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_3_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_3_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_3 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_3.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_3, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_3_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_4_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_4_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_4_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_4 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_4.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_4, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_4_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_5_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_5_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_5_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_5 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_5.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_5, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_5_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_6_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_6_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_6_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_6 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_6.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_6, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_6_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_7_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_7_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_7_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_7 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_7.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_7, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_7_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_8_pure : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_8_pure.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_8_pure;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_8 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_8.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_8, Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_8_aux;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of_vcltq_s16_partial_solve_wit_9 : Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_9.
Proof. unfold Qs8Lrelu.neon_vcltq_s16_goal.vcltq_s16_partial_solve_wit_9;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
End Checked.
