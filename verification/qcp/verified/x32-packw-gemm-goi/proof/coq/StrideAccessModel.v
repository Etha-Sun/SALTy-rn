From X32Packw Require Export AccessModel.
From Coq Require Import ZArith List.
Local Open Scope Z_scope.
Definition pw_stride_window(W:list Z)(p vl:Z):Prop:=
 0<p /\ 0<=vl<=16 /\ forall i,0<=i<vl->In(p+8*i)W.
Definition pw_segment_window(W:list Z)(p vl:Z):Prop:=
 pw_stride_window W p vl /\ pw_stride_window W(p+4)vl.
