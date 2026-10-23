From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart08.
Lemma proof_of_test_neon_entail_wit_4_6 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_4_6.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_4_6;try left;intros;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_1 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_7_1;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_3 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_9_3;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_126 : Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
End CheckedPart08.
