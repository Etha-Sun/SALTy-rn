From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import MemoryModel IntegerFacts VectorFacts.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rs_firstn_sum_step : forall A k,
 (k<length A)%nat ->
 rs_sum(firstn(S k)A)=rs_sum(firstn k A)+nth k A 0.
Proof.
 unfold rs_sum;induction A as[|a A IH];intros[|k]H;simpl in *;try lia.
 specialize(IH k ltac:(lia));lia.
Qed.
Lemma rs_prefix_step : forall A idx,
 0<=idx<Zlength A ->
 rs_prefix A(idx+1)=rs_prefix A idx+Znth idx A 0.
Proof.
 intros A idx Hi;unfold rs_prefix,Znth.
 assert(Hnat:Z.to_nat(idx+1)=S(Z.to_nat idx))by lia.
 rewrite Hnat;apply rs_firstn_sum_step;rewrite Zlength_correct in Hi;lia.
Qed.
Fixpoint rs_chunk(A:list Z)(idx:Z)(k:nat):Z :=
 match k with O=>0|S j=>rs_chunk A idx j+Znth(idx+Z.of_nat j)A 0 end.
Lemma rs_prefix_chunk : forall k A idx,
 0<=idx -> idx+Z.of_nat k<=Zlength A ->
 rs_prefix A(idx+Z.of_nat k)=rs_prefix A idx+rs_chunk A idx k.
Proof.
 induction k as[|k IH];intros A idx Hi Hlen.
 - cbn[rs_chunk];replace (idx+Z.of_nat 0)with idx by lia;lia.
 - rewrite Nat2Z.inj_succ in *;unfold Z.succ in *.
   replace (idx+(Z.of_nat k+1))with ((idx+Z.of_nat k)+1)by lia.
   rewrite rs_prefix_step by lia;rewrite IH by lia;cbn[rs_chunk];lia.
Qed.
Print Assumptions rs_firstn_sum_step.
Print Assumptions rs_prefix_step.
Print Assumptions rs_prefix_chunk.
