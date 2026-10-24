From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8Resume_mac8_01 Require Import KernelMac8.
From Qd8Resume_output03 Require Import KernelOutput.
From GuardCursor Require Import GuardCursor.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac guard_cursor N K a wb c p k w Ps :=
 let Hr:=fresh "Hcursor_range" in
 assert (Hr:0<=w+64<=UINT64_MAX) by
   (eapply (current_loaded_pointer_range N K a wb c p k w Ps);
    first[eassumption|lia|nia]);
 repeat match goal with H:context[unsigned_last_nbits ?x 64] |- _ =>
   let E:=fresh "Ecast" in
   assert (E:unsigned_last_nbits x 64=x) by
     (apply uintptr_cast_identity;replace x with (w+64) by ring;exact Hr);
   rewrite E in H;clear E
 end.
Ltac capacity_facts :=
 repeat match goal with H:data_capacity _ _ _ _ _ |- _ =>
   unfold data_capacity in H;decompose [and] H;clear H
 end.
Ltac guard_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];timeout 1800 nia.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_135:neon_guard_goal.test_neon_partial_solve_wit_135.
Proof. unfold neon_guard_goal.test_neon_partial_solve_wit_135,neon_guard_goal.test_neon_partial_solve_wit_135_aux;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;capacity_facts;repeat match goal with H:Z.land ?x ?mask = ?rhs |- _ => progress rewrite H end;rewrite ?Z.add_0_r,?Z.add_0_l,?Z.add_assoc;qd8_frame.
Qed.
End Checked.
