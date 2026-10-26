From Coq Require Import ZArith Lia.
From ExpMinusMax Require Export ProgramFacts.
Local Open Scope Z_scope.
Definition em_pair_result(F:EMMap)(p m q s n:Z)(O:EMOutput):EMOutput:=
 em_rvv_result F p m q s n(em_arm_result F p m q s n O).
Definition em_pair_observation(F:EMMap)(p m q s n:Z)(O:EMOutput):Prop:=
 forall address,
 (em_written q s n address->exists a b,
   em_arm_result F p m q s n O address=Some a /\
   em_pair_result F p m q s n O address=Some b /\em_observe a b) /\
 (~em_written q s n address->
   em_arm_result F p m q s n O address=O address /\
   em_pair_result F p m q s n O address=O address).
Lemma em_output_write_outside:forall O p n f address,
 0<=n->(forall j,0<=j<n->address<>p+4*j)->
 em_output_write O p n f address=O address.
Proof.
 intros;unfold em_output_write;apply em_write_nat_outside.
 rewrite Z2Nat.id by assumption;assumption.
Qed.
Lemma em_results_outside:forall F p m q s n O address,
 0<=n->~em_written q s n address->
 em_arm_result F p m q s n O address=O address /\
 em_rvv_result F p m q s n O address=O address.
Proof.
 intros F p m q s n O address Hn Hnot.
 assert(Hs:address<>s)by(intro E;apply Hnot;left;exact E).
 assert(Hq:forall j,0<=j<n->address<>q+4*j).
 { intros j Hj E;apply Hnot;right;exists j;auto. }
 unfold em_arm_result,em_rvv_result,em_output_put.
 split;rewrite em_put_other by congruence;apply em_output_write_outside;assumption.
Qed.
Theorem em_pair_observation_correct:forall F p m q s n O,
 0<=n->em_pair_observation F p m q s n O.
Proof.
 intros F p m q s n O Hn address;split.
 - unfold em_pair_result;apply em_written_observation.
 - intros Hnot.
   destruct(em_results_outside F p m q s n O address Hn Hnot)as[HA _].
   destruct(em_results_outside F p m q s n(em_arm_result F p m q s n O)address Hn Hnot)as[_ HR].
   split;[exact HA|unfold em_pair_result;rewrite HR;exact HA].
Qed.
Print Assumptions em_pair_observation_correct.
Print Assumptions em_results_outside.
