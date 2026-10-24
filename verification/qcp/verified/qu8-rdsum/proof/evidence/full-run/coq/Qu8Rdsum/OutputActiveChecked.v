From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rdsum Require Import OutputModel output_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedOutputActive : Qu8Rdsum.output_active_goal.VC_Correct.
Lemma proof_of_rdsum_output_lane_safety_wit_1 : Qu8Rdsum.output_active_goal.rdsum_output_lane_safety_wit_1.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_output_lane_safety_wit_1;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_output_lane_return_wit_1 : Qu8Rdsum.output_active_goal.rdsum_output_lane_return_wit_1.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_output_lane_return_wit_1;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_output_lane_return_wit_2 : Qu8Rdsum.output_active_goal.rdsum_output_lane_return_wit_2.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_output_lane_return_wit_2;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_output_lane_partial_solve_wit_1_pure : Qu8Rdsum.output_active_goal.rdsum_output_lane_partial_solve_wit_1_pure.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_output_lane_partial_solve_wit_1_pure;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_output_lane_partial_solve_wit_1 : Qu8Rdsum.output_active_goal.rdsum_output_lane_partial_solve_wit_1.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_output_lane_partial_solve_wit_1, Qu8Rdsum.output_active_goal.rdsum_output_lane_partial_solve_wit_1_aux;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_store_lane_return_wit_1 : Qu8Rdsum.output_active_goal.rdsum_store_lane_return_wit_1.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_store_lane_return_wit_1;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_store_lane_return_wit_2 : Qu8Rdsum.output_active_goal.rdsum_store_lane_return_wit_2.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_store_lane_return_wit_2;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_store_lane_partial_solve_wit_1_pure : Qu8Rdsum.output_active_goal.rdsum_store_lane_partial_solve_wit_1_pure.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_store_lane_partial_solve_wit_1_pure;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
Lemma proof_of_rdsum_store_lane_partial_solve_wit_1 : Qu8Rdsum.output_active_goal.rdsum_store_lane_partial_solve_wit_1.
Proof. unfold Qu8Rdsum.output_active_goal.rdsum_store_lane_partial_solve_wit_1, Qu8Rdsum.output_active_goal.rdsum_store_lane_partial_solve_wit_1_aux;try left;intros;rewrite ?sizeof_uint in *;try change Int.max_signed with 4294967295 in *;try change Int.min_signed with (0) in *;unfold rd_out_lane,rd_store_lane;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)end;entailer!;lia. Qed.
End CheckedOutputActive.
