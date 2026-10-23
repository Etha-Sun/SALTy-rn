Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonSafetyExtra.
Lemma proof_of_test_neon_safety_wit_3 : test_neon_safety_wit_3.
Proof. unfold test_neon_safety_wit_3; repeat rewrite sizeof_float; pre_process; subst; try congruence; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_21 : test_neon_safety_wit_21.
Proof. unfold test_neon_safety_wit_21; repeat rewrite sizeof_float; pre_process; subst; try congruence; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_38 : test_neon_safety_wit_38.
Proof. unfold test_neon_safety_wit_38; intros; repeat rewrite sizeof_float in *; subst batch; vm_compute in PreH20; discriminate. Qed.
Lemma proof_of_test_neon_safety_wit_45 : test_neon_safety_wit_45.
Proof. unfold test_neon_safety_wit_45; intros; repeat rewrite sizeof_float in *; subst batch; vm_compute in PreH21; discriminate. Qed.
End CheckedNeonSafetyExtra.
Print Assumptions CheckedNeonSafetyExtra.proof_of_test_neon_safety_wit_3.
Print Assumptions CheckedNeonSafetyExtra.proof_of_test_neon_safety_wit_21.
Print Assumptions CheckedNeonSafetyExtra.proof_of_test_neon_safety_wit_38.
Print Assumptions CheckedNeonSafetyExtra.proof_of_test_neon_safety_wit_45.
