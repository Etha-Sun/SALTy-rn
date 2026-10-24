From Dwconv Require Export RvvCompactSupport.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac dwr_rewrite_borrow :=
 lazymatch goal with |- ?P |-- ?Q=>
 multimatch Q with context[dw_data(dw_pop ?F ?p)]=>
 let Hp:=fresh "Hpresent"in assert(Hp:dw_present F p)by assumption;
 let H:=fresh "Hopen"in pose proof(proj1(dw_data_pop F p Hp))as H;
 rewrite H;clear H
 end end.
Ltac dwr_rewrite_restore :=
 lazymatch goal with |- ?P |-- ?Q=>
 multimatch P with context[dw_data(dw_pop ?F ?p)]=>
 let Hp:=fresh "Hpresent"in assert(Hp:dw_present F p)by assumption;
 let H:=fresh "Hclose"in pose proof(proj2(dw_data_pop F p Hp))as H;
 let cell:=constr:(store_float p(dw_get F p))in
 let fragment:=constr:(dw_data(dw_pop F p))in
 sep_lift_L (cons cell(cons fragment nil));
 try rewrite !derivable1_sepcon_assoc1;
 rewrite H;clear H
 end end.
