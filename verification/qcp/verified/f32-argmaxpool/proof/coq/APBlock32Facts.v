From Coq Require Import ZArith List Lia.
From ArgmaxPool Require Export APBlock32StageModel RvvUpdateKernelFacts.
From ArgmaxPool Require Import APProgramMemoryFacts RvvUpdateIntoModel Model.
Import ListNotations. Local Open Scope Z_scope.
Lemma apbc_u32_idempotent:forall x,ap_u32(ap_u32 x)=ap_u32 x.
Proof. intro;unfold ap_u32,unsigned_last_nbits;apply Z.mod_mod;lia. Qed.
Lemma apbc_step_index_wrap:forall old candidate index,
 ap_step old(candidate,ap_u32 index)=ap_step old(candidate,index).
Proof.
 intros;unfold ap_step;cbn[fst snd].
 destruct(Z.eqb(ap_gt_mask candidate(fst old))4294967295);[rewrite apbc_u32_idempotent|];reflexivity.
Qed.
Lemma apbc_prefix_next:forall F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane k,
 0<=k<8 ->
 ap_block32_prefix F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane(k+1)=
 ap_step(ap_block32_prefix F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane k)
 (ap_load_lane F(nth(Z.to_nat k)[p1;p2;p3;p4;p5;p6;p7;p8]0)lane,idx+(k+1)).
Proof.
 intros F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane k HK.
 assert(k=0\/k=1\/k=2\/k=3\/k=4\/k=5\/k=6\/k=7)by lia.
 repeat match goal with H:_\/_|-_=>destruct H end;subst k;reflexivity.
Qed.
Lemma apbc_acc_step:forall R JO A J B F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl k,
 0<vl<=32 ->0<=k<8 ->
 ap_block32_acc A J F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl k ->
 (forall lane,0<=lane<vl->apup_float B lane=
 ap_load_lane F(nth(Z.to_nat k)[p1;p2;p3;p4;p5;p6;p7;p8]0)lane)->
 ap_rvv_update32 R JO A J B(ap_u32(idx+(k+1)))vl ->
 ap_block32_acc R JO F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl(k+1).
Proof.
 unfold ap_block32_acc;intros R JO A J B F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl k HV HK HA HB HU lane HL.
 pose proof(apuk_update_step R JO A J B(ap_u32(idx+(k+1)))vl lane HL ltac:(lia)HU)as E.
 rewrite(HA lane HL),(HB lane HL),apbc_step_index_wrap in E.
 rewrite apbc_prefix_next by exact HK;exact E.
Qed.
Lemma apbc_initial_null:forall A J F O I ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl,
 (forall lane,0<=lane<vl->apup_float A lane=ap_load_lane F p0 lane)->
 (forall lane,0<=lane<vl->apup_int J lane=ap_u32 idx)->
 ap_block32_acc A J F O I 0 ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl 0.
Proof.
 unfold ap_block32_acc,ap_block32_prefix,ap_block32_after_first;
 intros A J F O I ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl HA HJ lane HL.
 rewrite(HA lane HL),(HJ lane HL);reflexivity.
Qed.
Lemma apbc_initial_nonnull:forall R JO A J B F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl,
 0<vl<=32 ->ab<>0 ->
 (forall lane,0<=lane<vl->
 (apup_float A lane,apup_int J lane)=ap_block32_initial F O I ab ib p0 idx lane)->
 (forall lane,0<=lane<vl->apup_float B lane=ap_load_lane F p0 lane)->
 ap_rvv_update32 R JO A J B idx vl ->
 ap_block32_acc R JO F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl 0.
Proof.
 unfold ap_block32_acc,ap_block32_prefix;intros R JO A J B F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl HV HN HA HB HU lane HL.
 change((apup_float R lane,apup_int JO lane)=ap_block32_after_first F O I ab ib p0 idx lane).
 unfold ap_block32_after_first.
 assert(Hab:(ab=?0)=false)by(apply Z.eqb_neq;exact HN);rewrite Hab.
 rewrite(apuk_update_step R JO A J B idx vl lane HL ltac:(lia)HU).
 rewrite(HA lane HL),(HB lane HL);reflexivity.
Qed.
Lemma apbc_written:forall A J F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index,
 0<=vl ->ap_block32_acc A J F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl 8 ->
 ap_block32_written F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index
 (ap_output_write O output vl(apup_float A))(ap_index_write I index vl(apup_int J)).
Proof.
 unfold ap_block32_acc,ap_block32_written;intros A J F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index HV HA lane HL.
 unfold ap_output_write,ap_index_write;rewrite !app_write_inside by(rewrite Z2Nat.id by lia;exact HL).
 specialize(HA lane HL);rewrite ap_block32_prefix_final in HA.
 pose proof(f_equal fst HA)as HF;pose proof(f_equal snd HA)as HJ;cbn[fst snd]in HF,HJ.
 split;[exact(f_equal Some HF)|exact(f_equal Some HJ)].
Qed.
Lemma apbc_frames:forall O I output index vl f i,0<=vl->
 ap_block32_frames O I(ap_output_write O output vl f)(ap_index_write I index vl i)vl output index.
Proof.
 unfold ap_block32_frames,ap_output_write,ap_index_write;intros O I output index vl f i HV;
 split;intros q Hout;apply app_write_outside;intros j HJ HE;apply Hout;exists j;split;
 try exact HE;rewrite Z2Nat.id in HJ by assumption;exact HJ.
Qed.
Print Assumptions apbc_u32_idempotent.
Print Assumptions apbc_step_index_wrap.
Print Assumptions apbc_prefix_next.
Print Assumptions apbc_acc_step.
Print Assumptions apbc_initial_null.
Print Assumptions apbc_initial_nonnull.
Print Assumptions apbc_written.
Print Assumptions apbc_frames.
