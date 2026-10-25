From Coq Require Import ZArith Lia List.
From DwChw Require Import NeonKernelColumnFacts NeonKernelTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results dw_image dw_row_base dw_neon_vector_pixel.
Lemma proof_of_test_neon_entail_wit_2:DwChw.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_2;left;intros.
 change(sizeof(FLOAT))with 4 in *.
 subst input_width padding_top i0 i1 i2 i3 i4 o0 o1 o2.
 assert(Hwm:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH37).
 pose proof(dw_neon_quot_position_exact N w ltac:(lia)Hwm)as Hcolumn.
 replace(4*4)with 16 in * by ring.
 rewrite(dw_neon_next_column N w ltac:(lia)Hwm).
 set(y:=H-output_height)in *;set(x:=(4*N-w)÷4)in *.
 rewrite ?Z.add_0_r in *.
 assert(Hx:0<=x /\ x+4<N)by lia.
 assert(Hxm:x mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH38).
 unfold dw_same in PreH4,PreH5;autorewrite with dw_neon_fields in PreH4,PreH5.
 rewrite PreH4,PreH5 in *.
 set(A0:=dw_fp4 (dw_get F(dw_row_base Input Zero H N (y-1)+4*(x+0))) (dw_get F(dw_row_base Input Zero H N (y-1)+4*(x+1))) (dw_get F(dw_row_base Input Zero H N (y-1)+4*(x+2))) (dw_get F(dw_row_base Input Zero H N (y-1)+4*(x+3))))in *.
 assert(HA0:forall k,0<=k<4->A0 k=dw_image F Input Zero H N (y-1)(x+k)).
 { unfold A0;intros;apply dw_neon_row_four;lia. }
 assert(HP0:retval=dw_image F Input Zero H N (y-1)(x-1)).
 { unfold dw_same in PreH15;autorewrite with dw_neon_fields in PreH15;rewrite PreH15,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HN0:retval_6=dw_image F Input Zero H N (y-1)(x+4)).
 { unfold dw_same in PreH10;autorewrite with dw_neon_fields in PreH10;rewrite PreH10;unfold dw_load.
   replace(dw_row_base Input Zero H N (y-1)+4*(x+4)+4*0)with(dw_row_base Input Zero H N (y-1)+4*(x+4))by ring.
   apply dw_row_image;lia. }
 set(A1:=dw_fp4 (dw_get F(dw_row_base Input Zero H N y+4*(x+0))) (dw_get F(dw_row_base Input Zero H N y+4*(x+1))) (dw_get F(dw_row_base Input Zero H N y+4*(x+2))) (dw_get F(dw_row_base Input Zero H N y+4*(x+3))))in *.
 assert(HA1:forall k,0<=k<4->A1 k=dw_image F Input Zero H N y(x+k)).
 { unfold A1;intros;apply dw_neon_row_four;lia. }
 assert(HP1:retval_2=dw_image F Input Zero H N y(x-1)).
 { unfold dw_same in PreH14;autorewrite with dw_neon_fields in PreH14;rewrite PreH14,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HN1:retval_7=dw_image F Input Zero H N y(x+4)).
 { unfold dw_same in PreH9;autorewrite with dw_neon_fields in PreH9;rewrite PreH9;unfold dw_load.
   replace(dw_row_base Input Zero H N y+4*(x+4)+4*0)with(dw_row_base Input Zero H N y+4*(x+4))by ring.
   apply dw_row_image;lia. }
 set(A2:=dw_fp4 (dw_get F(dw_row_base Input Zero H N (y+1)+4*(x+0))) (dw_get F(dw_row_base Input Zero H N (y+1)+4*(x+1))) (dw_get F(dw_row_base Input Zero H N (y+1)+4*(x+2))) (dw_get F(dw_row_base Input Zero H N (y+1)+4*(x+3))))in *.
 assert(HA2:forall k,0<=k<4->A2 k=dw_image F Input Zero H N (y+1)(x+k)).
 { unfold A2;intros;apply dw_neon_row_four;lia. }
 assert(HP2:retval_3=dw_image F Input Zero H N (y+1)(x-1)).
 { unfold dw_same in PreH13;autorewrite with dw_neon_fields in PreH13;rewrite PreH13,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HN2:retval_8=dw_image F Input Zero H N (y+1)(x+4)).
 { unfold dw_same in PreH8;autorewrite with dw_neon_fields in PreH8;rewrite PreH8;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+1)+4*(x+4)+4*0)with(dw_row_base Input Zero H N (y+1)+4*(x+4))by ring.
   apply dw_row_image;lia. }
 set(A3:=dw_fp4 (dw_get F(dw_row_base Input Zero H N (y+2)+4*(x+0))) (dw_get F(dw_row_base Input Zero H N (y+2)+4*(x+1))) (dw_get F(dw_row_base Input Zero H N (y+2)+4*(x+2))) (dw_get F(dw_row_base Input Zero H N (y+2)+4*(x+3))))in *.
 assert(HA3:forall k,0<=k<4->A3 k=dw_image F Input Zero H N (y+2)(x+k)).
 { unfold A3;intros;apply dw_neon_row_four;lia. }
 assert(HP3:retval_4=dw_image F Input Zero H N (y+2)(x-1)).
 { unfold dw_same in PreH12;autorewrite with dw_neon_fields in PreH12;rewrite PreH12,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HN3:retval_9=dw_image F Input Zero H N (y+2)(x+4)).
 { unfold dw_same in PreH7;autorewrite with dw_neon_fields in PreH7;rewrite PreH7;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+2)+4*(x+4)+4*0)with(dw_row_base Input Zero H N (y+2)+4*(x+4))by ring.
   apply dw_row_image;lia. }
 set(A4:=dw_fp4 (dw_get F(dw_row_base Input Zero H N (y+3)+4*(x+0))) (dw_get F(dw_row_base Input Zero H N (y+3)+4*(x+1))) (dw_get F(dw_row_base Input Zero H N (y+3)+4*(x+2))) (dw_get F(dw_row_base Input Zero H N (y+3)+4*(x+3))))in *.
 assert(HA4:forall k,0<=k<4->A4 k=dw_image F Input Zero H N (y+3)(x+k)).
 { unfold A4;intros;apply dw_neon_row_four;lia. }
 assert(HP4:retval_5=dw_image F Input Zero H N (y+3)(x-1)).
 { unfold dw_same in PreH11;autorewrite with dw_neon_fields in PreH11;rewrite PreH11,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HN4:retval_10=dw_image F Input Zero H N (y+3)(x+4)).
 { unfold dw_same in PreH6;autorewrite with dw_neon_fields in PreH6;rewrite PreH6;unfold dw_load.
   replace(dw_row_base Input Zero H N (y+3)+4*(x+4)+4*0)with(dw_row_base Input Zero H N (y+3)+4*(x+4))by ring.
   apply dw_row_image;lia. }
 assert(HV0:forall k,0<=k<4->nth(Z.to_nat k)(dw_pack4 r0 r1 r2 r3)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi(y*N+x+k)).
 { eapply(dw_pack4_pixel_row F Input Zero Weights H N y x A0 A1 A2 retval retval_2 retval_3 retval_6 retval_7 retval_8 Lo Hi r0 r1 r2 r3).
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact HA0.
  - exact HA1.
  - exact HA2.
  - exact HP0.
  - exact HP1.
  - exact HP2.
  - exact HN0.
  - exact HN1.
  - exact HN2.
  - exact PreH3.
 }
 assert(HV1:forall k,0<=k<4->nth(Z.to_nat k)(dw_pack4 r0_2 r1_2 r2_2 r3_2)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi((y+1)*N+x+k)).
 { eapply(dw_pack4_pixel_row F Input Zero Weights H N (y+1) x A1 A2 A3 retval_2 retval_3 retval_4 retval_7 retval_8 retval_9 Lo Hi r0_2 r1_2 r2_2 r3_2).
  all:try replace(y+1-1)with(y)by ring.
  all:try replace(y+1+1)with(y+2)by ring.
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact HA1.
  - exact HA2.
  - exact HA3.
  - exact HP1.
  - exact HP2.
  - exact HP3.
  - exact HN1.
  - exact HN2.
  - exact HN3.
  - exact PreH2.
 }
 assert(HV2:forall k,0<=k<4->nth(Z.to_nat k)(dw_pack4 r0_3 r1_3 r2_3 r3_3)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi((y+2)*N+x+k)).
 { eapply(dw_pack4_pixel_row F Input Zero Weights H N (y+2) x A2 A3 A4 retval_3 retval_4 retval_5 retval_8 retval_9 retval_10 Lo Hi r0_3 r1_3 r2_3 r3_3).
  all:try replace(y+2-1)with(y+1)by ring.
  all:try replace(y+2+1)with(y+3)by ring.
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact ltac:(lia).
  - exact HA2.
  - exact HA3.
  - exact HA4.
  - exact HP2.
  - exact HP3.
  - exact HP4.
  - exact HN2.
  - exact HN3.
  - exact HN4.
  - exact PreH1.
 }
 pose proof(dw_progress_write_tile (dw_neon_results F Input Zero Weights H N Lo Hi) O Output H N y x 4 (dw_pack4 r0 r1 r2 r3) (dw_pack4 r0_2 r1_2 r2_2 r3_2) (dw_pack4 r0_3 r1_3 r2_3 r3_3) ltac:(lia) ltac:(unfold y;lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(reflexivity) ltac:(reflexivity) ltac:(reflexivity) HV0 HV1 HV2)as Hstate.
 rewrite Hstate.
 assert(Hnewmod:(w-16)mod 4=0).
 { replace(w-16)with(w+(-4)*4)by ring;rewrite Z.mod_add by lia;exact Hwm. }
 assert(Hcolmod:(x+4)mod 4=0).
 { replace(x+4)with(x+1*4)by ring;rewrite Z.mod_add by lia;exact Hxm. }
 unfold dw_same in *.
 unfold dw_load in *.
 repeat match goal with|-context[dw_previous4 ?F ?p(x+4)?i]=>rewrite<-(dw_neon_previous_advance F p x i ltac:(lia)ltac:(lia))end.
 repeat match goal with|-context[dw_get ?F ?p]=>progress ring_simplify p end.
 repeat match goal with|-context[Z.rem ?a ?b]=>rewrite(Z.rem_mod_nonneg a b)by lia end.
 repeat progress rewrite<-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_ /\ _=>split end;try assumption;try reflexivity;try ring;try lia.
   all:match goal with|-?G=>idtac "BULK_PURE" G end.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
