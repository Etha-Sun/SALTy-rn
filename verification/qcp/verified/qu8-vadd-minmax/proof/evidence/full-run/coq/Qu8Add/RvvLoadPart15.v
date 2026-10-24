From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvLoadSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvLoadPart15.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_16 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_16.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_16; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_safety_wit_32 : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_32.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_safety_wit_32; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_8_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_8_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_8_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_16_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_16_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_16_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_24_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_24_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_24_pure; rvv_pure.  Qed.
Lemma proof_of___riscv_vle8_v_u8m2_partial_solve_wit_32_pure : Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_32_pure.
Proof.  unfold Qu8Add.rvv_load_goal.__riscv_vle8_v_u8m2_partial_solve_wit_32_pure; rvv_pure.  Qed.
End CheckedRvvLoadPart15.
