From Coq Require Import ZArith Lia String List.
From Qs8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart08.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_9 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_9.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_9; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_25 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_25.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_25; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_4 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_4.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_4; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_4_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_12 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_12.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_12; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_12_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_20 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_20.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_20; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_20_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_28 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_28.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_28; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_28_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart08.
