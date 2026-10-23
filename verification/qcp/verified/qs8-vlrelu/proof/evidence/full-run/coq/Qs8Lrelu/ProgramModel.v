From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Export LreluModel Types MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qlr_outputs_related(L R:list Z):Prop := L=R.
