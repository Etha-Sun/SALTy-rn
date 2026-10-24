From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart00.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_1 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_1.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_1; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_17 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_17.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_17; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_return_wit_1 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_return_wit_1.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_return_wit_1; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_8 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_8.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_8; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_8_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_16 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_16.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_16; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_16_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_24 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_24.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_24; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_24_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_32 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_32.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_32; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_32_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart00.
