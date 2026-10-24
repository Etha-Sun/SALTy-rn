From Coq Require Import ZArith Lia List.
From Qs8Add Require Export Model Types MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qa_values (n az bz ma mb raw oz lo hi:Z)(A B:list Z):list Z :=
 map (fun i:nat => qa_neon_lane (nth i A 0) (nth i B 0) az bz ma mb raw oz lo hi) (seq 0 (Z.to_nat n)).
Definition qa_outputs_related (L R:list Z):Prop := L=R.
