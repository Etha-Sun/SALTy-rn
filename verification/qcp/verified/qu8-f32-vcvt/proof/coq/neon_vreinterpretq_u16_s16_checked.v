From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame neon_vreinterpretq_u16_s16_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.VC_Correct.
Lemma proof_of_vreinterpretq_u16_s16_return_wit_1 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_return_wit_1.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_return_wit_1;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_1_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_1_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_1 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_1.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_1, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_1_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_2_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_2_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_2_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_2 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_2.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_2, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_2_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_3_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_3_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_3_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_3 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_3.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_3, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_3_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_4_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_4_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_4_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_4 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_4.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_4, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_4_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_5_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_5_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_5_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_5 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_5.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_5, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_5_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_6_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_6_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_6_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_6 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_6.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_6, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_6_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_7_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_7_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_7_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_7 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_7.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_7, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_7_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_8_pure : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_8_pure.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_8_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_8 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_8.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_8, Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_8_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vreinterpretq_u16_s16_partial_solve_wit_9 : Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_9.
Proof. unfold Qu8Cvt.neon_vreinterpretq_u16_s16_goal.vreinterpretq_u16_s16_partial_solve_wit_9;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
End Checked.
