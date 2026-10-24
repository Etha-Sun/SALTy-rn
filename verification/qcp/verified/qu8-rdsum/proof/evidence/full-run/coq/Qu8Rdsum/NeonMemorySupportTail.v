From Coq Require Import ZArith.
From Qu8Rdsum Require Export NeonMemorySupportExtra.
Local Open Scope Z_scope.
Lemma rd_neon_u32_as_wrap : forall x, unsigned_last_nbits x 32=rs_u32 x.
Proof. reflexivity. Qed.
Print Assumptions rd_neon_u32_as_wrap.
