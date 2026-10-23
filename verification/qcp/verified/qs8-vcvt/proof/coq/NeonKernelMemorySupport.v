From Coq Require Import ZArith Lia List.
From Qs8I8Cvt Require Export KernelMemory.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qcv_output_append_full : forall p k r z m o A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 CharArray.full p k(qcv_values k z m o A) ** CharArray.full(p+k)r(qcv_chunk k r z m o A) |--
 CharArray.full p(k+r)(qcv_values(k+r)z m o A).
Proof.
 intros p k r z m o A Hk Hr Hb.
 pose proof(CharArray.full_merge_to_full p k(k+r)(qcv_values k z m o A)(qcv_chunk k r z m o A)ltac:(lia))as HH.
 rewrite sizeof_char in HH;replace(k+r-k)with r in HH by lia;replace(p+k*1)with(p+k)in HH by lia.
 rewrite <-qcv_values_append in HH by assumption;exact HH.
Qed.
Print Assumptions qcv_output_append_full.
