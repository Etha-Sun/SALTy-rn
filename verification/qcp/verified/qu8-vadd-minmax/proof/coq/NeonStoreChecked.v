From Coq Require Import ZArith Lia.
From Qu8Add Require Import NeonFrame NeonStoreMemory U8ArraysStrategy neon_store_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonStore : Qu8Add.neon_store_goal.VC_Correct.
Include Qu8Add.U8ArraysStrategy.CheckedU8Arrays.
Lemma proof_of_qcp_u8_store8_safety_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_1;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_2 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_2.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_2;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_3 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_3.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_3;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_4 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_4.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_4;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_5 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_5.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_5;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_6 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_6.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_6;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_7 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_7.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_7;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_safety_wit_8 : Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_8.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_safety_wit_8;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store8_entail_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store8_entail_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_entail_wit_1;
 try left;intros;rewrite ?sizeof_uchar;
 rewrite u8_store_undef8_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_u8_store8_return_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store8_return_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store8_return_wit_1;
 try left;intros;rewrite ?sizeof_uchar;
 rewrite u8_store_full8_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_1;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_2 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_2.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_2;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_3 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_3.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_3;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_4 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_4.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_4;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_5 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_5.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_5;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_6 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_6.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_6;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_7 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_7.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_7;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_8 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_8.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_8;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_9 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_9.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_9;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_10 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_10.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_10;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_11 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_11.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_11;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_12 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_12.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_12;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_13 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_13.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_13;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_14 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_14.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_14;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_15 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_15.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_15;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_safety_wit_16 : Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_16.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_safety_wit_16;
 intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Qed.
Lemma proof_of_qcp_u8_store16_entail_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store16_entail_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_entail_wit_1;
 try left;intros;rewrite ?sizeof_uchar;
 rewrite u8_store_undef16_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_u8_store16_return_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store16_return_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store16_return_wit_1;
 try left;intros;rewrite ?sizeof_uchar;
 rewrite u8_store_full16_cells;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
Lemma proof_of_qcp_u8_store_lane0_return_wit_1 : Qu8Add.neon_store_goal.qcp_u8_store_lane0_return_wit_1.
Proof. unfold Qu8Add.neon_store_goal.qcp_u8_store_lane0_return_wit_1;
 try left;intros;rewrite ?sizeof_uchar;
 repeat rewrite Z.mul_1_r;neon_frame.
Qed.
End CheckedNeonStore.
