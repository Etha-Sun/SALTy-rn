From Qu8Add Require Export RvvKernelArithmeticAutomation.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac qu_atomic2_find x :=
 match goal with c := x : Assertion |- _ => constr:(c) end.
Ltac qu_atomic2_create P sep :=
 lazymatch P with
 | sep ?A ?B => qu_atomic2_create A sep;qu_atomic2_create B sep
 | _ => first[let c:=qu_atomic2_find P in idtac|let c:=fresh "atomicCell"in pose(c:=P)]
 end.
Ltac qu_atomic2_rebuild P sep :=
 lazymatch P with
 | sep ?A ?B => let A1:=qu_atomic2_rebuild A sep in let B1:=qu_atomic2_rebuild B sep in constr:(A1 ** B1)
 | _ => qu_atomic2_find P
 end.
Ltac qu_atomic2_frame :=
 let example:=constr:(emp ** emp)in
 lazymatch example with (?sep _ _) =>
  lazymatch goal with |-?P|--?Q=>
   qu_atomic2_create P sep;
   let P1:=qu_atomic2_rebuild P sep in let Q1:=qu_atomic2_rebuild Q sep in
   change(P1|--Q1);
   repeat match goal with c := _ : Assertion |- _ => clearbody c end;
   sepcon_assoc_change;fast_cancel
  end
 end.
