From Coq Require Import ZArith List Lia.
From SpmmProof Require Export EntryFrame.
From SpmmSpec Require Export ActiveStep.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(** Generated C premises already expose their pure facts. Avoid traversing
    the entire 32-lane separation frame with Intros when it has no binder. *)
Ltac spmm_fast_frame :=
 spmm_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[spmm_pure2|spmm_cancel2]|spmm_cancel2].
