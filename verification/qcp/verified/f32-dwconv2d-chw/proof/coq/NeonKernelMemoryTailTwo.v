From Coq Require Import ZArith Lia List.
From DwChw Require Import NeonKernelTailListFacts NeonKernelTactics neon_unit_goal.
Import ListNotations Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results dw_image dw_row_base dw_neon_vector_pixel.
Lemma proof_of_test_neon_entail_wit_4_4:DwChw.neon_unit_goal.test_neon_entail_wit_4_4.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_4_4;left;intros.
 change(sizeof(FLOAT))with 4 in *.
 assert(Hw:w=8).
 { clear -PreH2 PreH13 PreH34 PreH36 PreH46 PreH47.
   assert(Hmod:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH36).
   pose proof(Z.div_mod w 4 ltac:(lia))as Hd;rewrite Hmod in Hd.
   assert(Hcases:w=4\/w=8\/w=12\/w=16)by lia.
   destruct Hcases as[->|[->|[->| -> ]]];vm_compute in PreH46,PreH47;lia.
 }
 subst w.
 subst input_width padding_top i0 i1 i2 i3 i4 o0 o1 o2 input_decrement retval.
 assert(Hwm:8 mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH36).
 pose proof(dw_neon_quot_position_exact N 8 ltac:(lia)Hwm)as Hcolumn.
 replace(4*4)with 16 in * by ring.
 set(y:=H-output_height)in *;set(x:=(4*N-8)÷4)in *.
 rewrite ?Z.add_0_r in *.
 assert(Hx:0<=x)by lia.
 assert(HN:N=x+2)by lia.
 assert(Hxm:x mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH37).
 unfold dw_same in PreH6,PreH7;autorewrite with dw_neon_fields in PreH6,PreH7.
 rewrite PreH6,PreH7 in PreH3,PreH4,PreH5.
 rewrite !dw_c_literal_zero in PreH3,PreH4,PreH5.
 assert(HP0:retval_2=dw_image F Input Zero H N (y-1)(x-1)).
 { unfold dw_same in PreH12;autorewrite with dw_neon_fields in PreH12;rewrite PreH12,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HP1:retval_3=dw_image F Input Zero H N y(x-1)).
 { unfold dw_same in PreH11;autorewrite with dw_neon_fields in PreH11;rewrite PreH11,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HP2:retval_4=dw_image F Input Zero H N (y+1)(x-1)).
 { unfold dw_same in PreH10;autorewrite with dw_neon_fields in PreH10;rewrite PreH10,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HP3:retval_5=dw_image F Input Zero H N (y+2)(x-1)).
 { unfold dw_same in PreH9;autorewrite with dw_neon_fields in PreH9;rewrite PreH9,dw_neon_previous_last;apply dw_prev_image;lia. }
 assert(HP4:retval_6=dw_image F Input Zero H N (y+3)(x-1)).
 { unfold dw_same in PreH8;autorewrite with dw_neon_fields in PreH8;rewrite PreH8,dw_neon_previous_last;apply dw_prev_image;lia. }
 change(dw_neon_vector_match4 r0 r1 r2 r3(dw_neon_vector_pixel F Weights (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y-1))x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N y)x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+1))x)) retval_2 retval_3 retval_4 fp32_zero fp32_zero fp32_zero Lo Hi))in PreH5.
 assert(HV0:forall k,0<=k<2->nth(Z.to_nat k)(dw_pack2 r0 r1)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi(y*N+x+k)).
 { intros k Hk;rewrite(dw_neon_pack2_fp4 r0 r1 r2 r3 k Hk).
  eapply(dw_neon_tail_pixel_row F Input Zero Weights H N y x 2 retval_2 retval_3 retval_4 Lo Hi r0 r1 r2 r3).
  - exact Hx.
  - lia.
  - lia.
  - exact Hxm.
  - exact HP0.
  - exact HP1.
  - exact HP2.
  - exact PreH5.
  - exact Hk.
 }
 change(dw_neon_vector_match4 r0_2 r1_2 r2_2 r3_2(dw_neon_vector_pixel F Weights (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N y)x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+1))x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+2))x)) retval_3 retval_4 retval_5 fp32_zero fp32_zero fp32_zero Lo Hi))in PreH4.
 assert(HV1:forall k,0<=k<2->nth(Z.to_nat k)(dw_pack2 r0_2 r1_2)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi((y+1)*N+x+k)).
 { intros k Hk;rewrite(dw_neon_pack2_fp4 r0_2 r1_2 r2_2 r3_2 k Hk).
  eapply(dw_neon_tail_pixel_row F Input Zero Weights H N (y+1) x 2 retval_3 retval_4 retval_5 Lo Hi r0_2 r1_2 r2_2 r3_2).
  all:try replace((y+1)-1)with y by ring.
  all:try replace((y+1)+1)with(y+2)by ring.
  - exact Hx.
  - lia.
  - lia.
  - exact Hxm.
  - exact HP1.
  - exact HP2.
  - exact HP3.
  - exact PreH4.
  - exact Hk.
 }
 change(dw_neon_vector_match4 r0_3 r1_3 r2_3 r3_3(dw_neon_vector_pixel F Weights (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+1))x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+2))x)) (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base Input Zero H N (y+3))x)) retval_4 retval_5 retval_6 fp32_zero fp32_zero fp32_zero Lo Hi))in PreH3.
 assert(HV2:forall k,0<=k<2->nth(Z.to_nat k)(dw_pack2 r0_3 r1_3)fp32_zero=dw_neon_results F Input Zero Weights H N Lo Hi((y+2)*N+x+k)).
 { intros k Hk;rewrite(dw_neon_pack2_fp4 r0_3 r1_3 r2_3 r3_3 k Hk).
  eapply(dw_neon_tail_pixel_row F Input Zero Weights H N (y+2) x 2 retval_4 retval_5 retval_6 Lo Hi r0_3 r1_3 r2_3 r3_3).
  all:try replace((y+2)-1)with(y+1)by ring.
  all:try replace((y+2)+1)with(y+3)by ring.
  - exact Hx.
  - lia.
  - lia.
  - exact Hxm.
  - exact HP2.
  - exact HP3.
  - exact HP4.
  - exact PreH3.
  - exact Hk.
 }
 pose proof(dw_progress_write_tile (dw_neon_results F Input Zero Weights H N Lo Hi) O Output H N y x 2 (dw_pack2 r0 r1) (dw_pack2 r0_2 r1_2) (dw_pack2 r0_3 r1_3) ltac:(lia) ltac:(unfold y;lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(reflexivity) ltac:(reflexivity) ltac:(reflexivity) HV0 HV1 HV2)as Hstate.
 replace((4*N-8)÷4)with x by reflexivity.
 rewrite <-HN in Hstate.
 rewrite Hstate.
 unfold y.
 rewrite(dw_progress_doz_end (dw_neon_results F Input Zero Weights H N Lo Hi) O Output H N output_height ltac:(lia)ltac:(lia)).
 rewrite(dw_neon_decrement_at_tail N x 2 Hx ltac:(lia) HN Hxm).
 lazymatch goal with|-context[dw_outer_pointers ?a ?b ?c ?hh ?nn ?rem ?ii0 ?ii1 ?ii2 ?ii3 ?ii4 ?oo0 ?oo1 ?oo2]=>
  assert(Houter:dw_outer_pointers a b c hh nn rem ii0 ii1 ii2 ii3 ii4 oo0 oo1 oo2)end.
 { pose proof(dw_neon_outer_pointers_after_tail_final F Input Zero Weights Params Output H N output_height x 2 PreH23 PreH30 ltac:(lia) Hx ltac:(lia) HN)as HP;cbv zeta in HP;rewrite !dw_u64_idempotent in HP;exact HP. }
 repeat progress rewrite<-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_/\_=>split end;try assumption;try reflexivity;try lia.
   all:unfold dw_doz_model.
   all:destruct(Z_le_dec output_height 3).
   all:first[rewrite Z.max_r by lia|rewrite Z.max_l by lia];lia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4_4.
Definition exact_tail_two_second:DwChw.neon_unit_goal.test_neon_entail_wit_4_4:=proof_of_test_neon_entail_wit_4_4.
