From Coq Require Import ZArith List.
From DwChw Require Export OutputMemory Store8Model.
Import ListNotations.
Local Open Scope Z_scope.
Definition dw_distinct(W:list Z):Prop:=NoDup W.
Definition dw_pack2(x0 x1:fp32):list fp32:=[x0;x1].
Definition dw_pack4(x0 x1 x2 x3:fp32):list fp32:=[x0;x1;x2;x3].
Fixpoint dw_write_values(O:DwOutput)(p:Z)(xs:list fp32):DwOutput:=
 match xs with []=>O|v::rest=>dw_write_values(dw_output_put O p v)(p+4)rest end.
Definition dw_output_domain(base count:Z):list Z:=map(fun i=>base+4*Z.of_nat i)(seq 0(Z.to_nat count)).
