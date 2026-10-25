From Coq Require Import ZArith String Lia List.
From SimpleC.SL Require Import SeparationLogic.
From SpmmSpec Require Import TupleMemory tuple_strategy_proof.
From SpmmTupleProbe Require Import probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Include TupleChecked.
Lemma proof_of_tuple_probe_safety_wit_1 : tuple_probe_safety_wit_1.
Proof. unfold tuple_probe_safety_wit_1;intros;entailer!;unfold INT_MAX,INT_MIN;lia. Qed.
Lemma proof_of_tuple_probe_return_wit_1 : tuple_probe_return_wit_1.
Proof.
 unfold tuple_probe_return_wit_1;left;intros.
 cbn [tuple_at tuple_values Z.to_nat nth f0];entailer!.
Qed.
Lemma proof_of_tuple_probe_partial_solve_wit_1 : tuple_probe_partial_solve_wit_1.
Proof. unfold tuple_probe_partial_solve_wit_1;intros;entailer!. Qed.
Lemma proof_of_tuple_probe_partial_solve_wit_2 : tuple_probe_partial_solve_wit_2.
Proof.
 unfold tuple_probe_partial_solve_wit_2;intros;unfold UndefStructPredfloat32x4x2_t,StructPredfloat32x4x2_t;cbn [tuple_values];rewrite ?tuple_local_field_address;entailer!.
Qed.
Lemma proof_of_tuple_probe_partial_solve_wit_3 : tuple_probe_partial_solve_wit_3.
Proof.
 unfold tuple_probe_partial_solve_wit_3;intros;unfold StructPredfloat32x4x2_t;rewrite ?tuple_local_field_address.
 sep_apply (tuple_full_two (&(( &("vminmax"))->ₛ "val"))).
 unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t;rewrite ?tuple_local_field_address.
 rewrite !Z.mul_0_l,!Z.mul_1_l,!Z.add_0_r.
 entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_tuple_probe_safety_wit_1.
Print Assumptions Checked.proof_of_tuple_probe_return_wit_1.
Print Assumptions Checked.proof_of_tuple_probe_partial_solve_wit_1.
Print Assumptions Checked.proof_of_tuple_probe_partial_solve_wit_2.
Print Assumptions Checked.proof_of_tuple_probe_partial_solve_wit_3.
