From Coq Require Import ZArith.
From ExpMinusMax Require Export RecordStageFacts.
Import Snaive_C_Rules64. Local Open Scope sac.
Definition em_same_record_i4(a b:Recordint32x4_t):Prop:=a=b.
Definition em_same_record_u4(a b:Recorduint32x4_t):Prop:=a=b.
Lemma em_record_stage_i4:forall p R,StructPredint32x4_t p R|--
 EX(V:Recordint32x4_t), “em_same_record_i4 V R” && StructPredint32x4_t p V.
Proof. intros;Exists R;unfold em_same_record_i4;entailer!. Qed.
Lemma em_record_stage_u4:forall p R,StructPreduint32x4_t p R|--
 EX(V:Recorduint32x4_t), “em_same_record_u4 V R” && StructPreduint32x4_t p V.
Proof. intros;Exists R;unfold em_same_record_u4;entailer!. Qed.
Print Assumptions em_record_stage_i4.
Print Assumptions em_record_stage_u4.
