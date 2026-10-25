From DwChw Require Import NeonBorrowTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_n_vandq_u32_partial_solve_wit_4 : DwChw.neon_borrow_unit_goal.dw_n_vandq_u32_partial_solve_wit_4.
Proof. unfold DwChw.neon_borrow_unit_goal.dw_n_vandq_u32_partial_solve_wit_4;dw_neon_borrow_solve.
Qed.
Print Assumptions proof_of_dw_n_vandq_u32_partial_solve_wit_4.
