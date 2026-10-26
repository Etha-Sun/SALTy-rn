From Coq Require Import ZArith Lia Reals QArith Ring.
From ExpMinusMax Require Export KernelFootprintFacts ZeroLiteral.
Local Open Scope Z_scope.
Lemma em_zero_Q_literal:forall d:positive,
 fp32_of_real(Q2R{|Qnum:=0;Qden:=d|})=fp32_zero.
Proof. intros;unfold Q2R;cbn[Qnum Qden];rewrite Rmult_0_l;apply em_zero_literal. Qed.
Lemma em_four_decomposition:forall n,n=4*(Z.quot n 4)+n%4.
Proof. intros;apply Z.quot_rem;lia. Qed.
Lemma em_tail_two_bit:forall r,0<=r<4->Z.land(4*r)8<>0->2<=r.
Proof.
 intros r Hr Hb;assert(H:r=0\/r=1\/r=2\/r=3)by lia.
 destruct H as [ Heq | [ Heq | [ Heq | Heq ] ] ]; subst r;try lia;exfalso;apply Hb;reflexivity.
Qed.
Lemma em_tail_one_bit:forall r,0<=r<4->Z.land(4*r)4<>0->1<=r.
Proof.
 intros r Hr Hb;assert(H:r=0\/r=1\/r=2\/r=3)by lia.
 destruct H as [ Heq | [ Heq | [ Heq | Heq ] ] ]; subst r;try lia;exfalso;apply Hb;reflexivity.
Qed.
Lemma em_tail_both_bits:forall r,0<=r<4->Z.land(4*r)8<>0->Z.land(4*r)4<>0->r=3.
Proof.
 intros r Hr H2 H1;assert(H:r=0\/r=1\/r=2\/r=3)by lia.
 destruct H as [ Heq | [ Heq | [ Heq | Heq ] ] ]; subst r;try lia;exfalso;first[apply H2;reflexivity|apply H1;reflexivity].
Qed.
Lemma em_valid_tail_read:forall F W P M Q S N,
 em_valid F W P M Q S N->0<N%4->em_window F(P+16*(Z.quot N 4))4.
Proof.
 intros;pose proof(em_four_decomposition N).
 assert(HN:0<N)by(unfold em_valid in H;tauto).
 eapply em_valid_bulk_read;try eassumption;[first[apply Z.div_pos;lia|apply Z.quot_pos;lia]|lia].
Qed.
Lemma em_valid_tail_two_write:forall F W P M Q S N,
 em_valid F W P M Q S N->2<=N%4->em_write_window W(Q+16*(Z.quot N 4))2.
Proof.
 intros F W P M Q S N H Hr;pose proof(em_four_decomposition N).
 assert(HN:0<N)by(unfold em_valid in H;tauto).
 destruct H as[_[_[_[_[_[HW _]]]]]].
 replace(Q+16*(Z.quot N 4))with(Q+4*(4*(Z.quot N 4)))by ring.
 eapply em_write_window_shift;try eassumption;try lia.
 apply Z.mul_nonneg_nonneg;[lia|first[apply Z.div_pos;lia|apply Z.quot_pos;lia]].
Qed.
Lemma em_valid_tail_one_write:forall F W P M Q S N,
 em_valid F W P M Q S N->1<=N%4->em_write_window W(Q+16*(Z.quot N 4))1.
Proof.
 intros F W P M Q S N H Hr;pose proof(em_four_decomposition N).
 assert(HN:0<N)by(unfold em_valid in H;tauto).
 destruct H as[_[_[_[_[_[HW _]]]]]].
 replace(Q+16*(Z.quot N 4))with(Q+4*(4*(Z.quot N 4)))by ring.
 eapply em_write_window_shift;try eassumption;try lia.
 apply Z.mul_nonneg_nonneg;[lia|first[apply Z.div_pos;lia|apply Z.quot_pos;lia]].
Qed.
Lemma em_valid_tail_third_write:forall F W P M Q S N,
 em_valid F W P M Q S N->N%4=3->em_write_window W(Q+16*(Z.quot N 4)+8)1.
Proof.
 intros F W P M Q S N H Hr;pose proof(em_four_decomposition N).
 assert(HN:0<N)by(unfold em_valid in H;tauto).
 destruct H as[_[_[_[_[_[HW _]]]]]].
 replace(Q+16*(Z.quot N 4)+8)with(Q+4*(4*(Z.quot N 4)+2))by ring.
 eapply em_write_window_shift;try eassumption;try lia.
Qed.
Print Assumptions em_zero_Q_literal.
Print Assumptions em_tail_two_bit.
Print Assumptions em_tail_one_bit.
Print Assumptions em_tail_both_bits.
Print Assumptions em_valid_tail_read.
Print Assumptions em_valid_tail_two_write.
Print Assumptions em_valid_tail_one_write.
Print Assumptions em_valid_tail_third_write.
