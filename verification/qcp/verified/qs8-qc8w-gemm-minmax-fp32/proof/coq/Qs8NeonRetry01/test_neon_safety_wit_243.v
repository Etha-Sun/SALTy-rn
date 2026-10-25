From Coq Require Import ZArith Lia.
From Qs8NeonGoals Require Import G0242.
From Qs8Gemm Require Import NeonSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_safety_wit_243.
Proof.
 unfold test_neon_safety_wit_243;intros;apply qs8_literal_safety;lia.
Qed.
Print Assumptions checked.
