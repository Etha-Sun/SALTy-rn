From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart09.
Lemma proof_of_test_neon_entail_wit_4_7 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_4_7.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_4_7;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_2 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_4 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_4.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_9_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_127 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_127.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_127;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
End CheckedPart09.
