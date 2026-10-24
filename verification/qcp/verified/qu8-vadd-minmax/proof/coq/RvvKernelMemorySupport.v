From Coq Require Import ZArith Lia List.
From Qu8Add Require Export RvvKernelAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qu_rvv_output_append_full : forall p k r az bz ma mb raw oz lo hi A B,
 0<=k -> 0<=r -> k+r<=Zlength A -> k+r<=Zlength B ->
 UCharArray.full p k(qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full(p+k)r(qu_window k r az bz ma mb raw oz lo hi A B) |--
 UCharArray.full p(k+r)(qu_values(k+r)az bz ma mb raw oz lo hi A B).
Proof.
 intros p k r az bz ma mb raw oz lo hi A B Hk Hr HA HB.
 pose proof(UCharArray.full_merge_to_full p k(k+r)(qu_values k az bz ma mb raw oz lo hi A B)(qu_window k r az bz ma mb raw oz lo hi A B)ltac:(lia))as HH.
 rewrite sizeof_uchar in HH;replace(k+r-k)with r in HH by lia;replace(p+k*1)with(p+k)in HH by lia.
 rewrite <-qu_values_append in HH by assumption;exact HH.
Qed.
Print Assumptions qu_rvv_output_append_full.
