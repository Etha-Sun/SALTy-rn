From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_outer_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_outer_frame|rs_outer_frame]
 | _=>first[solve[rs_neon_pure]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]end.
Lemma proof_of_test_neon_entail_wit_4 : Qu8Rsum.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_entail_wit_4;left;intros.
 assert(Hend:current_batch=0)by lia;subst.
 rewrite ?sizeof_uchar in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.sub_0_r in *.
 try change Int.max_unsigned with 4294967295 in *.
 change(rs_count16 2048)with 128 in *.
 assert(Hc0:0<=rs_pair_u16 c0_2 w0 w1<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc1:0<=rs_pair_u16 c1_2 w2 w3<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc2:0<=rs_pair_u16 c2_2 w4 w5<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc3:0<=rs_pair_u16 c3_2 w6 w7<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 pose proof(rs_sum4_pair_step c0_2 c1_2 c2_2 c3_2 w0 w1 w2 w3 w4 w5 w6 w7)as Hsum.
 repeat match type of Hsum with ?P->_=>specialize(Hsum ltac:(lia))end.
 rewrite <-(rs_u32_add_l(rs_sum4 c0_2 c1_2 c2_2 c3_2)(rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7))in Hsum.
 rewrite PreH38,rs_u32_add_l,PreH39 in Hsum.
 replace(rs_prefix A(batch_pre-batch)+(rs_prefix A(batch_pre-batch+2048)-rs_prefix A(batch_pre-batch)))with(rs_prefix A(batch_pre-batch+2048))in Hsum by lia.
 rexists(rs_pair_u16 c3_2 w6 w7).
 rexists(rs_pair_u16 c2_2 w4 w5).
 rexists(rs_pair_u16 c1_2 w2 w3).
 rexists(rs_pair_u16 c0_2 w0 w1).
 try rewrite unsigned_last_nbits_eq by(cbn;lia).
 replace(batch_pre-(batch-2048))with(batch_pre-batch+2048)by lia.
 rewrite rs_rem2048_sub,Hsum.
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_outer_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
