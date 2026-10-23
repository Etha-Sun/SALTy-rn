From Coq Require Import ZArith Lia List.
From QcpNeon Require Export NeonBridge.
From QcpNeonLoop Require Export LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From Rndne Require Export KernelSupport NeonResult neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rndne_neon_expression : forall x,
 rndne_select (rndne_or (rndne_abs_lt (fp32_of_bits 1258291200) x) 2147483648) x
 (rndne_arm_sub (rndne_arm_add (rndne_abs x) (fp32_of_bits 1258291200)) (fp32_of_bits 1258291200)) = rndne_neon x.
Proof. reflexivity. Qed.
Ltac choose_initial_case :=
 first [solve [Exists 0; unfold FloatArray.full, store_array;
 cbn [store_array_rec]; entailer!;
 cbn [rndne_values List.firstn Z.to_nat store_array_rec]; try entailer!;
 subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].
Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].


