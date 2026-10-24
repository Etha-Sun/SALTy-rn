From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart02.
Lemma proof_of_test_neon_entail_wit_3 : F32F16.neon_unit_goal.test_neon_entail_wit_3.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_3.
intros output_pre input_pre batch_pre A o input k_2 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15.
f16_memory_prepare.
 f16_opaque_stack_frames.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 pose proof (f16_byte_tail_cases8 batch ltac:(lia) ltac:(lia)) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|[H16|[H20|[H24|[H28|Hbig]]]]]]]];try lia.
 all: f16_choose_step_case k_2.
Qed.
End CheckedNeonKernelMemoryPart02.
