From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemoryGeometry.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_3:Dwconv.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold test_neon_entail_wit_3;left;dwm_prepare.
 assert(Hp:0<=dw_width D-output_width<dw_width D)by lia.
 pose proof(dwm_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 0 ltac:(lia))as[Ha0 Hb0].
 pose proof(dwm_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 1 ltac:(lia))as[Ha1 Hb1].
 pose proof(dwm_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 2 ltac:(lia))as[Ha2 Hb2].
 dwm_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
