From Coq Require Import ZArith List Lia.
From ExpMinusMax Require Export ProgramModel AccumulatorFacts.
Local Open Scope Z_scope.
Lemma em_write_nat_outside:forall n O p f q,
 (forall j,0<=j<Z.of_nat n->q<>p+4*j)->em_write_nat O p n f q=O q.
Proof.
 induction n;intros O p f q H;[reflexivity|].
 cbn[em_write_nat];unfold em_output_put;rewrite em_put_other by(pose proof(H(Z.of_nat n)ltac:(lia));congruence).
 apply IHn;intros;apply H;lia.
Qed.
Lemma em_write_nat_inside:forall n O p f j,0<=j<Z.of_nat n->em_write_nat O p n f(p+4*j)=Some(f j).
Proof.
 induction n;intros O p f j Hj;[lia|].
 cbn[em_write_nat];unfold em_output_put;destruct(Z.eq_dec j(Z.of_nat n))as[->|Hne].
 - apply em_put_same.
 - rewrite em_put_other by lia;apply IHn;lia.
Qed.
Lemma em_output_write_inside:forall O p n f j,0<=j<n->em_output_write O p n f(p+4*j)=Some(f j).
Proof. intros;unfold em_output_write;apply em_write_nat_inside;rewrite Z2Nat.id by lia;lia. Qed.
Lemma em_result_sum:forall F input maximum output sum n O,
 em_arm_result F input maximum output sum n O sum=Some(em_arm_sum n(em_input F input)(em_get F maximum))/\
 em_rvv_result F input maximum output sum n O sum=Some(em_rvv_sum n(em_input F input)(em_get F maximum)).
Proof. intros;split;apply em_put_same. Qed.
Lemma em_result_element:forall F input maximum output sum n O j,
 0<=j<n->output+4*j<>sum->
 em_arm_result F input maximum output sum n O(output+4*j)=Some(em_arm_value(em_input F input j)(em_get F maximum))/\
 em_rvv_result F input maximum output sum n O(output+4*j)=Some(em_rvv_value(em_input F input j)(em_get F maximum)).
Proof.
 intros;unfold em_arm_result,em_rvv_result,em_output_put;split;rewrite em_put_other by lia;apply em_output_write_inside;assumption.
Qed.
Lemma em_written_observation:forall F input maximum output sum n O1 O2 p,
 em_written output sum n p->exists a b,
 em_arm_result F input maximum output sum n O1 p=Some a/\
 em_rvv_result F input maximum output sum n O2 p=Some b/\em_observe a b.
Proof.
 intros F input maximum output sum n O1 O2 p[->|[j[Hj ->]]].
 - eexists;eexists;split;[apply em_put_same|split;[apply em_put_same|apply em_sum_observation]].
 - destruct(Z.eq_dec(output+4*j)sum)as[E|Hne].
   + rewrite E;eexists;eexists;split;[apply em_put_same|split;[apply em_put_same|apply em_sum_observation]].
   + destruct(em_result_element F input maximum output sum n O1 j Hj Hne)as[H1 _].
     destruct(em_result_element F input maximum output sum n O2 j Hj Hne)as[_ H2].
     eexists;eexists;split;[exact H1|split;[exact H2|apply em_value_observation]].
Qed.
Print Assumptions em_write_nat_inside.
Print Assumptions em_result_sum.
Print Assumptions em_result_element.
Print Assumptions em_written_observation.
