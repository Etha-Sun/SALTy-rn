From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Minmax Require Import VectorLayout neon_copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: neon_copy_Strategy_Correct.
Lemma neon_copy_strategy1_correctness : neon_copy_strategy1.
Proof. pre_process_default; subst q; unfold UndefStructPredfloat32x4_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
Lemma neon_copy_strategy2_correctness : neon_copy_strategy2.
Proof. pre_process_default; subst q; unfold UndefStructPredfloat32x2_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
End Checked.
Print Assumptions Checked.neon_copy_strategy1_correctness.
Print Assumptions Checked.neon_copy_strategy2_correctness.
