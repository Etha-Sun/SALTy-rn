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
Lemma proof_of_qc4_compare_outputs_which_implies_wit_2:caller_goal.qc4_compare_outputs_which_implies_wit_2.
Proof. unfold caller_goal.qc4_compare_outputs_which_implies_wit_2;left;intros R L i n left right __default_fp32 PreH1 PreH2.
 pose proof(FloatArray.missing_i_merge_to_full left i n (Znth i L __default_fp32) L ltac:(lia)) as HL.
 pose proof(FloatArray.missing_i_merge_to_full right i n (Znth i R __default_fp32) R ltac:(lia)) as HR.
 unfold StoreFloatAsElement.storeA in HL,HR;cbn beta in HL,HR.
 sep_apply HL;sep_apply HR;rewrite !replace_Znth_Znth;entailer!.
Qed.
Print Assumptions proof_of_qc4_compare_outputs_which_implies_wit_2.
