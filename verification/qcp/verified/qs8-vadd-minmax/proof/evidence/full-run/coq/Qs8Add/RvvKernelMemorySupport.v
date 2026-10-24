From Coq Require Import ZArith Lia List.
From Qs8Add Require Export RvvKernelAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_rvv_output_append_full : forall p k r az bz ma mb raw oz lo hi A B,
 0<=k -> 0<=r -> k+r<=Zlength A -> k+r<=Zlength B ->
 CharArray.full p k(qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full(p+k)r(qa_window k r az bz ma mb raw oz lo hi A B) |--
 CharArray.full p(k+r)(qa_values(k+r)az bz ma mb raw oz lo hi A B).
Proof.
 intros p k r az bz ma mb raw oz lo hi A B Hk Hr HA HB.
 pose proof(CharArray.full_merge_to_full p k(k+r)(qa_values k az bz ma mb raw oz lo hi A B)(qa_window k r az bz ma mb raw oz lo hi A B)ltac:(lia))as HH.
 rewrite sizeof_char in HH;replace(k+r-k)with r in HH by lia;replace(p+k*1)with(p+k)in HH by lia.
 rewrite <-qa_values_append in HH by assumption;exact HH.
Qed.
Print Assumptions qa_rvv_output_append_full.
