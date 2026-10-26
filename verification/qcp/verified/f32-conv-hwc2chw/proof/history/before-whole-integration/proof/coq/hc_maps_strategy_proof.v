From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import MemoryFacts FloatCopyModel hc_maps_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedMaps : HwcConv.hc_maps_strategy_goal.hc_maps_Strategy_Correct.
Lemma hc_maps_strategy1_correctness :  HwcConv.hc_maps_strategy_goal.hc_maps_strategy1.
Proof. unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy1;pre_process_default;sep_apply(proj1(hc_data_pop F p H));cancel;Intros_r v;apply_sepcon_adjoint;entailer!. Qed.
Lemma hc_maps_strategy2_correctness :  HwcConv.hc_maps_strategy_goal.hc_maps_strategy2.
Proof. unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy2;pre_process_default;subst;sep_apply(proj2(hc_data_pop F p H0));entailer!. Qed.
Lemma hc_maps_strategy5_correctness :  HwcConv.hc_maps_strategy_goal.hc_maps_strategy5.
Proof. unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy5;pre_process_default;subst;entailer!. Qed.
Lemma hc_maps_strategy7_correctness :  HwcConv.hc_maps_strategy_goal.hc_maps_strategy7.
Proof. unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy7;pre_process_default;subst;entailer!. Qed.
End CheckedMaps.
Print Assumptions CheckedMaps.hc_maps_strategy1_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy2_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy5_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy7_correctness.
