From Coq Require Import ZArith Lia List.
From DwChw Require Export Types.
Import ListNotations. Local Open Scope Z_scope.
Definition dw_mask7_values:list Z:=[-1;-1;-1;-1;0;0;0].
Definition dw_mask7_word(k i:Z):Z:=if Z.ltb(k+i)4 then 4294967295 else 0.
Lemma dw_mask7_word_from_signed:forall k i,0<=k<=3->0<=i<4->
 unsigned_last_nbits(Znth(k+i)dw_mask7_values 0)32=dw_mask7_word k i.
Proof.
 intros k i Hk Hi.
 assert(Hcases:k=0\/k=1\/k=2\/k=3)by lia.
 assert(Icases:i=0\/i=1\/i=2\/i=3)by lia.
 destruct Hcases as[H|[H|[H|H]]];subst k;
 destruct Icases as[J|[J|[J|J]]];subst i;reflexivity.
Qed.
Print Assumptions dw_mask7_word_from_signed.
