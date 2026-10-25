From Coq Require Import ZArith List Lia.
Import ListNotations.
Local Open Scope Z_scope.

(** Pure packing arithmetic. These lemmas do not prove the upstream C packer
    or discharge the actual kernel's memory ownership obligations. *)
Fixpoint delta_sum (ds:list Z) : Z :=
 match ds with [] => 0 | d::rest => d + delta_sum rest end.
Fixpoint endpoint (previous:Z) (positions:list Z) : Z :=
 match positions with [] => previous | x::rest => endpoint x rest end.
Fixpoint gaps_from (previous:Z) (positions:list Z) : list Z :=
 match positions with [] => [] | x::rest => (x-previous)::gaps_from x rest end.
Definition cyclic_deltas (positions:list Z) : list Z :=
 match positions with
 | [] => []
 | first::rest => gaps_from first rest ++ [first-endpoint first rest]
 end.
Definition scale_deltas (stride:Z) (ds:list Z) := map (Z.mul stride) ds.
Fixpoint address_walk (address:Z) (ds:list Z) : Z :=
 match ds with [] => address | d::rest => address_walk (address+d) rest end.

Lemma delta_sum_app : forall xs ys,
 delta_sum (xs++ys) = delta_sum xs + delta_sum ys.
Proof. induction xs; intros; simpl; [lia|rewrite IHxs;lia]. Qed.
Lemma gaps_telescope : forall positions previous,
 delta_sum (gaps_from previous positions) = endpoint previous positions-previous.
Proof. induction positions; intros; simpl; [lia|rewrite IHpositions;lia]. Qed.
Lemma cyclic_deltas_sum_zero : forall positions,
 delta_sum (cyclic_deltas positions)=0.
Proof.
 intros [|first rest]; [reflexivity|].
 unfold cyclic_deltas; rewrite delta_sum_app,gaps_telescope; simpl;lia.
Qed.
Lemma scaled_sum : forall ds stride,
 delta_sum (scale_deltas stride ds)=stride*delta_sum ds.
Proof. induction ds;intros;unfold scale_deltas in *;simpl;[lia|rewrite IHds;ring]. Qed.
Lemma scaled_cycle_sum_zero : forall positions stride,
 delta_sum (scale_deltas stride (cyclic_deltas positions))=0.
Proof. intros;rewrite scaled_sum,cyclic_deltas_sum_zero;lia. Qed.
Lemma address_walk_sum : forall ds address,
 address_walk address ds=address+delta_sum ds.
Proof. induction ds;intros;simpl;[lia|rewrite IHds;lia]. Qed.
Theorem packed_stream_returns_to_start : forall positions stride address,
 address_walk address (scale_deltas stride (cyclic_deltas positions))=address.
Proof. intros;rewrite address_walk_sum,scaled_cycle_sum_zero;lia. Qed.

(** uint64 casts/addition are modular. Bounds concern the resulting address,
    so negative int32 increments remain permitted. *)
Definition modulus64 : Z := 18446744073709551616.
Definition word_step (address delta:Z) :=
 (address + delta mod modulus64) mod modulus64.
Fixpoint word_walk (address:Z) (ds:list Z) : Z :=
 match ds with [] => address | d::rest => word_walk (word_step address d) rest end.
Lemma modulus64_positive : 0 < modulus64.
Proof. unfold modulus64;lia. Qed.
Lemma word_step_mod : forall address delta,
 word_step address delta=(address+delta) mod modulus64.
Proof. intros;unfold word_step;apply Z.add_mod_idemp_r;unfold modulus64;lia. Qed.
Lemma word_step_within_capacity : forall address delta,
 0<=address+delta<modulus64 -> word_step address delta=address+delta.
Proof. intros;rewrite word_step_mod;now apply Z.mod_small. Qed.
Lemma word_walk_mod : forall ds address,
 0<=address<modulus64 ->
 word_walk address ds=(address+delta_sum ds) mod modulus64.
Proof.
 induction ds as[|d rest IH];intros address H;simpl.
 - rewrite Z.add_0_r;now rewrite Z.mod_small.
 - rewrite IH.
   + rewrite word_step_mod,Z.add_mod_idemp_l;[f_equal;lia|unfold modulus64;lia].
   + rewrite word_step_mod;apply Z.mod_pos_bound;exact modulus64_positive.
Qed.
Theorem packed_word_stream_returns_to_start : forall positions stride address,
 0<=address<modulus64 ->
 word_walk address (scale_deltas stride (cyclic_deltas positions))=address.
Proof.
 intros;rewrite word_walk_mod by assumption.
 rewrite scaled_cycle_sum_zero,Z.add_0_r;now apply Z.mod_small.
Qed.

Print Assumptions delta_sum_app.
Print Assumptions gaps_telescope.
Print Assumptions cyclic_deltas_sum_zero.
Print Assumptions scaled_sum.
Print Assumptions scaled_cycle_sum_zero.
Print Assumptions address_walk_sum.
Print Assumptions packed_stream_returns_to_start.
Print Assumptions word_step_mod.
Print Assumptions word_step_within_capacity.
Print Assumptions word_walk_mod.
Print Assumptions packed_word_stream_returns_to_start.
