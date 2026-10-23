From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame neon_seed_probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonSeedProbe : Qu8Cvt.neon_seed_probe_goal.VC_Correct.
Lemma proof_of_qcp_probe_neon_seed_return_wit_1 : Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_return_wit_1.
Proof. unfold Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_return_wit_1;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_probe_neon_seed_partial_solve_wit_1_pure : Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_1_pure;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_probe_neon_seed_partial_solve_wit_1 : Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_1.
Proof. unfold Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_1, Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_1_aux;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_probe_neon_seed_partial_solve_wit_2 : Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_2.
Proof. unfold Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_2;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_qcp_probe_neon_seed_partial_solve_wit_3 : Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_3.
Proof. unfold Qu8Cvt.neon_seed_probe_goal.qcp_probe_neon_seed_partial_solve_wit_3;try left;intros;
 unfold cvt_seed;rewrite ?signed_unsigned_revolutive_less by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try match goal with |- context[signed_last_nbits ?x 16]=>pose proof(signed_Lastnbits_range x 16 ltac:(lia))end;
 unfold UndefStructPredint16x8_t;rewrite ?local_field_address;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
End CheckedNeonSeedProbe.
