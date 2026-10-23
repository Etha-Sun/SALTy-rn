From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Layout packed_copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <:packed_copy_Strategy_Correct.
Lemma packed_copy_strategy1_correctness:packed_copy_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredvuint8m8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
End Checked.
Print Assumptions Checked.packed_copy_strategy1_correctness.
