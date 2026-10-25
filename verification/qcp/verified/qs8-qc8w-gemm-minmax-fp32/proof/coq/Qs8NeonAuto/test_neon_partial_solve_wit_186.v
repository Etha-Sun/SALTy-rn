From Coq Require Import ZArith List Lia Strings.String.
From Qs8NeonGoals Require Import G0761.
From Qs8Gemm Require Import KernelFrame NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_186:G0761.test_neon_partial_solve_wit_186.
Proof.
 timeout 300 (
 unfold test_neon_partial_solve_wit_186;try right;intros;qs8_normalize2;qs8_domain_facts;
 solve [qs8_pure2 | qs8_kernel_frame | qs8_read_frame |
   unfold qs8_output_prefix;qs8_kernel_frame | entailer!]).
 all: try lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_186.
