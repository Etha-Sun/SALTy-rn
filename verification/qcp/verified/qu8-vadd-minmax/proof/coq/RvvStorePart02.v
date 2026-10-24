From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart02.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_3 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_3.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_3; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_19 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_19.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_19; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_4 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_4.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_4;right;intros;assert(i_pre=28)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_20 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_20.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_20;right;intros;assert(i_pre=12)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_entail_wit_1 : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_entail_wit_1.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_entail_wit_1;intros;
 rewrite u8_rvv_prefix_zero,UCharArray.seg_empty;
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
 - assert(He : (coq_prop (0=0) && emp)--||--emp).
   { unfold logic_equiv,derivable1,andp,coq_prop;split;intros;tauto. }
   rewrite He;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv';apply derivable1_refl.
Qed.
End CheckedRvvStorePart02.
