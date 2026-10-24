From Coq Require Import ZArith Lia.
From Qu8Add Require Import RvvModel setvl_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedSetvl : Qu8Add.setvl_goal.VC_Correct.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;unfold qu_vl;try(rewrite Z.min_l by lia);try(rewrite Z.min_r by lia);entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;unfold qu_vl;try(rewrite Z.min_l by lia);try(rewrite Z.min_r by lia);entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;unfold qu_vl;try(rewrite Z.min_l by lia);try(rewrite Z.min_r by lia);entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof. unfold Qu8Add.setvl_goal.__riscv_vsetvl_e8m2_return_wit_2;intros n_pre Hn Hnonneg;unfold qu_vl;rewrite Z.min_l by lia.
 destruct(Z.eq_dec n_pre 0).
 - eapply derivable1_trans;[|apply derivable1_orp_intros1];entailer!.
 - eapply derivable1_trans;[|apply derivable1_orp_intros2];entailer!.
Qed.
End CheckedSetvl.
