From Qs8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_86 : Qs8Cvt.neon_unit_goal.test_neon_safety_wit_86.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_safety_wit_86;intros;rewrite ?sizeof_char,?sizeof_float in *;subst;first[solve[repeat match goal with H:context[Z.land _ _]|-_ => vm_compute in H end;congruence]|cvt_complete]. Qed.
Print Assumptions proof_of_test_neon_safety_wit_86.
