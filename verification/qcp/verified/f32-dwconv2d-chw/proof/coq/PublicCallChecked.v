From Coq Require Import ZArith Lia.
From DwChw Require Import PublicObservation public_caller_goal.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque dw_public_observed.
Ltac pintro:=lazymatch goal with |- ?P |-- ?Q=>idtac | |- forall _,_=>intro;pintro end.
Module CheckedPublicCaller : DwChw.public_caller_goal.VC_Correct.
Include DwChw.dw_maps_strategy_proof.CheckedMaps.
Include DwChw.dw_output_strategy_proof.CheckedOutput.
Lemma proof_of_dwchw_public_pair_safety_wit_1 : DwChw.public_caller_goal.dwchw_public_pair_safety_wit_1.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_safety_wit_1;pintro;entailer!;unfold andp,coq_prop;intuition lia. Qed.
Lemma proof_of_dwchw_public_pair_return_wit_1 : DwChw.public_caller_goal.dwchw_public_pair_return_wit_1.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_return_wit_1;left;intros params_pre padding_top_pre outR_pre outN_pre zero_pre weights_pre input_pre input_width_pre input_height_pre Hi Lo Params OutR OutN Weights Zero Input width height WR WN OR ON F PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
pose proof(dw_complete_program_observation F Input Zero Weights height width Lo Hi OutN OutR ON OR ltac:(assumption)ltac:(assumption))as Hobs.
entailer!;unfold andp,coq_prop in *;tauto. Qed.
Lemma proof_of_dwchw_public_pair_partial_solve_wit_1_pure : DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_1_pure.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_1_pure;pintro;entailer!;unfold andp,coq_prop;intuition lia. Qed.
Lemma proof_of_dwchw_public_pair_partial_solve_wit_1 : DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_1.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_1,DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_1_aux;pintro;entailer!;unfold andp,coq_prop;intuition lia. Qed.
Lemma proof_of_dwchw_public_pair_partial_solve_wit_2_pure : DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_2_pure.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_2_pure;pintro;entailer!;unfold andp,coq_prop;intuition lia. Qed.
Lemma proof_of_dwchw_public_pair_partial_solve_wit_2 : DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_2.
Proof. unfold DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_2,DwChw.public_caller_goal.dwchw_public_pair_partial_solve_wit_2_aux;pintro;entailer!;unfold andp,coq_prop;intuition lia. Qed.
End CheckedPublicCaller.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_safety_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_return_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_partial_solve_wit_1_pure.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_partial_solve_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_partial_solve_wit_2_pure.
Print Assumptions CheckedPublicCaller.proof_of_dwchw_public_pair_partial_solve_wit_2.
