From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import MemoryInterface MapStrategyChecked map_probe_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedMapProbe : Dwconv.map_probe_goal.VC_Correct.
Include Dwconv.MapStrategyChecked.CheckedMaps.
Lemma proof_of_dw_read_float_auto_return_wit_1 : Dwconv.map_probe_goal.dw_read_float_auto_return_wit_1.
Proof. unfold Dwconv.map_probe_goal.dw_read_float_auto_return_wit_1;left;intros;sep_apply(proj2(dw_data_pop F p_pre PreH2));unfold dw_same;entailer!. Qed.
Lemma proof_of_dw_read_float_auto_partial_solve_wit_1 : Dwconv.map_probe_goal.dw_read_float_auto_partial_solve_wit_1.
Proof. unfold Dwconv.map_probe_goal.dw_read_float_auto_partial_solve_wit_1;intros;sep_apply(proj1(dw_data_pop F p_pre PreH2));entailer!. Qed.
Lemma proof_of_dw_read_table_auto_return_wit_1 : Dwconv.map_probe_goal.dw_read_table_auto_return_wit_1.
Proof. unfold Dwconv.map_probe_goal.dw_read_table_auto_return_wit_1;intros;sep_apply(proj2(dw_ptr_data_pop P p_pre PreH2));entailer!. Qed.
Lemma proof_of_dw_read_table_auto_partial_solve_wit_1 : Dwconv.map_probe_goal.dw_read_table_auto_partial_solve_wit_1.
Proof. unfold Dwconv.map_probe_goal.dw_read_table_auto_partial_solve_wit_1;intros;sep_apply(proj1(dw_ptr_data_pop P p_pre PreH2));entailer!. Qed.
End CheckedMapProbe.
Print Assumptions CheckedMapProbe.proof_of_dw_read_float_auto_return_wit_1.
Print Assumptions CheckedMapProbe.proof_of_dw_read_float_auto_partial_solve_wit_1.
Print Assumptions CheckedMapProbe.proof_of_dw_read_table_auto_return_wit_1.
Print Assumptions CheckedMapProbe.proof_of_dw_read_table_auto_partial_solve_wit_1.
