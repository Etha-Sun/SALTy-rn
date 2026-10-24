From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export NeonOuterTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_rvv_outer_values :=
 match goal with HM:(forall q,rd_present ?Map q ->-128<=rd_get ?Map q<=127),
 Hin:rd_inputs ?Map ?Base ?Rows ?Ch ?Stride |- _=>
 repeat match goal with
 | |- context[rd_active_wadd32(rd_acc32 Map Base Stride ?col(Rows- ?r)?i ?vl)
   (rd_acc16 Map Base Stride ?col(Rows- ?r)(rd_done ?r ?cb)?i ?vl)?i ?vl]=>
 let E:=fresh "EBatchLane"in pose proof(rd_acc32_batch_step Map Base Rows Ch Stride col r cb i vl
 HM Hin ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as E;
 rewrite rd_min252_remainder in E by lia;rd_outer_case E;rewrite E;clear E
 end end.
