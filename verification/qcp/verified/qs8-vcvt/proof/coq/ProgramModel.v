From Coq Require Import ZArith Lia List.
From Qs8I8Cvt Require Export Model Types MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qcv_outputs_related (L R:list Z):Prop := L=R.
