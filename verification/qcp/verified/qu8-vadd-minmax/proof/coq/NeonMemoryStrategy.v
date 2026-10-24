From Coq Require Import ZArith Lia.
From Qu8Add Require Import MemoryModel ByteBridge u8_neon_memory_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryStrategy : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_Strategy_Correct.
Lemma u8_neon_memory_strategy1_correctness : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_strategy1.
Proof.
 pre_process_default;subst q.
 pose proof (UCharArray.undef_full_split_to_undef_full p m n) as Hsplit.
 unfold StoreUCharAsElement.sizeA in Hsplit;rewrite sizeof_uchar in Hsplit.
 sep_apply_l_atomic Hsplit;[dump_pre_spatial;lia|].
 rewrite ?sizeof_uchar; cancel (UCharArray.undef_full (p+m*1) (n-m)).
 try apply_sepcon_adjoint;entailer!.
Qed.
Lemma u8_neon_memory_strategy2_correctness : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_strategy2.
Proof.
 pre_process_default;subst q.
 entailer!.
Qed.
Lemma u8_neon_memory_strategy3_correctness : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_strategy3.
Proof.
 pre_process_default;subst q i.
 rewrite ?sizeof_uchar, ?sizeof_uchar.
 replace (p + (k+j)*1) with (p+k*1+j*1) by lia.
 entailer!.
Qed.
Lemma u8_neon_memory_strategy4_correctness : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_strategy4.
Proof. pre_process_default;subst q i;entailer!. Qed.
Lemma u8_neon_memory_strategy5_correctness : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_strategy5.
Proof. pre_process_default;subst q i;rewrite Z.mul_0_l,Z.add_0_r;entailer!. Qed.
End CheckedNeonMemoryStrategy.
Include CheckedNeonMemoryStrategy.
Print Assumptions CheckedNeonMemoryStrategy.u8_neon_memory_strategy1_correctness.
Print Assumptions CheckedNeonMemoryStrategy.u8_neon_memory_strategy2_correctness.
Print Assumptions CheckedNeonMemoryStrategy.u8_neon_memory_strategy3_correctness.
Print Assumptions CheckedNeonMemoryStrategy.u8_neon_memory_strategy4_correctness.
Print Assumptions CheckedNeonMemoryStrategy.u8_neon_memory_strategy5_correctness.
