From Coq Require Import ZArith Lia.
From S8Clamp Require Import MemoryModel ByteBridge s8_neon_memory_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryStrategy : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_Strategy_Correct.
Lemma s8_neon_memory_strategy1_correctness : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_strategy1.
Proof.
 pre_process_default;subst q.
 pose proof (CharArray.undef_full_split_to_undef_full p m n) as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 sep_apply_l_atomic Hsplit;[dump_pre_spatial;lia|].
 rewrite ?sizeof_char; cancel (CharArray.undef_full (p+m*1) (n-m)).
 try apply_sepcon_adjoint;entailer!.
Qed.
Lemma s8_neon_memory_strategy2_correctness : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_strategy2.
Proof.
 pre_process_default;subst q.
 entailer!.
Qed.
Lemma s8_neon_memory_strategy3_correctness : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_strategy3.
Proof.
 pre_process_default;subst q i.
 rewrite ?sizeof_char, ?sizeof_uchar.
 replace (p + (k+j)*1) with (p+k*1+j*1) by lia.
 entailer!.
Qed.
Lemma s8_neon_memory_strategy4_correctness : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_strategy4.
Proof. pre_process_default;subst q i;entailer!. Qed.
Lemma s8_neon_memory_strategy5_correctness : S8Clamp.s8_neon_memory_strategy_goal.s8_neon_memory_strategy5.
Proof. pre_process_default;subst q i;rewrite Z.mul_0_l,Z.add_0_r;entailer!. Qed.
End CheckedNeonMemoryStrategy.
Include CheckedNeonMemoryStrategy.
Print Assumptions CheckedNeonMemoryStrategy.s8_neon_memory_strategy1_correctness.
Print Assumptions CheckedNeonMemoryStrategy.s8_neon_memory_strategy2_correctness.
Print Assumptions CheckedNeonMemoryStrategy.s8_neon_memory_strategy3_correctness.
Print Assumptions CheckedNeonMemoryStrategy.s8_neon_memory_strategy4_correctness.
Print Assumptions CheckedNeonMemoryStrategy.s8_neon_memory_strategy5_correctness.
