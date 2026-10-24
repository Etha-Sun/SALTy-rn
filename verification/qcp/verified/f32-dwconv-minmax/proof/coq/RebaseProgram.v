From Coq Require Import ZArith List Lia.
From Dwconv Require Import ProgramFacts ProgramTrace AddressFacts Observation StateObservation.
Import ListNotations.
Local Open Scope Z_scope.

Definition dw_rebase (D:DwProgram) (output:Z) : DwProgram :=
 dw_program (dw_channels D) (dw_width D) (dw_input D) (dw_weights D)
 output (dw_input_stride D) (dw_out_increment D) (dw_offset D)
 (dw_pixel_stride D) (dw_zero_ptr D).

Lemma dw_value_rebase : forall isa F P D output pixel channel lo hi,
 dw_value isa F P (dw_rebase D output) pixel channel lo hi=
 dw_value isa F P D pixel channel lo hi.
Proof. reflexivity. Qed.

Lemma dw_output_at_canonical : forall D pixel,
 0<=dw_out D<dw_addr_modulus ->
 dw_output_at D pixel=
 dw_addr_word(dw_out D+pixel*(4*dw_channels D+dw_out_increment D)).
Proof.
 intros D pixel Hout;unfold dw_output_at.
 destruct(Z.eqb_spec pixel 0)as[->|H].
 - replace(dw_out D+0*(4*dw_channels D+dw_out_increment D))with(dw_out D)by ring.
   symmetry;apply dw_addr_word_small;exact Hout.
 - reflexivity.
Qed.

Lemma dw_rebased_write_address : forall D output pixel channel,
 0<=dw_out D<dw_addr_modulus -> 0<=output<dw_addr_modulus ->
 0<=dw_output_at D pixel+4*channel<dw_addr_modulus ->
 0<=dw_output_at (dw_rebase D output) pixel+4*channel<dw_addr_modulus ->
 dw_translate(output-dw_out D)(dw_output_at D pixel+4*channel)=
 dw_output_at (dw_rebase D output) pixel+4*channel.
Proof.
 intros D output pixel channel Hout Houtput Ha Hb.
 rewrite(dw_output_at_canonical D pixel Hout)in Ha|-*.
 assert(Hrebase:0<=dw_out(dw_rebase D output)<dw_addr_modulus)by exact Houtput.
 rewrite(dw_output_at_canonical (dw_rebase D output) pixel Hrebase)in Hb|-*.
 cbn[dw_rebase]in Hb|-*.
 apply dw_translate_write_address;assumption.
Qed.

Lemma dw_related_map : forall A T (f g:A->Z*fp32) xs,
 (forall x,In x xs -> dw_trace_item_related T (f x) (g x)) ->
 dw_trace_related T (map f xs) (map g xs).
Proof.
 intros A T f g xs;induction xs as[|x xs IH];intro H;constructor.
 - apply H;left;reflexivity.
 - apply IH;intros y Hy;apply H;right;exact Hy.
Qed.

Lemma dw_related_flat_map : forall A T (f g:A->list(Z*fp32)) xs,
 (forall x,In x xs -> dw_trace_related T (f x) (g x)) ->
 dw_trace_related T (flat_map f xs) (flat_map g xs).
Proof.
 intros A T f g xs;induction xs as[|x xs IH];intro H;[constructor|].
 cbn[flat_map];apply dw_trace_related_app.
 - apply H;left;reflexivity.
 - apply IH;intros y Hy;apply H;right;exact Hy.
Qed.

(* These range hypotheses are properties of the owned physical output cells,
   to be derived by the public caller's memory proof, not extra kernel domain
   restrictions. They include wrapping schedules and repeated output pixels. *)
Definition dw_trace_addresses_safe (D:DwProgram) (count:Z) : Prop :=
 forall pixel channel,
 In pixel (seq 0(Z.to_nat count)) ->
 In channel (seq 0(Z.to_nat(dw_channels D))) ->
 0<=dw_output_at D (Z.of_nat pixel)+4*Z.of_nat channel<dw_addr_modulus.

Lemma dw_program_trace_rebase_related : forall F P D output count lo hi,
 0<=dw_out D<dw_addr_modulus -> 0<=output<dw_addr_modulus ->
 dw_trace_addresses_safe D count ->
 dw_trace_addresses_safe (dw_rebase D output) count ->
 dw_trace_related (dw_translate(output-dw_out D))
 (dw_program_trace true F P D count lo hi)
 (dw_program_trace false F P (dw_rebase D output) count lo hi).
Proof.
 intros F P D output count lo hi Hout Houtput Hsafe1 Hsafe2.
 unfold dw_program_trace;cbn[dw_rebase].
 apply dw_related_flat_map;intros pixel Hpixel.
 unfold dw_pixel_trace;apply dw_related_map;intros channel Hchannel.
 split;cbn[fst snd].
 - symmetry;apply dw_rebased_write_address;try assumption.
   + apply Hsafe1;assumption.
   + apply Hsafe2;assumption.
 - rewrite dw_value_rebase;unfold dw_value;apply dw_lane_related.
Qed.

Theorem dw_rebased_results_observe : forall F P D output count lo hi O1 O2 p,
 0<=dw_out D<dw_addr_modulus -> 0<=output<dw_addr_modulus ->
 dw_trace_addresses_safe D count ->
 dw_trace_addresses_safe (dw_rebase D output) count ->
 In p(map fst(dw_program_trace true F P D count lo hi)) ->
 exists a b,dw_full_state true F P D count lo hi O1 p=Some a /\
 dw_full_state false F P (dw_rebase D output) count lo hi O2
    (dw_translate(output-dw_out D)p)=Some b /\ dw_observe a b.
Proof.
 intros F P D output count lo hi O1 O2 p Hout Houtput Hsafe1 Hsafe2 Hp.
 pose proof(dw_written_slots_observe (dw_translate(output-dw_out D))
 (dw_translate_injective(output-dw_out D))
 (dw_program_trace true F P D count lo hi)
 (dw_program_trace false F P (dw_rebase D output) count lo hi) O1 O2
 (dw_program_trace_rebase_related F P D output count lo hi Hout Houtput Hsafe1 Hsafe2)
 p Hp)as H.
 rewrite !dw_program_trace_state in H;exact H.
Qed.
Print Assumptions dw_rebased_write_address.
Print Assumptions dw_program_trace_rebase_related.
Print Assumptions dw_rebased_results_observe.
