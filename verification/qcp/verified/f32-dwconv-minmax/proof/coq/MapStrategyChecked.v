From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import MemoryInterface dw_maps_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedMaps : Dwconv.dw_maps_strategy_goal.dw_maps_Strategy_Correct.
Lemma dw_maps_strategy5_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy5.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy5;pre_process_default;subst;entailer!. Qed.
Lemma dw_maps_strategy6_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy6.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy6;pre_process_default;subst;entailer!. Qed.
Lemma dw_maps_strategy7_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy7.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy7;pre_process_default;subst;entailer!. Qed.
Lemma dw_maps_strategy8_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy8.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy8;pre_process_default;subst;entailer!. Qed.
Lemma dw_maps_strategy2_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy2.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy2;pre_process_default;unfold dw_same in *;subst;sep_apply(proj2(dw_data_pop F p H0));entailer!. Qed.
Lemma dw_maps_strategy4_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy4.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy4;pre_process_default;subst;sep_apply(proj2(dw_ptr_data_pop P p H0));entailer!. Qed.
Lemma dw_maps_strategy1_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy1.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy1;pre_process_default;sep_apply(proj1(dw_data_pop F p H));cancel;Intros_r v;apply_sepcon_adjoint;entailer!. Qed.
Lemma dw_maps_strategy3_correctness : Dwconv.dw_maps_strategy_goal.dw_maps_strategy3.
Proof. unfold Dwconv.dw_maps_strategy_goal.dw_maps_strategy3;pre_process_default;sep_apply(proj1(dw_ptr_data_pop P p H));cancel;Intros_r v;apply_sepcon_adjoint;entailer!. Qed.
End CheckedMaps.
Print Assumptions CheckedMaps.dw_maps_strategy1_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy2_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy3_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy4_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy5_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy6_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy7_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy8_correctness.
