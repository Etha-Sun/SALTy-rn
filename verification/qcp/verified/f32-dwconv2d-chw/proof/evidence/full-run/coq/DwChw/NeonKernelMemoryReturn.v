From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import NeonKernelFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_neon_results dw_data dw_output dw_progress.
Lemma proof_of_test_neon_return_wit_1: DwChw.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_return_wit_1;right;intros.
 subst output_height;rewrite Z.sub_0_r;entailer!.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
