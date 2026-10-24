From Coq Require Import ZArith Lia.
From Dwconv Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* This actual branch retains c=1 and (c&1)=0 simultaneously. *)
Lemma proof_of_test_neon_entail_wit_11_3:
 Dwconv.neon_unit_goal.test_neon_entail_wit_11_3.
Proof.
 unfold test_neon_entail_wit_11_3; dwm_prepare.
 change (Z.land 1 1) with 1 in *.
 exfalso; lia.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_11_3.
