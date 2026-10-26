From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_1 : ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_1;right;intros sum_pre output_pre max_pre input_pre batch_pre S Q M P N W F PreH1 PreH2 PreH3 PreH4 PreH5 PreH6.
 pose proof PreH6 as HV;unfold em_valid,em_window,em_write_window in HV.
 destruct HV as[HN[HB[[HP _][HM[HMp[[HQ _][HS[HSp HD]]]]]]]].
 assert(Hrem:BinInt.Z.rem (BinInt.Z.mul 4 N) 4=0)by(rewrite BinInt.Z.mul_comm;apply BinInt.Z.rem_mul;lia).
 emk_prepare;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_1.
