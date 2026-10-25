From Coq Require Import ZArith List Lia.
From X32Transpose Require Import ProgressFacts StrideModel.
Import ListNotations. Local Open Scope Z_scope.

(* The addresses and values here are the actual active lanes.  In particular,
   this proof neither gives meaning to inactive lanes nor replaces the RVV
   vector-length choice by a scalar reference schedule. *)
Lemma xt_done_row_prefix : forall F G O R k row p stride vl V n,
 xt_injective G -> 0 <= k -> k+vl <= xt_cols G ->
 0 <= row < xt_height G -> 0 <= vl -> Z.of_nat n <= vl ->
 (forall j,0<=j<vl -> xt_addr p stride j=xt_output_address G row(k+j)) ->
 (forall j,0<=j<vl -> Znth j V 0=xt_get F(xt_input_address G row(k+j))) ->
 xt_progress F G O R k vl row ->
 xt_done F G O
  (fold_left (fun state i => xt_output_put state (xt_addr p stride(Z.of_nat i))
    (Znth(Z.of_nat i)V 0)) (seq 0 n) R)
  (fun r c => xt_region k vl row r c \/ (r=row /\ k<=c<k+Z.of_nat n)).
Proof.
 intros F G O R k row p stride vl V n.
 induction n as [|n IH];intros Hi Hk Hend Hr Hvl Hn Ha Hv Hp.
 - cbn [seq fold_left]. unfold xt_progress in Hp.
   eapply xt_done_ext;[|exact Hp]. intros r c Hrc;cbn;unfold xt_region;lia.
 - rewrite seq_S,fold_left_app. cbn [fold_left].
   rewrite Ha,Hv by lia.
   eapply xt_done_ext.
   2: { eapply xt_done_put.
        - exact Hi.
        - split;[exact Hr|lia].
        - apply IH;assumption || lia. }
   intros r c Hrc. rewrite Nat2Z.inj_succ. unfold xt_region;lia.
Qed.

Lemma xt_progress_strided_row : forall F G O R k row p stride vl V,
 xt_injective G -> 0 <= k -> k+vl <= xt_cols G ->
 0 <= row < xt_height G -> 0 <= vl ->
 (forall j,0<=j<vl -> xt_addr p stride j=xt_output_address G row(k+j)) ->
 (forall j,0<=j<vl -> Znth j V 0=xt_get F(xt_input_address G row(k+j))) ->
 xt_progress F G O R k vl row ->
 xt_progress F G O (xt_strided_write R p stride vl V) k vl (row+1).
Proof.
 intros F G O R k row p stride vl V Hi Hk Hend Hr Hvl Ha Hv Hp.
 assert(Hn:Z.of_nat(Z.to_nat vl)<=vl)by(rewrite Z2Nat.id by lia;lia).
 pose proof(xt_done_row_prefix F G O R k row p stride vl V (Z.to_nat vl)
  Hi Hk Hend Hr Hvl Hn Ha Hv Hp)as Hdone.
 unfold xt_progress,xt_strided_write.
 eapply xt_done_ext;[|exact Hdone].
 intros r c Hrc. rewrite Z2Nat.id by lia. unfold xt_region;lia.
Qed.

Print Assumptions xt_done_row_prefix.
Print Assumptions xt_progress_strided_row.
