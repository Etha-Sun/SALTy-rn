From Coq Require Import ZArith Lia.
From DwChw Require Import VectorPixelTactics pixel_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_vector_pixel_compute_partial_solve_wit_47 : DwChw.pixel_unit_goal.dw_vector_pixel_compute_partial_solve_wit_47.
Proof. unfold DwChw.pixel_unit_goal.dw_vector_pixel_compute_partial_solve_wit_47;dw_pixel_solve. Qed.
Print Assumptions proof_of_dw_vector_pixel_compute_partial_solve_wit_47.
