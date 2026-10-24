From Coq Require Import ZArith List Lia.
From QcpNeonLoop Require Import neon_init_lemmas LoopMemory.
From QcpNeon Require Import NeonBridge.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma float_input_merge : forall p k n (xs:list fp32),
  0 <= k <= n -> n = Zlength xs ->
  FloatArray.full p k (fp32_slice 0 k xs) **
  FloatArray.full (p+k*sizeof(FLOAT)) (n-k) (fp32_slice k n xs)
  |-- FloatArray.full p n xs.
Proof.
 intros p k n xs Hk Hn.
 sep_apply (FloatArray.full_merge_to_full p k n
   (fp32_slice 0 k xs) (fp32_slice k n xs) Hk).
 assert (Hparts : fp32_slice 0 k xs ++ fp32_slice k n xs = xs).
 { unfold fp32_slice. rewrite <- sublist_split by lia. rewrite sublist_self by lia. reflexivity. }
 rewrite Hparts. entailer!.
Qed.

Lemma float_input_restore : forall p k n (xs:list fp32) d,
  0 <= k -> k+4 <= n -> n = Zlength xs ->
  FloatArray.full p k (fp32_slice 0 k xs) **
  float_cells4 (p+k*sizeof(FLOAT))
    (Znth 0 (fp32_slice k n xs) d) (Znth 1 (fp32_slice k n xs) d)
    (Znth 2 (fp32_slice k n xs) d) (Znth 3 (fp32_slice k n xs) d) **
  FloatArray.seg (p+k*sizeof(FLOAT)) 4 (n-k) (fp32_slice 4 (n-k) (fp32_slice k n xs))
  |-- FloatArray.full p n xs.
Proof.
 intros p k n xs d Hk Hkn Hn.
 sep_apply (float_input_step_four p k n xs d Hk Hkn Hn).
 apply float_input_merge; lia.
Qed.

Lemma float_cells1_full : forall p x0,
 (p+0*sizeof(FLOAT)) # Float |-> x0 |-- FloatArray.full p 1 [x0].
Proof.
 intros. unfold FloatArray.full, store_array.
 simpl store_array_rec. unfold StoreFloatAsElement.storeA. entailer!.
Qed.

Lemma float_prefix_append1 : forall p k prefix x0,
 0 <= k -> FloatArray.full p k prefix **
 ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> x0) |-- FloatArray.full p (k+1) (prefix++[x0]).
Proof.
 intros p k prefix x0 Hk.
 sep_apply (float_cells1_full (p+k*sizeof(FLOAT)) x0).
 pose proof (FloatArray.full_merge_to_full p k (k+1) prefix [x0] ltac:(lia)) as Hmerge.
 replace (k+1-k) with 1 in Hmerge by lia.
 sep_apply Hmerge. entailer!.
Qed.

Lemma float_cells2_full : forall p x0 x1,
 (p+0*sizeof(FLOAT)) # Float |-> x0 **
 (p+1*sizeof(FLOAT)) # Float |-> x1 |-- FloatArray.full p 2 [x0;x1].
Proof.
 intros. unfold FloatArray.full, store_array.
 simpl store_array_rec. unfold StoreFloatAsElement.storeA. entailer!.
Qed.

Lemma float_prefix_append2 : forall p k prefix x0 x1,
 0 <= k -> FloatArray.full p k prefix **
 ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> x0 **
 (p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> x1) |-- FloatArray.full p (k+2) (prefix++[x0;x1]).
Proof.
 intros p k prefix x0 x1 Hk.
 sep_apply (float_cells2_full (p+k*sizeof(FLOAT)) x0 x1).
 pose proof (FloatArray.full_merge_to_full p k (k+2) prefix [x0;x1] ltac:(lia)) as Hmerge.
 replace (k+2-k) with 2 in Hmerge by lia.
 sep_apply Hmerge. entailer!.
Qed.

Lemma float_cells3_full : forall p x0 x1 x2,
 (p+0*sizeof(FLOAT)) # Float |-> x0 **
 (p+1*sizeof(FLOAT)) # Float |-> x1 **
 (p+2*sizeof(FLOAT)) # Float |-> x2 |-- FloatArray.full p 3 [x0;x1;x2].
Proof.
 intros. unfold FloatArray.full, store_array.
 simpl store_array_rec. unfold StoreFloatAsElement.storeA. entailer!.
Qed.

Lemma float_prefix_append3 : forall p k prefix x0 x1 x2,
 0 <= k -> FloatArray.full p k prefix **
 ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> x0 **
 (p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> x1 **
 (p+k*sizeof(FLOAT)+2*sizeof(FLOAT)) # Float |-> x2) |-- FloatArray.full p (k+3) (prefix++[x0;x1;x2]).
Proof.
 intros p k prefix x0 x1 x2 Hk.
 sep_apply (float_cells3_full (p+k*sizeof(FLOAT)) x0 x1 x2).
 pose proof (FloatArray.full_merge_to_full p k (k+3) prefix [x0;x1;x2] ltac:(lia)) as Hmerge.
 replace (k+3-k) with 3 in Hmerge by lia.
 sep_apply Hmerge. entailer!.
Qed.

Print Assumptions float_input_merge.
Print Assumptions float_input_restore.
Print Assumptions float_prefix_append1.
Print Assumptions float_prefix_append2.
Print Assumptions float_prefix_append3.
