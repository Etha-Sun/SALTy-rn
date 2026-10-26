From Coq Require Import ZArith Lia.
From HwcConv Require Import MemoryFacts FloatCopyModel hc_maps_strategy_proof read_scalar_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRead : HwcConv.read_scalar_unit_goal.VC_Correct.
Include HwcConv.hc_maps_strategy_proof.CheckedMaps.
Lemma proof_of_hc_read_scalar_return_wit_1 : HwcConv.read_scalar_unit_goal.hc_read_scalar_return_wit_1.
Proof.
 unfold HwcConv.read_scalar_unit_goal.hc_read_scalar_return_wit_1;left;intros.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,hc_same_bits;intros;reflexivity.
 - apply(proj2(hc_data_pop F p_pre PreH1)).
Qed.
Lemma proof_of_hc_read_scalar_partial_solve_wit_1 : HwcConv.read_scalar_unit_goal.hc_read_scalar_partial_solve_wit_1.
Proof.
 unfold HwcConv.read_scalar_unit_goal.hc_read_scalar_partial_solve_wit_1;intros.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;assumption.
 - apply(proj1(hc_data_pop F p_pre PreH1)).
Qed.
End CheckedRead.
Module ExactSecond:HwcConv.read_scalar_unit_goal.VC_Correct:=CheckedRead.
Print Assumptions CheckedRead.proof_of_hc_read_scalar_return_wit_1.
Print Assumptions CheckedRead.proof_of_hc_read_scalar_partial_solve_wit_1.
