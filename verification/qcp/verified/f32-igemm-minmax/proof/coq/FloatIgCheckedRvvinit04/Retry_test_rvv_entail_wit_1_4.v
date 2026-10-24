From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvinit04 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1_4:rvv_goal.test_rvv_entail_wit_1_4.
Proof. unfold rvv_goal.test_rvv_entail_wit_1_4;try left;intros.
 Exists z7_2 z6_2 z5_2 z4_2 z3_2 z2_2 z1_2 z0_2. ig_initial.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1_4.
