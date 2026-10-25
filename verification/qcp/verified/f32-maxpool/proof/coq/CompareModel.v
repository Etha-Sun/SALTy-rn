From Coq Require Import ZArith Bool.
From MaxPool Require Export MemoryViews.
Local Open Scope Z_scope.
Definition mp_out_known(O:MPOutput)(p:Z)(v:fp32):Prop:=O p=Some v.
Definition mp_word_equal(a b:Z):Z:=if Z.eqb a b then 1 else 0.
