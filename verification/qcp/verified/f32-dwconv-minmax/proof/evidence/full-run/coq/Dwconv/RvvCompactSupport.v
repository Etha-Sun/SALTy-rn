(* Resource-only compact replay, adapted from the frozen F32F16.RvvCallerFrame
   source. No semantic model or C obligation is weakened. Identical undefined
   vector ownership remains one opaque predicate instead of 16 expansions. *)
From Coq Require Import ZArith Lia.
From Dwconv Require Export KernelRetrySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dwr_compact_spatial := opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac dwr_compact_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];first[tauto|lia]
 |dwr_compact_spatial]|dwr_compact_spatial].
Ltac dwr_compact_call :=
 lazymatch goal with |- _ \/ _=>left|_=>idtac end;
 dw_prepare;dw_address_units;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia]
 |solve[dw_borrow;dwr_compact_frame]
 |solve[dw_restore_maps;dwr_compact_frame]
 |solve[dw_restore_maps;dw_borrow;dwr_compact_frame]
 |dwr_compact_frame].
