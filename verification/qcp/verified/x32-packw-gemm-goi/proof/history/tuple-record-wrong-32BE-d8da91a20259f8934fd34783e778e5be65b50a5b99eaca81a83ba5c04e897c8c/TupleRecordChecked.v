From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From X32Packw Require Import tuple_record_def tuple_record_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma pw_local_field_address : forall (v t f:String.string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
Module CheckedRecordCopy : tuple_record_goal.VC_Correct.
Lemma proof_of_pw_record_copy_return_wit_1 : tuple_record_goal.pw_record_copy_return_wit_1.
Proof. unfold tuple_record_goal.pw_record_copy_return_wit_1,StructPreduint32x2x2_t,UndefStructPreduint32x2x2_t;intros;rewrite ?pw_local_field_address;entailer!. Qed.
Lemma proof_of_pw_record_copy_partial_solve_wit_1 : tuple_record_goal.pw_record_copy_partial_solve_wit_1.
Proof. unfold tuple_record_goal.pw_record_copy_partial_solve_wit_1,StructPreduint32x2x2_t,UndefStructPreduint32x2x2_t;intros;rewrite ?pw_local_field_address;entailer!. Qed.
Lemma proof_of_pw_record_copy_partial_solve_wit_2 : tuple_record_goal.pw_record_copy_partial_solve_wit_2.
Proof. unfold tuple_record_goal.pw_record_copy_partial_solve_wit_2,StructPreduint32x2x2_t,UndefStructPreduint32x2x2_t;intros;rewrite ?pw_local_field_address;entailer!. Qed.
End CheckedRecordCopy.
Module ExactAgain : tuple_record_goal.VC_Correct := CheckedRecordCopy.
Print Assumptions ExactAgain.proof_of_pw_record_copy_return_wit_1.
Print Assumptions ExactAgain.proof_of_pw_record_copy_partial_solve_wit_1.
Print Assumptions ExactAgain.proof_of_pw_record_copy_partial_solve_wit_2.
Print Assumptions pw_local_field_address.
