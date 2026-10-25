From DwChw Require Import NeonBorrowTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_n_vst1_f32_safety_wit_2 : DwChw.neon_borrow_unit_goal.dw_n_vst1_f32_safety_wit_2.
Proof. unfold DwChw.neon_borrow_unit_goal.dw_n_vst1_f32_safety_wit_2;dw_neon_borrow_solve.
Qed.
Print Assumptions proof_of_dw_n_vst1_f32_safety_wit_2.
