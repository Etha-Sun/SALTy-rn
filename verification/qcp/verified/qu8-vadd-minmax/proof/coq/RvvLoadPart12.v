From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart12.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_13 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_13.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_13; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_29 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_29.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_29; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_6 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_6.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_6; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_6_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_14 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_14.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_14; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_14_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_22 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_22.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_22; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_22_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_30 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_30.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_30; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_30_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart12.
