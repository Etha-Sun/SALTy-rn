From Coq Require Import ZArith.
From DwChw Require Export NeonKernelTailListFacts.
Local Open Scope Z_scope.
Lemma dw_neon_tail_fp2_zero:forall a b,dw_fp2 a b 0=a.
Proof. reflexivity. Qed.
Print Assumptions dw_neon_tail_fp2_zero.
