From Coq Require Import ZArith List.
From ArgmaxPool Require Import ReadPreviousModel read_previous_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedReadPrevious:ArgmaxPool.read_previous_goal.VC_Correct.
Lemma proof_of_ap_read_previous_float_entail_wit_1:ArgmaxPool.read_previous_goal.ap_read_previous_float_entail_wit_1.
Proof. unfold ArgmaxPool.read_previous_goal.ap_read_previous_float_entail_wit_1;left;intros.
 unfold ap_distinct,ap_owned,ap_float_initialized in *.
 pose proof(proj1(ap_cells_pop fp32 ap_output_cell W O p_pre PreH2 PreH3))as H.
 change(ap_output W O |-- ap_output_cell p_pre(O p_pre) ** ap_output(ap_removed W p_pre)O)in H.
 rewrite PreH4 in H;cbn[ap_output_cell]in H;sep_apply H;entailer!.
Qed.
Lemma proof_of_ap_read_previous_float_return_wit_1:ArgmaxPool.read_previous_goal.ap_read_previous_float_return_wit_1.
Proof. unfold ArgmaxPool.read_previous_goal.ap_read_previous_float_return_wit_1;left;intros.
 unfold ap_distinct,ap_owned,ap_float_initialized in *.
 pose proof(proj2(ap_cells_pop fp32 ap_output_cell W O p PreH2 PreH3))as H.
 change(ap_output_cell p(O p) ** ap_output(ap_removed W p)O |-- ap_output W O)in H.
 rewrite PreH4 in H;cbn[ap_output_cell]in H;sep_apply H;unfold ap_same_bits;entailer!.
Qed.
Lemma proof_of_ap_read_previous_uint_entail_wit_1:ArgmaxPool.read_previous_goal.ap_read_previous_uint_entail_wit_1.
Proof. unfold ArgmaxPool.read_previous_goal.ap_read_previous_uint_entail_wit_1;left;intros.
 unfold ap_distinct,ap_owned,ap_uint_initialized in *.
 pose proof(proj1(ap_cells_pop Z ap_index_cell W O p_pre PreH2 PreH3))as H.
 change(ap_index W O |-- ap_index_cell p_pre(O p_pre) ** ap_index(ap_removed W p_pre)O)in H.
 rewrite PreH4 in H;cbn[ap_index_cell]in H;sep_apply H;entailer!.
Qed.
Lemma proof_of_ap_read_previous_uint_return_wit_1:ArgmaxPool.read_previous_goal.ap_read_previous_uint_return_wit_1.
Proof. unfold ArgmaxPool.read_previous_goal.ap_read_previous_uint_return_wit_1;left;intros.
 unfold ap_distinct,ap_owned,ap_uint_initialized in *.
 pose proof(proj2(ap_cells_pop Z ap_index_cell W O p PreH2 PreH3))as H.
 change(ap_index_cell p(O p) ** ap_index(ap_removed W p)O |-- ap_index W O)in H.
 rewrite PreH4 in H;cbn[ap_index_cell]in H;sep_apply H;entailer!.
Qed.
End CheckedReadPrevious.
Print Assumptions CheckedReadPrevious.proof_of_ap_read_previous_float_entail_wit_1.
Print Assumptions CheckedReadPrevious.proof_of_ap_read_previous_float_return_wit_1.
Print Assumptions CheckedReadPrevious.proof_of_ap_read_previous_uint_entail_wit_1.
Print Assumptions CheckedReadPrevious.proof_of_ap_read_previous_uint_return_wit_1.
