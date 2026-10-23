From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_remainder_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_remainder_frame|rs_remainder_frame]
 | _=>first[solve[rs_neon_pure]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]end.
Lemma proof_of_test_neon_entail_wit_6 : Qs8Rsum.neon_unit_goal.test_neon_entail_wit_6.
Proof.
 unfold Qs8Rsum.neon_unit_goal.test_neon_entail_wit_6;left;intros;subst.
 rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.quot_1_r in *.
 try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *.
 pose proof(rs_rem2048_bound batch_pre)as Hrem.
 pose proof(rs_rem2048_le batch_pre ltac:(lia))as Hremle.
 pose proof(rs_count16_strict(rs_rem2048 batch_pre-batch)ltac:(lia))as Hk.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+15)A);Intros_p Hlen.
 prop_apply(rs_bytes_all_range input_pre(batch_pre+15)A);Intros_p Hbytes.
 replace(input_pre+(batch_pre-batch)-input_pre)with(batch_pre-batch)in *by lia.
 pose proof(Hbytes((batch_pre-batch)+0)ltac:(lia))as Hb0.
 pose proof(Hbytes((batch_pre-batch)+1)ltac:(lia))as Hb1.
 pose proof(Hbytes((batch_pre-batch)+2)ltac:(lia))as Hb2.
 pose proof(Hbytes((batch_pre-batch)+3)ltac:(lia))as Hb3.
 pose proof(Hbytes((batch_pre-batch)+4)ltac:(lia))as Hb4.
 pose proof(Hbytes((batch_pre-batch)+5)ltac:(lia))as Hb5.
 pose proof(Hbytes((batch_pre-batch)+6)ltac:(lia))as Hb6.
 pose proof(Hbytes((batch_pre-batch)+7)ltac:(lia))as Hb7.
 pose proof(Hbytes((batch_pre-batch)+8)ltac:(lia))as Hb8.
 pose proof(Hbytes((batch_pre-batch)+9)ltac:(lia))as Hb9.
 pose proof(Hbytes((batch_pre-batch)+10)ltac:(lia))as Hb10.
 pose proof(Hbytes((batch_pre-batch)+11)ltac:(lia))as Hb11.
 pose proof(Hbytes((batch_pre-batch)+12)ltac:(lia))as Hb12.
 pose proof(Hbytes((batch_pre-batch)+13)ltac:(lia))as Hb13.
 pose proof(Hbytes((batch_pre-batch)+14)ltac:(lia))as Hb14.
 pose proof(Hbytes((batch_pre-batch)+15)ltac:(lia))as Hb15.
 pose proof(rs_pair_s8_step_bound w0_2(Znth((batch_pre-batch)+0)A 0)(Znth((batch_pre-batch)+1)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw0.
 pose proof(rs_pair_s8_step_bound w1_2(Znth((batch_pre-batch)+2)A 0)(Znth((batch_pre-batch)+3)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw1.
 pose proof(rs_pair_s8_step_bound w2_2(Znth((batch_pre-batch)+4)A 0)(Znth((batch_pre-batch)+5)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw2.
 pose proof(rs_pair_s8_step_bound w3_2(Znth((batch_pre-batch)+6)A 0)(Znth((batch_pre-batch)+7)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw3.
 pose proof(rs_pair_s8_step_bound w4_2(Znth((batch_pre-batch)+8)A 0)(Znth((batch_pre-batch)+9)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw4.
 pose proof(rs_pair_s8_step_bound w5_2(Znth((batch_pre-batch)+10)A 0)(Znth((batch_pre-batch)+11)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw5.
 pose proof(rs_pair_s8_step_bound w6_2(Znth((batch_pre-batch)+12)A 0)(Znth((batch_pre-batch)+13)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw6.
 pose proof(rs_pair_s8_step_bound w7_2(Znth((batch_pre-batch)+14)A 0)(Znth((batch_pre-batch)+15)A 0)(rs_count16(rs_rem2048 batch_pre-batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw7.
 pose proof(rs_sum8_pair_step (rs_count16(rs_rem2048 batch_pre-batch)) w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2 (Znth((batch_pre-batch)+0)A 0) (Znth((batch_pre-batch)+1)A 0) (Znth((batch_pre-batch)+2)A 0) (Znth((batch_pre-batch)+3)A 0) (Znth((batch_pre-batch)+4)A 0) (Znth((batch_pre-batch)+5)A 0) (Znth((batch_pre-batch)+6)A 0) (Znth((batch_pre-batch)+7)A 0) (Znth((batch_pre-batch)+8)A 0) (Znth((batch_pre-batch)+9)A 0) (Znth((batch_pre-batch)+10)A 0) (Znth((batch_pre-batch)+11)A 0) (Znth((batch_pre-batch)+12)A 0) (Znth((batch_pre-batch)+13)A 0) (Znth((batch_pre-batch)+14)A 0) (Znth((batch_pre-batch)+15)A 0))as Hstep.
 repeat match type of Hstep with ?P -> _=>specialize(Hstep ltac:(lia))end.
 pose proof(rs_prefix16_values A (batch_pre-batch) ltac:(lia)ltac:(lia))as Hprefix.
 assert(Hsum:rs_s32(rs_sum4 c0_2 c1_2 c2_2 c3_2+rs_sum8 (rs_pair_s8 w0_2(Znth((batch_pre-batch)+0)A 0)(Znth((batch_pre-batch)+1)A 0)) (rs_pair_s8 w1_2(Znth((batch_pre-batch)+2)A 0)(Znth((batch_pre-batch)+3)A 0)) (rs_pair_s8 w2_2(Znth((batch_pre-batch)+4)A 0)(Znth((batch_pre-batch)+5)A 0)) (rs_pair_s8 w3_2(Znth((batch_pre-batch)+6)A 0)(Znth((batch_pre-batch)+7)A 0)) (rs_pair_s8 w4_2(Znth((batch_pre-batch)+8)A 0)(Znth((batch_pre-batch)+9)A 0)) (rs_pair_s8 w5_2(Znth((batch_pre-batch)+10)A 0)(Znth((batch_pre-batch)+11)A 0)) (rs_pair_s8 w6_2(Znth((batch_pre-batch)+12)A 0)(Znth((batch_pre-batch)+13)A 0)) (rs_pair_s8 w7_2(Znth((batch_pre-batch)+14)A 0)(Znth((batch_pre-batch)+15)A 0)))=rs_s32(rs_prefix A((batch_pre-batch)+16))).
 { rewrite Hstep.
   replace(rs_sum4 c0_2 c1_2 c2_2 c3_2+(rs_sum8 w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2+rs_sum [ Znth((batch_pre-batch)+0)A 0;Znth((batch_pre-batch)+1)A 0;Znth((batch_pre-batch)+2)A 0;Znth((batch_pre-batch)+3)A 0;Znth((batch_pre-batch)+4)A 0;Znth((batch_pre-batch)+5)A 0;Znth((batch_pre-batch)+6)A 0;Znth((batch_pre-batch)+7)A 0;Znth((batch_pre-batch)+8)A 0;Znth((batch_pre-batch)+9)A 0;Znth((batch_pre-batch)+10)A 0;Znth((batch_pre-batch)+11)A 0;Znth((batch_pre-batch)+12)A 0;Znth((batch_pre-batch)+13)A 0;Znth((batch_pre-batch)+14)A 0;Znth((batch_pre-batch)+15)A 0 ]))with((rs_sum4 c0_2 c1_2 c2_2 c3_2+rs_sum8 w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2)+rs_sum [ Znth((batch_pre-batch)+0)A 0;Znth((batch_pre-batch)+1)A 0;Znth((batch_pre-batch)+2)A 0;Znth((batch_pre-batch)+3)A 0;Znth((batch_pre-batch)+4)A 0;Znth((batch_pre-batch)+5)A 0;Znth((batch_pre-batch)+6)A 0;Znth((batch_pre-batch)+7)A 0;Znth((batch_pre-batch)+8)A 0;Znth((batch_pre-batch)+9)A 0;Znth((batch_pre-batch)+10)A 0;Znth((batch_pre-batch)+11)A 0;Znth((batch_pre-batch)+12)A 0;Znth((batch_pre-batch)+13)A 0;Znth((batch_pre-batch)+14)A 0;Znth((batch_pre-batch)+15)A 0 ])by ring.
   rewrite <-(rs_s32_add_l(rs_sum4 c0_2 c1_2 c2_2 c3_2+rs_sum8 w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2)(rs_sum [ Znth((batch_pre-batch)+0)A 0;Znth((batch_pre-batch)+1)A 0;Znth((batch_pre-batch)+2)A 0;Znth((batch_pre-batch)+3)A 0;Znth((batch_pre-batch)+4)A 0;Znth((batch_pre-batch)+5)A 0;Znth((batch_pre-batch)+6)A 0;Znth((batch_pre-batch)+7)A 0;Znth((batch_pre-batch)+8)A 0;Znth((batch_pre-batch)+9)A 0;Znth((batch_pre-batch)+10)A 0;Znth((batch_pre-batch)+11)A 0;Znth((batch_pre-batch)+12)A 0;Znth((batch_pre-batch)+13)A 0;Znth((batch_pre-batch)+14)A 0;Znth((batch_pre-batch)+15)A 0 ])).
   rewrite PreH35,rs_s32_add_l;rewrite <-Hprefix;reflexivity.
 }
 rexists(rs_pair_s8 w7_2(Znth((batch_pre-batch)+14)A 0)(Znth((batch_pre-batch)+15)A 0)).
 rexists(rs_pair_s8 w6_2(Znth((batch_pre-batch)+12)A 0)(Znth((batch_pre-batch)+13)A 0)).
 rexists(rs_pair_s8 w5_2(Znth((batch_pre-batch)+10)A 0)(Znth((batch_pre-batch)+11)A 0)).
 rexists(rs_pair_s8 w4_2(Znth((batch_pre-batch)+8)A 0)(Znth((batch_pre-batch)+9)A 0)).
 rexists(rs_pair_s8 w3_2(Znth((batch_pre-batch)+6)A 0)(Znth((batch_pre-batch)+7)A 0)).
 rexists(rs_pair_s8 w2_2(Znth((batch_pre-batch)+4)A 0)(Znth((batch_pre-batch)+5)A 0)).
 rexists(rs_pair_s8 w1_2(Znth((batch_pre-batch)+2)A 0)(Znth((batch_pre-batch)+3)A 0)).
 rexists(rs_pair_s8 w0_2(Znth((batch_pre-batch)+0)A 0)(Znth((batch_pre-batch)+1)A 0)).
 rexists c3_2.
 rexists c2_2.
 rexists c1_2.
 rexists c0_2.

 replace(rs_rem2048 batch_pre-(batch-16))with((rs_rem2048 batch_pre-batch)+16)by lia.
 replace(batch_pre-(batch-16))with((batch_pre-batch)+16)by lia.
 rewrite rs_count16_next,rs_mod16_add,Hsum.
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_remainder_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_6.
