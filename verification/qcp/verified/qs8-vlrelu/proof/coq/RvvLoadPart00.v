From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart00.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_1 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_1.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_1; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_17 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_17.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_17; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_return_wit_1 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_return_wit_1.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_return_wit_1; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_8 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_8.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_8; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_8_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_16 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_16.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_16; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_16_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_24 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_24.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_24; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_24_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_32 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_32.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_32; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_32_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart00.
