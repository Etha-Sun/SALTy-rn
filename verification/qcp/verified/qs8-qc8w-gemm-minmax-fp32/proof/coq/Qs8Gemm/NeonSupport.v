From Coq Require Import ZArith Lia.
From Qs8Gemm Require Export KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_neon_address :=
 lazymatch goal with
 | |- qs8_i8_address_ok 0 _ _ _ _ _ _ _ =>
   unfold qs8_i8_address_ok;left;repeat split;try reflexivity;unfold panel_bytes;nia
 | |- qs8_i8_address_ok 1 _ _ _ _ _ _ _ =>
   unfold qs8_i8_address_ok;right;repeat split;try reflexivity;unfold panel_bytes;nia
 end.
Ltac qs8_neon_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj|qs8_neon_address];
 try lia.
Ltac qs8_neon_frame :=
 qs8_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qs8_neon_pure|qs8_cancel]|qs8_cancel].

Lemma qs8_literal_safety : forall P (n:Z), 0<=n<=1 ->
 P |-- “ (n<=2147483647) ” && “ (-2147483648<=n) ”.
Proof. unfold derivable1,andp,coq_prop;intros;split;lia. Qed.
