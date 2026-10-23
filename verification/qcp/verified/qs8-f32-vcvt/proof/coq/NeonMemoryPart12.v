From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart12.
Lemma proof_of_test_neon_entail_wit_5_3 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_3.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_7_5 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_5.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_7 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_7.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_160 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_160.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_160;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
End CheckedPart12.
