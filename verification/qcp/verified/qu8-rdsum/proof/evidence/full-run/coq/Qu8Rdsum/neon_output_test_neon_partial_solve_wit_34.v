From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import CallerOutputFirst neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque rd_active_wadd16 rd_active_wadd32 rd_acc16 rd_acc32 rd_read_lane rd_partial rd_u64.
Lemma proof_of_test_neon_partial_solve_wit_34 : Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_34, Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_34_aux;try left;intros;subst;rd_output_record_pure_first. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_34.
