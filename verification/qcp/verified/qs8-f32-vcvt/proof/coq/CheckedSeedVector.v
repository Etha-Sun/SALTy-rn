From Coq Require Import ZArith Lia.
From Qs8Cvt Require Import Types FastFrame vector_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedSeedVector : Qs8Cvt.vector_primitives_goal.VC_Correct.
Lemma proof_of_vdupq_n_s16_return_wit_1 : Qs8Cvt.vector_primitives_goal.vdupq_n_s16_return_wit_1.
Proof. unfold Qs8Cvt.vector_primitives_goal.vdupq_n_s16_return_wit_1;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_vdupq_n_s16_partial_solve_wit_1 : Qs8Cvt.vector_primitives_goal.vdupq_n_s16_partial_solve_wit_1.
Proof. unfold Qs8Cvt.vector_primitives_goal.vdupq_n_s16_partial_solve_wit_1;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
End CheckedSeedVector.
