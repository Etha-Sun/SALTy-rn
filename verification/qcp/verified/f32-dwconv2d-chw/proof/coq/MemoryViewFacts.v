From Coq Require Import ZArith List.
From DwChw Require Export TerminalModel OutputInterface.
Local Open Scope Z_scope.
(* These wrappers preserve the original all-VL conditions exactly. They hide
   logical disjunction from QCP's eager branch matcher; no address permission
   is created by the byte-address identity or by the zero-VL branch. *)
Definition dw_load_allowed(F:DwROMap)(p vl:Z):Prop:=vl=0 \/ dw_window F p vl.
Definition dw_store_allowed(W:list Z)(p vl:Z):Prop:=vl=0 \/ dw_write_window W p vl.
Lemma dw_load_allowed_exact:forall F p vl,dw_load_allowed F p vl <-> (vl=0 \/ dw_window F p vl).
Proof. reflexivity. Qed.
Lemma dw_store_allowed_exact:forall W p vl,dw_store_allowed W p vl <-> (vl=0 \/ dw_write_window W p vl).
Proof. reflexivity. Qed.
Lemma dw_load_allowed_zero:forall F p,dw_load_allowed F p 0.
Proof. intros;left;reflexivity. Qed.
Lemma dw_store_allowed_zero:forall W p,dw_store_allowed W p 0.
Proof. intros;left;reflexivity. Qed.
Lemma dw_load_byte_address:forall F base j,dw_load F base j=dw_get F(base+4*j).
Proof. reflexivity. Qed.
Print Assumptions dw_load_allowed_exact.
Print Assumptions dw_store_allowed_exact.
Print Assumptions dw_load_allowed_zero.
Print Assumptions dw_store_allowed_zero.
Print Assumptions dw_load_byte_address.
