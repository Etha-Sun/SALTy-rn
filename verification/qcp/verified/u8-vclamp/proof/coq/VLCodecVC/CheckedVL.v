From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic.
From VLCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VLCodecVC.unit_goal.VC_Correct.
Lemma proof_of___riscv_vsetvl_e8m8_safety_wit_1 : __riscv_vsetvl_e8m8_safety_wit_1.
Proof. unfold __riscv_vsetvl_e8m8_safety_wit_1;pre_process;unfold INT_MAX,INT_MIN;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m8_safety_wit_2 : __riscv_vsetvl_e8m8_safety_wit_2.
Proof. unfold __riscv_vsetvl_e8m8_safety_wit_2;pre_process;unfold INT_MAX,INT_MIN;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m8_return_wit_1 : __riscv_vsetvl_e8m8_return_wit_1.
Proof. unfold __riscv_vsetvl_e8m8_return_wit_1;left;pre_process;unfold u8_vl;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m8_return_wit_2 : __riscv_vsetvl_e8m8_return_wit_2.
Proof. unfold __riscv_vsetvl_e8m8_return_wit_2;left;pre_process;unfold u8_vl;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];entailer!;lia. Qed.
End Checked.
Print Assumptions Checked.proof_of___riscv_vsetvl_e8m8_safety_wit_1.
Print Assumptions Checked.proof_of___riscv_vsetvl_e8m8_safety_wit_2.
Print Assumptions Checked.proof_of___riscv_vsetvl_e8m8_return_wit_1.
Print Assumptions Checked.proof_of___riscv_vsetvl_e8m8_return_wit_2.
