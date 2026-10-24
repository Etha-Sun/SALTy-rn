From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart04.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_5 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_5.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_5; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_21 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_21.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_21; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_2 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_2.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_2; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_2_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_10 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_10.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_10; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_10_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_18 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_18.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_18; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_18_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_26 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_26.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_26; intros Hpure; unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_26_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart04.
