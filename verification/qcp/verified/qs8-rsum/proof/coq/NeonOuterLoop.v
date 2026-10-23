From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_outer_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_outer_frame|rs_outer_frame]
 | _=>first[solve[rs_neon_pure]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]end.
Lemma proof_of_test_neon_entail_wit_4 : Qs8Rsum.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold Qs8Rsum.neon_unit_goal.test_neon_entail_wit_4;left;intros.
 assert(Hend:current_batch=0)by lia;subst.
 rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.sub_0_r in *.
 try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *.
 change(rs_count16 2048)with 128 in *.
 assert(Hc0:-2147483648<=rs_pair_s16 c0_2 w0 w1<=2147483647)by(rewrite rs_pair_s16_wrap by lia;apply rs_s32_bound).
 assert(Hc1:-2147483648<=rs_pair_s16 c1_2 w2 w3<=2147483647)by(rewrite rs_pair_s16_wrap by lia;apply rs_s32_bound).
 assert(Hc2:-2147483648<=rs_pair_s16 c2_2 w4 w5<=2147483647)by(rewrite rs_pair_s16_wrap by lia;apply rs_s32_bound).
 assert(Hc3:-2147483648<=rs_pair_s16 c3_2 w6 w7<=2147483647)by(rewrite rs_pair_s16_wrap by lia;apply rs_s32_bound).
 pose proof(rs_sum4_pair_step c0_2 c1_2 c2_2 c3_2 w0 w1 w2 w3 w4 w5 w6 w7)as Hsum.
 repeat match type of Hsum with ?P->_=>specialize(Hsum ltac:(lia))end.
 rewrite <-(rs_s32_add_l(rs_sum4 c0_2 c1_2 c2_2 c3_2)(rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7))in Hsum.
 rewrite PreH38,rs_s32_add_l,PreH39 in Hsum.
 replace(rs_prefix A(batch_pre-batch)+(rs_prefix A(batch_pre-batch+2048)-rs_prefix A(batch_pre-batch)))with(rs_prefix A(batch_pre-batch+2048))in Hsum by lia.
 rexists(rs_pair_s16 c3_2 w6 w7).
 rexists(rs_pair_s16 c2_2 w4 w5).
 rexists(rs_pair_s16 c1_2 w2 w3).
 rexists(rs_pair_s16 c0_2 w0 w1).

 replace(batch_pre-(batch-2048))with(batch_pre-batch+2048)by lia.
 rewrite rs_rem2048_sub,Hsum.
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_outer_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
