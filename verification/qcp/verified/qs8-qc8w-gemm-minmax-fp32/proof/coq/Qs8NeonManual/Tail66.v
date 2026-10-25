From Coq Require Import ZArith List Lia.
From Qs8NeonGoals Require Import G0502.
From Qs8Gemm Require Import KernelFrame NeonMac NeonOutput.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_tail_cases nc :=
 assert(Hcases:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7) by lia;
 repeat match goal with H:_ \/ _ |- _ => destruct H end;subst nc;
 repeat match goal with
 | H:context[Z.land ?x ?y] |- _ =>
   let v:=eval vm_compute in (Z.land x y) in change(Z.land x y)with v in H
 end.
Lemma checked_tail66:test_neon_entail_wit_4_66.
Proof.
 unfold test_neon_entail_wit_4_66;right;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 exfalso;qs8_tail_cases nc;congruence.
Qed.
Print Assumptions checked_tail66.
