From HwcConv Require Import rvv_unit_goal Main401EightStoreFacts HwcRvvMainPixelFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_rvv_raw hc_progress hc_visible hc_get hc_acc_prefix hc_clamp_min hc_clamp_max hc_canonical_min hc_canonical_max hc_vget hc_output.
Lemma hm401_width_eta:forall A,make_record_vfloat32m1_t A.(vfloat32m1_t_s0) A.(vfloat32m1_t_s1) A.(vfloat32m1_t_s2) A.(vfloat32m1_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Lemma actual : HwcConv.rvv_unit_goal.test_rvv_entail_wit_4.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_4;right.
 intros Hi Lo Cs Hs Cn Params Output Weights Zero Input End Start Top N H W O F A00 A01 A02 A03 A10 A11 A12 A13 input_height_stride output_width output_channel_increment input_y2 output_y input_y4 output0 output1 c i4 i3 i2 i1 i0 w ow_done ow o1c3 o1c2 o1c1 o1c0 o0c3 o0c2 o0c1 o0c0 current_o0c0 current_o0c1 current_o0c2 current_o0c3 current_o1c0 current_o1c1 current_o1c2 current_o1c3 vl retval R retval_2 R_2 retval_3 R_3 retval_4 R_4 retval_5 R_5 retval_6 R_6 retval_7 R_7 retval_8 R_8 retval_9 R_9 retval_10 R_10 retval_11 R_11 retval_12 R_12 retval_13 R_13 retval_14 R_14 retval_15 R_15 retval_16 R_16 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48 PreH49 PreH50 PreH51 PreH52 PreH53 PreH54 PreH55 PreH56 PreH57 PreH58 PreH59 PreH60 PreH61 PreH62 PreH63 PreH64 PreH65 PreH66 PreH67 PreH68 PreH69 PreH70 PreH71 PreH72 PreH73 PreH74 PreH75 PreH76 PreH77 PreH78 PreH79 PreH80 PreH81 PreH82 PreH83 PreH84 PreH85 PreH86 PreH87 PreH88 PreH89 PreH90 PreH91 PreH92 PreH93 PreH94 PreH95 PreH96 PreH97.
 rewrite ?hm401_width_eta in *.
 unfold hc_same_bits in *;rewrite PreH38,PreH39 in *.
 subst retval retval_2 retval_3 retval_4 retval_5 retval_6 retval_7 retval_8 retval_9 retval_10 retval_11 retval_12 retval_13 retval_14 retval_15 retval_16 current_o0c0 current_o0c1 current_o0c2 current_o0c3 current_o1c0 current_o1c1 current_o1c2 current_o1c3 ow.
 assert(Hq:Z.quot(N+1)2=(N+1)/2)by(apply Z.quot_div_nonneg;lia).
 rewrite Hq in *.
 set(Raw:=hc_rvv_raw F Input Zero Weights H N Top Lo Hi).
 assert(HM:(Cn-c) mod 4=0).
 { rewrite<-Z.rem_mod_nonneg by lia;exact PreH58. }
 assert(HOW:0<(N+1)/2)by(apply Z.div_str_pos;lia).
 pose proof PreH34 as HLayout;unfold hc_output_layout in HLayout;cbn zeta in HLayout.
 destruct HLayout as[HOut[HHs[HCs HLimit]]].
 pose proof(hc_rvv_main_clamped_prefix A00 R R_9 F Input Zero Weights H N Top(output_y+0)ow_done(Cn-c)0 vl Lo Hi PreH90 PreH31 PreH15)as HV00.
 change(forall i,0<=i<vl->hc_vget R_9 i=Raw(Cn-c)0(output_y+0)(ow_done+i))in HV00.
 pose proof(hc_rvv_main_clamped_prefix A01 R_2 R_10 F Input Zero Weights H N Top(output_y+0)ow_done(Cn-c)1 vl Lo Hi PreH91 PreH29 PreH13)as HV01.
 change(forall i,0<=i<vl->hc_vget R_10 i=Raw(Cn-c)1(output_y+0)(ow_done+i))in HV01.
 pose proof(hc_rvv_main_clamped_prefix A02 R_3 R_11 F Input Zero Weights H N Top(output_y+0)ow_done(Cn-c)2 vl Lo Hi PreH92 PreH27 PreH11)as HV02.
 change(forall i,0<=i<vl->hc_vget R_11 i=Raw(Cn-c)2(output_y+0)(ow_done+i))in HV02.
 pose proof(hc_rvv_main_clamped_prefix A03 R_4 R_12 F Input Zero Weights H N Top(output_y+0)ow_done(Cn-c)3 vl Lo Hi PreH93 PreH25 PreH9)as HV03.
 change(forall i,0<=i<vl->hc_vget R_12 i=Raw(Cn-c)3(output_y+0)(ow_done+i))in HV03.
 pose proof(hc_rvv_main_clamped_prefix A10 R_5 R_13 F Input Zero Weights H N Top(output_y+1)ow_done(Cn-c)0 vl Lo Hi PreH94 PreH23 PreH7)as HV10.
 change(forall i,0<=i<vl->hc_vget R_13 i=Raw(Cn-c)0(output_y+1)(ow_done+i))in HV10.
 pose proof(hc_rvv_main_clamped_prefix A11 R_6 R_14 F Input Zero Weights H N Top(output_y+1)ow_done(Cn-c)1 vl Lo Hi PreH95 PreH21 PreH5)as HV11.
 change(forall i,0<=i<vl->hc_vget R_14 i=Raw(Cn-c)1(output_y+1)(ow_done+i))in HV11.
 pose proof(hc_rvv_main_clamped_prefix A12 R_7 R_15 F Input Zero Weights H N Top(output_y+1)ow_done(Cn-c)2 vl Lo Hi PreH96 PreH19 PreH3)as HV12.
 change(forall i,0<=i<vl->hc_vget R_15 i=Raw(Cn-c)2(output_y+1)(ow_done+i))in HV12.
 pose proof(hc_rvv_main_clamped_prefix A13 R_8 R_16 F Input Zero Weights H N Top(output_y+1)ow_done(Cn-c)3 vl Lo Hi PreH97 PreH17 PreH1)as HV13.
 change(forall i,0<=i<vl->hc_vget R_16 i=Raw(Cn-c)3(output_y+1)(ow_done+i))in HV13.
 match goal with |-hc_output ?cells ?old|--_=>
  assert(HStep:old=hc_progress(hc_visible Raw Cn)O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)(ow_done+vl))end.
 { apply(hm401_eight_stores_progress Raw O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)ow_done vl R_9 R_10 R_11 R_12 R_13 R_14 R_15 R_16);
   first[assumption|split;lia|lia]. }
 rewrite HStep.
 repeat apply _derivable1_andp_intros.
 all:try exact(derivable1_refl _).
 all:unfold derivable1,coq_prop;intros;change(sizeof(FLOAT))with 4;unfold hc_output_address;ring.
Qed.
Definition exact_second : HwcConv.rvv_unit_goal.test_rvv_entail_wit_4:=actual.
Print Assumptions actual.
Print Assumptions exact_second.
