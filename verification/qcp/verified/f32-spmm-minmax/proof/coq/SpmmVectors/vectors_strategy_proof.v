From Coq Require Import ZArith String Lia.
From SimpleC.SL Require Import SeparationLogic.
From SpmmSpec Require Import Vectors.
From SpmmVectors Require Import vectors_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module Checked <: vectors_Strategy_Correct.
Lemma vectors_strategy1_correctness : vectors_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredfloat32x2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma vectors_strategy2_correctness : vectors_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPredvfloat32m8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma vectors_strategy3_correctness : vectors_strategy3.
Proof. pre_process_default;subst q;unfold UndefStructPredvbool4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma vectors_strategy4_correctness : vectors_strategy4.
Proof. pre_process_default;subst q;Intros;unfold UndefStructPredfloat32x2_t;repeat sep_apply store_float_undef_store_float;entailer!. Qed.
Lemma vectors_strategy5_correctness : vectors_strategy5.
Proof. pre_process_default;subst q;Intros;unfold UndefStructPredfloat32x4_t;repeat sep_apply store_float_undef_store_float;entailer!. Qed.
Lemma vectors_strategy6_correctness : vectors_strategy6.
Proof. pre_process_default;subst q;Intros;unfold UndefStructPredvfloat32m8_t;repeat sep_apply store_float_undef_store_float;entailer!. Qed.
Lemma vectors_strategy7_correctness : vectors_strategy7.
Proof. pre_process_default;subst q;Intros;unfold UndefStructPredvbool4_t;repeat sep_apply store_int_undef_store_int;entailer!. Qed.
End Checked.
Print Assumptions Checked.vectors_strategy1_correctness.
Print Assumptions Checked.vectors_strategy2_correctness.
Print Assumptions Checked.vectors_strategy3_correctness.
Print Assumptions Checked.vectors_strategy4_correctness.
Print Assumptions Checked.vectors_strategy5_correctness.
Print Assumptions Checked.vectors_strategy6_correctness.
Print Assumptions Checked.vectors_strategy7_correctness.
