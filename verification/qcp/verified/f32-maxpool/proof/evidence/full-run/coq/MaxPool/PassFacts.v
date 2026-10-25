From Coq Require Import ZArith Lia FunctionalExtensionality.
From MaxPool Require Import KernelState KernelFacts WriteFacts.
Local Open Scope Z_scope.

Lemma mp_write_overwrite : forall old p count first second,
 0<=count ->
 mp_write (mp_write old p count first) p count second=mp_write old p count second.
Proof.
 intros old p count first second Hcount;apply functional_extensionality;intro q.
 pose proof(Z.div_mod(q-p)4 ltac:(lia))as Hdiv.
 destruct(Z.eq_dec((q-p)mod 4)0)as[Hz|Hz].
 - destruct(Z_lt_dec((q-p)/4)0)as[Hneg|Hpos];
   destruct(Z_lt_dec((q-p)/4)count)as[Hin|Hout].
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
   + replace q with(p+4*((q-p)/4))by lia.
     rewrite !mp_write_inside by lia;reflexivity.
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
 - assert(Houtside:forall j,0<=j<count->q<>p+4*j).
   { intros j Hj Heq;apply Hz;rewrite Heq.
     replace(p+4*j-p)with(j*4)by lia;apply Z.mod_mul;lia. }
   rewrite !mp_write_outside by assumption;reflexivity.
Qed.

Lemma mp_pass_partial_full : forall F PT old table offset output K channels group lo hi,
 0<=channels ->
 mp_pass_partial F PT old table offset output K channels group channels lo hi=
 mp_pass_complete F PT old table offset output K channels group lo hi.
Proof.
 intros;unfold mp_pass_partial.
 destruct(Z.eqb group 0);[reflexivity|].
 unfold mp_pass_complete;apply mp_write_overwrite;assumption.
Qed.

Lemma mp_pass_finished_pixel : forall F PT old table offset output K channels lo hi,
 mp_pass_complete F PT old table offset output K channels (mp_extra_groups K) lo hi=
 mp_finish_pixel F PT old table offset output K channels lo hi.
Proof. reflexivity. Qed.

Lemma mp_pixel_pass_step : forall F PT old table offset stride inc output outinc K channels pixel lo hi,
 0<=pixel ->
 mp_pass_complete F PT
  (mp_pixel_before F PT old table offset stride inc output outinc K channels pixel lo hi)
  (mp_table_at table inc pixel) (mp_offset_at offset stride pixel)
  (mp_output_at output outinc pixel) K channels (mp_extra_groups K) lo hi=
 mp_pixel_before F PT old table offset stride inc output outinc K channels (pixel+1) lo hi.
Proof.
 intros;unfold mp_pixel_before.
 replace(Z.to_nat(pixel+1))with(S(Z.to_nat pixel))
  by(rewrite Z2Nat.inj_add by lia;cbn;lia).
 cbn[mp_finish_pixels];rewrite Z2Nat.id by lia.
 apply mp_pass_finished_pixel.
Qed.

Print Assumptions mp_write_overwrite.
Print Assumptions mp_pass_partial_full.
Print Assumptions mp_pass_finished_pixel.
Print Assumptions mp_pixel_pass_step.
