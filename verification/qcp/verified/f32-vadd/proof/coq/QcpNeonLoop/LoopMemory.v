Require Import Coq.ZArith.ZArith Coq.Lists.List Coq.micromega.Psatz.
From QcpNeon Require Import NeonBridge.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition float_cells4 (p:Z) (x0 x1 x2 x3:fp32) : Assertion :=
 (p+0*sizeof(FLOAT)) # Float |-> x0 **
 (p+1*sizeof(FLOAT)) # Float |-> x1 **
 (p+2*sizeof(FLOAT)) # Float |-> x2 **
 (p+3*sizeof(FLOAT)) # Float |-> x3.
Lemma float_cells4_full : forall p x0 x1 x2 x3,
 float_cells4 p x0 x1 x2 x3 |-- FloatArray.full p 4 [x0;x1;x2;x3].
Proof.
 intros. unfold float_cells4, FloatArray.full, store_array.
 simpl store_array_rec. unfold StoreFloatAsElement.storeA. entailer!.
Qed.
Lemma float_prefix_append4 : forall p k prefix x0 x1 x2 x3,
 0 <= k -> FloatArray.full p k prefix **
 float_cells4 (p+k*sizeof(FLOAT)) x0 x1 x2 x3 |--
 FloatArray.full p (k+4) (prefix++[x0;x1;x2;x3]).
Proof.
 intros p k prefix x0 x1 x2 x3 Hk.
 sep_apply (float_cells4_full (p+k*sizeof(FLOAT)) x0 x1 x2 x3).
 pose proof (FloatArray.full_merge_to_full p k (k+4) prefix [x0;x1;x2;x3] ltac:(lia)) as Hmerge.
 replace (k+4-k) with 4 in Hmerge by lia.
 sep_apply Hmerge. entailer!.
Qed.
Lemma float_suffix_after4 : forall p n suffix,
 FloatArray.seg p 4 n suffix |-- FloatArray.full (p+4*sizeof(FLOAT)) (n-4) suffix.
Proof. intros. apply FloatArray.seg_to_full. Qed.
Lemma float_initial_split : forall p n values,
 FloatArray.full p n values |--
 FloatArray.full p 0 (fp32_slice 0 0 values) ** FloatArray.full p n (fp32_slice 0 n values).
Proof.
 intros p n values. prop_apply (FloatArray.full_Zlength p n values). Intros_p Hlen.
 unfold fp32_slice. replace (sublist 0 0 values) with (@nil fp32) by reflexivity. rewrite sublist_self by lia.
 unfold FloatArray.full at 2. unfold store_array. simpl store_array_rec. entailer!.
Qed.
Print Assumptions float_cells4_full.
Print Assumptions float_prefix_append4.
Print Assumptions float_suffix_after4.
Print Assumptions float_initial_split.
