From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Import RvvUpdateIntoProbeModel APProgramMemoryFacts.
Local Open Scope Z_scope.
Definition apup_float(A:Recordvfloat32m8_t):Z->fp32:=ap_fpack32 (A.(vfloat32m8_t_s0)) (A.(vfloat32m8_t_s1)) (A.(vfloat32m8_t_s2)) (A.(vfloat32m8_t_s3)) (A.(vfloat32m8_t_s4)) (A.(vfloat32m8_t_s5)) (A.(vfloat32m8_t_s6)) (A.(vfloat32m8_t_s7)) (A.(vfloat32m8_t_s8)) (A.(vfloat32m8_t_s9)) (A.(vfloat32m8_t_s10)) (A.(vfloat32m8_t_s11)) (A.(vfloat32m8_t_s12)) (A.(vfloat32m8_t_s13)) (A.(vfloat32m8_t_s14)) (A.(vfloat32m8_t_s15)) (A.(vfloat32m8_t_s16)) (A.(vfloat32m8_t_s17)) (A.(vfloat32m8_t_s18)) (A.(vfloat32m8_t_s19)) (A.(vfloat32m8_t_s20)) (A.(vfloat32m8_t_s21)) (A.(vfloat32m8_t_s22)) (A.(vfloat32m8_t_s23)) (A.(vfloat32m8_t_s24)) (A.(vfloat32m8_t_s25)) (A.(vfloat32m8_t_s26)) (A.(vfloat32m8_t_s27)) (A.(vfloat32m8_t_s28)) (A.(vfloat32m8_t_s29)) (A.(vfloat32m8_t_s30)) (A.(vfloat32m8_t_s31)).
Definition apup_int(A:Recordvuint32m8_t):Z->Z:=ap_ipack32 (A.(vuint32m8_t_s0)) (A.(vuint32m8_t_s1)) (A.(vuint32m8_t_s2)) (A.(vuint32m8_t_s3)) (A.(vuint32m8_t_s4)) (A.(vuint32m8_t_s5)) (A.(vuint32m8_t_s6)) (A.(vuint32m8_t_s7)) (A.(vuint32m8_t_s8)) (A.(vuint32m8_t_s9)) (A.(vuint32m8_t_s10)) (A.(vuint32m8_t_s11)) (A.(vuint32m8_t_s12)) (A.(vuint32m8_t_s13)) (A.(vuint32m8_t_s14)) (A.(vuint32m8_t_s15)) (A.(vuint32m8_t_s16)) (A.(vuint32m8_t_s17)) (A.(vuint32m8_t_s18)) (A.(vuint32m8_t_s19)) (A.(vuint32m8_t_s20)) (A.(vuint32m8_t_s21)) (A.(vuint32m8_t_s22)) (A.(vuint32m8_t_s23)) (A.(vuint32m8_t_s24)) (A.(vuint32m8_t_s25)) (A.(vuint32m8_t_s26)) (A.(vuint32m8_t_s27)) (A.(vuint32m8_t_s28)) (A.(vuint32m8_t_s29)) (A.(vuint32m8_t_s30)) (A.(vuint32m8_t_s31)).
Lemma apup_frames:forall O I output index vl f i,0<=vl->
 ap_probe_frames O I(ap_output_write O output vl f)(ap_index_write I index vl i)vl output index.
Proof.
 unfold ap_probe_frames,ap_output_write,ap_index_write;intros O I output index vl f i Hv;
 split;intros q Hout;apply app_write_outside;intros j Hj Heq;apply Hout;exists j;split;
 try exact Heq;rewrite Z2Nat.id in Hj by assumption;exact Hj.
Qed.
Lemma apup_update_lane:forall R J A I B New vl j,
 0<=j<vl->vl<=32->ap_rvv_update32 R J A I B New vl->
 apup_float R j=ap_rvv_select_f32(ap_rvv_gt(apup_float B j)(apup_float A j))(apup_float A j)(apup_float B j) /\
 apup_int J j=ap_rvv_select_u32(ap_rvv_gt(apup_float B j)(apup_float A j))(apup_int I j)(ap_u32 New).
Proof.
 intros R J A I B New vl j Hj HV HU.
 destruct HU as[m[HG[HM[HR HI]]]].
 unfold ap_record_gt32 in HG;unfold ap_record_merge32 in HR;unfold ap_update_um32 in HI.
 repeat match goal with H:_ /\ _|-_=>destruct H end.
 assert(Hcases:j=0 \/ j=1 \/ j=2 \/ j=3 \/ j=4 \/ j=5 \/ j=6 \/ j=7 \/ j=8 \/ j=9 \/ j=10 \/ j=11 \/ j=12 \/ j=13 \/ j=14 \/ j=15 \/ j=16 \/ j=17 \/ j=18 \/ j=19 \/ j=20 \/ j=21 \/ j=22 \/ j=23 \/ j=24 \/ j=25 \/ j=26 \/ j=27 \/ j=28 \/ j=29 \/ j=30 \/ j=31)by lia.
 repeat match goal with H:_ \/ _|-_=>destruct H end;
 subst j;
 cbv beta iota zeta delta [apup_float apup_int ap_fpack32 ap_ipack32 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add];
 match goal with
 |-?r=ap_rvv_select_f32(ap_rvv_gt ?b ?a)?a ?b /\ ?out=ap_rvv_select_u32(ap_rvv_gt ?b ?a)?old(ap_u32 New)=>
 match goal with
 | HG:apr_int_lane ?n vl ?mask(ap_rvv_gt b a),
   HR:apr_float_lane ?n vl r(ap_rvv_select_f32 ?mask a b),
   HI:apr_int_lane ?n vl out(ap_rvv_select_u32 ?mask old(ap_u32 New))|-_=>
   unfold apr_float_lane in HR;unfold apr_int_lane in HG,HI;
   rewrite HG in HR,HI by lia;split;[apply HR|apply HI];lia
 end end.
Qed.
Lemma apup_written:forall F pa pb Old New vl output index O I R J A V B,
 0<vl<=32->ap_rvv_update32 R J A V B New vl->
 (forall j,0<=j<vl->apup_float A j=ap_load_lane F pa j)->
 (forall j,0<=j<vl->apup_float B j=ap_load_lane F pb j)->
 (forall j,0<=j<vl->apup_int V j=ap_u32 Old)->
 ap_probe_written F pa pb Old New vl output index
 (ap_output_write O output vl(apup_float R))(ap_index_write I index vl(apup_int J)).
Proof.
 intros F pa pb Old New vl output index O I R J A V B HV HU HA HB HI.
 unfold ap_probe_written;intros j Hj.
 unfold ap_output_write,ap_index_write;rewrite !app_write_inside by(rewrite Z2Nat.id by lia;exact Hj).
 pose proof(apup_update_lane R J A V B New vl j Hj ltac:(lia)HU)as[HF HJ].
 rewrite HA,HB in HF,HJ by exact Hj;rewrite HI in HJ by exact Hj.
 split;[exact(f_equal Some HF)|exact(f_equal Some HJ)].
Qed.
Print Assumptions apup_frames.
Print Assumptions apup_update_lane.
Print Assumptions apup_written.
