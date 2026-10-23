From Coq Require Import ZArith Lia.
From Qs8Cvt Require Import Types FastFrame neon_qcp_cvt_movlow_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8Cvt.neon_qcp_cvt_movlow_goal.VC_Correct.
Lemma proof_of_qcp_cvt_movlow_return_wit_1 : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_return_wit_1.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_return_wit_1;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_1_pure : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_1_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_1 : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_1.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_1, Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_1_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_2 : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_2.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_2;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_3_pure : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_3_pure.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_3_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_3 : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_3.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_3, Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_3_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_cvt_movlow_partial_solve_wit_4 : Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_4.
Proof. unfold Qs8Cvt.neon_qcp_cvt_movlow_goal.qcp_cvt_movlow_partial_solve_wit_4;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
End Checked.
