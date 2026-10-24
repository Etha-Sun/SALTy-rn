From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart10.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_11 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_11.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_11; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_27 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_27.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_27; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_5 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_5.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_5; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_5_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_13 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_13.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_13; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_13_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_21 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_21.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_21; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_21_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_29 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_29.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_29; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_29_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart10.
