From Coq Require Import ZArith String Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Gemm Require Import Model Layouts.
From Qs8Strategy Require Import copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module Checked <: copy_Strategy_Correct.
Lemma copy_strategy1_correctness:copy_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredint8x8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy2_correctness:copy_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPredint16x8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy3_correctness:copy_strategy3.
Proof. pre_process_default;subst q;unfold UndefStructPredint16x4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy4_correctness:copy_strategy4.
Proof. pre_process_default;subst q;unfold UndefStructPredint32x4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy5_correctness:copy_strategy5.
Proof. pre_process_default;subst q;unfold UndefStructPredfloat32x4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy6_correctness:copy_strategy6.
Proof. pre_process_default;subst q;unfold UndefStructPredfloat32x2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy7_correctness:copy_strategy7.
Proof. pre_process_default;subst q;unfold UndefStructPredvint8mf2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy8_correctness:copy_strategy8.
Proof. pre_process_default;subst q;unfold UndefStructPredvint16m1_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy9_correctness:copy_strategy9.
Proof. pre_process_default;subst q;unfold UndefStructPredvint32m2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy10_correctness:copy_strategy10.
Proof. pre_process_default;subst q;unfold UndefStructPredvfloat32m2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy11_correctness:copy_strategy11.
Proof. pre_process_default;subst q;unfold UndefStructPredvbool16_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy12_correctness:copy_strategy12.
Proof. pre_process_default;subst q;unfold UndefStructPreduint32x2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy13_correctness:copy_strategy13.
Proof. pre_process_default;subst q;unfold UndefStructPreduint16x4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy14_correctness:copy_strategy14.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
Lemma copy_strategy15_correctness:copy_strategy15.
Proof. pre_process_default;subst;Intros;subst;unfold qs8_output_prefix;entailer!. Qed.
Lemma copy_strategy16_correctness:copy_strategy16.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
End Checked.
Print Assumptions Checked.copy_strategy1_correctness.
Print Assumptions Checked.copy_strategy2_correctness.
Print Assumptions Checked.copy_strategy3_correctness.
Print Assumptions Checked.copy_strategy4_correctness.
Print Assumptions Checked.copy_strategy5_correctness.
Print Assumptions Checked.copy_strategy6_correctness.
Print Assumptions Checked.copy_strategy7_correctness.
Print Assumptions Checked.copy_strategy8_correctness.
Print Assumptions Checked.copy_strategy9_correctness.
Print Assumptions Checked.copy_strategy10_correctness.
Print Assumptions Checked.copy_strategy11_correctness.
Print Assumptions Checked.copy_strategy12_correctness.
Print Assumptions Checked.copy_strategy13_correctness.
Print Assumptions Checked.copy_strategy14_correctness.
Print Assumptions Checked.copy_strategy15_correctness.
Print Assumptions Checked.copy_strategy16_correctness.
