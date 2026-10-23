From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export NeonKernelBitFacts KernelArrayFrame LreluFacts LreluActiveModel.
Local Open Scope Z_scope.
Lemma qlr_mask_predicate : forall a b,qlr_neon_canonical(qlr_neon_mask a b).
Proof. intros;unfold qlr_neon_canonical;apply qlr_neon_mask_canonical. Qed.
Ltac qlr_kernel_mask_math :=
 try match goal with |-context[qlr_neon_mask ?a ?b]=>pose proof(qlr_neon_mask_range a b);pose proof(qlr_mask_predicate a b)end;
 try match goal with |-context[qlr_choose_neon ?m ?a ?b]=>pose proof(qlr_choose_neon_range m a b)end.
Ltac qlr_kernel_close := qlr_kernel_mask_math;first[solve[qcv_neon_bit_close]|qcv_neon_split_output].
