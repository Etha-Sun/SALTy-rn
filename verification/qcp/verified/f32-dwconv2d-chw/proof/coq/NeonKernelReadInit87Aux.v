From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelTactics NeonKernelInitReadFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_87:DwChw.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_87;intro HP.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_87_aux;intros.
 lazymatch goal with|-?P |--?Q=>
 let R:=fresh "R"in let T:=type of HP in
 eapply(derivable1_trans P _ Q);[apply _derivable1_andp_intros;[eapply dw_neon_init_read_87; eassumption|apply derivable1_refl]|]end.
 Intros_p HWin. destruct HWin.
 dw_neon_kernel_solve.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_87.
