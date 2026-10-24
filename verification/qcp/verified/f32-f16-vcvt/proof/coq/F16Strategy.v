From Coq Require Import ZArith List.
From F32F16 Require Import ProgramModel f16_memory_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedF16Strategy : F32F16.f16_memory_strategy_goal.f16_memory_Strategy_Correct.
Lemma f16_memory_strategy1_correctness : F32F16.f16_memory_strategy_goal.f16_memory_strategy1.
Proof. pre_process_default; subst; unfold f16_values; simpl.
 rewrite UShortArray.full_empty;entailer!.
Qed.
Lemma f16_memory_strategy2_correctness : F32F16.f16_memory_strategy_goal.f16_memory_strategy2.
Proof. pre_process_default; subst; unfold f16_rvv_values; simpl.
 rewrite UShortArray.seg_empty;entailer!.
Qed.
Lemma f16_memory_strategy3_correctness : F32F16.f16_memory_strategy_goal.f16_memory_strategy3.
Proof. pre_process_default;entailer!.
Qed.
Lemma f16_memory_strategy4_correctness : F32F16.f16_memory_strategy_goal.f16_memory_strategy4.
Proof. pre_process_default;entailer!.
Qed.
End CheckedF16Strategy.
Print Assumptions CheckedF16Strategy.f16_memory_strategy1_correctness.
Print Assumptions CheckedF16Strategy.f16_memory_strategy2_correctness.
Print Assumptions CheckedF16Strategy.f16_memory_strategy3_correctness.
Print Assumptions CheckedF16Strategy.f16_memory_strategy4_correctness.
