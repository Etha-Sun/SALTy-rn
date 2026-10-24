From Coq Require Import ZArith List Lia.
From Dwconv Require Export ProgramFacts ProgramTrace AddressFacts Observation StateObservation.
From Dwconv Require Export RebaseProgram OutputRangeFacts OutputReadModel.
From Dwconv Require Export WrittenReadModel.
From NanBridge Require Import BridgeLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Definition dw_observed_pair(O1 O2:DwOutput)(p q:Z):Prop:=
 exists x y,dw_initialized O1 p x /\ dw_initialized O2 q y /\ same_value x y.
Lemma dw_observed_pair_ready : forall O1 O2 p q,
 dw_observed_pair O1 O2 p q -> dw_output_ready O1 p /\ dw_output_ready O2 q.
Proof. intros O1 O2 p q [x[y[Hx[Hy Hxy]]]];split;[exists x|exists y];assumption. Qed.
Lemma dw_observed_pair_values : forall O1 O2 p q x y,
 dw_observed_pair O1 O2 p q -> dw_initialized O1 p x ->dw_initialized O2 q y ->same_value x y.
Proof.
 intros O1 O2 p q x y [a[b[Ha[Hb Hab]]]]Hx Hy.
 unfold dw_initialized in *;assert(x=a)by congruence;assert(y=b)by congruence;subst;exact Hab.
Qed.

Definition dw_output_domain(W:list Z)(D:DwProgram):Prop:=
 0<dw_channels D /\ 0<dw_width D /\
 forall pixel,0<=pixel<dw_width D ->
 dw_write_window W(dw_output_at D pixel)(dw_channels D).

Definition dw_pair_observed(D:DwProgram)(output:Z)(O1 O2:DwOutput):Prop:=
 forall pixel channel,0<=pixel<dw_width D -> 0<=channel<dw_channels D ->
 exists x y,
 dw_initialized O1(dw_output_at D pixel+4*channel)x /\
 dw_initialized O2(dw_output_at(dw_rebase D output)pixel+4*channel)y /\
 same_value x y.

Lemma dw_valid_output_domain : forall F P W D,
 dw_valid F P W D -> dw_output_domain W D.
Proof. unfold dw_valid,dw_output_domain;intros F P W D [HC[HP[HW H]]];split;[exact HC|];split;[exact HP|];intros pixel Hpixel;exact(proj2(proj2(H pixel Hpixel))). Qed.

Lemma dw_nat_sequence_index : forall n i,
 0<=n -> In i(seq 0(Z.to_nat n)) -> 0<=Z.of_nat i<n.
Proof.
 intros n i Hn Hin;apply in_seq in Hin;destruct Hin as[Hlow Hhigh].
 rewrite Nat.add_0_l in Hhigh;apply Nat2Z.inj_lt in Hhigh.
 rewrite Z2Nat.id in Hhigh by assumption;lia.
Qed.

Lemma dw_domain_address_owned : forall W D pixel channel,
 dw_output_domain W D -> 0<=pixel<dw_width D -> 0<=channel<dw_channels D ->
 In(dw_output_at D pixel+4*channel)W.
Proof. intros W D pixel channel [HC[HP H]]Hp Hi;exact(proj2(proj2(H pixel Hp))channel Hi). Qed.

Lemma dw_domain_address_positive : forall W D pixel channel,
 dw_output_domain W D -> 0<=pixel<dw_width D -> 0<=channel<dw_channels D ->
 0<dw_output_at D pixel+4*channel.
Proof. intros W D pixel channel [HC[HP H]]Hp Hi;pose proof(proj1(H pixel Hp));lia. Qed.

Lemma dw_pair_observed_at : forall D output O1 O2 pixel channel,
 dw_pair_observed D output O1 O2 ->
 0<=pixel<dw_width D -> 0<=channel<dw_channels D ->
 dw_observed_pair O1 O2 (dw_output_at D pixel+4*channel)
 (dw_output_at(dw_rebase D output)pixel+4*channel).
Proof. intros D output O1 O2 pixel channel H Hp Hi;exact(H pixel channel Hp Hi). Qed.

Lemma dw_domain_base_owned : forall W D,
 dw_output_domain W D -> In(dw_out D)W.
Proof.
 intros W D H;destruct H as[HC[HP H]].
 pose proof(proj2(proj2(H 0 ltac:(lia)))0 ltac:(lia))as Hin.
 cbn[dw_output_at Z.eqb]in Hin;rewrite Z.add_0_r in Hin;exact Hin.
Qed.

Lemma dw_domain_trace_safe : forall W D,
 dw_output_domain W D -> dw_owned_addresses_canonical W ->
 dw_trace_addresses_safe D(dw_width D).
Proof.
 intros W D Hdomain Hcanonical pixel channel Hp Hi.
 destruct Hdomain as[HC[HP Hwindows]].
 pose proof(dw_nat_sequence_index (dw_width D)pixel ltac:(lia)Hp)as Hpixel.
 pose proof(dw_nat_sequence_index (dw_channels D)channel ltac:(lia)Hi)as Hchannel.
 apply Hcanonical;exact(proj2(proj2(Hwindows _ Hpixel))_ Hchannel).
Qed.

Lemma dw_program_trace_contains : forall isa F P D pixel channel lo hi,
 0<=pixel<dw_width D -> 0<=channel<dw_channels D ->
 In(dw_output_at D pixel+4*channel)
 (map fst(dw_program_trace isa F P D(dw_width D)lo hi)).
Proof.
 intros isa F P D pixel channel lo hi Hp Hi.
 apply in_map_iff;exists(dw_output_at D pixel+4*channel,dw_value isa F P D pixel channel lo hi);split;[reflexivity|].
 unfold dw_program_trace;apply in_flat_map;exists(Z.to_nat pixel);split.
 - apply in_seq;split;lia.
 - unfold dw_pixel_trace;apply in_map_iff;exists(Z.to_nat channel);split.
   + rewrite !Z2Nat.id by lia;reflexivity.
   + apply in_seq;split;lia.
Qed.

Theorem dw_complete_outputs_observed : forall F P W1 W2 D output lo hi O1 O2,
 dw_valid F P W1 D -> dw_valid F P W2(dw_rebase D output) ->
 dw_owned_addresses_canonical W1 -> dw_owned_addresses_canonical W2 ->
 dw_pair_observed D output
 (dw_neon_result F P D lo hi O1)
 (dw_rvv_result F P(dw_rebase D output)lo hi O2).
Proof.
 intros F P W1 W2 D output lo hi O1 O2 Hv1 Hv2 Hcanonical1 Hcanonical2.
 pose proof(dw_valid_output_domain F P W1 D Hv1)as Hdomain1.
 pose proof(dw_valid_output_domain F P W2(dw_rebase D output)Hv2)as Hdomain2.
 pose proof(Hcanonical1 _ (dw_domain_base_owned W1 D Hdomain1))as Hout1.
 pose proof(Hcanonical2 _ (dw_domain_base_owned W2(dw_rebase D output)Hdomain2))as Hout2.
 unfold dw_pair_observed;intros pixel channel Hp Hi.
 pose proof(dw_program_trace_contains true F P D pixel channel lo hi Hp Hi)as Hwritten.
 pose proof(dw_domain_trace_safe W1 D Hdomain1 Hcanonical1)as Hsafe1.
 pose proof(dw_domain_trace_safe W2(dw_rebase D output)Hdomain2 Hcanonical2)as Hsafe2.
 destruct(dw_rebased_results_observe F P D output(dw_width D)lo hi O1 O2
 (dw_output_at D pixel+4*channel)Hout1 Hout2 Hsafe1 Hsafe2 Hwritten)
 as[x[y[Hx[Hy Hobserve]]]].
 assert(Haddress:dw_translate(output-dw_out D)(dw_output_at D pixel+4*channel)=
 dw_output_at(dw_rebase D output)pixel+4*channel).
 { apply dw_rebased_write_address;try assumption.
   - apply Hcanonical1;exact(dw_domain_address_owned W1 D pixel channel Hdomain1 Hp Hi).
   - apply Hcanonical2;exact(dw_domain_address_owned W2(dw_rebase D output)pixel channel Hdomain2 Hp Hi). }
 rewrite Haddress in Hy;exists x,y;unfold dw_initialized,dw_neon_result,dw_rvv_result.
 split;[exact Hx|];split;[exact Hy|exact Hobserve].
Qed.
Print Assumptions dw_domain_trace_safe.
Print Assumptions dw_program_trace_contains.
Print Assumptions dw_complete_outputs_observed.
