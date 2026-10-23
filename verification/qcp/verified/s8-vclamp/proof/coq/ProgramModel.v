From Coq Require Import ZArith List.
From S8Clamp Require Export MemoryModel.
Definition s8_outputs_related (L R:list Z) : Prop := L=R.
