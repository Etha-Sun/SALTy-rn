From Qu8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_105 : Qu8Cvt.neon_unit_goal.test_neon_safety_wit_105.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_safety_wit_105;intros;rewrite ?sizeof_uchar,?sizeof_float in *;subst;first[solve[repeat match goal with H:context[Z.land _ _]|-_ => vm_compute in H end;congruence]|cvt_complete]. Qed.
Print Assumptions proof_of_test_neon_safety_wit_105.
