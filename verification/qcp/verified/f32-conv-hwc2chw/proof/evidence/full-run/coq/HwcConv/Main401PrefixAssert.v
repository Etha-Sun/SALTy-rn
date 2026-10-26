From HwcConv Require Import rvv_unit_goal Main401PrefixBridgeV2 FastFrame AddressFacts.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_rvv_raw hc_progress hc_visible hc_acc_prefix hc_rvv_pixel9_prefix hc_rvv_pixel9_fold hc_get hc_row_base dw_rvv_fma.
Lemma hrp_pure_intro:forall(P:Assertion)(Q:Prop),Q->P|--coq_prop Q.
Proof. intros P Q HQ;unfold derivable1,coq_prop;auto. Qed.
Ltac hrp_dispatch:=lazymatch goal with
 |- _ |-- andp _ _=>apply _derivable1_andp_intros;[hrp_dispatch|hrp_dispatch]
 | |- _ |-- coq_prop _=>apply hrp_pure_intro;first[assumption|reflexivity|lia|idtac]
 | _=>try fast_cancel end.
Module CheckedPrefix.
Lemma proof_of_test_rvv_entail_wit_3:HwcConv.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_3;left;intros.
 assert(HW:w=Weights+448*((Cn-c)/4)).
 { rewrite<-Z.quot_div_nonneg by lia;exact PreH61. }
 assert(HVL:0<retval /\ retval<=ow).
 { pose proof PreH9 as HV;unfold hc_rvv_vl in HV.
   destruct HV as[Hr[Hsmall|[Hmedium|Hlarge]]].
   - destruct Hsmall as[Ha He];lia.
   - destruct Hmedium as[Ha Hb].
     assert(Hhalf:1<=(ow+1)/2)by(apply Z.div_le_lower_bound;lia);lia.
   - destruct Hlarge as[Ha He];lia. }
 destruct HVL as[Hvlpos Hvlavl].
 pose proof(hm401_prefix_row0 R F Input Zero Weights H N Top output_y ow_done(Cn-c)0 retval i0 i1 i2 i3 i4 w PreH37 HW PreH8)as HA00.
 pose proof(hm401_prefix_row0 R_2 F Input Zero Weights H N Top output_y ow_done(Cn-c)1 retval i0 i1 i2 i3 i4 w PreH37 HW PreH7)as HA01.
 pose proof(hm401_prefix_row0 R_3 F Input Zero Weights H N Top output_y ow_done(Cn-c)2 retval i0 i1 i2 i3 i4 w PreH37 HW PreH6)as HA02.
 pose proof(hm401_prefix_row0 R_4 F Input Zero Weights H N Top output_y ow_done(Cn-c)3 retval i0 i1 i2 i3 i4 w PreH37 HW PreH5)as HA03.
 pose proof(hm401_prefix_row1 R_5 F Input Zero Weights H N Top output_y ow_done(Cn-c)0 retval i0 i1 i2 i3 i4 w PreH37 HW PreH4)as HA10.
 pose proof(hm401_prefix_row1 R_6 F Input Zero Weights H N Top output_y ow_done(Cn-c)1 retval i0 i1 i2 i3 i4 w PreH37 HW PreH3)as HA11.
 pose proof(hm401_prefix_row1 R_7 F Input Zero Weights H N Top output_y ow_done(Cn-c)2 retval i0 i1 i2 i3 i4 w PreH37 HW PreH2)as HA12.
 pose proof(hm401_prefix_row1 R_8 F Input Zero Weights H N Top output_y ow_done(Cn-c)3 retval i0 i1 i2 i3 i4 w PreH37 HW PreH1)as HA13.
 rewrite ?Z.add_0_r.
 Exists R_8 R_7 R_6 R_5 R_4 R_3 R_2 R.
 unfold StructPredvfloat32m1_t.
 cbn[vfloat32m1_t_s0 vfloat32m1_t_s1 vfloat32m1_t_s2 vfloat32m1_t_s3].
 rewrite ?hc_local_field_address.
 sepcon_assoc_change.
 hrp_dispatch.
 Show.
Qed.
End CheckedPrefix.
Print Assumptions CheckedPrefix.proof_of_test_rvv_entail_wit_3.
