From Coq Require Import ZArith Lia Ring.
From ExpMinusMax Require Export RvvExpressionFacts RvvMemoryDomain KernelFootprintFacts.
Local Open Scope Z_scope.
Lemma em_rvv_tail_domains:forall F W P M Q S N,
 em_valid F W P M Q S N->0<=Z.rem N 4->
 em_rvv_readable F(P+16*Z.quot N 4)(Z.rem N 4) /\
 em_rvv_writable W(Q+16*Z.quot N 4)(Z.rem N 4).
Proof.
 intros F W P M Q S N H Hr.
 assert(HN:0<N)by(unfold em_valid in H;tauto).
 assert(Hq:0<=Z.quot N 4)by(apply Z.quot_pos;lia).
 pose proof(Z.quot_rem N 4 ltac:(lia))as HD.
 destruct H as[_[_[HR[_[_[HW _]]]]]].
 split;right.
 - replace(P+16*Z.quot N 4)with(P+4*(4*Z.quot N 4))by ring.
   eapply em_window_shift;try eassumption;lia.
 - replace(Q+16*Z.quot N 4)with(Q+4*(4*Z.quot N 4))by ring.
   eapply em_write_window_shift;try eassumption;lia.
Qed.
Print Assumptions em_rvv_tail_domains.
