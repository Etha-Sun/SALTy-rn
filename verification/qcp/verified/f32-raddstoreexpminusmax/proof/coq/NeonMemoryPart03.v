From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_4 : ExpMinusMax.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_4;intros S Q M P N O W F A_2 output input batch G PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
 assert(HN:0<N)by(unfold em_valid in PreH7;tauto).
 assert(Hq:Z.quot N 4=G)by(rewrite Z.quot_div_nonneg by lia;symmetry;apply Z.div_unique with(N-4*G);lia).
 rewrite Hq.
 assert(Hrem:BinInt.Z.rem N 4=N-4*G)by(pose proof(BinInt.Z.quot_rem N 4 ltac:(lia));lia).
 destruct(BinInt.Z.eq_dec batch 0)as[Hz|Hz].
 - eapply derivable1_trans;[|apply derivable1_orp_intros1].
   rewrite Hrem;Exists A_2;emk_frame.
 - eapply derivable1_trans;[|apply derivable1_orp_intros2].
   rewrite Hrem;Exists A_2;emk_frame.

Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_4.
