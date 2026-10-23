From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel RvvFacts RvvBounds FastFrame rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_loop_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_loop_frame|rs_loop_frame]
 | _=>first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|solve[entailer!;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end.
Lemma proof_of_test_rvv_entail_wit_2 : Qu8Rsum.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qu8Rsum.rvv_unit_goal.test_rvv_entail_wit_2;left;intros;subst.
 try change Int.max_unsigned with 4294967295 in *.
 assert(Hvl:0<rs_vl batch<=32 /\ rs_vl batch<=batch).
 { unfold rs_vl;destruct(Z.ltb_spec batch 32);lia. }
 prop_apply(UCharArray.full_Zlength input_pre (batch_pre+15)A);Intros_p Hlen.
 prop_apply(rs_read_lane_all input_pre (batch_pre+15)A (batch_pre-batch)(rs_vl batch) ltac:(lia) ltac:(lia) ltac:(lia));Intros_p Hbytes.
 pose proof(Hbytes 0 ltac:(lia))as Hb0.
 pose proof(Hbytes 1 ltac:(lia))as Hb1.
 pose proof(Hbytes 2 ltac:(lia))as Hb2.
 pose proof(Hbytes 3 ltac:(lia))as Hb3.
 pose proof(Hbytes 4 ltac:(lia))as Hb4.
 pose proof(Hbytes 5 ltac:(lia))as Hb5.
 pose proof(Hbytes 6 ltac:(lia))as Hb6.
 pose proof(Hbytes 7 ltac:(lia))as Hb7.
 pose proof(Hbytes 8 ltac:(lia))as Hb8.
 pose proof(Hbytes 9 ltac:(lia))as Hb9.
 pose proof(Hbytes 10 ltac:(lia))as Hb10.
 pose proof(Hbytes 11 ltac:(lia))as Hb11.
 pose proof(Hbytes 12 ltac:(lia))as Hb12.
 pose proof(Hbytes 13 ltac:(lia))as Hb13.
 pose proof(Hbytes 14 ltac:(lia))as Hb14.
 pose proof(Hbytes 15 ltac:(lia))as Hb15.
 pose proof(Hbytes 16 ltac:(lia))as Hb16.
 pose proof(Hbytes 17 ltac:(lia))as Hb17.
 pose proof(Hbytes 18 ltac:(lia))as Hb18.
 pose proof(Hbytes 19 ltac:(lia))as Hb19.
 pose proof(Hbytes 20 ltac:(lia))as Hb20.
 pose proof(Hbytes 21 ltac:(lia))as Hb21.
 pose proof(Hbytes 22 ltac:(lia))as Hb22.
 pose proof(Hbytes 23 ltac:(lia))as Hb23.
 pose proof(Hbytes 24 ltac:(lia))as Hb24.
 pose proof(Hbytes 25 ltac:(lia))as Hb25.
 pose proof(Hbytes 26 ltac:(lia))as Hb26.
 pose proof(Hbytes 27 ltac:(lia))as Hb27.
 pose proof(Hbytes 28 ltac:(lia))as Hb28.
 pose proof(Hbytes 29 ltac:(lia))as Hb29.
 pose proof(Hbytes 30 ltac:(lia))as Hb30.
 pose proof(Hbytes 31 ltac:(lia))as Hb31.
 pose proof(rs_splat_u32_bound(rs_read_lane 0(rs_vl batch)(batch_pre-batch)A)0(rs_vl batch)ltac:(lia))as Hs0.
 pose proof(rs_active_u32_bound c0_2 (rs_splat_u32(rs_read_lane 0(rs_vl batch)(batch_pre-batch)A)0(rs_vl batch)) 0(rs_vl batch)ltac:(lia)ltac:(lia))as Hc0.
 pose proof(rs_splat_u32_bound(rs_read_lane 1(rs_vl batch)(batch_pre-batch)A)1(rs_vl batch)ltac:(lia))as Hs1.
 pose proof(rs_active_u32_bound c1_2 (rs_splat_u32(rs_read_lane 1(rs_vl batch)(batch_pre-batch)A)1(rs_vl batch)) 1(rs_vl batch)ltac:(lia)ltac:(lia))as Hc1.
 pose proof(rs_splat_u32_bound(rs_read_lane 2(rs_vl batch)(batch_pre-batch)A)2(rs_vl batch)ltac:(lia))as Hs2.
 pose proof(rs_active_u32_bound c2_2 (rs_splat_u32(rs_read_lane 2(rs_vl batch)(batch_pre-batch)A)2(rs_vl batch)) 2(rs_vl batch)ltac:(lia)ltac:(lia))as Hc2.
 pose proof(rs_splat_u32_bound(rs_read_lane 3(rs_vl batch)(batch_pre-batch)A)3(rs_vl batch)ltac:(lia))as Hs3.
 pose proof(rs_active_u32_bound c3_2 (rs_splat_u32(rs_read_lane 3(rs_vl batch)(batch_pre-batch)A)3(rs_vl batch)) 3(rs_vl batch)ltac:(lia)ltac:(lia))as Hc3.
 pose proof(rs_splat_u32_bound(rs_read_lane 4(rs_vl batch)(batch_pre-batch)A)4(rs_vl batch)ltac:(lia))as Hs4.
 pose proof(rs_active_u32_bound c4_2 (rs_splat_u32(rs_read_lane 4(rs_vl batch)(batch_pre-batch)A)4(rs_vl batch)) 4(rs_vl batch)ltac:(lia)ltac:(lia))as Hc4.
 pose proof(rs_splat_u32_bound(rs_read_lane 5(rs_vl batch)(batch_pre-batch)A)5(rs_vl batch)ltac:(lia))as Hs5.
 pose proof(rs_active_u32_bound c5_2 (rs_splat_u32(rs_read_lane 5(rs_vl batch)(batch_pre-batch)A)5(rs_vl batch)) 5(rs_vl batch)ltac:(lia)ltac:(lia))as Hc5.
 pose proof(rs_splat_u32_bound(rs_read_lane 6(rs_vl batch)(batch_pre-batch)A)6(rs_vl batch)ltac:(lia))as Hs6.
 pose proof(rs_active_u32_bound c6_2 (rs_splat_u32(rs_read_lane 6(rs_vl batch)(batch_pre-batch)A)6(rs_vl batch)) 6(rs_vl batch)ltac:(lia)ltac:(lia))as Hc6.
 pose proof(rs_splat_u32_bound(rs_read_lane 7(rs_vl batch)(batch_pre-batch)A)7(rs_vl batch)ltac:(lia))as Hs7.
 pose proof(rs_active_u32_bound c7_2 (rs_splat_u32(rs_read_lane 7(rs_vl batch)(batch_pre-batch)A)7(rs_vl batch)) 7(rs_vl batch)ltac:(lia)ltac:(lia))as Hc7.
 pose proof(rs_splat_u32_bound(rs_read_lane 8(rs_vl batch)(batch_pre-batch)A)8(rs_vl batch)ltac:(lia))as Hs8.
 pose proof(rs_active_u32_bound c8_2 (rs_splat_u32(rs_read_lane 8(rs_vl batch)(batch_pre-batch)A)8(rs_vl batch)) 8(rs_vl batch)ltac:(lia)ltac:(lia))as Hc8.
 pose proof(rs_splat_u32_bound(rs_read_lane 9(rs_vl batch)(batch_pre-batch)A)9(rs_vl batch)ltac:(lia))as Hs9.
 pose proof(rs_active_u32_bound c9_2 (rs_splat_u32(rs_read_lane 9(rs_vl batch)(batch_pre-batch)A)9(rs_vl batch)) 9(rs_vl batch)ltac:(lia)ltac:(lia))as Hc9.
 pose proof(rs_splat_u32_bound(rs_read_lane 10(rs_vl batch)(batch_pre-batch)A)10(rs_vl batch)ltac:(lia))as Hs10.
 pose proof(rs_active_u32_bound c10_2 (rs_splat_u32(rs_read_lane 10(rs_vl batch)(batch_pre-batch)A)10(rs_vl batch)) 10(rs_vl batch)ltac:(lia)ltac:(lia))as Hc10.
 pose proof(rs_splat_u32_bound(rs_read_lane 11(rs_vl batch)(batch_pre-batch)A)11(rs_vl batch)ltac:(lia))as Hs11.
 pose proof(rs_active_u32_bound c11_2 (rs_splat_u32(rs_read_lane 11(rs_vl batch)(batch_pre-batch)A)11(rs_vl batch)) 11(rs_vl batch)ltac:(lia)ltac:(lia))as Hc11.
 pose proof(rs_splat_u32_bound(rs_read_lane 12(rs_vl batch)(batch_pre-batch)A)12(rs_vl batch)ltac:(lia))as Hs12.
 pose proof(rs_active_u32_bound c12_2 (rs_splat_u32(rs_read_lane 12(rs_vl batch)(batch_pre-batch)A)12(rs_vl batch)) 12(rs_vl batch)ltac:(lia)ltac:(lia))as Hc12.
 pose proof(rs_splat_u32_bound(rs_read_lane 13(rs_vl batch)(batch_pre-batch)A)13(rs_vl batch)ltac:(lia))as Hs13.
 pose proof(rs_active_u32_bound c13_2 (rs_splat_u32(rs_read_lane 13(rs_vl batch)(batch_pre-batch)A)13(rs_vl batch)) 13(rs_vl batch)ltac:(lia)ltac:(lia))as Hc13.
 pose proof(rs_splat_u32_bound(rs_read_lane 14(rs_vl batch)(batch_pre-batch)A)14(rs_vl batch)ltac:(lia))as Hs14.
 pose proof(rs_active_u32_bound c14_2 (rs_splat_u32(rs_read_lane 14(rs_vl batch)(batch_pre-batch)A)14(rs_vl batch)) 14(rs_vl batch)ltac:(lia)ltac:(lia))as Hc14.
 pose proof(rs_splat_u32_bound(rs_read_lane 15(rs_vl batch)(batch_pre-batch)A)15(rs_vl batch)ltac:(lia))as Hs15.
 pose proof(rs_active_u32_bound c15_2 (rs_splat_u32(rs_read_lane 15(rs_vl batch)(batch_pre-batch)A)15(rs_vl batch)) 15(rs_vl batch)ltac:(lia)ltac:(lia))as Hc15.
 pose proof(rs_splat_u32_bound(rs_read_lane 16(rs_vl batch)(batch_pre-batch)A)16(rs_vl batch)ltac:(lia))as Hs16.
 pose proof(rs_active_u32_bound c16_2 (rs_splat_u32(rs_read_lane 16(rs_vl batch)(batch_pre-batch)A)16(rs_vl batch)) 16(rs_vl batch)ltac:(lia)ltac:(lia))as Hc16.
 pose proof(rs_splat_u32_bound(rs_read_lane 17(rs_vl batch)(batch_pre-batch)A)17(rs_vl batch)ltac:(lia))as Hs17.
 pose proof(rs_active_u32_bound c17_2 (rs_splat_u32(rs_read_lane 17(rs_vl batch)(batch_pre-batch)A)17(rs_vl batch)) 17(rs_vl batch)ltac:(lia)ltac:(lia))as Hc17.
 pose proof(rs_splat_u32_bound(rs_read_lane 18(rs_vl batch)(batch_pre-batch)A)18(rs_vl batch)ltac:(lia))as Hs18.
 pose proof(rs_active_u32_bound c18_2 (rs_splat_u32(rs_read_lane 18(rs_vl batch)(batch_pre-batch)A)18(rs_vl batch)) 18(rs_vl batch)ltac:(lia)ltac:(lia))as Hc18.
 pose proof(rs_splat_u32_bound(rs_read_lane 19(rs_vl batch)(batch_pre-batch)A)19(rs_vl batch)ltac:(lia))as Hs19.
 pose proof(rs_active_u32_bound c19_2 (rs_splat_u32(rs_read_lane 19(rs_vl batch)(batch_pre-batch)A)19(rs_vl batch)) 19(rs_vl batch)ltac:(lia)ltac:(lia))as Hc19.
 pose proof(rs_splat_u32_bound(rs_read_lane 20(rs_vl batch)(batch_pre-batch)A)20(rs_vl batch)ltac:(lia))as Hs20.
 pose proof(rs_active_u32_bound c20_2 (rs_splat_u32(rs_read_lane 20(rs_vl batch)(batch_pre-batch)A)20(rs_vl batch)) 20(rs_vl batch)ltac:(lia)ltac:(lia))as Hc20.
 pose proof(rs_splat_u32_bound(rs_read_lane 21(rs_vl batch)(batch_pre-batch)A)21(rs_vl batch)ltac:(lia))as Hs21.
 pose proof(rs_active_u32_bound c21_2 (rs_splat_u32(rs_read_lane 21(rs_vl batch)(batch_pre-batch)A)21(rs_vl batch)) 21(rs_vl batch)ltac:(lia)ltac:(lia))as Hc21.
 pose proof(rs_splat_u32_bound(rs_read_lane 22(rs_vl batch)(batch_pre-batch)A)22(rs_vl batch)ltac:(lia))as Hs22.
 pose proof(rs_active_u32_bound c22_2 (rs_splat_u32(rs_read_lane 22(rs_vl batch)(batch_pre-batch)A)22(rs_vl batch)) 22(rs_vl batch)ltac:(lia)ltac:(lia))as Hc22.
 pose proof(rs_splat_u32_bound(rs_read_lane 23(rs_vl batch)(batch_pre-batch)A)23(rs_vl batch)ltac:(lia))as Hs23.
 pose proof(rs_active_u32_bound c23_2 (rs_splat_u32(rs_read_lane 23(rs_vl batch)(batch_pre-batch)A)23(rs_vl batch)) 23(rs_vl batch)ltac:(lia)ltac:(lia))as Hc23.
 pose proof(rs_splat_u32_bound(rs_read_lane 24(rs_vl batch)(batch_pre-batch)A)24(rs_vl batch)ltac:(lia))as Hs24.
 pose proof(rs_active_u32_bound c24_2 (rs_splat_u32(rs_read_lane 24(rs_vl batch)(batch_pre-batch)A)24(rs_vl batch)) 24(rs_vl batch)ltac:(lia)ltac:(lia))as Hc24.
 pose proof(rs_splat_u32_bound(rs_read_lane 25(rs_vl batch)(batch_pre-batch)A)25(rs_vl batch)ltac:(lia))as Hs25.
 pose proof(rs_active_u32_bound c25_2 (rs_splat_u32(rs_read_lane 25(rs_vl batch)(batch_pre-batch)A)25(rs_vl batch)) 25(rs_vl batch)ltac:(lia)ltac:(lia))as Hc25.
 pose proof(rs_splat_u32_bound(rs_read_lane 26(rs_vl batch)(batch_pre-batch)A)26(rs_vl batch)ltac:(lia))as Hs26.
 pose proof(rs_active_u32_bound c26_2 (rs_splat_u32(rs_read_lane 26(rs_vl batch)(batch_pre-batch)A)26(rs_vl batch)) 26(rs_vl batch)ltac:(lia)ltac:(lia))as Hc26.
 pose proof(rs_splat_u32_bound(rs_read_lane 27(rs_vl batch)(batch_pre-batch)A)27(rs_vl batch)ltac:(lia))as Hs27.
 pose proof(rs_active_u32_bound c27_2 (rs_splat_u32(rs_read_lane 27(rs_vl batch)(batch_pre-batch)A)27(rs_vl batch)) 27(rs_vl batch)ltac:(lia)ltac:(lia))as Hc27.
 pose proof(rs_splat_u32_bound(rs_read_lane 28(rs_vl batch)(batch_pre-batch)A)28(rs_vl batch)ltac:(lia))as Hs28.
 pose proof(rs_active_u32_bound c28_2 (rs_splat_u32(rs_read_lane 28(rs_vl batch)(batch_pre-batch)A)28(rs_vl batch)) 28(rs_vl batch)ltac:(lia)ltac:(lia))as Hc28.
 pose proof(rs_splat_u32_bound(rs_read_lane 29(rs_vl batch)(batch_pre-batch)A)29(rs_vl batch)ltac:(lia))as Hs29.
 pose proof(rs_active_u32_bound c29_2 (rs_splat_u32(rs_read_lane 29(rs_vl batch)(batch_pre-batch)A)29(rs_vl batch)) 29(rs_vl batch)ltac:(lia)ltac:(lia))as Hc29.
 pose proof(rs_splat_u32_bound(rs_read_lane 30(rs_vl batch)(batch_pre-batch)A)30(rs_vl batch)ltac:(lia))as Hs30.
 pose proof(rs_active_u32_bound c30_2 (rs_splat_u32(rs_read_lane 30(rs_vl batch)(batch_pre-batch)A)30(rs_vl batch)) 30(rs_vl batch)ltac:(lia)ltac:(lia))as Hc30.
 pose proof(rs_splat_u32_bound(rs_read_lane 31(rs_vl batch)(batch_pre-batch)A)31(rs_vl batch)ltac:(lia))as Hs31.
 pose proof(rs_active_u32_bound c31_2 (rs_splat_u32(rs_read_lane 31(rs_vl batch)(batch_pre-batch)A)31(rs_vl batch)) 31(rs_vl batch)ltac:(lia)ltac:(lia))as Hc31.
 pose proof(rs_acc_update_total c0_2 c1_2 c2_2 c3_2 c4_2 c5_2 c6_2 c7_2 c8_2 c9_2 c10_2 c11_2 c12_2 c13_2 c14_2 c15_2 c16_2 c17_2 c18_2 c19_2 c20_2 c21_2 c22_2 c23_2 c24_2 c25_2 c26_2 c27_2 c28_2 c29_2 c30_2 c31_2 A (batch_pre-batch)(rs_vl batch))as Hsum.
 repeat match type of Hsum with ?P -> _=>specialize(Hsum ltac:(lia))end.
 rewrite PreH76,rs_u32_add_l in Hsum.
 rewrite <-(rs_read_sum32_prefix A(batch_pre-batch)(rs_vl batch)ltac:(lia)ltac:(lia)ltac:(lia))in Hsum.
 rexists(rs_active_u32 c31_2(rs_splat_u32(rs_read_lane 31(rs_vl batch)(batch_pre-batch)A)31(rs_vl batch))31(rs_vl batch)).
 rexists(rs_active_u32 c30_2(rs_splat_u32(rs_read_lane 30(rs_vl batch)(batch_pre-batch)A)30(rs_vl batch))30(rs_vl batch)).
 rexists(rs_active_u32 c29_2(rs_splat_u32(rs_read_lane 29(rs_vl batch)(batch_pre-batch)A)29(rs_vl batch))29(rs_vl batch)).
 rexists(rs_active_u32 c28_2(rs_splat_u32(rs_read_lane 28(rs_vl batch)(batch_pre-batch)A)28(rs_vl batch))28(rs_vl batch)).
 rexists(rs_active_u32 c27_2(rs_splat_u32(rs_read_lane 27(rs_vl batch)(batch_pre-batch)A)27(rs_vl batch))27(rs_vl batch)).
 rexists(rs_active_u32 c26_2(rs_splat_u32(rs_read_lane 26(rs_vl batch)(batch_pre-batch)A)26(rs_vl batch))26(rs_vl batch)).
 rexists(rs_active_u32 c25_2(rs_splat_u32(rs_read_lane 25(rs_vl batch)(batch_pre-batch)A)25(rs_vl batch))25(rs_vl batch)).
 rexists(rs_active_u32 c24_2(rs_splat_u32(rs_read_lane 24(rs_vl batch)(batch_pre-batch)A)24(rs_vl batch))24(rs_vl batch)).
 rexists(rs_active_u32 c23_2(rs_splat_u32(rs_read_lane 23(rs_vl batch)(batch_pre-batch)A)23(rs_vl batch))23(rs_vl batch)).
 rexists(rs_active_u32 c22_2(rs_splat_u32(rs_read_lane 22(rs_vl batch)(batch_pre-batch)A)22(rs_vl batch))22(rs_vl batch)).
 rexists(rs_active_u32 c21_2(rs_splat_u32(rs_read_lane 21(rs_vl batch)(batch_pre-batch)A)21(rs_vl batch))21(rs_vl batch)).
 rexists(rs_active_u32 c20_2(rs_splat_u32(rs_read_lane 20(rs_vl batch)(batch_pre-batch)A)20(rs_vl batch))20(rs_vl batch)).
 rexists(rs_active_u32 c19_2(rs_splat_u32(rs_read_lane 19(rs_vl batch)(batch_pre-batch)A)19(rs_vl batch))19(rs_vl batch)).
 rexists(rs_active_u32 c18_2(rs_splat_u32(rs_read_lane 18(rs_vl batch)(batch_pre-batch)A)18(rs_vl batch))18(rs_vl batch)).
 rexists(rs_active_u32 c17_2(rs_splat_u32(rs_read_lane 17(rs_vl batch)(batch_pre-batch)A)17(rs_vl batch))17(rs_vl batch)).
 rexists(rs_active_u32 c16_2(rs_splat_u32(rs_read_lane 16(rs_vl batch)(batch_pre-batch)A)16(rs_vl batch))16(rs_vl batch)).
 rexists(rs_active_u32 c15_2(rs_splat_u32(rs_read_lane 15(rs_vl batch)(batch_pre-batch)A)15(rs_vl batch))15(rs_vl batch)).
 rexists(rs_active_u32 c14_2(rs_splat_u32(rs_read_lane 14(rs_vl batch)(batch_pre-batch)A)14(rs_vl batch))14(rs_vl batch)).
 rexists(rs_active_u32 c13_2(rs_splat_u32(rs_read_lane 13(rs_vl batch)(batch_pre-batch)A)13(rs_vl batch))13(rs_vl batch)).
 rexists(rs_active_u32 c12_2(rs_splat_u32(rs_read_lane 12(rs_vl batch)(batch_pre-batch)A)12(rs_vl batch))12(rs_vl batch)).
 rexists(rs_active_u32 c11_2(rs_splat_u32(rs_read_lane 11(rs_vl batch)(batch_pre-batch)A)11(rs_vl batch))11(rs_vl batch)).
 rexists(rs_active_u32 c10_2(rs_splat_u32(rs_read_lane 10(rs_vl batch)(batch_pre-batch)A)10(rs_vl batch))10(rs_vl batch)).
 rexists(rs_active_u32 c9_2(rs_splat_u32(rs_read_lane 9(rs_vl batch)(batch_pre-batch)A)9(rs_vl batch))9(rs_vl batch)).
 rexists(rs_active_u32 c8_2(rs_splat_u32(rs_read_lane 8(rs_vl batch)(batch_pre-batch)A)8(rs_vl batch))8(rs_vl batch)).
 rexists(rs_active_u32 c7_2(rs_splat_u32(rs_read_lane 7(rs_vl batch)(batch_pre-batch)A)7(rs_vl batch))7(rs_vl batch)).
 rexists(rs_active_u32 c6_2(rs_splat_u32(rs_read_lane 6(rs_vl batch)(batch_pre-batch)A)6(rs_vl batch))6(rs_vl batch)).
 rexists(rs_active_u32 c5_2(rs_splat_u32(rs_read_lane 5(rs_vl batch)(batch_pre-batch)A)5(rs_vl batch))5(rs_vl batch)).
 rexists(rs_active_u32 c4_2(rs_splat_u32(rs_read_lane 4(rs_vl batch)(batch_pre-batch)A)4(rs_vl batch))4(rs_vl batch)).
 rexists(rs_active_u32 c3_2(rs_splat_u32(rs_read_lane 3(rs_vl batch)(batch_pre-batch)A)3(rs_vl batch))3(rs_vl batch)).
 rexists(rs_active_u32 c2_2(rs_splat_u32(rs_read_lane 2(rs_vl batch)(batch_pre-batch)A)2(rs_vl batch))2(rs_vl batch)).
 rexists(rs_active_u32 c1_2(rs_splat_u32(rs_read_lane 1(rs_vl batch)(batch_pre-batch)A)1(rs_vl batch))1(rs_vl batch)).
 rexists(rs_active_u32 c0_2(rs_splat_u32(rs_read_lane 0(rs_vl batch)(batch_pre-batch)A)0(rs_vl batch))0(rs_vl batch)).
 rewrite ?sizeof_uchar.
 rewrite unsigned_last_nbits_eq by(cbn;lia).
 replace(batch_pre-(batch-rs_vl batch))with((batch_pre-batch)+rs_vl batch)by lia.
 rewrite Hsum.
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_loop_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2.
