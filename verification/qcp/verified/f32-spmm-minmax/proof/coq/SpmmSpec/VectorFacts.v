From Coq Require Import ZArith List Lia.
From AUXLib Require Import ListLib.
From SpmmSpec Require Import Vectors MemoryStore.
Import ListNotations.
Local Open Scope Z_scope.

(** The intrinsic store observes only the active prefix. Inactive fields
    remain arbitrary; no zero-tail or short-VLEN premise is introduced. *)
Lemma spmm_active32_block : forall vl row column start nnz deltas input weights lo hi
 (x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:fp32),
 0<=row -> 0<=vl<=32 ->
 spmm_active32 vl x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 (spmm_cell column (row+0) start nnz deltas input weights lo hi) (spmm_cell column (row+1) start nnz deltas input weights lo hi) (spmm_cell column (row+2) start nnz deltas input weights lo hi) (spmm_cell column (row+3) start nnz deltas input weights lo hi) (spmm_cell column (row+4) start nnz deltas input weights lo hi) (spmm_cell column (row+5) start nnz deltas input weights lo hi) (spmm_cell column (row+6) start nnz deltas input weights lo hi) (spmm_cell column (row+7) start nnz deltas input weights lo hi) (spmm_cell column (row+8) start nnz deltas input weights lo hi) (spmm_cell column (row+9) start nnz deltas input weights lo hi) (spmm_cell column (row+10) start nnz deltas input weights lo hi) (spmm_cell column (row+11) start nnz deltas input weights lo hi) (spmm_cell column (row+12) start nnz deltas input weights lo hi) (spmm_cell column (row+13) start nnz deltas input weights lo hi) (spmm_cell column (row+14) start nnz deltas input weights lo hi) (spmm_cell column (row+15) start nnz deltas input weights lo hi) (spmm_cell column (row+16) start nnz deltas input weights lo hi) (spmm_cell column (row+17) start nnz deltas input weights lo hi) (spmm_cell column (row+18) start nnz deltas input weights lo hi) (spmm_cell column (row+19) start nnz deltas input weights lo hi) (spmm_cell column (row+20) start nnz deltas input weights lo hi) (spmm_cell column (row+21) start nnz deltas input weights lo hi) (spmm_cell column (row+22) start nnz deltas input weights lo hi) (spmm_cell column (row+23) start nnz deltas input weights lo hi) (spmm_cell column (row+24) start nnz deltas input weights lo hi) (spmm_cell column (row+25) start nnz deltas input weights lo hi) (spmm_cell column (row+26) start nnz deltas input weights lo hi) (spmm_cell column (row+27) start nnz deltas input weights lo hi) (spmm_cell column (row+28) start nnz deltas input weights lo hi) (spmm_cell column (row+29) start nnz deltas input weights lo hi) (spmm_cell column (row+30) start nnz deltas input weights lo hi) (spmm_cell column (row+31) start nnz deltas input weights lo hi) ->
 sublist 0 vl [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31] =
 spmm_column_block row vl column start nnz deltas input weights lo hi.
Proof.
 intros vl row column start nnz deltas input weights lo hi x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 Hr Hv Hactive.
 unfold spmm_active32,spmm_active_value,bit_same in Hactive.
 decompose [and] Hactive;clear Hactive.
 apply (list_eq_nth fp32 _ _ fp32_zero).
 - pose proof (spmm_block_length row vl column start nnz deltas input weights lo hi ltac:(lia)) as Hlen.
   rewrite Zlength_correct in Hlen.
   unfold sublist;cbn [Z.to_nat skipn];rewrite firstn_length;cbn [length];lia.
 - intros n Hn.
   assert (Hbound:(n<Z.to_nat vl)%nat).
   { unfold sublist in Hn;cbn [Z.to_nat skipn] in Hn;rewrite firstn_length in Hn;cbn [length] in Hn;lia. }
   assert (H32:(n<32)%nat) by lia.
   unfold sublist;cbn [Z.to_nat skipn];rewrite nth_firstn by lia.
   pose proof (spmm_block_nth row vl column start nnz deltas input weights lo hi (Z.of_nat n) Hr ltac:(lia)) as E.
   unfold fp_at in E;rewrite Nat2Z.id in E;rewrite E.
   do 32 (destruct n as [|n];
    [cbn [nth Z.of_nat];match goal with Hlane: _ -> ?G |- ?G => apply Hlane;lia end|]);lia.
Qed.
Print Assumptions spmm_active32_block.
