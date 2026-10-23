From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart11.
Lemma proof_of_test_neon_entail_wit_5_2 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_2.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_7_4 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_4.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_6 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_6.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_159 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_159.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_159;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
End CheckedPart11.
