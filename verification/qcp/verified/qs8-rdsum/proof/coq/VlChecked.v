From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import VlModel vl_control_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedVl : Qs8Rdsum.vl_control_goal.VC_Correct.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;unfold rd_vl;rewrite Z.min_r by lia;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof. unfold Qs8Rdsum.vl_control_goal.__riscv_vsetvl_e8m2_return_wit_2;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;unfold rd_vl;rewrite Z.min_l by lia;entailer!;lia. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : Qs8Rdsum.vl_control_goal.qcp_assert_return_wit_1.
Proof. unfold Qs8Rdsum.vl_control_goal.qcp_assert_return_wit_1;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
End CheckedVl.
