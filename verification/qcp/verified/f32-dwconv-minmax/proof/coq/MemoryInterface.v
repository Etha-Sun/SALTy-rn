From Coq Require Import ZArith List.
From Dwconv Require Export OutputMemory.
Definition dw_same(x y:fp32):Prop:=x=y.
Definition dw_distinct(W:list Z):Prop:=NoDup W.
Definition dw_owned(W:list Z)(p:Z):Prop:=In p W.
Definition dw_removed(W:list Z)(p:Z):list Z:=remove Z.eq_dec p W.
Definition dw_at(O:DwOutput)(p:Z):option fp32:=O p.
