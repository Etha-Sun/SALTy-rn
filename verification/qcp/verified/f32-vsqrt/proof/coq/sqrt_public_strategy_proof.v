From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From Sqrt Require Import sqrt_public_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedSqrtPublic : Sqrt.sqrt_public_strategy_goal.sqrt_public_Strategy_Correct.
Lemma sqrt_public_strategy1_correctness : Sqrt.sqrt_public_strategy_goal.sqrt_public_strategy1.
Proof. unfold Sqrt.sqrt_public_strategy_goal.sqrt_public_strategy1;pre_process_default;subst;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma sqrt_public_strategy2_correctness : Sqrt.sqrt_public_strategy_goal.sqrt_public_strategy2.
Proof. unfold Sqrt.sqrt_public_strategy_goal.sqrt_public_strategy2;pre_process_default;subst;Intros;subst;entailer!. Qed.
End CheckedSqrtPublic.
Print Assumptions CheckedSqrtPublic.sqrt_public_strategy1_correctness.
Print Assumptions CheckedSqrtPublic.sqrt_public_strategy2_correctness.
