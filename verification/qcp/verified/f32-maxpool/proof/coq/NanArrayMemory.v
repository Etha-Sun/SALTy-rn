From Coq Require Import ZArith Lia List.
From MaxPool Require Import NanArrayModel propagate_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNanArrayMemory.
Lemma proof_of_mp_array_read_entail_wit_1:MaxPool.propagate_goal.mp_array_read_entail_wit_1.
Proof.
 unfold mp_array_read_entail_wit_1;intros;subst p_pre.
 sep_apply(UIntArray.full_split_to_missing_i base i_pre 32 L0 0 ltac:(lia)).
 unfold StoreUIntAsElement.storeA;entailer!.
Qed.
Lemma proof_of_mp_array_read_entail_wit_2:MaxPool.propagate_goal.mp_array_read_entail_wit_2.
Proof.
 unfold mp_array_read_entail_wit_2;right;intros.
 pose proof(UIntArray.missing_i_merge_to_full base i_pre 32(Znth i_pre L0 0)L0 ltac:(lia))as Hmerge.
 rewrite replace_Znth_Znth in Hmerge;unfold StoreUIntAsElement.storeA in Hmerge.
 sep_apply Hmerge;entailer!.
Qed.
Lemma proof_of_mp_array_read_return_wit_1:MaxPool.propagate_goal.mp_array_read_return_wit_1.
Proof. unfold mp_array_read_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_mp_array_write_entail_wit_1:MaxPool.propagate_goal.mp_array_write_entail_wit_1.
Proof.
 unfold mp_array_write_entail_wit_1;intros;subst p_pre.
 sep_apply(UIntArray.full_split_to_missing_i base i_pre 32 L0 0 ltac:(lia)).
 unfold StoreUIntAsElement.storeA;entailer!.
Qed.
Lemma proof_of_mp_array_write_entail_wit_2:MaxPool.propagate_goal.mp_array_write_entail_wit_2.
Proof.
 unfold mp_array_write_entail_wit_2;right;intros.
 pose proof(UIntArray.missing_i_merge_to_full base i_pre 32 value_pre L0 ltac:(lia))as Hmerge.
 unfold StoreUIntAsElement.storeA in Hmerge;sep_apply Hmerge;entailer!.
Qed.
Lemma proof_of_mp_array_write_return_wit_1:MaxPool.propagate_goal.mp_array_write_return_wit_1.
Proof. unfold mp_array_write_return_wit_1;intros;apply derivable1_refl. Qed.
End CheckedNanArrayMemory.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_read_entail_wit_1.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_read_entail_wit_2.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_read_return_wit_1.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_write_entail_wit_1.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_write_entail_wit_2.
Print Assumptions CheckedNanArrayMemory.proof_of_mp_array_write_return_wit_1.
