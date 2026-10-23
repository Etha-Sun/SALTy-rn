From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import NeonSupport NeonReturns NeonTailFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_2 : Qu8Rsum.neon_unit_goal.test_neon_return_wit_2.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_return_wit_2;left;intros;subst.
 try change Int.max_unsigned with 4294967295 in *.
 rewrite ?sizeof_uchar in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.quot_1_r in *.
 replace(input_pre+(batch_pre-batch)-input_pre)with(batch_pre-batch)in *by lia.
 set(idx:=batch_pre-batch)in *.
 assert(Hidx:0<=idx)by(pose proof(rs_rem2048_le batch_pre ltac:(lia));unfold idx;lia).
 assert(Hend:idx+batch=batch_pre)by(unfold idx;lia).
 pose proof(rs_rem2048_bound batch_pre)as Hr.
 pose proof(rs_count16_strict(rs_rem2048 batch_pre-batch)ltac:(lia))as Hk.
 prop_apply(UCharArray.full_Zlength input_pre(batch_pre+15)A);Intros_p Hlen.
 prop_apply(rs_bytes_all_range input_pre(batch_pre+15)A);Intros_p Hbytes.
 assert(Htailbytes:forall i:Z,0<=i<16 -> 0<=Znth(idx+i)A 0<=255)by(intros i Hi;apply Hbytes;unfold idx;lia).
 pose proof(rs_mul_u8_range (Znth(idx+0)A 0)(Znth(16-batch+0)rs_onemask 0))as Hm0.
 pose proof(rs_mul_u8_range (Znth(idx+1)A 0)(Znth(16-batch+1)rs_onemask 0))as Hm1.
 pose proof(rs_mul_u8_range (Znth(idx+2)A 0)(Znth(16-batch+2)rs_onemask 0))as Hm2.
 pose proof(rs_mul_u8_range (Znth(idx+3)A 0)(Znth(16-batch+3)rs_onemask 0))as Hm3.
 pose proof(rs_mul_u8_range (Znth(idx+4)A 0)(Znth(16-batch+4)rs_onemask 0))as Hm4.
 pose proof(rs_mul_u8_range (Znth(idx+5)A 0)(Znth(16-batch+5)rs_onemask 0))as Hm5.
 pose proof(rs_mul_u8_range (Znth(idx+6)A 0)(Znth(16-batch+6)rs_onemask 0))as Hm6.
 pose proof(rs_mul_u8_range (Znth(idx+7)A 0)(Znth(16-batch+7)rs_onemask 0))as Hm7.
 pose proof(rs_mul_u8_range (Znth(idx+8)A 0)(Znth(16-batch+8)rs_onemask 0))as Hm8.
 pose proof(rs_mul_u8_range (Znth(idx+9)A 0)(Znth(16-batch+9)rs_onemask 0))as Hm9.
 pose proof(rs_mul_u8_range (Znth(idx+10)A 0)(Znth(16-batch+10)rs_onemask 0))as Hm10.
 pose proof(rs_mul_u8_range (Znth(idx+11)A 0)(Znth(16-batch+11)rs_onemask 0))as Hm11.
 pose proof(rs_mul_u8_range (Znth(idx+12)A 0)(Znth(16-batch+12)rs_onemask 0))as Hm12.
 pose proof(rs_mul_u8_range (Znth(idx+13)A 0)(Znth(16-batch+13)rs_onemask 0))as Hm13.
 pose proof(rs_mul_u8_range (Znth(idx+14)A 0)(Znth(16-batch+14)rs_onemask 0))as Hm14.
 pose proof(rs_mul_u8_range (Znth(idx+15)A 0)(Znth(16-batch+15)rs_onemask 0))as Hm15.
 pose proof(rs_sum8_pair_step(rs_count16(rs_rem2048 batch_pre-batch)) w0 w1 w2 w3 w4 w5 w6 w7 (rs_mul_u8(Znth(idx+0)A 0)(Znth(16-batch+0)rs_onemask 0)) (rs_mul_u8(Znth(idx+1)A 0)(Znth(16-batch+1)rs_onemask 0)) (rs_mul_u8(Znth(idx+2)A 0)(Znth(16-batch+2)rs_onemask 0)) (rs_mul_u8(Znth(idx+3)A 0)(Znth(16-batch+3)rs_onemask 0)) (rs_mul_u8(Znth(idx+4)A 0)(Znth(16-batch+4)rs_onemask 0)) (rs_mul_u8(Znth(idx+5)A 0)(Znth(16-batch+5)rs_onemask 0)) (rs_mul_u8(Znth(idx+6)A 0)(Znth(16-batch+6)rs_onemask 0)) (rs_mul_u8(Znth(idx+7)A 0)(Znth(16-batch+7)rs_onemask 0)) (rs_mul_u8(Znth(idx+8)A 0)(Znth(16-batch+8)rs_onemask 0)) (rs_mul_u8(Znth(idx+9)A 0)(Znth(16-batch+9)rs_onemask 0)) (rs_mul_u8(Znth(idx+10)A 0)(Znth(16-batch+10)rs_onemask 0)) (rs_mul_u8(Znth(idx+11)A 0)(Znth(16-batch+11)rs_onemask 0)) (rs_mul_u8(Znth(idx+12)A 0)(Znth(16-batch+12)rs_onemask 0)) (rs_mul_u8(Znth(idx+13)A 0)(Znth(16-batch+13)rs_onemask 0)) (rs_mul_u8(Znth(idx+14)A 0)(Znth(16-batch+14)rs_onemask 0)) (rs_mul_u8(Znth(idx+15)A 0)(Znth(16-batch+15)rs_onemask 0)))as Hstep.
 repeat match type of Hstep with ?P -> _=>specialize(Hstep ltac:(lia))end.
 pose proof(rs_tail_sum16_values A idx batch Hidx ltac:(lia)ltac:(lia) Htailbytes)as Htail.
 rewrite Hend in Htail;rewrite Htail in Hstep.
 assert(Hsum:rs_u32(rs_sum4 c0 c1 c2 c3+(rs_sum8 (rs_pair_u8 w0(rs_mul_u8(Znth(idx+0)A 0)(Znth(16-batch+0)rs_onemask 0))(rs_mul_u8(Znth(idx+1)A 0)(Znth(16-batch+1)rs_onemask 0))) (rs_pair_u8 w1(rs_mul_u8(Znth(idx+2)A 0)(Znth(16-batch+2)rs_onemask 0))(rs_mul_u8(Znth(idx+3)A 0)(Znth(16-batch+3)rs_onemask 0))) (rs_pair_u8 w2(rs_mul_u8(Znth(idx+4)A 0)(Znth(16-batch+4)rs_onemask 0))(rs_mul_u8(Znth(idx+5)A 0)(Znth(16-batch+5)rs_onemask 0))) (rs_pair_u8 w3(rs_mul_u8(Znth(idx+6)A 0)(Znth(16-batch+6)rs_onemask 0))(rs_mul_u8(Znth(idx+7)A 0)(Znth(16-batch+7)rs_onemask 0))) (rs_pair_u8 w4(rs_mul_u8(Znth(idx+8)A 0)(Znth(16-batch+8)rs_onemask 0))(rs_mul_u8(Znth(idx+9)A 0)(Znth(16-batch+9)rs_onemask 0))) (rs_pair_u8 w5(rs_mul_u8(Znth(idx+10)A 0)(Znth(16-batch+10)rs_onemask 0))(rs_mul_u8(Znth(idx+11)A 0)(Znth(16-batch+11)rs_onemask 0))) (rs_pair_u8 w6(rs_mul_u8(Znth(idx+12)A 0)(Znth(16-batch+12)rs_onemask 0))(rs_mul_u8(Znth(idx+13)A 0)(Znth(16-batch+13)rs_onemask 0))) (rs_pair_u8 w7(rs_mul_u8(Znth(idx+14)A 0)(Znth(16-batch+14)rs_onemask 0))(rs_mul_u8(Znth(idx+15)A 0)(Znth(16-batch+15)rs_onemask 0)))))=rs_u32(rs_prefix A batch_pre)).
 { rewrite Hstep.
  replace(rs_sum4 c0 c1 c2 c3+(rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7+(rs_prefix A batch_pre-rs_prefix A idx)))with((rs_sum4 c0 c1 c2 c3+rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7)+(rs_prefix A batch_pre-rs_prefix A idx))by ring.
  rewrite <-(rs_u32_add_l(rs_sum4 c0 c1 c2 c3+rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7)(rs_prefix A batch_pre-rs_prefix A idx)).
  rewrite PreH37,rs_u32_add_l;f_equal;ring.
 }
 fold rs_u32.
 rewrite rs_reduce4 by(apply rs_pair_u16_range;first[lia|apply rs_pair_u8_range]).
 rewrite rs_sum4_pair_step by(first[lia|apply rs_pair_u8_range]).
 rewrite Hsum;unfold rs_u32;rewrite unsigned_unsigned_add_r by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_neon_return_wit_2.
