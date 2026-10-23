From Coq Require Import ZArith Lia.
From Qs8I8Cvt Require Import NeonFrame NeonStoreMemory S8ArraysStrategy neon_store_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonStore : Qs8I8Cvt.neon_store_goal.VC_Correct.
Include Qs8I8Cvt.S8ArraysStrategy.CheckedS8Arrays.
Lemma proof_of_qcp_s8_store8_safety_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_1;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_2 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_2.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_2;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_3 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_3.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_3;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_4 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_4.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_4;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_5 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_5.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_5;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_6 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_6.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_6;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_7 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_7.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_7;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_safety_wit_8 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_8.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_safety_wit_8;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store8_entail_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_entail_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_entail_wit_1;
 try left;intros;rewrite ?sizeof_char;
 rewrite s8_store_undef8_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_s8_store8_return_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store8_return_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store8_return_wit_1;
 try left;intros;rewrite ?sizeof_char;
 rewrite s8_store_full8_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_1;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_2 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_2.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_2;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_3 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_3.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_3;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_4 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_4.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_4;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_5 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_5.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_5;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_6 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_6.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_6;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_7 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_7.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_7;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_8 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_8.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_8;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_9 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_9.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_9;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_10 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_10.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_10;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_11 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_11.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_11;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_12 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_12.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_12;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_13 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_13.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_13;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_14 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_14.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_14;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_15 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_15.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_15;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_safety_wit_16 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_16.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_safety_wit_16;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_s8_store16_entail_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_entail_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_entail_wit_1;
 try left;intros;rewrite ?sizeof_char;
 rewrite s8_store_undef16_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_s8_store16_return_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store16_return_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store16_return_wit_1;
 try left;intros;rewrite ?sizeof_char;
 rewrite s8_store_full16_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_s8_store_lane0_return_wit_1 : Qs8I8Cvt.neon_store_goal.qcp_s8_store_lane0_return_wit_1.
Proof. unfold Qs8I8Cvt.neon_store_goal.qcp_s8_store_lane0_return_wit_1;
 try left;intros;rewrite ?sizeof_char;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
End CheckedNeonStore.
