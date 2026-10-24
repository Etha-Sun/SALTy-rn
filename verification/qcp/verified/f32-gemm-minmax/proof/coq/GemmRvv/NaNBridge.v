From Coq Require Import ZArith.
From GemmRvv Require Export Model.
Local Open Scope Z_scope.
Definition nan_branch_observation (x:fp32)(r:Z):Prop :=
 (r=1 /\ fp32_ne x x) \/ (r=0 /\ fp32_eq x x).
Lemma old_qnan_numeric_post_impossible : forall y, ~fp32_eq y canonical_qnan.
Proof. intros y; destruct y; vm_compute; discriminate. Qed.
Lemma identity_nan_test : forall x y, bit_same y x -> (fp32_ne x x <-> fp32_ne x y).
Proof. unfold bit_same; intros; subst; reflexivity. Qed.
Print Assumptions old_qnan_numeric_post_impossible.
Print Assumptions identity_nan_test.
