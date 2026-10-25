From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelTactics RvvKernelMemoryWrapFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_86_pure:DwChw.neon_unit_goal.test_neon_partial_solve_wit_86_pure.
Proof. unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_86_pure;try left;intros;
 unfold dw_same in *;subst;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold dw_inputs,dw_footprint,dw_u64_limit in *;
 repeat match goal with H:_ /\ _|-_=>destruct H end;
 repeat match goal with |-context[unsigned_last_nbits ?x 64]=>rewrite(unsigned_last_nbits_eq x 64)by(change(0<=x<18446744073709551616);nia) end;
 unfold derivable1,andp,coq_prop;intros;split;
 lazymatch goal with |-dw_window ?f (?p+4*?k) ?n=>
 match goal with HW:dw_window f p ?count|-_=>
 apply(dw_read_window_shift f p count k n);[exact HW|lia|lia|nia]end end. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_86_pure.
