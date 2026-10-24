From Qu8Add Require Export RvvKernelArithmeticAutomation.
Import Snaive_C_Rules64.
Local Open Scope sac.
(* Each atom is a local transparent definition. A single change checks the
   complete reconstructed assertion before those definitions are generalized. *)
Ltac qu_atomic_find x :=
 match goal with c := ?v : Assertion |- _ => constr_eq x v;constr:(c) end.
Ltac qu_atomic_create P sep :=
 lazymatch P with
 | (?op ?A ?B) => first[constr_eq op sep;qu_atomic_create A sep;qu_atomic_create B sep
                         |first[let c:=qu_atomic_find P in idtac
                               |let c:=fresh "atomicCell"in pose(c:=P)]]
 | _ => first[let c:=qu_atomic_find P in idtac|let c:=fresh "atomicCell"in pose(c:=P)]
 end.
Ltac qu_atomic_rebuild P sep :=
 lazymatch P with
 | (?op ?A ?B) => first[constr_eq op sep;let A1:=qu_atomic_rebuild A sep in let B1:=qu_atomic_rebuild B sep in constr:(A1 ** B1)
                         |qu_atomic_find P]
 | _ => qu_atomic_find P
 end.
Ltac qu_atomic_frame :=
 let example:=constr:(emp ** emp)in
 lazymatch example with (?sep _ _) =>
  lazymatch goal with |-?P|--?Q=>
   qu_atomic_create P sep;
   let P1:=qu_atomic_rebuild P sep in let Q1:=qu_atomic_rebuild Q sep in
   change(P1|--Q1);
   repeat match goal with c := _ : Assertion |- _ => clearbody c end;
   sepcon_assoc_change;fast_cancel
  end
 end.
