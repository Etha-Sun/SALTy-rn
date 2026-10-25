From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import KernelFrame NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_96:rvv_goal.test_rvv_partial_solve_wit_96.
Proof.
 unfold test_rvv_partial_solve_wit_96;intro Hpure;clear Hpure.
 unfold test_rvv_partial_solve_wit_96_aux;intros.
 subst c0;rewrite sizeof_char in *.
 unfold qs8_output_prefix.
 assert(Hcapout:nc_pre-nc+vl<=nc_pre).
 { rewrite PreH204;unfold qs8_min;pose proof(Z.le_min_l nc 8);lia. }
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;
   repeat first[assumption|reflexivity|apply conj];try lia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_96.
