From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import MemoryFacts OutputInterface dw_maps_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedMaps : DwChw.dw_maps_strategy_goal.dw_maps_Strategy_Correct.
Lemma dw_maps_strategy1_correctness :  DwChw.dw_maps_strategy_goal.dw_maps_strategy1.
Proof. unfold DwChw.dw_maps_strategy_goal.dw_maps_strategy1;pre_process_default;sep_apply(proj1(dw_data_pop F p H));cancel;Intros_r v;apply_sepcon_adjoint;entailer!. Qed.
Lemma dw_maps_strategy2_correctness :  DwChw.dw_maps_strategy_goal.dw_maps_strategy2.
Proof. unfold DwChw.dw_maps_strategy_goal.dw_maps_strategy2;pre_process_default;unfold dw_same in *;subst;sep_apply(proj2(dw_data_pop F p H0));entailer!. Qed.
Lemma dw_maps_strategy5_correctness :  DwChw.dw_maps_strategy_goal.dw_maps_strategy5.
Proof. unfold DwChw.dw_maps_strategy_goal.dw_maps_strategy5;pre_process_default;subst;entailer!. Qed.
Lemma dw_maps_strategy7_correctness :  DwChw.dw_maps_strategy_goal.dw_maps_strategy7.
Proof. unfold DwChw.dw_maps_strategy_goal.dw_maps_strategy7;pre_process_default;subst;entailer!. Qed.
End CheckedMaps.
Print Assumptions CheckedMaps.dw_maps_strategy1_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy2_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy5_correctness.
Print Assumptions CheckedMaps.dw_maps_strategy7_correctness.
