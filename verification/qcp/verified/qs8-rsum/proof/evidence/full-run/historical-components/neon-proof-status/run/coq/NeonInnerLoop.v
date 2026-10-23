From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_inner_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_inner_frame|rs_inner_frame]
 | _=>first[solve[rs_neon_pure]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]] end.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Rsum.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold Qs8Rsum.neon_unit_goal.test_neon_entail_wit_3;left;intros;subst.
 rewrite ?sizeof_char in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.quot_1_r in *.
 try change Int.max_signed with 2147483647 in *.
 assert(Hcur:16<=current_batch)by(eapply rs_mod16_positive;[lia|assumption]).
 pose proof(rs_count16_strict(2048-current_batch)ltac:(lia))as Hk.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+15)A);Intros_p Hlen.
 prop_apply(rs_bytes_all_range input_pre(batch_pre+15)A);Intros_p Hbytes.
 replace(input_pre+((batch_pre-batch)+(2048-current_batch))-input_pre)with(batch_pre-batch+(2048-current_batch))in *by lia.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+0)ltac:(lia))as Hb0.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+1)ltac:(lia))as Hb1.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+2)ltac:(lia))as Hb2.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+3)ltac:(lia))as Hb3.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+4)ltac:(lia))as Hb4.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+5)ltac:(lia))as Hb5.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+6)ltac:(lia))as Hb6.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+7)ltac:(lia))as Hb7.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+8)ltac:(lia))as Hb8.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+9)ltac:(lia))as Hb9.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+10)ltac:(lia))as Hb10.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+11)ltac:(lia))as Hb11.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+12)ltac:(lia))as Hb12.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+13)ltac:(lia))as Hb13.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+14)ltac:(lia))as Hb14.
 pose proof(Hbytes((batch_pre-batch+(2048-current_batch))+15)ltac:(lia))as Hb15.
 pose proof(rs_pair_s8_step_bound w0_2(Znth((batch_pre-batch+(2048-current_batch))+0)A 0)(Znth((batch_pre-batch+(2048-current_batch))+1)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw0.
 pose proof(rs_pair_s8_step_bound w1_2(Znth((batch_pre-batch+(2048-current_batch))+2)A 0)(Znth((batch_pre-batch+(2048-current_batch))+3)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw1.
 pose proof(rs_pair_s8_step_bound w2_2(Znth((batch_pre-batch+(2048-current_batch))+4)A 0)(Znth((batch_pre-batch+(2048-current_batch))+5)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw2.
 pose proof(rs_pair_s8_step_bound w3_2(Znth((batch_pre-batch+(2048-current_batch))+6)A 0)(Znth((batch_pre-batch+(2048-current_batch))+7)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw3.
 pose proof(rs_pair_s8_step_bound w4_2(Znth((batch_pre-batch+(2048-current_batch))+8)A 0)(Znth((batch_pre-batch+(2048-current_batch))+9)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw4.
 pose proof(rs_pair_s8_step_bound w5_2(Znth((batch_pre-batch+(2048-current_batch))+10)A 0)(Znth((batch_pre-batch+(2048-current_batch))+11)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw5.
 pose proof(rs_pair_s8_step_bound w6_2(Znth((batch_pre-batch+(2048-current_batch))+12)A 0)(Znth((batch_pre-batch+(2048-current_batch))+13)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw6.
 pose proof(rs_pair_s8_step_bound w7_2(Znth((batch_pre-batch+(2048-current_batch))+14)A 0)(Znth((batch_pre-batch+(2048-current_batch))+15)A 0)(rs_count16(2048-current_batch))ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hw7.
 pose proof(rs_sum8_pair_step(rs_count16(2048-current_batch)) w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2 (Znth((batch_pre-batch+(2048-current_batch))+0)A 0) (Znth((batch_pre-batch+(2048-current_batch))+1)A 0) (Znth((batch_pre-batch+(2048-current_batch))+2)A 0) (Znth((batch_pre-batch+(2048-current_batch))+3)A 0) (Znth((batch_pre-batch+(2048-current_batch))+4)A 0) (Znth((batch_pre-batch+(2048-current_batch))+5)A 0) (Znth((batch_pre-batch+(2048-current_batch))+6)A 0) (Znth((batch_pre-batch+(2048-current_batch))+7)A 0) (Znth((batch_pre-batch+(2048-current_batch))+8)A 0) (Znth((batch_pre-batch+(2048-current_batch))+9)A 0) (Znth((batch_pre-batch+(2048-current_batch))+10)A 0) (Znth((batch_pre-batch+(2048-current_batch))+11)A 0) (Znth((batch_pre-batch+(2048-current_batch))+12)A 0) (Znth((batch_pre-batch+(2048-current_batch))+13)A 0) (Znth((batch_pre-batch+(2048-current_batch))+14)A 0) (Znth((batch_pre-batch+(2048-current_batch))+15)A 0))as Hstep.
 repeat match type of Hstep with ?P -> _=>specialize(Hstep ltac:(lia))end.
 match goal with H:(rs_sum8 w0_2 w1_2 w2_2 w3_2 w4_2 w5_2 w6_2 w7_2)=_|-_=>rewrite H in Hstep end.
 pose proof(rs_prefix16_values A (batch_pre-batch+(2048-current_batch)) ltac:(lia)ltac:(lia))as Hprefix.
 assert(Hsum:rs_sum8 (rs_pair_s8 w0_2(Znth((batch_pre-batch+(2048-current_batch))+0)A 0)(Znth((batch_pre-batch+(2048-current_batch))+1)A 0)) (rs_pair_s8 w1_2(Znth((batch_pre-batch+(2048-current_batch))+2)A 0)(Znth((batch_pre-batch+(2048-current_batch))+3)A 0)) (rs_pair_s8 w2_2(Znth((batch_pre-batch+(2048-current_batch))+4)A 0)(Znth((batch_pre-batch+(2048-current_batch))+5)A 0)) (rs_pair_s8 w3_2(Znth((batch_pre-batch+(2048-current_batch))+6)A 0)(Znth((batch_pre-batch+(2048-current_batch))+7)A 0)) (rs_pair_s8 w4_2(Znth((batch_pre-batch+(2048-current_batch))+8)A 0)(Znth((batch_pre-batch+(2048-current_batch))+9)A 0)) (rs_pair_s8 w5_2(Znth((batch_pre-batch+(2048-current_batch))+10)A 0)(Znth((batch_pre-batch+(2048-current_batch))+11)A 0)) (rs_pair_s8 w6_2(Znth((batch_pre-batch+(2048-current_batch))+12)A 0)(Znth((batch_pre-batch+(2048-current_batch))+13)A 0)) (rs_pair_s8 w7_2(Znth((batch_pre-batch+(2048-current_batch))+14)A 0)(Znth((batch_pre-batch+(2048-current_batch))+15)A 0))=rs_prefix A((batch_pre-batch+(2048-current_batch))+16)-rs_prefix A(batch_pre-batch))by lia.
 rexists(rs_pair_s8 w7_2(Znth((batch_pre-batch+(2048-current_batch))+14)A 0)(Znth((batch_pre-batch+(2048-current_batch))+15)A 0)).
 rexists(rs_pair_s8 w6_2(Znth((batch_pre-batch+(2048-current_batch))+12)A 0)(Znth((batch_pre-batch+(2048-current_batch))+13)A 0)).
 rexists(rs_pair_s8 w5_2(Znth((batch_pre-batch+(2048-current_batch))+10)A 0)(Znth((batch_pre-batch+(2048-current_batch))+11)A 0)).
 rexists(rs_pair_s8 w4_2(Znth((batch_pre-batch+(2048-current_batch))+8)A 0)(Znth((batch_pre-batch+(2048-current_batch))+9)A 0)).
 rexists(rs_pair_s8 w3_2(Znth((batch_pre-batch+(2048-current_batch))+6)A 0)(Znth((batch_pre-batch+(2048-current_batch))+7)A 0)).
 rexists(rs_pair_s8 w2_2(Znth((batch_pre-batch+(2048-current_batch))+4)A 0)(Znth((batch_pre-batch+(2048-current_batch))+5)A 0)).
 rexists(rs_pair_s8 w1_2(Znth((batch_pre-batch+(2048-current_batch))+2)A 0)(Znth((batch_pre-batch+(2048-current_batch))+3)A 0)).
 rexists(rs_pair_s8 w0_2(Znth((batch_pre-batch+(2048-current_batch))+0)A 0)(Znth((batch_pre-batch+(2048-current_batch))+1)A 0)).
 rexists c3_2.
 rexists c2_2.
 rexists c1_2.
 rexists c0_2.
 rewrite unsigned_last_nbits_eq by(cbn;lia).
 replace(2048-(current_batch-16))with((2048-current_batch)+16)by lia.
 rewrite rs_count16_next,rs_mod16_sub.
 replace(batch_pre-batch+((2048-current_batch)+16))with((batch_pre-batch+(2048-current_batch))+16)by lia.
 rewrite Hsum.
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_inner_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
