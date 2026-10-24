From Coq Require Export ZArith.
From Qu8Rdsum Require Export RvvModel.
Local Open Scope Z_scope.
(* Only a finished final block may forget its row pointers.  A full 252-row
   block must retain them because the outer row loop can continue. *)
Definition rd_inner_gate(r cb p expected:Z):Prop :=
 (r<=252 /\ cb<=0) \/ p=expected.
