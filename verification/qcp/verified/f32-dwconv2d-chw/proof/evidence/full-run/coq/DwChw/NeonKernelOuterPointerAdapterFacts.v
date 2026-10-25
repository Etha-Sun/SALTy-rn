From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelOuterPointerFinalFacts.
Local Open Scope Z_scope.
Lemma dw_u64_idempotent:forall p,
 unsigned_last_nbits(unsigned_last_nbits p 64)64=unsigned_last_nbits p 64.
Proof. intros;unfold unsigned_last_nbits;apply Z.mod_mod;lia. Qed.
Print Assumptions dw_u64_idempotent.
