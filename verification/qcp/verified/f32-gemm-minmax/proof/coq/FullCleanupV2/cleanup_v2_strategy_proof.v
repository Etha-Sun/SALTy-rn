From Coq Require Import ZArith Lia.
From GemmRvv Require Import Model SLFacts SafeFrame.
From FullCleanupV2 Require Import cleanup_v2_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: cleanup_v2_Strategy_Correct.
Lemma cleanup_v2_strategy1_correctness : cleanup_v2_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredvfloat32m4_t;entailer!;try apply_sepcon_adjoint;try entailer!;safe_frame. Qed.
Lemma cleanup_v2_strategy2_correctness : cleanup_v2_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPredvbool8_t;entailer!;try apply_sepcon_adjoint;try entailer!;repeat match goal with |- ?P |-- ?Q => multimatch P with context[store_int ?p ?v] => sep_apply(store_int_undef_store_int p v) end end;safe_frame. Qed.
End Checked.
Print Assumptions Checked.cleanup_v2_strategy1_correctness.
Print Assumptions Checked.cleanup_v2_strategy2_correctness.
