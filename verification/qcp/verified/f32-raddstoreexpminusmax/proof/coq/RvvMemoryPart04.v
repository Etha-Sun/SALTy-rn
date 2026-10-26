From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_5 : ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_5.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_5;left;intros S Q M P N O W F A_2 output input G PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8.
 assert(HN:0<N)by(unfold em_valid in PreH6;tauto).
 assert(Hq:Z.quot N 4=G)by(rewrite Z.quot_div_nonneg by lia;symmetry;apply Z.div_unique with(N-4*G);lia).
 rewrite Hq.
 assert(Hrem:Z.rem N 4=N-4*G)by(pose proof(Z.quot_rem N 4 ltac:(lia));lia).
 rewrite Hrem;Exists A_2;emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_5.
