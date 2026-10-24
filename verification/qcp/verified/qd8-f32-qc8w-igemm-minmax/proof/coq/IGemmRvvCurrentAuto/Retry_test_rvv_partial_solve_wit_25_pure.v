From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmRvv Require Import rvv_goal.
From IGemmSupport Require Import IGemmFacts.
From Qd8RvvArith Require Import RvvArithmetic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac igemm_context_facts :=
 match goal with H:igemm_shape ?mr ?N ?K ?ks ?es ?rs ?bs ?z ?zd ?off ?ps |- _ =>
 let Hd:=fresh "Hdepth" in let Hq:=fresh "Hentries" in
 let He:=fresh "Hlen" in let Hp:=fresh "Hpanels" in let Hw:=fresh "Hmatrix" in
 destruct (igemm_shape_facts mr N K ks es rs bs z zd off ps H) as [Hd [Hq [He [Hp Hw]]]]
 end.
Ltac igemm_pure :=
 rvv_normalize;try igemm_context_facts;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[lia|nia].
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_25_pure:rvv_goal.test_rvv_partial_solve_wit_25_pure.
Proof. unfold rvv_goal.test_rvv_partial_solve_wit_25_pure;try left;intros;timeout 1800 igemm_pure. Qed.
End Checked.
