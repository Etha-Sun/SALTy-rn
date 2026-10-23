From Coq Require Import ZArith Lia.
From S8Clamp Require Import Types scalar_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalar : S8Clamp.scalar_primitives_goal.VC_Correct.
Lemma proof_of_qcp_s8_min_return_wit_1 : S8Clamp.scalar_primitives_goal.qcp_s8_min_return_wit_1.
Proof. unfold S8Clamp.scalar_primitives_goal.qcp_s8_min_return_wit_1.
 left; intros; unfold s8_min; rewrite Z.min_r by lia; entailer!.
Qed.
Lemma proof_of_qcp_s8_min_return_wit_2 : S8Clamp.scalar_primitives_goal.qcp_s8_min_return_wit_2.
Proof. unfold S8Clamp.scalar_primitives_goal.qcp_s8_min_return_wit_2.
 left; intros; unfold s8_min; rewrite Z.min_l by lia; entailer!.
Qed.
Lemma proof_of_qcp_s8_max_return_wit_1 : S8Clamp.scalar_primitives_goal.qcp_s8_max_return_wit_1.
Proof. unfold S8Clamp.scalar_primitives_goal.qcp_s8_max_return_wit_1.
 left; intros; unfold s8_max; rewrite Z.max_r by lia; entailer!.
Qed.
Lemma proof_of_qcp_s8_max_return_wit_2 : S8Clamp.scalar_primitives_goal.qcp_s8_max_return_wit_2.
Proof. unfold S8Clamp.scalar_primitives_goal.qcp_s8_max_return_wit_2.
 left; intros; unfold s8_max; rewrite Z.max_l by lia; entailer!.
Qed.
Lemma proof_of_qcp_s8_narrow_return_wit_1 : S8Clamp.scalar_primitives_goal.qcp_s8_narrow_return_wit_1.
Proof. unfold S8Clamp.scalar_primitives_goal.qcp_s8_narrow_return_wit_1.
 left; intros; unfold s8_narrow; entailer!.
Qed.
Lemma proof_of___riscv_vsetvl_e8m8_safety_wit_1 : S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_safety_wit_1.
Proof. unfold S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_safety_wit_1.
 intros; unfold derivable1,andp,coq_prop; intros; split; lia.
Qed.
Lemma proof_of___riscv_vsetvl_e8m8_safety_wit_2 : S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_safety_wit_2.
Proof. unfold S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_safety_wit_2.
 intros; unfold derivable1,andp,coq_prop; intros; split; lia.
Qed.
Lemma proof_of___riscv_vsetvl_e8m8_return_wit_1 : S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_return_wit_1.
Proof. unfold S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_return_wit_1.
 intros; entailer!;lia.
Qed.
Lemma proof_of___riscv_vsetvl_e8m8_return_wit_2 : S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_return_wit_2.
Proof. unfold S8Clamp.scalar_primitives_goal.__riscv_vsetvl_e8m8_return_wit_2.
 intros; entailer!;lia.
Qed.
End CheckedScalar.
