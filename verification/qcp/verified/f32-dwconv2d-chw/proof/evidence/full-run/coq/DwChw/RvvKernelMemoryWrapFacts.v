From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelMemoryFacts.
Local Open Scope Z_scope.
Lemma dw_u64_add_no_wrap:forall p off,
 0<=p -> 0<=off -> p+off<18446744073709551616 ->
 unsigned_last_nbits (unsigned_last_nbits p 64+off) 64=p+off.
Proof.
 intros p off Hp Ho Hb.
 rewrite (unsigned_last_nbits_eq p 64) by
   (change(0<=p<18446744073709551616);lia).
 apply unsigned_last_nbits_eq;change(0<=p+off<18446744073709551616);lia.
Qed.
Print Assumptions dw_u64_add_no_wrap.
