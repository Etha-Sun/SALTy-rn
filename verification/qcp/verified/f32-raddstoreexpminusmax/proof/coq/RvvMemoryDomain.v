From Coq Require Import ZArith List.
From ExpMinusMax Require Export OutputMemory.
Local Open Scope Z_scope.
(* Atomic names for the same disjunctions avoid prefill branch selection in
   QCP.  VL=0 still requires no accessed memory and imposes no pointer test. *)
Definition em_rvv_readable(F:EMMap)(p vl:Z):Prop:=vl=0 \/ em_window F p vl.
Definition em_rvv_writable(W:list Z)(p vl:Z):Prop:=vl=0 \/ em_write_window W p vl.
Lemma em_rvv_readable_exact:forall F p vl,
 em_rvv_readable F p vl <-> vl=0 \/ em_window F p vl.
Proof. reflexivity. Qed.
Lemma em_rvv_writable_exact:forall W p vl,
 em_rvv_writable W p vl <-> vl=0 \/ em_write_window W p vl.
Proof. reflexivity. Qed.
Print Assumptions em_rvv_readable_exact.
Print Assumptions em_rvv_writable_exact.
