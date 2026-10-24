From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8Resume_output03 Require Import KernelOutput.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac tail_cases nc :=
 assert (Hcases:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7) by lia;
 repeat match goal with H : _ \/ _ |- _ => destruct H end;
 subst nc;
 repeat match goal with
 | H : context[Z.land ?x ?y] |- _ =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v in H
 | |- context[Z.land ?x ?y] =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v
 end.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_508_pure:neon_full_goal.test_neon_partial_solve_wit_508_pure.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_508_pure;try left;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];timeout 1800 nia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_508_pure.
