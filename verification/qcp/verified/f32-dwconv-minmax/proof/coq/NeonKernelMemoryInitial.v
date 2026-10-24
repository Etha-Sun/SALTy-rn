From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2:Dwconv.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2;left;dwm_prepare.
 unfold dw_neon_progress;rewrite ?Z.sub_diag,dw_progress_start,dw_full_state_zero.
 unfold dw_table,dw_offset_at,dw_output_at;rewrite ?Z.sub_diag;cbn[Z.eqb].
 dwm_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
