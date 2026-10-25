From Coq Require Import ZArith.
From Qs8Mul Require Export RecordStageViews MemoryModel.
Local Open Scope Z_scope.
Definition qm_record_load_allowed(M:RDMap)(p vl:Z):Prop:=vl=0 \/ rd_window M p vl.
Definition qm_record_load_match(M:RDMap)(p vl:Z)(r:Recordvint8m2_t):Prop:=
 forall i,0<=i<vl -> qm_record_lanes_vint8m2_t r i=rd_get M(p+i).
Definition qm_record_sext_sub_match(vl:Z)(a:Recordvint8m2_t)(r:Recordvint16m4_t)(x:Z):Prop:=
 forall i,0<=i<vl -> qm_record_lanes_vint16m4_t r i=qm_sub16(qm_record_lanes_vint8m2_t a i)x.
