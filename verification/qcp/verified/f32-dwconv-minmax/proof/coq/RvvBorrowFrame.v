From Dwconv Require Export RvvCompactSupport.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac dwr_abstract_leaves_except keep leaves :=
 lazymatch leaves with
 | nil=>idtac
 | cons(norm_asrt ?v)?rest=>
   first[constr_eq v keep|is_var v|
    let cell:=fresh "frame_cell"in let E:=fresh "Eframe_cell"in
    remember v as cell eqn:E;clear E];
   dwr_abstract_leaves_except keep rest
 end.
Ltac dwr_abstract_unrelated :=
 lazymatch goal with |- ?P |-- ?Q=>
 multimatch Q with context[dw_data(dw_pop ?F ?p)]=>
 let leaves:=All_listasrts P in dwr_abstract_leaves_except (dw_data F) leaves
 end end.
