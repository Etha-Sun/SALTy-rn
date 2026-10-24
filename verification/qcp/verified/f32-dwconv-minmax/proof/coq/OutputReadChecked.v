From Coq Require Import ZArith.
From Dwconv Require Import OutputReadModel output_read_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedOutputRead : Dwconv.output_read_goal.VC_Correct.
Lemma proof_of_dw_read_output_entail_wit_1 :
 Dwconv.output_read_goal.dw_read_output_entail_wit_1.
Proof.
 unfold Dwconv.output_read_goal.dw_read_output_entail_wit_1;left;intros.
 unfold dw_distinct,dw_owned,dw_initialized in *.
 pose proof(proj1(dw_cells_pop fp32 dw_output_cell W O p_pre PreH2 PreH3))as H.
 change(dw_output W O |--dw_output_cell p_pre(O p_pre)**dw_output(dw_removed W p_pre)O)in H.
 rewrite PreH4 in H;cbn[dw_output_cell]in H;sep_apply H;entailer!.
Qed.
Lemma proof_of_dw_read_output_return_wit_1 :
 Dwconv.output_read_goal.dw_read_output_return_wit_1.
Proof.
 unfold Dwconv.output_read_goal.dw_read_output_return_wit_1;left;intros.
 unfold dw_distinct,dw_owned,dw_initialized in *.
 pose proof(proj2(dw_cells_pop fp32 dw_output_cell W O p PreH2 PreH3))as H.
 change(dw_output_cell p(O p)**dw_output(dw_removed W p)O |--dw_output W O)in H.
 rewrite PreH4 in H;cbn[dw_output_cell]in H;sep_apply H;unfold dw_same;entailer!.
Qed.
End CheckedOutputRead.
Print Assumptions CheckedOutputRead.proof_of_dw_read_output_entail_wit_1.
Print Assumptions CheckedOutputRead.proof_of_dw_read_output_return_wit_1.
