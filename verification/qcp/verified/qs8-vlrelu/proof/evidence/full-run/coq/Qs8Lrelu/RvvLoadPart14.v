From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart14.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_15 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_15.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_15; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_31 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_31.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_31; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_7 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_7.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_7; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_7_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_15 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_15.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_15; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_15_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_23 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_23.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_23; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_23_aux; intros; subst; rvv_frame.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_31 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_31.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_31; intros Hpure; unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_31_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvLoadPart14.
