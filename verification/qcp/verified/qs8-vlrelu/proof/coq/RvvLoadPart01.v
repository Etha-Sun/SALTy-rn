From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart01.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_2 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_2.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_2; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_safety_wit_18 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_18.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_safety_wit_18; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_1_pure : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_1_pure.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_1_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_9_pure : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_9_pure.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_9_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_17_pure : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_17_pure.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_17_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_25_pure : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_25_pure.
Proof.  unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_25_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_i8m2_partial_solve_wit_33 : Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_33.
Proof. unfold Qs8Lrelu.rvv_load_goal.__riscv_vle8_v_i8m2_partial_solve_wit_33;intros;subst;rvv_frame. Qed.
End CheckedRvvLoadPart01.
