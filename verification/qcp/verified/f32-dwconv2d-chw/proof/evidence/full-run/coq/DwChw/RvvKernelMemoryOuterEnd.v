From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import RvvKernelMemoryFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_results dw_data dw_output.
Lemma proof_of_test_rvv_entail_wit_4_2: DwChw.rvv_unit_goal.test_rvv_entail_wit_4_2.
Proof.
 unfold DwChw.rvv_unit_goal.test_rvv_entail_wit_4_2;right;intros.
 assert(w=0)by lia;subst w;rewrite !Z.sub_0_r.
 rewrite dw_progress_tile_end by lia.
 rewrite Z.min_l by lia.
 unfold dw_outer_pointers;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.
