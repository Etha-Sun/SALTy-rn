From Coq Require Import ZArith.
From Qs8Mul Require Export RecordInputViews ProgramModel.
Local Open Scope Z_scope.
(* This ordinary helper admits all typed signed16 offsets. Public signed8
   zero points are a subset; no finite/positive scale or ordered-bound cut. *)
Definition qm_record_compute_match(vl:Z)(a b r:Recordvint8m2_t)(az bz:Z)(scale:fp32)(oz lo hi:Z):Prop:=
 forall i,0<=i<vl ->qm_record_lanes_vint8m2_t r i=
 qm_rvv_lane(qm_sub16(qm_record_lanes_vint8m2_t a i)az)
            (qm_sub16(qm_record_lanes_vint8m2_t b i)bz)0 0 scale oz lo hi.
