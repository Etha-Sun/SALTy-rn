From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export APBlockMainControlSupport.
Local Open Scope Z_scope.
Lemma apbmc_zero_output:forall F P D O I,app_rvv_partial_output F P D 0 0 0 O I=O.
Proof. intros;unfold app_rvv_partial_output,app_partial_output;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apbmc_zero_index:forall F P D O I,app_rvv_partial_index F P D 0 0 0 O I=I.
Proof. intros;unfold app_rvv_partial_index,app_partial_index;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apbmc_initial_nonzero:forall F P W WI D,app_valid F P W WI D->0<app_output_base D /\ 0<app_index_base D.
Proof. intros F P W WI D [[HP[HK[HC HG]]]HN].
 destruct(HG 0 ltac:(lia))as[HT[HR[HW HI]]].
 destruct HW as[HW _];destruct HI as[HI _].
 change(0<app_output_base D)in HW;change(0<app_index_base D)in HI;auto. Qed.
Print Assumptions apbmc_zero_output.
Print Assumptions apbmc_zero_index.
Print Assumptions apbmc_initial_nonzero.
