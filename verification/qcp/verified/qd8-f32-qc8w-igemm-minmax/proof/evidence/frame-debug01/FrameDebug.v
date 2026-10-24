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
Ltac igemm_frame :=
 rvv_normalize;rvv_subst;rvv_normalize;try igemm_context_facts;
 rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[igemm_pure|qd8_cancel]|qd8_cancel].
Goal rvv_goal.test_rvv_partial_solve_wit_100.
unfold rvv_goal.test_rvv_partial_solve_wit_100,rvv_goal.test_rvv_partial_solve_wit_100_aux;intros.
rvv_normalize;rvv_subst;rvv_normalize;try igemm_context_facts.
rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc.
try (apply _derivable1_andp_intros;[solve [igemm_pure]|]).
qd8_forget_cells;opaque_leaves;sepcon_assoc_change;try fast_cancel.
Show.
Abort.
