From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart06.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_7 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_7.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_7; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_23 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_23.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_23; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_3 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_3.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_3; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_3_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_11 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_11.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_11; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_11_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_19 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_19.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_19; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_19_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_27 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_27.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_27; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_27_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart06.
