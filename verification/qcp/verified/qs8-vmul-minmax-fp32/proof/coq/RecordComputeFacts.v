From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordComputeModel RecordInputFacts MagicConstant RvvLaneFactsFast.
Local Open Scope Z_scope.
Local Opaque qm_ne qm_of_int qm_rvv_add qm_rvv_mul qm_sign qm_signed_bits bits_of_fp32 qm_sat8 qm_sat16 qm_sat32.
Lemma qm_record_compute_no_nan:forall (vl:Z)(A B:Recordvint8m2_t)(X Y:Recordvint16m4_t)(P:Recordvint32m8_t)(F0 F1 F2:Recordvfloat32m8_t)(U S:Recordvint32m8_t)(T:Recordvint16m4_t)(V M R:Recordvint8m2_t)(az bz:Z)(scale:fp32)(oz lo hi:Z),
 0<=vl<=32 ->
 qm_record_sext_sub_match vl A X az ->
 qm_record_sext_sub_match vl B Y bz ->
 qm_record_wmul_match vl P X Y ->
 qm_record_cvt_match vl P F0 ->
 qm_record_fmul_match vl F0 F1 scale ->
 qm_record_fadd_match vl F1 F2 qm_magic ->
 qm_record_reinterpret_match 32 F2 U ->
 qm_record_ssub_match vl U S(1262485504-oz) ->
 qm_record_clip16_match vl S T ->
 qm_record_clip8_match vl T V ->
 qm_record_max8_match vl V M lo ->
 qm_record_min8_match vl M R hi ->
 qm_ne scale scale=0 ->qm_record_compute_match vl A B R az bz scale oz lo hi.
Proof.
 intros vl A B X Y P F0 F1 F2 U S T V M R az bz scale oz lo hi Hvl HX HY HP HC HM HA HU HS HT HV HMAX HMIN Hnan.
 unfold qm_record_compute_match;intros i Hi.
 unfold qm_record_sext_sub_match,qm_record_wmul_match,qm_record_cvt_match,qm_record_fmul_match,qm_record_fadd_match,qm_record_reinterpret_match,qm_record_ssub_match,qm_record_clip16_match,qm_record_clip8_match,qm_record_max8_match,qm_record_min8_match in *.
 repeat match goal with H:forall j:Z,_ -> _ |- _=>specialize(H i ltac:(lia))end.
 rewrite HMIN,HMAX,HV,HT,HS,HU,HA,HM,HC,HP,HX,HY.
 pose proof(qm_rvv_fold_no_nan (qm_sub16(qm_record_lanes_vint8m2_t A i)az)(qm_sub16(qm_record_lanes_vint8m2_t B i)bz)0 0 scale oz lo hi Hnan)as E.
 rewrite !Z.sub_0_r in E;exact E.
Qed.
Print Assumptions qm_record_compute_no_nan.
Lemma qm_record_compute_nan:forall (vl:Z)(A B:Recordvint8m2_t)(X Y:Recordvint16m4_t)(P:Recordvint32m8_t)(F0 F1 F2:Recordvfloat32m8_t)(F3:Recordvfloat32m8_t)(U S:Recordvint32m8_t)(T:Recordvint16m4_t)(V M R:Recordvint8m2_t)(az bz:Z)(scale:fp32)(oz lo hi:Z),
 0<=vl<=32 ->
 qm_record_sext_sub_match vl A X az ->
 qm_record_sext_sub_match vl B Y bz ->
 qm_record_wmul_match vl P X Y ->
 qm_record_cvt_match vl P F0 ->
 qm_record_fmul_match vl F0 F1 scale ->
 qm_record_fadd_match vl F1 F2 qm_magic ->
 qm_record_sgnj_match vl F2 F3 scale ->
 qm_record_reinterpret_match 32 F3 U ->
 qm_record_ssub_match vl U S(1262485504-oz) ->
 qm_record_clip16_match vl S T ->
 qm_record_clip8_match vl T V ->
 qm_record_max8_match vl V M lo ->
 qm_record_min8_match vl M R hi ->
 qm_ne scale scale<>0 ->qm_record_compute_match vl A B R az bz scale oz lo hi.
Proof.
 intros vl A B X Y P F0 F1 F2 F3 U S T V M R az bz scale oz lo hi Hvl HX HY HP HC HM HA HG HU HS HT HV HMAX HMIN Hnan.
 unfold qm_record_compute_match;intros i Hi.
 unfold qm_record_sext_sub_match,qm_record_wmul_match,qm_record_cvt_match,qm_record_fmul_match,qm_record_fadd_match,qm_record_sgnj_match,qm_record_reinterpret_match,qm_record_ssub_match,qm_record_clip16_match,qm_record_clip8_match,qm_record_max8_match,qm_record_min8_match in *.
 repeat match goal with H:forall j:Z,_ -> _ |- _=>specialize(H i ltac:(lia))end.
 rewrite HMIN,HMAX,HV,HT,HS,HU,HG,HA,HM,HC,HP,HX,HY.
 pose proof(qm_rvv_fold_nan (qm_sub16(qm_record_lanes_vint8m2_t A i)az)(qm_sub16(qm_record_lanes_vint8m2_t B i)bz)0 0 scale oz lo hi Hnan)as E.
 rewrite !Z.sub_0_r in E;exact E.
Qed.
Print Assumptions qm_record_compute_nan.
