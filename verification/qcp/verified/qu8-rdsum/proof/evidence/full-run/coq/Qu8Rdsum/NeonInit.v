From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import NeonCallsTactics NeonInitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_1 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_1;left;intros;rd_limits.
 rd_array_ranges;rewrite Z.sub_diag,rd_partial_initial;unfold rd_u64;entailer!;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_21 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_21.
Proof.
 unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_21;left;intros;rd_limits.
 unfold rd_ptr_gate,rd_u64;entailer!;lia.
Qed.
Ltac rd_initial_pointers k :=
 rd_map_ranges;
 unfold rd_u64;repeat rewrite unsigned_unsigned_add_l by lia;
 repeat rewrite unsigned_unsigned_add_r by lia;
 repeat rewrite Z.sub_diag;rd_limits;
 match goal with Hin:rd_inputs ?M ?base ?rows ?Ch ?stride,
 HA:(forall q,rd_present ?M q ->0<=q<=18446744073709551615) |- _ =>
 let HB:=fresh "HInputBound"in pose proof(rd_input_offset_bounds M base rows Ch stride k HA Hin ltac:(lia)ltac:(lia)ltac:(lia))as HB;
 let E:=fresh "EInput"in assert(E:unsigned_last_nbits(base+k)64=base+k)by(apply unsigned_last_nbits_eq;change(0<=base+k<18446744073709551616);lia);rewrite E
 end.
Lemma proof_of_test_neon_entail_wit_2 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_2;left;intros;rd_limits;subst input output input_increment.
 rewrite Z.sub_diag;rd_limits;rewrite !rd_acc32_zero.
 unfold rd_progress,rd_mod252,rd_ptr_gate.
 rd_initial_pointers (channels_pre-channels);entailer!;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Lemma proof_of_test_neon_entail_wit_22 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_22.
Proof.
 unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_22;left;intros;rd_limits;subst retval input_increment.
 assert(Hc:0<channels)by lia.
 apply rd_gate_live in PreH21;[|assumption];apply rd_gate_live in PreH22;[|assumption];subst input output.
 rewrite Z.sub_diag;rd_limits;rewrite !rd_acc32_zero.
 unfold rd_progress,rd_mod252,rd_ptr_gate.
 rd_initial_pointers (channels_pre-channels);entailer!;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
Print Assumptions proof_of_test_neon_entail_wit_21.
Print Assumptions proof_of_test_neon_entail_wit_2.
Print Assumptions proof_of_test_neon_entail_wit_22.
