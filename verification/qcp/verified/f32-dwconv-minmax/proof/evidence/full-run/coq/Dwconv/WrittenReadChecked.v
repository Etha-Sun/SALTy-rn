From Coq Require Import ZArith.
From Dwconv Require Import WrittenReadModel written_read_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedWrittenRead : Dwconv.written_read_goal.VC_Correct.
Lemma proof_of_dw_read_written_entail_wit_1 : Dwconv.written_read_goal.dw_read_written_entail_wit_1.
Proof.
 unfold Dwconv.written_read_goal.dw_read_written_entail_wit_1;left;intros.
 unfold dw_output_ready in PreH4;destruct PreH4 as[v Hv];Exists v.
 unfold dw_distinct,dw_owned in *.
 pose proof(proj1(dw_cells_pop fp32 dw_output_cell W O p_pre PreH2 PreH3))as H.
 change(dw_output W O |--dw_output_cell p_pre(O p_pre)**dw_output(dw_removed W p_pre)O)in H.
 unfold dw_initialized in *;rewrite Hv in H;cbn[dw_output_cell]in H;sep_apply H;entailer!.
Qed.
Lemma proof_of_dw_read_written_return_wit_1 : Dwconv.written_read_goal.dw_read_written_return_wit_1.
Proof.
 unfold Dwconv.written_read_goal.dw_read_written_return_wit_1;left;intros.
 unfold dw_distinct,dw_owned,dw_initialized in *.
 pose proof(proj2(dw_cells_pop fp32 dw_output_cell W O p_pre PreH2 PreH3))as H.
 change(dw_output_cell p_pre(O p_pre)**dw_output(dw_removed W p_pre)O |--dw_output W O)in H.
 rewrite PreH4 in H;cbn[dw_output_cell]in H;sep_apply H;entailer!.
Qed.
End CheckedWrittenRead.
Print Assumptions CheckedWrittenRead.proof_of_dw_read_written_entail_wit_1.
Print Assumptions CheckedWrittenRead.proof_of_dw_read_written_return_wit_1.
