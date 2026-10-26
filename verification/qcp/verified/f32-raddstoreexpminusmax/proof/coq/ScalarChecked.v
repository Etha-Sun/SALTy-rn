From Coq Require Import ZArith List.
From ExpMinusMax Require Import Frame IntrinsicModel MemoryInterface scalar_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedScalar:ExpMinusMax.scalar_goal.VC_Correct.
Lemma proof_of_em_read_scalar_entail_wit_1:ExpMinusMax.scalar_goal.em_read_scalar_entail_wit_1.
Proof.
 unfold ExpMinusMax.scalar_goal.em_read_scalar_entail_wit_1;right;intros.
 exact(proj1(em_data_pop F p_pre PreH2)).
Qed.
Lemma proof_of_em_read_scalar_return_wit_1:ExpMinusMax.scalar_goal.em_read_scalar_return_wit_1.
Proof.
 unfold ExpMinusMax.scalar_goal.em_read_scalar_return_wit_1;left;intros.
 apply _derivable1_andp_intros.
 - apply em_pure_right;reflexivity.
 - exact(proj2(em_data_pop F p_pre PreH2)).
Qed.
Lemma proof_of_em_write_scalar_entail_wit_1:ExpMinusMax.scalar_goal.em_write_scalar_entail_wit_1.
Proof.
 unfold ExpMinusMax.scalar_goal.em_write_scalar_entail_wit_1;left;intros.
 pose proof(proj1(em_cells_pop fp32 em_output_cell W O p_pre PreH2 PreH3))as Hpop.
 change(em_output W O|--em_output_cell p_pre(O p_pre)**em_output(em_removed W p_pre)O)in Hpop.
 sep_apply Hpop;sep_apply(em_output_forget_cell p_pre(O p_pre));entailer!.
Qed.
Lemma proof_of_em_write_scalar_return_wit_1:ExpMinusMax.scalar_goal.em_write_scalar_return_wit_1.
Proof.
 unfold ExpMinusMax.scalar_goal.em_write_scalar_return_wit_1;left;intros.
 unfold em_same in PreH4;subst x;apply em_output_writeback;assumption.
Qed.
Lemma proof_of_em_assert_return_wit_1:ExpMinusMax.scalar_goal.em_assert_return_wit_1.
Proof. unfold ExpMinusMax.scalar_goal.em_assert_return_wit_1;intros;entailer!. Qed.
End CheckedScalar.
Module ExactScalar:ExpMinusMax.scalar_goal.VC_Correct:=CheckedScalar.
Print Assumptions ExactScalar.proof_of_em_read_scalar_entail_wit_1.
Print Assumptions ExactScalar.proof_of_em_read_scalar_return_wit_1.
Print Assumptions ExactScalar.proof_of_em_write_scalar_entail_wit_1.
Print Assumptions ExactScalar.proof_of_em_write_scalar_return_wit_1.
Print Assumptions ExactScalar.proof_of_em_assert_return_wit_1.
