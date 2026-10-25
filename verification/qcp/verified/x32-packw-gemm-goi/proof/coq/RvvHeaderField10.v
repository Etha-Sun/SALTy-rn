From Coq Require Import ZArith List Lia.
From X32Packw Require Import TileAutomation rvv_header_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_rvv_header_partial_solve_wit_1_pure:pw_rvv_header_partial_solve_wit_1_pure.
Proof. unfold pw_rvv_header_partial_solve_wit_1_pure.
 first [right;intros;pw_tile_auto |left;intros;pw_tile_auto |intros;pw_tile_auto].
Qed.
Print Assumptions checked_pw_rvv_header_partial_solve_wit_1_pure.
