From Coq Require Import ZArith Lia.
From DwChw Require Import MemoryFacts OutputInterface dw_maps_strategy_proof dw_output_strategy_proof read_scalar_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRead : DwChw.read_scalar_unit_goal.VC_Correct.
Include DwChw.dw_maps_strategy_proof.CheckedMaps.
Include DwChw.dw_output_strategy_proof.CheckedOutput.
Lemma proof_of_dw_read_scalar_return_wit_1 : DwChw.read_scalar_unit_goal.dw_read_scalar_return_wit_1.
Proof.
 unfold DwChw.read_scalar_unit_goal.dw_read_scalar_return_wit_1;left;intros.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,dw_same;intros;reflexivity.
 - apply(proj2(dw_data_pop F p_pre PreH1)).
Qed.
Lemma proof_of_dw_read_scalar_partial_solve_wit_1 : DwChw.read_scalar_unit_goal.dw_read_scalar_partial_solve_wit_1.
Proof.
 unfold DwChw.read_scalar_unit_goal.dw_read_scalar_partial_solve_wit_1;intros.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;assumption.
 - apply(proj1(dw_data_pop F p_pre PreH1)).
Qed.
End CheckedRead.
Print Assumptions CheckedRead.proof_of_dw_read_scalar_return_wit_1.
Print Assumptions CheckedRead.proof_of_dw_read_scalar_partial_solve_wit_1.
