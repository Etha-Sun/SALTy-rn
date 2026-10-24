From Coq Require Import ZArith List Lia.
From Qs8Rdsum Require Export RvvModel ListFacts.
Local Open Scope Z_scope.
Definition rd_probe_values(M:RDMap)(base n stride zero:Z)(Init:list Z):list Z :=
 map(fun j=>rs_s32(Znth(Z.of_nat j)Init 0+rd_get M(base+Z.of_nat j)+rd_get M(base+stride+Z.of_nat j)+rd_get M zero))(seq 0(Z.to_nat n)).
Definition rd_probe_partial(M:RDMap)(base n stride zero k:Z)(Init:list Z):list Z := rd_mix Init(rd_probe_values M base n stride zero Init)k.
Lemma rd_probe_values_length : forall M base n stride zero Init,0<=n ->Zlength(rd_probe_values M base n stride zero Init)=n.
Proof. intros;unfold rd_probe_values;rewrite Zlength_correct,length_map,length_seq,Z2Nat.id by lia;reflexivity. Qed.
Print Assumptions rd_probe_values_length.
