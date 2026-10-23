From Coq Require Import ZArith Lia.
From Qs8I8Cvt Require Import Types NeonFrame neon_vdupq_n_s16_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8I8Cvt.neon_vdupq_n_s16_goal.VC_Correct.
Lemma proof_of_vdupq_n_s16_return_wit_1 : Qs8I8Cvt.neon_vdupq_n_s16_goal.vdupq_n_s16_return_wit_1.
Proof. unfold Qs8I8Cvt.neon_vdupq_n_s16_goal.vdupq_n_s16_return_wit_1;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vdupq_n_s16_partial_solve_wit_1 : Qs8I8Cvt.neon_vdupq_n_s16_goal.vdupq_n_s16_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.neon_vdupq_n_s16_goal.vdupq_n_s16_partial_solve_wit_1;try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
End Checked.
