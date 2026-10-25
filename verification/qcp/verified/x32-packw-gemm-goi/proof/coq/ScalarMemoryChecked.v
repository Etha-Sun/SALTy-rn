From Coq Require Import ZArith List Lia.
From X32Packw Require Import ScalarMemory scalar_memory_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedScalarMemory : X32Packw.scalar_memory_goal.VC_Correct.
Lemma proof_of_pw_read_word_entail_wit_1:pw_read_word_entail_wit_1.
Proof.
 unfold pw_read_word_entail_wit_1;right;intros.
 exact(proj1(pw_data_pop F p_pre PreH2 PreH3)).
Qed.
Lemma proof_of_pw_read_word_entail_wit_2:pw_read_word_entail_wit_2.
Proof.
 unfold pw_read_word_entail_wit_2;right;intros.
 pose proof(proj2(pw_data_pop F p_pre PreH4 PreH5))as Hp.
 sep_apply Hp;entailer!.
Qed.
Lemma proof_of_pw_read_word_return_wit_1:pw_read_word_return_wit_1.
Proof. unfold pw_read_word_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_pw_write_word_entail_wit_1:pw_write_word_entail_wit_1.
Proof.
 unfold pw_write_word_entail_wit_1;left;intros.
 pose proof(proj1(pw_output_loan W O p_pre PreH2 PreH3))as Hp.
 sep_apply Hp;sep_apply(pw_output_forget_cell p_pre(O p_pre));entailer!.
Qed.
Lemma proof_of_pw_write_word_return_wit_1:pw_write_word_return_wit_1.
Proof.
 unfold pw_write_word_return_wit_1;left;intros;unfold pw_output_rest.
 apply pw_output_writeback;assumption.
Qed.
End CheckedScalarMemory.
Module ScalarMemoryExact : X32Packw.scalar_memory_goal.VC_Correct := CheckedScalarMemory.
Print Assumptions CheckedScalarMemory.proof_of_pw_read_word_entail_wit_1.
Print Assumptions CheckedScalarMemory.proof_of_pw_read_word_entail_wit_2.
Print Assumptions CheckedScalarMemory.proof_of_pw_read_word_return_wit_1.
Print Assumptions CheckedScalarMemory.proof_of_pw_write_word_entail_wit_1.
Print Assumptions CheckedScalarMemory.proof_of_pw_write_word_return_wit_1.
