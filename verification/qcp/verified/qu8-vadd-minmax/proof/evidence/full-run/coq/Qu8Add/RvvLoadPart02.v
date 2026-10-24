From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart02.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_3 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_3.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_3; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_19 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_19.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_19; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_1 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_1.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_1; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_1_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_9 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_9.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_9; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_9_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_17 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_17.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_17; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_17_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_25 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_25.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_25; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_25_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart02.
