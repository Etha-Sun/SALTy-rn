From Coq Require Import ZArith String Lia.
From SimpleC.SL Require Import SeparationLogic.
From SpmmSpec Require Import TupleMemory tuple_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module TupleChecked <: tuple_Strategy_Correct.
Lemma tuple_strategy1_correctness : tuple_strategy1.
Proof.
 pre_process_default;subst q;unfold UndefStructPredfloat32x4x2_t;
 entailer!;apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy2_correctness : tuple_strategy2.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
Lemma tuple_strategy3_correctness : tuple_strategy3.
Proof.
 pre_process_default;subst q;unfold UndefStructPredfloat32x4_t;
 entailer!;apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy4_correctness : tuple_strategy4.
Proof.
 pre_process_default;sep_apply tuple_full_two;unfold StructPredfloat32x4_t.
 rewrite !Z.mul_0_l,!Z.mul_1_l,!Z.add_0_r.
 entailer!;apply derivable1s_allp_r;intro v;apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy5_correctness : tuple_strategy5.
Proof. pre_process_default;Intros;unfold UndefStructPredfloat32x4x2_t;entailer!. Qed.
Lemma tuple_strategy6_correctness : tuple_strategy6.
Proof. pre_process_default;Intros;sep_apply tuple_forget;entailer!. Qed.
Lemma tuple_strategy7_correctness : tuple_strategy7.
Proof.
 pre_process_default;Intros;unfold UndefStructPredfloat32x4_t.
 repeat sep_apply store_float_undef_store_float;entailer!.
Qed.
Lemma tuple_strategy8_correctness : tuple_strategy8.
Proof.
 pre_process_default;Intros;rewrite tuple_undef_two;unfold UndefStructPredfloat32x4_t.
 rewrite !Z.mul_0_l,!Z.mul_1_l,!Z.add_0_r.
 repeat sep_apply store_float_undef_store_float;entailer!.
Qed.
Lemma tuple_strategy11_correctness : tuple_strategy11.
Proof.
 pre_process_default;unfold StructPredfloat32x4x2_t;cbn [tuple_values];entailer!;
 try (apply derivable1s_allp_r;intro);apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy13_correctness : tuple_strategy13.
Proof.
 pre_process_default;unfold StructPredfloat32x4x2_t;cbn [tuple_values];entailer!;
 apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy14_correctness : tuple_strategy14.
Proof.
 pre_process_default;unfold StructPredfloat32x4x2_t;cbn [tuple_values];entailer!;
 try (apply derivable1s_allp_r;intro);apply_sepcon_adjoint;entailer!.
Qed.
Lemma tuple_strategy12_correctness : tuple_strategy12.
Proof.
 pre_process_default;unfold StructPredfloat32x4x2_t;cbn [tuple_values];entailer!;
 apply_sepcon_adjoint;entailer!.
Qed.
End TupleChecked.
Export TupleChecked.
Print Assumptions TupleChecked.tuple_strategy1_correctness.
Print Assumptions TupleChecked.tuple_strategy2_correctness.
Print Assumptions TupleChecked.tuple_strategy3_correctness.
Print Assumptions TupleChecked.tuple_strategy4_correctness.
Print Assumptions TupleChecked.tuple_strategy5_correctness.
Print Assumptions TupleChecked.tuple_strategy6_correctness.
Print Assumptions TupleChecked.tuple_strategy7_correctness.
Print Assumptions TupleChecked.tuple_strategy8_correctness.

Print Assumptions TupleChecked.tuple_strategy11_correctness.
Print Assumptions TupleChecked.tuple_strategy13_correctness.
Print Assumptions TupleChecked.tuple_strategy14_correctness.
Print Assumptions TupleChecked.tuple_strategy12_correctness.
