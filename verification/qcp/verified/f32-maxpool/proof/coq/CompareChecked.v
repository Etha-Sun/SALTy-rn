From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import Types CompareTypes MemoryModel MemoryViews CompareModel CompareFacts compare_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_intro := lazymatch goal with | |- _ |-- _=>idtac | |- forall _, _=>intro;mp_intro end.
Module CheckedCompare : MaxPool.compare_goal.VC_Correct.
Lemma proof_of_mp_output_bits_at_safety_wit_1 : MaxPool.compare_goal.mp_output_bits_at_safety_wit_1.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_safety_wit_1;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_return_wit_1 : MaxPool.compare_goal.mp_output_bits_at_return_wit_1.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_return_wit_1;left;mp_intro;match goal with HK:mp_out_known ?out ?ptr ?v,HL:mp_loaded_lane ?out ?ptr 0 ?value |- _=>unfold mp_out_known in HK;unfold mp_loaded_lane in HL;replace(ptr+4*0)with ptr in HL by lia;unfold mp_loaded in HL;rewrite HK in HL;subst value end;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_1_pure : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_1_pure.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_1_pure;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_1 : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_1.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_1;intro Hpure;unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_1_aux;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_2 : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_2.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_2;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_3 : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_3.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_3;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_4 : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_4.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_4;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_5_pure : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_5_pure.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_5_pure;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_output_bits_at_partial_solve_wit_5 : MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_5.
Proof. unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_5;intro Hpure;unfold MaxPool.compare_goal.mp_output_bits_at_partial_solve_wit_5_aux;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_same_output_at_return_wit_1 : MaxPool.compare_goal.mp_same_output_at_return_wit_1.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_return_wit_1;left;mp_intro;unfold mp_word_equal;repeat match goal with |- context[Z.eqb ?x ?y]=>destruct(Z.eqb_spec x y) end;entailer!;congruence. Qed.
Lemma proof_of_mp_same_output_at_return_wit_2 : MaxPool.compare_goal.mp_same_output_at_return_wit_2.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_return_wit_2;left;mp_intro;unfold mp_word_equal;repeat match goal with |- context[Z.eqb ?x ?y]=>destruct(Z.eqb_spec x y) end;entailer!;congruence. Qed.
Lemma proof_of_mp_same_output_at_partial_solve_wit_1_pure : MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_1_pure.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_1_pure;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_same_output_at_partial_solve_wit_1 : MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_1.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_1;intro Hpure;unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_1_aux;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_same_output_at_partial_solve_wit_2_pure : MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_2_pure.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_2_pure;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
Lemma proof_of_mp_same_output_at_partial_solve_wit_2 : MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_2.
Proof. unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_2;intro Hpure;unfold MaxPool.compare_goal.mp_same_output_at_partial_solve_wit_2_aux;mp_intro;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!. Qed.
End CheckedCompare.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_safety_wit_1.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_return_wit_1.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_1_pure.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_1.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_2.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_3.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_4.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_5_pure.
Print Assumptions CheckedCompare.proof_of_mp_output_bits_at_partial_solve_wit_5.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_return_wit_1.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_return_wit_2.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_partial_solve_wit_1_pure.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_partial_solve_wit_1.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_partial_solve_wit_2_pure.
Print Assumptions CheckedCompare.proof_of_mp_same_output_at_partial_solve_wit_2.
Print Assumptions MaxPool.CompareFacts.mp_local_field_address.
Print Assumptions MaxPool.CompareFacts.mp_loaded_known_lane_zero.
Print Assumptions MaxPool.CompareFacts.mp_word_equal_bits.
