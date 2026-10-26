From Coq Require Import ZArith List.
From ArgmaxPool Require Export OutputMemory.
Definition ap_distinct(W:list Z):Prop:=NoDup W.
Definition ap_owned(W:list Z)(p:Z):Prop:=In p W.
Definition ap_removed(W:list Z)(p:Z):list Z:=remove Z.eq_dec p W.
Definition ap_float_initialized(O:APOutput)(p:Z)(v:fp32):Prop:=O p=Some v.
Definition ap_uint_initialized(O:APIndex)(p v:Z):Prop:=O p=Some v.
