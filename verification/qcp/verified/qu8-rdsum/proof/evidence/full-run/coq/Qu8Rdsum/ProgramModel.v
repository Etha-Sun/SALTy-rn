From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export Types MemoryModel ControlModel VectorModel.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope.
Definition rd_row_address (base stride row col:Z):Z := base+row*stride+col.
Fixpoint rd_sum_rows (M:RDMap)(base stride col:Z)(rows:nat):Z :=
 match rows with O=>0 |S n=>rd_sum_rows M base stride col n + rd_get M(rd_row_address base stride (Z.of_nat n) col) end.
Definition rd_column (M:RDMap)(base rows stride col:Z):Z := rd_sum_rows M base stride col (Z.to_nat rows).
Definition rd_results (M:RDMap)(base rows channels stride:Z)(Init:list Z):list Z :=
 map(fun j=>rs_u32(Znth (Z.of_nat j) Init 0+rd_column M base rows stride (Z.of_nat j)))(seq 0(Z.to_nat channels)).
Definition rd_inputs (M:RDMap)(base rows channels stride:Z):Prop :=
 forall r c:Z,0<=r<rows -> 0<=c<channels+8 -> rd_present M(rd_row_address base stride r c).
Definition rd_zero_size(channels:Z):Z := if Z.leb 32 channels then 40 else Z.max 8 channels.
Definition rd_zeros (M:RDMap)(zero channels:Z):Prop :=
 0<zero /\ rd_window M zero (rd_zero_size channels) /\
 forall i:Z,0<=i<rd_zero_size channels -> rd_get M(zero+i)=0.
Definition rd_zero_condition(M:RDMap)(zero rows channels:Z):Prop :=
 rows mod 7=0 \/ rd_zeros M zero channels.
Lemma rd_results_length : forall M base rows channels stride Init,0<=channels ->
 Zlength(rd_results M base rows channels stride Init)=channels.
Proof. intros;unfold rd_results;rewrite Zlength_correct,length_map,length_seq,Z2Nat.id by lia;reflexivity. Qed.
Lemma rd_column_zero : forall M base stride col,rd_column M base 0 stride col=0.
Proof. reflexivity. Qed.
Print Assumptions rd_results_length.
Print Assumptions rd_column_zero.
