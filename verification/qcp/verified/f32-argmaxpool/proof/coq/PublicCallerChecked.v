From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import APPublicModel public_caller_goal.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Local Opaque app_public_equal.
Ltac pintro:=lazymatch goal with |- ?P |-- ?Q=>idtac | |- forall _,_=>intro;pintro end.
Module CheckedPublicCaller : ArgmaxPool.public_caller_goal.VC_Correct.
Lemma proof_of_argmax_public_pair_safety_wit_1 : ArgmaxPool.public_caller_goal.argmax_public_pair_safety_wit_1.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_safety_wit_1;try left;pintro;entailer!;unfold andp,coq_prop;try (intuition lia);try (eapply app_public_final_equal;[eapply app_arguments_same_read;eassumption|eassumption]). Qed.
Lemma proof_of_argmax_public_pair_return_wit_1 : ArgmaxPool.public_caller_goal.argmax_public_pair_return_wit_1.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_return_wit_1;left;intros index_inc_pre output_inc_pre input_inc_pre idxR_pre outR_pre idxN_pre outN_pre stride_pre offset_pre input_pre channels_pre rows_pre pixels_pre IR OR IN ON WIR WR WIN WN P F layout DR DN PreH1 PreH2 PreH3 PreH4 PreH5.
assert(Hread:apo_same_read DN DR)by(eapply app_arguments_same_read;[exact PreH1|exact PreH2]).
pose proof(app_public_final_equal F P DN DR layout ON IN OR IR Hread PreH5)as Hobs.
entailer!;unfold andp,coq_prop in *;tauto. Qed.
Lemma proof_of_argmax_public_pair_partial_solve_wit_1_pure : ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_1_pure.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_1_pure;try left;pintro;entailer!;unfold andp,coq_prop;try (intuition lia);try (eapply app_public_final_equal;[eapply app_arguments_same_read;eassumption|eassumption]). Qed.
Lemma proof_of_argmax_public_pair_partial_solve_wit_1 : ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_1.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_1,ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_1_aux;try left;pintro;entailer!;unfold andp,coq_prop;try (intuition lia);try (eapply app_public_final_equal;[eapply app_arguments_same_read;eassumption|eassumption]). Qed.
Lemma proof_of_argmax_public_pair_partial_solve_wit_2_pure : ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_2_pure.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_2_pure;try left;pintro;entailer!;unfold andp,coq_prop;try (intuition lia);try (eapply app_public_final_equal;[eapply app_arguments_same_read;eassumption|eassumption]). Qed.
Lemma proof_of_argmax_public_pair_partial_solve_wit_2 : ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_2.
Proof. unfold ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_2,ArgmaxPool.public_caller_goal.argmax_public_pair_partial_solve_wit_2_aux;try left;pintro;entailer!;unfold andp,coq_prop;try (intuition lia);try (eapply app_public_final_equal;[eapply app_arguments_same_read;eassumption|eassumption]). Qed.
End CheckedPublicCaller.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_safety_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_return_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_partial_solve_wit_1_pure.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_partial_solve_wit_1.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_partial_solve_wit_2_pure.
Print Assumptions CheckedPublicCaller.proof_of_argmax_public_pair_partial_solve_wit_2.
