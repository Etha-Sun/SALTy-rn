From Coq Require Import ZArith Lia Ring.
From ExpMinusMax Require Export KernelModel.
Local Open Scope Z_scope.
Lemma em_valid_maximum:forall F W P M Q S N,
 em_valid F W P M Q S N -> em_present F M.
Proof. unfold em_valid;tauto. Qed.
Lemma em_window_shift:forall F p n k r,
 em_window F p n ->0<=k->0<=r->k+r<=n->em_window F(p+4*k)r.
Proof.
 unfold em_window;intros F p n k r[Hp[Hn H]]Hk Hr Hkr.
 repeat split;try lia;intros j Hj.
 replace(p+4*k+4*j)with(p+4*(k+j))by ring;apply H;lia.
Qed.
Lemma em_write_window_shift:forall W p n k r,
 em_write_window W p n ->0<=k->0<=r->k+r<=n->em_write_window W(p+4*k)r.
Proof.
 unfold em_write_window;intros W p n k r[Hp[Hn H]]Hk Hr Hkr.
 repeat split;try lia;intros j Hj.
 replace(p+4*k+4*j)with(p+4*(k+j))by ring;apply H;lia.
Qed.
Lemma em_valid_bulk_read:forall F W P M Q S N G,
 em_valid F W P M Q S N ->0<=G->4*G+4<=N+3->em_window F(P+16*G)4.
Proof.
 intros F W P M Q S N G H HG HB;unfold em_valid in H.
 destruct H as[_[_[HR _]]];replace(P+16*G)with(P+4*(4*G))by ring.
 eapply em_window_shift;try eassumption;lia.
Qed.
Lemma em_valid_bulk_write:forall F W P M Q S N G,
 em_valid F W P M Q S N ->0<=G->4*G+4<=N->em_write_window W(Q+16*G)4.
Proof.
 intros F W P M Q S N G H HG HB;unfold em_valid in H.
 destruct H as[_[_[_[_[_[HW _]]]]]];replace(Q+16*G)with(Q+4*(4*G))by ring.
 eapply em_write_window_shift;try eassumption;lia.
Qed.
Print Assumptions em_valid_maximum.
Print Assumptions em_window_shift.
Print Assumptions em_write_window_shift.
Print Assumptions em_valid_bulk_read.
Print Assumptions em_valid_bulk_write.
