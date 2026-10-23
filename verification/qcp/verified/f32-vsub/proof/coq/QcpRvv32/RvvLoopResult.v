From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Import RvvStoreModel.
Require Import VaddSegments.
From AUXLib Require Import ListLib.
Import ListNotations.
Open Scope Z_scope.

Lemma firstn_vadd_truncate : forall n a b,
 firstn n (map (fun ab : fp32 * fp32 => fp32_sub (fst ab) (snd ab))
   (combine (firstn n a) (firstn n b))) =
 firstn n (map (fun ab : fp32 * fp32 => fp32_sub (fst ab) (snd ab)) (combine a b)).
Proof.
 induction n; intros a b; [reflexivity|].
 destruct a,b; cbn; try reflexivity.
 now rewrite IHn.
Qed.

Lemma rvv_vadd_append : forall k vl a b,
 0 <= k -> 0 <= vl ->
 vadd_values (k+vl) a b = vadd_values k a b ++
 vadd_values vl (sublist k (k+vl) a) (sublist k (k+vl) b).
Proof.
 intros k vl a b Hk Hv.
 rewrite vadd_values_split by lia. f_equal.
 unfold sublist. rewrite !skipn_firstn_comm.
 rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 unfold vadd_values. symmetry. apply firstn_vadd_truncate.
Qed.

Print Assumptions rvv_vadd_append.
