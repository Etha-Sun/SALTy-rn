From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import RvvKernelMemoryWrapFacts RvvKernelProgressTileFacts RvvKernelPixelBridgeFacts NeonVectorPixelFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_results dw_data dw_output dw_vector_pixel dw_image dw_row_base dw_prev dw_values8.
Lemma proof_of_test_rvv_entail_wit_2_2: DwChw.rvv_unit_goal.test_rvv_entail_wit_2_2.
Proof.
 unfold DwChw.rvv_unit_goal.test_rvv_entail_wit_2_2;right;intros.
 change(sizeof(FLOAT))with 4 in *.
 pose proof(dw_legal_vl_positive w retval ltac:(lia) PreH67)as[HvlW Hvl8].
 rewrite(unsigned_last_nbits_eq(retval-1)64)in * by(change(0<=retval-1<18446744073709551616);lia).
 try rewrite(unsigned_last_nbits_eq(w-retval)64)by(change(0<=w-retval<18446744073709551616);lia).
 subst input_width padding_top orig_i3 orig_i4 i0 i1 i2 i3 i4 o0 o1 o2.
 set(y:=H-output_height)in *;set(x:=N-w)in *.
 rewrite ?Z.add_0_r in *;rewrite ?dw_c_literal_zero in *.
 replace (dw_store_row H y 0*N+N-w)with(dw_store_row H y 0*N+x)in * by(unfold x;ring).
 replace (dw_store_row H y 1*N+N-w)with(dw_store_row H y 1*N+x)in * by(unfold x;ring).
 replace (dw_store_row H y 2*N+N-w)with(dw_store_row H y 2*N+x)in * by(unfold x;ring).
 assert(E7:retval_12=Lo)by(unfold dw_same in PreH14,PreH79;congruence);rewrite E7 in *.
 assert(E8:retval_13=Hi)by(unfold dw_same in PreH13,PreH80;congruence);rewrite E8 in *.
 assert(E9:retval_14=Lo)by(unfold dw_same in PreH11,PreH79;congruence);rewrite E9 in *.
 assert(E10:retval_15=Hi)by(unfold dw_same in PreH10,PreH80;congruence);rewrite E10 in *.
 assert(E11:retval_16=Lo)by(unfold dw_same in PreH8,PreH79;congruence);rewrite E11 in *.
 assert(E12:retval_17=Hi)by(unfold dw_same in PreH7,PreH80;congruence);rewrite E12 in *.
 set(A0:=dw_fp8 r0 r1 r2 r3 r4 r5 r6 r7)in *.
 assert(L0:forall k,0<=k<retval->A0 k=dw_load F(dw_row_base Input Zero H N (y-1)+4*x)k).
 { unfold A0;apply(dw_fp8_active_all retval r0 r1 r2 r3 r4 r5 r6 r7 (dw_load F(dw_row_base Input Zero H N (y-1)+4*x)) ltac:(lia) PreH57 PreH58 PreH59 PreH60 PreH61 PreH62 PreH63 PreH64). }
 assert(HA0:forall k,0<=k<retval->A0 k=dw_image F Input Zero H N (y-1)(x+k)).
 { intros k Hk;rewrite L0 by assumption;unfold dw_load.
   replace(dw_row_base Input Zero H N (y-1)+4*x+4*k)with(dw_row_base Input Zero H N (y-1)+4*(x+k))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HP0:prev_i0=dw_image F Input Zero H N (y-1)(x-1)).
 { unfold dw_same in PreH91;rewrite PreH91;apply dw_prev_image;unfold x;lia. }
 set(A1:=dw_fp8 r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2)in *.
 assert(L1:forall k,0<=k<retval->A1 k=dw_load F(dw_row_base Input Zero H N y+4*x)k).
 { unfold A1;apply(dw_fp8_active_all retval r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 (dw_load F(dw_row_base Input Zero H N y+4*x)) ltac:(lia) PreH49 PreH50 PreH51 PreH52 PreH53 PreH54 PreH55 PreH56). }
 assert(HA1:forall k,0<=k<retval->A1 k=dw_image F Input Zero H N y(x+k)).
 { intros k Hk;rewrite L1 by assumption;unfold dw_load.
   replace(dw_row_base Input Zero H N y+4*x+4*k)with(dw_row_base Input Zero H N y+4*(x+k))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HP1:prev_i1=dw_image F Input Zero H N y(x-1)).
 { unfold dw_same in PreH93;rewrite PreH93;apply dw_prev_image;unfold x;lia. }
 set(A2:=dw_fp8 r0_3 r1_3 r2_3 r3_3 r4_3 r5_3 r6_3 r7_3)in *.
 assert(L2:forall k,0<=k<retval->A2 k=dw_load F(dw_row_base Input Zero H N (y+1)+4*x)k).
 { unfold A2;apply(dw_fp8_active_all retval r0_3 r1_3 r2_3 r3_3 r4_3 r5_3 r6_3 r7_3 (dw_load F(dw_row_base Input Zero H N (y+1)+4*x)) ltac:(lia) PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48). }
 assert(HA2:forall k,0<=k<retval->A2 k=dw_image F Input Zero H N (y+1)(x+k)).
 { intros k Hk;rewrite L2 by assumption;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+1)+4*x+4*k)with(dw_row_base Input Zero H N (y+1)+4*(x+k))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HP2:prev_i2=dw_image F Input Zero H N (y+1)(x-1)).
 { unfold dw_same in PreH95;rewrite PreH95;apply dw_prev_image;unfold x;lia. }
 set(A3:=dw_fp8 r0_4 r1_4 r2_4 r3_4 r4_4 r5_4 r6_4 r7_4)in *.
 assert(L3:forall k,0<=k<retval->A3 k=dw_load F(dw_row_base Input Zero H N (y+2)+4*x)k).
 { unfold A3;apply(dw_fp8_active_all retval r0_4 r1_4 r2_4 r3_4 r4_4 r5_4 r6_4 r7_4 (dw_load F(dw_row_base Input Zero H N (y+2)+4*x)) ltac:(lia) PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40). }
 assert(HA3:forall k,0<=k<retval->A3 k=dw_image F Input Zero H N (y+2)(x+k)).
 { intros k Hk;rewrite L3 by assumption;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+2)+4*x+4*k)with(dw_row_base Input Zero H N (y+2)+4*(x+k))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HP3:prev_i3=dw_image F Input Zero H N (y+2)(x-1)).
 { unfold dw_same in PreH97;rewrite PreH97;apply dw_prev_image;unfold x;lia. }
 set(A4:=dw_fp8 r0_5 r1_5 r2_5 r3_5 r4_5 r5_5 r6_5 r7_5)in *.
 assert(L4:forall k,0<=k<retval->A4 k=dw_load F(dw_row_base Input Zero H N (y+3)+4*x)k).
 { unfold A4;apply(dw_fp8_active_all retval r0_5 r1_5 r2_5 r3_5 r4_5 r5_5 r6_5 r7_5 (dw_load F(dw_row_base Input Zero H N (y+3)+4*x)) ltac:(lia) PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32). }
 assert(HA4:forall k,0<=k<retval->A4 k=dw_image F Input Zero H N (y+3)(x+k)).
 { intros k Hk;rewrite L4 by assumption;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+3)+4*x+4*k)with(dw_row_base Input Zero H N (y+3)+4*(x+k))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HP4:prev_i4=dw_image F Input Zero H N (y+3)(x-1)).
 { unfold dw_same in PreH99;rewrite PreH99;apply dw_prev_image;unfold x;lia. }
 assert(HN0:retval_7=dw_image F Input Zero H N (y-1)(x+retval)).
 { unfold dw_same in PreH23;rewrite PreH23.
   replace(dw_row_base Input Zero H N (y-1)+4*x+retval*4)with(dw_row_base Input Zero H N (y-1)+4*(x+retval))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HN1:retval_8=dw_image F Input Zero H N y(x+retval)).
 { unfold dw_same in PreH21;rewrite PreH21.
   replace(dw_row_base Input Zero H N y+4*x+retval*4)with(dw_row_base Input Zero H N y+4*(x+retval))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HN2:retval_9=dw_image F Input Zero H N (y+1)(x+retval)).
 { unfold dw_same in PreH19;rewrite PreH19.
   replace(dw_row_base Input Zero H N (y+1)+4*x+retval*4)with(dw_row_base Input Zero H N (y+1)+4*(x+retval))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HN3:retval_10=dw_image F Input Zero H N (y+2)(x+retval)).
 { unfold dw_same in PreH17;rewrite PreH17.
   replace(dw_row_base Input Zero H N (y+2)+4*x+retval*4)with(dw_row_base Input Zero H N (y+2)+4*(x+retval))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HN4:retval_11=dw_image F Input Zero H N (y+3)(x+retval)).
 { unfold dw_same in PreH15;rewrite PreH15.
   replace(dw_row_base Input Zero H N (y+3)+4*x+retval*4)with(dw_row_base Input Zero H N (y+3)+4*(x+retval))by ring.
   apply dw_row_image;unfold x;lia. }
 assert(HV0:forall k,0<=k<retval->nth(Z.to_nat k)(dw_values8 r0_6 r1_6 r2_6 r3_6 r4_6 r5_6 r6_6 r7_6 retval)fp32_zero=dw_rvv_results F Input Zero Weights H N Lo Hi(y*N+x+k)).
 { eapply(dw_values8_pixel_row F Input Zero Weights H N y x retval A0 A1 A2 prev_i0 prev_i1 prev_i2 retval_7 retval_8 retval_9 Lo Hi r0_6 r1_6 r2_6 r3_6 r4_6 r5_6 r6_6 r7_6);
    try assumption;try lia.
  all: try assumption;try assumption.
 }
 assert(HV1:forall k,0<=k<retval->nth(Z.to_nat k)(dw_values8 r0_7 r1_7 r2_7 r3_7 r4_7 r5_7 r6_7 r7_7 retval)fp32_zero=dw_rvv_results F Input Zero Weights H N Lo Hi((y+1)*N+x+k)).
 { eapply(dw_values8_pixel_row F Input Zero Weights H N (y+1) x retval A1 A2 A3 prev_i1 prev_i2 prev_i3 retval_8 retval_9 retval_10 Lo Hi r0_7 r1_7 r2_7 r3_7 r4_7 r5_7 r6_7 r7_7);
    try assumption;try lia.
  all: try replace(y+1-1)with(y)by ring.
  all: try replace(y+1+1)with(y+2)by ring.
  all: try assumption;try assumption.
 }
 assert(HV2:forall k,0<=k<retval->nth(Z.to_nat k)(dw_values8 r0_8 r1_8 r2_8 r3_8 r4_8 r5_8 r6_8 r7_8 retval)fp32_zero=dw_rvv_results F Input Zero Weights H N Lo Hi((y+2)*N+x+k)).
 { eapply(dw_values8_pixel_row F Input Zero Weights H N (y+2) x retval A2 A3 A4 prev_i2 prev_i3 prev_i4 retval_9 retval_10 retval_11 Lo Hi r0_8 r1_8 r2_8 r3_8 r4_8 r5_8 r6_8 r7_8);
    try assumption;try lia.
  all: try replace(y+2-1)with(y+1)by ring.
  all: try replace(y+2+1)with(y+3)by ring.
  all: try assumption;try assumption.
 }
 pose proof(dw_progress_write_tile (dw_rvv_results F Input Zero Weights H N Lo Hi) O Output H N y x retval (dw_values8 r0_6 r1_6 r2_6 r3_6 r4_6 r5_6 r6_6 r7_6 retval) (dw_values8 r0_7 r1_7 r2_7 r3_7 r4_7 r5_7 r6_7 r7_7 retval) (dw_values8 r0_8 r1_8 r2_8 r3_8 r4_8 r5_8 r6_8 r7_8 retval) ltac:(lia) ltac:(unfold y;lia) ltac:(unfold x;lia) ltac:(lia) ltac:(unfold x;lia) (dw_values8_length r0_6 r1_6 r2_6 r3_6 r4_6 r5_6 r6_6 r7_6 retval ltac:(lia)) (dw_values8_length r0_7 r1_7 r2_7 r3_7 r4_7 r5_7 r6_7 r7_7 retval ltac:(lia)) (dw_values8_length r0_8 r1_8 r2_8 r3_8 r4_8 r5_8 r6_8 r7_8 retval ltac:(lia)) HV0 HV1 HV2)as Hstate.
 replace(N-(w-retval))with(x+retval)by(unfold x;ring).
 rewrite Hstate.
 assert(Last0:dw_same retval_2(dw_prev F(dw_row_base Input Zero H N (y-1))(x+retval))).
 { unfold dw_same in *;rewrite PreH5;apply dw_prev_after_chunk;unfold x;lia. }
 assert(Last1:dw_same retval_3(dw_prev F(dw_row_base Input Zero H N y)(x+retval))).
 { unfold dw_same in *;rewrite PreH4;apply dw_prev_after_chunk;unfold x;lia. }
 assert(Last2:dw_same retval_4(dw_prev F(dw_row_base Input Zero H N (y+1))(x+retval))).
 { unfold dw_same in *;rewrite PreH3;apply dw_prev_after_chunk;unfold x;lia. }
 assert(Last3:dw_same retval_5(dw_prev F(dw_row_base Input Zero H N (y+2))(x+retval))).
 { unfold dw_same in *;rewrite PreH2;apply dw_prev_after_chunk;unfold x;lia. }
 assert(Last4:dw_same retval_6(dw_prev F(dw_row_base Input Zero H N (y+3))(x+retval))).
 { unfold dw_same in *;rewrite PreH1;apply dw_prev_after_chunk;unfold x;lia. }
 entailer!;try assumption;try ring;try lia.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2_2.
