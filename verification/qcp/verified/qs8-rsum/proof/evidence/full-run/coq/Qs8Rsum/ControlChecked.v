From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rsum Require Import VlModel vl_goal control_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checkedvl : Qs8Rsum.vl_goal.VC_Correct.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_2;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m8_safety_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_safety_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_safety_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m8_return_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_return_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_return_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m1_safety_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_safety_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_safety_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m1_return_wit_1 : Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_return_wit_1.
Proof. unfold Qs8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_return_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
End Checkedvl.
Print Assumptions Checkedvl.proof_of___riscv_vsetvl_e8m2_safety_wit_1.
Print Assumptions Checkedvl.proof_of___riscv_vsetvl_e8m2_safety_wit_2.
Print Assumptions Checkedvl.proof_of___riscv_vsetvl_e8m2_return_wit_1.
Print Assumptions Checkedvl.proof_of___riscv_vsetvl_e8m2_return_wit_2.
Print Assumptions Checkedvl.proof_of___riscv_vsetvlmax_e32m8_safety_wit_1.
Print Assumptions Checkedvl.proof_of___riscv_vsetvlmax_e32m8_return_wit_1.
Print Assumptions Checkedvl.proof_of___riscv_vsetvlmax_e32m1_safety_wit_1.
Print Assumptions Checkedvl.proof_of___riscv_vsetvlmax_e32m1_return_wit_1.
Module Checkedcontrol : Qs8Rsum.control_goal.VC_Correct.
Lemma proof_of_qcp_assert_return_wit_1 : Qs8Rsum.control_goal.qcp_assert_return_wit_1.
Proof. unfold Qs8Rsum.control_goal.qcp_assert_return_wit_1;try left;intros;subst;unfold rs_vl in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int64.max_unsigned with 18446744073709551615 in *;entailer!;lia. Qed.
End Checkedcontrol.
Print Assumptions Checkedcontrol.proof_of_qcp_assert_return_wit_1.
