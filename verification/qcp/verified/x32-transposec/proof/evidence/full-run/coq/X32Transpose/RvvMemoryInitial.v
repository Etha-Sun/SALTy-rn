From Coq Require Import ZArith Lia.
From X32Transpose Require Import RvvAutomation ProgressFacts AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac xt_memory_initial :=
 intros;subst;
 match goal with H:xt_valid ?F ?W ?G|-_=>pose proof(xt_total_bounds F W G H)end;
 lazymatch goal with
 | |- context[xt_progress ?F ?G ?O ?R (?t-?b) _ _] =>
   let Ht:=fresh "Htotal" in
   assert(Ht:t=b)by(unfold xt_total,xt_effective_width;
    destruct(Z.eqb_spec(xt_height G)0);destruct(Z.eqb_spec(xt_width G)0);lia);
   rewrite Ht,Z.sub_diag
 end;
 unfold xt_current_input,xt_current_output;cbn;
 entailer!;try apply xt_progress_initial;try lia.
Lemma xt_proof_test_rvv_entail_wit_2_1:test_rvv_entail_wit_2_1.
Proof. unfold test_rvv_entail_wit_2_1;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_1.
Lemma xt_proof_test_rvv_entail_wit_2_2:test_rvv_entail_wit_2_2.
Proof. unfold test_rvv_entail_wit_2_2;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_2.
Lemma xt_proof_test_rvv_entail_wit_2_3:test_rvv_entail_wit_2_3.
Proof. unfold test_rvv_entail_wit_2_3;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_3.
Lemma xt_proof_test_rvv_entail_wit_2_4:test_rvv_entail_wit_2_4.
Proof. unfold test_rvv_entail_wit_2_4;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_4.
Lemma xt_proof_test_rvv_entail_wit_2_5:test_rvv_entail_wit_2_5.
Proof. unfold test_rvv_entail_wit_2_5;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_5.
Lemma xt_proof_test_rvv_entail_wit_2_6:test_rvv_entail_wit_2_6.
Proof. unfold test_rvv_entail_wit_2_6;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_6.
Lemma xt_proof_test_rvv_entail_wit_2_7:test_rvv_entail_wit_2_7.
Proof. unfold test_rvv_entail_wit_2_7;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_7.
Lemma xt_proof_test_rvv_entail_wit_2_8:test_rvv_entail_wit_2_8.
Proof. unfold test_rvv_entail_wit_2_8;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_8.
Lemma xt_proof_test_rvv_entail_wit_2_9:test_rvv_entail_wit_2_9.
Proof. unfold test_rvv_entail_wit_2_9;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_9.
Lemma xt_proof_test_rvv_entail_wit_2_10:test_rvv_entail_wit_2_10.
Proof. unfold test_rvv_entail_wit_2_10;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_10.
Lemma xt_proof_test_rvv_entail_wit_2_11:test_rvv_entail_wit_2_11.
Proof. unfold test_rvv_entail_wit_2_11;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_11.
Lemma xt_proof_test_rvv_entail_wit_2_12:test_rvv_entail_wit_2_12.
Proof. unfold test_rvv_entail_wit_2_12;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_12.
Lemma xt_proof_test_rvv_entail_wit_2_13:test_rvv_entail_wit_2_13.
Proof. unfold test_rvv_entail_wit_2_13;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_13.
Lemma xt_proof_test_rvv_entail_wit_2_14:test_rvv_entail_wit_2_14.
Proof. unfold test_rvv_entail_wit_2_14;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_14.
Lemma xt_proof_test_rvv_entail_wit_2_15:test_rvv_entail_wit_2_15.
Proof. unfold test_rvv_entail_wit_2_15;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_15.
Lemma xt_proof_test_rvv_entail_wit_2_16:test_rvv_entail_wit_2_16.
Proof. unfold test_rvv_entail_wit_2_16;right;xt_memory_initial. Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_2_16.
