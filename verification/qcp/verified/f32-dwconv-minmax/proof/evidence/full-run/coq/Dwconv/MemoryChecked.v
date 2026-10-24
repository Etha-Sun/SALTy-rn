From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import MemoryInterface memory_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedMemory : Dwconv.memory_goal.VC_Correct.
Lemma proof_of_dw_read_float_entail_wit_1 : Dwconv.memory_goal.dw_read_float_entail_wit_1.
Proof. unfold Dwconv.memory_goal.dw_read_float_entail_wit_1;left;intros.
 sep_apply(proj1(dw_data_pop F p_pre PreH2));entailer!.
Qed.
Lemma proof_of_dw_read_float_return_wit_1 : Dwconv.memory_goal.dw_read_float_return_wit_1.
Proof. unfold Dwconv.memory_goal.dw_read_float_return_wit_1;left;intros.
 sep_apply(proj2(dw_data_pop F p_pre PreH1));unfold dw_same;entailer!.
Qed.
Lemma proof_of_dw_store_float_entail_wit_1 : Dwconv.memory_goal.dw_store_float_entail_wit_1.
Proof. unfold Dwconv.memory_goal.dw_store_float_entail_wit_1;left;intros.
 unfold dw_distinct in PreH2;unfold dw_owned in PreH3.
 pose proof(proj1(dw_cells_pop fp32 dw_output_cell W O p_pre PreH2 PreH3))as Hpop.
 change (dw_output W O |--dw_output_cell p_pre(O p_pre)**dw_output(dw_removed W p_pre)O)in Hpop.
 sep_apply Hpop;sep_apply(dw_output_forget_cell p_pre(O p_pre));unfold dw_same;entailer!.
Qed.
Lemma proof_of_dw_store_float_return_wit_1 : Dwconv.memory_goal.dw_store_float_return_wit_1.
Proof. unfold Dwconv.memory_goal.dw_store_float_return_wit_1;left;intros.
 unfold dw_same in PreH1;subst v.
 unfold dw_removed,dw_distinct,dw_owned in *.
 sep_apply(dw_output_writeback W O p_pre v_pre PreH2 PreH3);entailer!.
Qed.
End CheckedMemory.
Print Assumptions CheckedMemory.proof_of_dw_read_float_entail_wit_1.
Print Assumptions CheckedMemory.proof_of_dw_read_float_return_wit_1.
Print Assumptions CheckedMemory.proof_of_dw_store_float_entail_wit_1.
Print Assumptions CheckedMemory.proof_of_dw_store_float_return_wit_1.
