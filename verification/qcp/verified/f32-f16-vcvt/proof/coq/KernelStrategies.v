From Coq Require Import ZArith Lia.
From F32F16 Require Import ProgramModel f16_kernel_strategy_goal f16_neon_load_strategy_goal f16_public_strategy_goal.
From QcpNeon Require Import NeonBridge.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedF16KernelStrategy : F32F16.f16_kernel_strategy_goal.f16_kernel_Strategy_Correct.
Lemma f16_kernel_strategy1_correctness : F32F16.f16_kernel_strategy_goal.f16_kernel_strategy1.
Proof.
 pre_process_default;subst q.
 assert(Hbound:0<=m<=n)by lia.
 sep_apply(UShortArray.undef_full_split_to_undef_full p m n Hbound).
 cbn[StoreUShortAsElement.sizeA];rewrite ?sizeof_ushort.
 replace(p+m*2)with(p+2*m)by ring.
 cancel(UShortArray.undef_full(p+2*m)(n-m));apply_sepcon_adjoint;entailer!.
Qed.
End CheckedF16KernelStrategy.
Module CheckedF16PublicStrategy : F32F16.f16_public_strategy_goal.f16_public_Strategy_Correct.
Lemma f16_public_strategy1_correctness : F32F16.f16_public_strategy_goal.f16_public_strategy1.
Proof. pre_process_default;subst;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma f16_public_strategy2_correctness : F32F16.f16_public_strategy_goal.f16_public_strategy2.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
End CheckedF16PublicStrategy.
Module CheckedF16NeonLoadStrategy : F32F16.f16_neon_load_strategy_goal.f16_neon_load_Strategy_Correct.
Lemma f16_neon_load_strategy1_correctness : F32F16.f16_neon_load_strategy_goal.f16_neon_load_strategy1.
Proof.
 pre_process_default;subst q;unfold fp32_slice.
 prop_apply(FloatArray.seg_Zlength p lo hi l). Intros_p Hlen.
 sep_apply(FloatArray.seg_to_full p lo hi l).
 assert(Hbound:4<=hi-lo)by lia.
 sep_apply(float_full_open4 (p+lo*sizeof(FLOAT)) (hi-lo) l fp32_zero Hbound).
 rewrite <- (FloatArray.seg_shift p lo 4 (hi-lo) (sublist 4 (hi-lo) l)).
 replace(lo+(hi-lo))with hi by lia.
 cancel(FloatArray.seg p (lo+4) hi (sublist 4 (hi-lo) l)).
 Intros_r x3 d x1 x0 x2;apply_sepcon_adjoint;Intros;subst.
 rewrite (Znth_indep l 0 fp32_zero d)by lia.
 rewrite (Znth_indep l 1 fp32_zero d)by lia.
 rewrite (Znth_indep l 2 fp32_zero d)by lia.
 rewrite (Znth_indep l 3 fp32_zero d)by lia.
 cancel.
Qed.
End CheckedF16NeonLoadStrategy.
Print Assumptions CheckedF16KernelStrategy.f16_kernel_strategy1_correctness.
Print Assumptions CheckedF16PublicStrategy.f16_public_strategy1_correctness.
Print Assumptions CheckedF16PublicStrategy.f16_public_strategy2_correctness.
Print Assumptions CheckedF16NeonLoadStrategy.f16_neon_load_strategy1_correctness.
