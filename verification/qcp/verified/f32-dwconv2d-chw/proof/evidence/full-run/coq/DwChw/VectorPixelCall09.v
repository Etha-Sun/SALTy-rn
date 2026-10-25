From Coq Require Import ZArith Lia.
From DwChw Require Import VectorPixelTactics pixel_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_vector_pixel_compute_safety_wit_10 : DwChw.pixel_unit_goal.dw_vector_pixel_compute_safety_wit_10.
Proof. unfold DwChw.pixel_unit_goal.dw_vector_pixel_compute_safety_wit_10;dw_pixel_solve. Qed.
Print Assumptions proof_of_dw_vector_pixel_compute_safety_wit_10.
