From Coq Require Import ZArith Lia.
From VCMul Require Import Model FastFrame WindowMemory window_load_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac window_frame :=
 unfold UndefStructPredfloat32x4_t;
 rewrite ?Z.add_0_r in *;
 rewrite ?local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedWindow : VC_Correct.
Lemma proof_of_qcp_vcmul_load4_safety_wit_1 : qcp_vcmul_load4_safety_wit_1.
Proof. unfold qcp_vcmul_load4_safety_wit_1; intros; try change Int.max_signed with 2147483647; try change Int.min_signed with (-2147483648); unfold derivable1,andp,coq_prop; intros; split;lia. Qed.
Lemma proof_of_qcp_vcmul_load4_safety_wit_2 : qcp_vcmul_load4_safety_wit_2.
Proof. unfold qcp_vcmul_load4_safety_wit_2; intros; try change Int.max_signed with 2147483647; try change Int.min_signed with (-2147483648); unfold derivable1,andp,coq_prop; intros; split;lia. Qed.
Lemma proof_of_qcp_vcmul_load4_safety_wit_3 : qcp_vcmul_load4_safety_wit_3.
Proof. unfold qcp_vcmul_load4_safety_wit_3; intros; try change Int.max_signed with 2147483647; try change Int.min_signed with (-2147483648); unfold derivable1,andp,coq_prop; intros; split;lia. Qed.
Lemma proof_of_qcp_vcmul_load4_safety_wit_4 : qcp_vcmul_load4_safety_wit_4.
Proof. unfold qcp_vcmul_load4_safety_wit_4; intros; try change Int.max_signed with 2147483647; try change Int.min_signed with (-2147483648); unfold derivable1,andp,coq_prop; intros; split;lia. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_1 : qcp_vcmul_load4_entail_wit_1.
Proof. unfold qcp_vcmul_load4_entail_wit_1; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+0*4) with (base+(idx+0)*4) by lia;
 sep_apply_l_atomic (window_extract base (idx+0) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_2 : qcp_vcmul_load4_entail_wit_2.
Proof. unfold qcp_vcmul_load4_entail_wit_2; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+0*4) with (base+(idx+0)*4) by lia;
 sep_apply_l_atomic (window_restore base (idx+0) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_3 : qcp_vcmul_load4_entail_wit_3.
Proof. unfold qcp_vcmul_load4_entail_wit_3; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+1*4) with (base+(idx+1)*4) by lia;
 sep_apply_l_atomic (window_extract base (idx+1) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_4 : qcp_vcmul_load4_entail_wit_4.
Proof. unfold qcp_vcmul_load4_entail_wit_4; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+1*4) with (base+(idx+1)*4) by lia;
 sep_apply_l_atomic (window_restore base (idx+1) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_5 : qcp_vcmul_load4_entail_wit_5.
Proof. unfold qcp_vcmul_load4_entail_wit_5; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+2*4) with (base+(idx+2)*4) by lia;
 sep_apply_l_atomic (window_extract base (idx+2) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_6 : qcp_vcmul_load4_entail_wit_6.
Proof. unfold qcp_vcmul_load4_entail_wit_6; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+2*4) with (base+(idx+2)*4) by lia;
 sep_apply_l_atomic (window_restore base (idx+2) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_7 : qcp_vcmul_load4_entail_wit_7.
Proof. unfold qcp_vcmul_load4_entail_wit_7; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+3*4) with (base+(idx+3)*4) by lia;
 sep_apply_l_atomic (window_extract base (idx+3) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_entail_wit_8 : qcp_vcmul_load4_entail_wit_8.
Proof. unfold qcp_vcmul_load4_entail_wit_8; left; intros p_pre xs idx n base d Hidx Hn Hp; subst p_pre; rewrite ?sizeof_float;
 replace (base+4*idx+3*4) with (base+(idx+3)*4) by lia;
 sep_apply_l_atomic (window_restore base (idx+3) n xs d);
 [dump_pre_spatial;lia | window_frame]. Qed.
Lemma proof_of_qcp_vcmul_load4_return_wit_1 : qcp_vcmul_load4_return_wit_1.
Proof. unfold qcp_vcmul_load4_return_wit_1; try left; intros; window_frame. Qed.
Lemma proof_of_qcp_vcmul_load4_partial_solve_wit_1 : qcp_vcmul_load4_partial_solve_wit_1.
Proof. unfold qcp_vcmul_load4_partial_solve_wit_1; try left; intros; window_frame. Qed.
End CheckedWindow.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_safety_wit_1.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_safety_wit_2.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_safety_wit_3.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_safety_wit_4.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_1.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_2.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_3.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_4.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_5.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_6.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_7.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_entail_wit_8.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_return_wit_1.
Print Assumptions CheckedWindow.proof_of_qcp_vcmul_load4_partial_solve_wit_1.
