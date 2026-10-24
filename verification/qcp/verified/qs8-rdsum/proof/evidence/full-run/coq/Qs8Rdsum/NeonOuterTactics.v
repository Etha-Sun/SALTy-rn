From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export CallerOrigin ResourceLiftMem NeonBatchFacts OuterPointerFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_outer_case E := first[rewrite Z.max_r in E by lia|rewrite Z.max_l in E by lia].
Ltac rd_outer_values :=
 match goal with HM:(forall q,rd_present ?Map q ->-128<=rd_get ?Map q<=127),
 Hin:rd_inputs ?Map ?Base ?Rows ?Ch ?Stride |- _=>
 repeat match goal with
 | |- context[rs_add_s32(rd_acc32 Map Base Stride ?c32(Rows- ?r)?i ?w32)
   (rd_acc16 Map Base Stride ?c16(Rows- ?r)(rd_done ?r ?cb)?j ?w16)]=>
 let E:=fresh "EBatchLane"in pose proof(rd_neon_acc32_batch_step Map Base Rows Ch Stride c32 c16 r cb i j w32 w16
 HM Hin ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as E;
 rd_outer_case E;rewrite E;clear E
 end end.
Ltac rd_outer_pointer_facts :=
 repeat match goal with
 | HG:rd_inner_gate ?r ?cb ?p(rd_u64(?input+(?Rows- ?r+(rd_min252 ?r- ?cb)+?j)*?Stride)) |- _=>
 let E:=fresh "HOuterPointer"in pose proof(rd_outer_pointer_step_flat r cb Rows input Stride j p
 ltac:(lia)ltac:(lia)ltac:(assumption)HG)as E;rd_outer_case E;clear HG
 end;
 try match goal with
 | HG:rd_inner_gate ?r ?cb ?p(rd_u64(?input+(?Rows- ?r+(rd_min252 ?r- ?cb))*?Stride)) |- _=>
 let E:=fresh "HOuterPointer"in
 let HG0:=fresh "HGateZero"in
 assert(HG0:rd_inner_gate r cb p(rd_u64(input+(Rows-r+(rd_min252 r-cb)+0)*Stride)))by(rewrite Z.add_0_r;exact HG);
 pose proof(rd_outer_pointer_step_flat r cb Rows input Stride 0 p ltac:(lia)ltac:(lia)ltac:(assumption)HG0)as E;
 rd_outer_case E;rewrite ?Z.add_0_r in E;clear HG HG0
 end.
Ltac rd_outer_progress_facts :=
 match goal with H:rd_mod252(?Rows- ?r)=0 |- _=>
 let HP:=fresh "HOuterProgress"in pose proof(rd_progress_step Rows r ltac:(lia)(or_intror H))as HP;rd_outer_case HP;
 let HC:=fresh "HOuterCount"in pose proof(rd_ceil252_step r ltac:(lia))as HC;rd_outer_case HC
 end.
Ltac rd_outer_pure := unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;try assumption;try reflexivity;try lia.
Ltac rd_outer_finish :=
 rd_outer_progress_facts;rd_outer_pointer_facts;
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[rd_outer_pure|opaque_leaves;sepcon_assoc_change;fast_cancel].
