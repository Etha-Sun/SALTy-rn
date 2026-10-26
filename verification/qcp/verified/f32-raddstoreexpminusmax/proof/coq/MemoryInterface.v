From Coq Require Import ZArith List.
From ExpMinusMax Require Export BorrowedMemory.
Definition em_distinct(W:list Z):Prop:=NoDup W.
Definition em_owned(W:list Z)(p:Z):Prop:=In p W.
Definition em_removed(W:list Z)(p:Z):list Z:=remove Z.eq_dec p W.
