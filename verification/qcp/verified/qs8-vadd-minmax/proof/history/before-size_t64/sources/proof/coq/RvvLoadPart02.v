From Coq Require Import ZArith Lia String List.
From Qs8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart02.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_3 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_3.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_3; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_19 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_19.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_19; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_1 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_1.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_1; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_1_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_9 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_9.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_9; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_9_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_17 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_17.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_17; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_17_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_25 : Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_25.
Proof.  unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_25; intros Hpure; unfold Qs8Add.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_25_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart02.
