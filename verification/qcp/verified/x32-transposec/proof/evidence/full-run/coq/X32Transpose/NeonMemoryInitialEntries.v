From Coq Require Import ZArith Lia.
From X32Transpose Require Import NeonAutomation ProgressFacts NeonMemoryInitialFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac xt_neon_memory_initial F W G O Hv :=
 let Hb:=fresh "Hwidth_bounds" in pose proof(proj1(proj1 Hv))as Hb;
 let Hh:=fresh "Hheight" in assert(Hh:0<xt_height G)by
  (pose proof(proj1(proj2(proj1 Hv)));lia);
 pose proof(xt_cols_positive G);
 pose proof(xt_progress_initial F G O);
 pose proof(xt_neon_initial_input_row F W G Hv Hh);
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size];
 Exists (0:Z);
 lazymatch goal with |-context[xt_neon_next G 0 ?b _]=>
  pose proof(xt_neon_initial_output_next F W G b Hv Hh);
  assert(Hwidth:b=xt_cols G)by(unfold xt_cols;
   first[rewrite Z.max_l by lia;lia|rewrite Z.max_r by lia;lia])
 end;
 try replace(xt_round_down 1 2)with(xt_round_down(xt_height G)2)by(f_equal;lia);
 rewrite ?xt_neon_input_reset_nested,?xt_neon_output_reset_nested;
 unfold xt_neon_input_offset;
 assert(Hdoz:xt_doz(xt_cols G)0=xt_cols G)by
  (unfold xt_doz;destruct(Z.ltb_spec 0(xt_cols G));lia);
 rewrite Hdoz;
 entailer!;try reflexivity;try lia.
Lemma xt_proof_test_neon_entail_wit_2_1:test_neon_entail_wit_2_1.
Proof. unfold test_neon_entail_wit_2_1;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_1.
Lemma xt_proof_test_neon_entail_wit_2_2:test_neon_entail_wit_2_2.
Proof. unfold test_neon_entail_wit_2_2;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_2.
Lemma xt_proof_test_neon_entail_wit_2_3:test_neon_entail_wit_2_3.
Proof. unfold test_neon_entail_wit_2_3;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_3.
Lemma xt_proof_test_neon_entail_wit_2_4:test_neon_entail_wit_2_4.
Proof. unfold test_neon_entail_wit_2_4;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_4.
Lemma xt_proof_test_neon_entail_wit_2_5:test_neon_entail_wit_2_5.
Proof. unfold test_neon_entail_wit_2_5;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_5.
Lemma xt_proof_test_neon_entail_wit_2_6:test_neon_entail_wit_2_6.
Proof. unfold test_neon_entail_wit_2_6;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_6.
Lemma xt_proof_test_neon_entail_wit_2_7:test_neon_entail_wit_2_7.
Proof. unfold test_neon_entail_wit_2_7;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_7.
Lemma xt_proof_test_neon_entail_wit_2_8:test_neon_entail_wit_2_8.
Proof. unfold test_neon_entail_wit_2_8;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_8.
Lemma xt_proof_test_neon_entail_wit_2_9:test_neon_entail_wit_2_9.
Proof. unfold test_neon_entail_wit_2_9;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_9.
Lemma xt_proof_test_neon_entail_wit_2_10:test_neon_entail_wit_2_10.
Proof. unfold test_neon_entail_wit_2_10;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_10.
Lemma xt_proof_test_neon_entail_wit_2_11:test_neon_entail_wit_2_11.
Proof. unfold test_neon_entail_wit_2_11;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_11.
Lemma xt_proof_test_neon_entail_wit_2_12:test_neon_entail_wit_2_12.
Proof. unfold test_neon_entail_wit_2_12;right;intros;subst;match goal with Hv:xt_valid ?F ?W ?G,O:XTOutput|-_=>xt_neon_memory_initial F W G O Hv end. Qed.
Print Assumptions xt_proof_test_neon_entail_wit_2_12.
