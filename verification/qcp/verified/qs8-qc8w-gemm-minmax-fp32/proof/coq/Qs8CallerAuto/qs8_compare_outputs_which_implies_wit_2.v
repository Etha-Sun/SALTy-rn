From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_qs8_compare_outputs_which_implies_wit_2:caller_goal.qs8_compare_outputs_which_implies_wit_2.
Proof. unfold qs8_compare_outputs_which_implies_wit_2;left;intros L0 i n left right PreH1 PreH2.
 pose proof(CharArray.missing_i_merge_to_full left i n (Znth i L0 0) L0 ltac:(lia)) as HL.
 pose proof(CharArray.missing_i_merge_to_full right i n (Znth i L0 0) L0 ltac:(lia)) as HR.
 unfold StoreCharAsElement.storeA in HL,HR;cbn beta in HL,HR.
 sep_apply HL;sep_apply HR;rewrite !replace_Znth_Znth;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qs8_compare_outputs_which_implies_wit_2.
