From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordComputeCompact RecordComputeBounds.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Preserve already identical complete owners before exposing only the borrowed
   input and return cells required by the actual C callee contract. *)
Ltac qm_shared_record_leaves l :=
 lazymatch l with
 | nil => idtac
 | cons(norm_asrt ?v) ?tail=>
   try(lazymatch goal with|-_ |-- ?Q=>
    lazymatch Q with context[v]=>
     let cell:=fresh "shared_owner"in let E:=fresh "Eowner"in
     remember v as cell eqn:E;clear E end end);
   qm_shared_record_leaves tail
 end.
Ltac qm_compute_frame:=
 match goal with|-?P |--_=>let leaves:=All_listasrts P in qm_shared_record_leaves leaves end;
 unfold StructPredvint8m2_t,StructPredvint16m4_t,StructPredvint32m8_t,StructPredvfloat32m8_t;
 try unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?qm_local_field_address;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac qm_compute_frame_solve:=qm_compute_compact_start;
 try(lazymatch goal with|-context[1262485504-?oz]=>let Hoz:=fresh "Hoz"in qm_capture_short oz Hoz end);
 first[solve[qm_pure]|solve[apply _derivable1_andp_intros;[qm_pure|qm_compute_frame]]|solve[qm_compute_frame]].
