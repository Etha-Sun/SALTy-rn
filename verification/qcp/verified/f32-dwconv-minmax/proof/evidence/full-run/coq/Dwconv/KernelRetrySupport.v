From Coq Require Import ZArith Lia List.
From Dwconv Require Export KernelSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_address_units :=
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 try change(Z.land 0 1)with 0 in *;try change(Z.land 0 2)with 0 in *;
 try change(Z.land 1 1)with 1 in *;try change(Z.land 1 2)with 0 in *;
 try change(Z.land 2 1)with 0 in *;try change(Z.land 2 2)with 2 in *;
 try change(Z.land 3 1)with 1 in *;try change(Z.land 3 2)with 2 in *.
Ltac dw_restore_maps :=
 lazymatch goal with |- ?P |-- ?Q =>
 first[multimatch P with context[dw_data(dw_pop ?F ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_present F p)by assumption;
 sep_apply(proj2(dw_data_pop F p H))end
 |multimatch P with context[dw_ptr_data(dw_ptr_pop ?P ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_ptr_present P p)by assumption;
 sep_apply(proj2(dw_ptr_data_pop P p H))end]end.
Ltac dw_retry_finish :=
 lazymatch goal with |- _ \/ _=>left|_=>idtac end;
 dw_prepare;dw_address_units;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia]
 |solve[dw_frame]
 |solve[dw_restore_maps;dw_frame]
 |solve[dw_borrow;dw_frame]
 |dw_restore_maps;dw_borrow;dw_frame].
