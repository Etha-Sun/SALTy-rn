From Coq Require Import ZArith List.
From Qu8Rdsum Require Export RvvModel.
Local Open Scope Z_scope.

Definition rd_result_lane(M:RDMap)(base rows stride col:Z)(Init:list Z):Z :=
 rs_u32(Znth col Init 0+rd_column M base rows stride col).

(* Mathematical sequence of writes, not a replacement for an actual C body. *)
Fixpoint rd_store_block(M:RDMap)(base rows stride k:Z)(count:nat)
 (Init Out:list Z):list Z :=
 match count with
 | O=>Out
 | S rest=>rd_store_block M base rows stride(k+1)rest Init
   (replace_Znth k(rd_result_lane M base rows stride k Init)Out)
 end.
