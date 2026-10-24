From Coq Require Import ZArith Lia.
From F32F16 Require Import Bits bits_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Module CheckedBits : F32F16.bits_goal.VC_Correct.
Lemma proof_of_qcp_float_bits_at_safety_wit_1 : F32F16.bits_goal.qcp_float_bits_at_safety_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_bits_at_safety_wit_2 : F32F16.bits_goal.qcp_float_bits_at_safety_wit_2.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_bits_at_safety_wit_3 : F32F16.bits_goal.qcp_float_bits_at_safety_wit_3.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_bits_at_entail_wit_1 : F32F16.bits_goal.qcp_float_bits_at_entail_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_entail_wit_1; left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; sep_apply (float_bytes x_pre v); Intros b0 b1 b2 b3; Exists b0 b1 b2 b3; entailer!.
Qed.
Lemma proof_of_qcp_float_bits_at_entail_wit_2 : F32F16.bits_goal.qcp_float_bits_at_entail_wit_2.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_entail_wit_2; left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; 
prop_apply (valid_store_uchar x_pre b0); Intros.
prop_apply (valid_store_uchar (x_pre+1) b1); Intros.
prop_apply (valid_store_uchar (x_pre+2) b2); Intros.
prop_apply (valid_store_uchar (x_pre+3) b3); Intros.
change Byte.max_unsigned with 255 in *.
sep_apply (bytes_float x_pre v b0 b1 b2 b3 PreH1 PreH2).
rewrite (unsigned_last_nbits_eq (256*b1) 32) by lia.
rewrite (unsigned_last_nbits_eq (65536*b2) 32) by lia.
rewrite (unsigned_last_nbits_eq (16777216*b3) 32) by lia.
rewrite (unsigned_last_nbits_eq (b0+256*b1) 32) by lia.
rewrite (unsigned_last_nbits_eq (b0+256*b1+65536*b2) 32) by lia.
rewrite (unsigned_last_nbits_eq (b0+256*b1+65536*b2+16777216*b3) 32) by lia.
unfold word32 in *; entailer!; lia.
Qed.
Lemma proof_of_qcp_float_bits_at_return_wit_1 : F32F16.bits_goal.qcp_float_bits_at_return_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_bits_at_return_wit_1; intros; entailer!.
Qed.
Lemma proof_of_qcp_float_bits_return_wit_1 : F32F16.bits_goal.qcp_float_bits_return_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_bits_return_wit_1; intros; entailer!.
Qed.
Lemma proof_of_qcp_float_bits_partial_solve_wit_1 : F32F16.bits_goal.qcp_float_bits_partial_solve_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_bits_partial_solve_wit_1; intros; entailer!.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_1 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_2 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_2.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_3 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_3.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_4 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_4.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_4; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_5 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_5.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_5; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_safety_wit_6 : F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_6.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_safety_wit_6; intros; unfold derivable1, andp, coq_prop; intros; split; lia.
Qed.
Lemma proof_of_qcp_float_from_bits_at_entail_wit_1 : F32F16.bits_goal.qcp_float_from_bits_at_entail_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_entail_wit_1; left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; sep_apply (uint_bytes bits_pre w); Intros b0 b1 b2 b3.
sep_apply (undef_float_bytes x_pre); Intros.
Exists b0 b1 b2 b3; repeat rewrite Z.mul_1_r; entailer!; cancel.
Qed.
Lemma proof_of_qcp_float_from_bits_at_entail_wit_2 : F32F16.bits_goal.qcp_float_from_bits_at_entail_wit_2.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_entail_wit_2; left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; repeat rewrite Z.mul_1_r;
sep_apply (bytes_uint bits_pre w b0 b1 b2 b3 PreH1 PreH3).
sep_apply (bytes_float_of_bits x_pre w b0 b1 b2 b3 PreH2 PreH3).
entailer!.
Qed.
Lemma proof_of_qcp_float_from_bits_at_return_wit_1 : F32F16.bits_goal.qcp_float_from_bits_at_return_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_at_return_wit_1; intros; entailer!.
Qed.
Lemma proof_of_qcp_float_from_bits_return_wit_1 : F32F16.bits_goal.qcp_float_from_bits_return_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_return_wit_1; left; intros; unfold same_bits; entailer!.
Qed.
Lemma proof_of_qcp_float_from_bits_partial_solve_wit_1 : F32F16.bits_goal.qcp_float_from_bits_partial_solve_wit_1.
Proof. unfold F32F16.bits_goal.qcp_float_from_bits_partial_solve_wit_1; intros; entailer!.
Qed.
End CheckedBits.
Print Assumptions CheckedBits.proof_of_qcp_float_bits_return_wit_1.
Print Assumptions CheckedBits.proof_of_qcp_float_from_bits_return_wit_1.
Print Assumptions CheckedBits.proof_of_qcp_float_bits_at_entail_wit_2.
Print Assumptions CheckedBits.proof_of_qcp_float_from_bits_at_entail_wit_2.

