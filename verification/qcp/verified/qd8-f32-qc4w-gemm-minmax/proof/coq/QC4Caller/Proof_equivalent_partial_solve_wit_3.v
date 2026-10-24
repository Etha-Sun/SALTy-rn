From Coq Require Import ZArith List Lia Strings.String.
From QC4Caller Require Import caller_goal.
From QC4W Require Import PublicModel.
From QC4Auto Require Import Frame.

From NanBridge Require Import BridgeLogic ListBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac call_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Lemma proof_of_equivalent_partial_solve_wit_3:caller_goal.equivalent_partial_solve_wit_3.
Proof. unfold caller_goal.equivalent_partial_solve_wit_3,caller_goal.equivalent_partial_solve_wit_3_aux;intros;
 (rvv_normalize;try lia);unfold qc4_domain_shape,qc4_data_capacity in *;repeat match goal with H:_ /\ _ |- _ => destruct H end;timeout 1800 (first[call_pure|rvv_frame|entailer!]). Qed.
Print Assumptions proof_of_equivalent_partial_solve_wit_3.
