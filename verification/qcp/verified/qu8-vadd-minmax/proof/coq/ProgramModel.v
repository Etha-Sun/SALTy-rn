From Coq Require Import ZArith Lia List.
From Qu8Add Require Export Model UnsignedModel Types MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qu_values (n az bz ma mb raw oz lo hi:Z)(A B:list Z):list Z :=
 map (fun i:nat => qu_neon_lane (nth i A 0) (nth i B 0) az bz ma mb raw oz lo hi) (seq 0 (Z.to_nat n)).
Definition qu_outputs_related (L R:list Z):Prop := L=R.
