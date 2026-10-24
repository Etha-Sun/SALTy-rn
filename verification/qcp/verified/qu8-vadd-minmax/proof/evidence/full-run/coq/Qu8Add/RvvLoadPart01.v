From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart01.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_2 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_2.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_2; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_18 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_18.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_18; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_1_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_1_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_1_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_9_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_9_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_9_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_17_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_17_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_17_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_25_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_25_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_25_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_33 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_33.
Proof. unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_33;intros;subst;rvv_frame. Qed.
End CheckedRvvLoadPart01.
