From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export Types.
Local Open Scope Z_scope.
Lemma rd_map_seq_nth : forall(f:nat->Z)start count i d,(i<count)%nat ->nth i(map f(seq start count))d=f(start+i)%nat.
Proof.
 intros f start count i d Hi;rewrite(@List.nth_indep Z(map f(seq start count))i d(f 0%nat))by(rewrite length_map,length_seq;assumption);rewrite(@List.map_nth nat Z f(seq start count)0%nat i);rewrite seq_nth by assumption;reflexivity.
Qed.
Print Assumptions rd_map_seq_nth.
