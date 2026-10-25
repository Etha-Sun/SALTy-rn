From X32Transpose Require Export ProgressModel.
From Coq Require Import ZArith List Lia.
Local Open Scope Z_scope.
Lemma xt_valid_injective:forall F W G,
 xt_valid F W G->0<xt_height G->xt_injective G.
Proof.
 intros F W G [He [Hf Hs]] Hh r c s d [Hr Hc] [Hsrow Hd] Eq.
 specialize(Hs Hh). unfold xt_storage in Hs.
 destruct Hs as [_ [_ [_ [_ [_ [_ [_ [_ [Hstride _]]]]]]]]].
 eapply xt_output_address_injective;eauto.
Qed.
Lemma xt_done_initial:forall F G O,xt_done F G O O(fun _ _=>False).
Proof. intros;split;intros;[contradiction|reflexivity]. Qed.
Lemma xt_done_ext:forall F G O R P Q,
 (forall r c,xt_matrix G r c->(P r c<->Q r c))->
 xt_done F G O R P->xt_done F G O R Q.
Proof.
 intros F G O R P Q He [Hv Hf];split.
 - intros r c Hrc Hq;apply Hv;[exact Hrc|apply(He r c Hrc);exact Hq].
 - intros q Hq;apply Hf;intros r c Hrc Hp;apply Hq;[exact Hrc|apply(He r c Hrc);exact Hp].
Qed.
Lemma xt_done_put:forall F G O R P r c,
 xt_injective G->xt_matrix G r c->xt_done F G O R P->
 xt_done F G O(xt_output_put R(xt_output_address G r c)(xt_get F(xt_input_address G r c)))
 (fun s d=>P s d \/ (s=r /\ d=c)).
Proof.
 intros F G O R P r c Hinj Hrc [Hv Hf];split.
 - intros s d Hsd [Hp|[-> ->]].
   + unfold xt_output_put,xt_put;destruct(Z.eqb_spec(xt_output_address G s d)(xt_output_address G r c))as[Eq|Ne].
     * destruct(Hinj s d r c Hsd Hrc Eq)as[-> ->];reflexivity.
     * apply Hv;assumption.
   + apply xt_put_same.
 - intros q Hq;unfold xt_output_put;rewrite xt_put_other.
   + apply Hf;intros s d Hsd Hp;apply Hq;[exact Hsd|left;exact Hp].
   + intro Eq;apply(Hq r c Hrc(or_intror(conj eq_refl eq_refl)));symmetry;exact Eq.
Qed.
Lemma xt_progress_initial:forall F G O,xt_progress F G O O 0 0 0.
Proof.
 intros;unfold xt_progress;eapply xt_done_ext;[|apply xt_done_initial].
 intros r c [[Hr1 Hr2][Hc1 Hc2]];unfold xt_region;lia.
Qed.
Lemma xt_progress_row_entry:forall F G O R k b,
 xt_progress F G O R k 0 0->xt_progress F G O R k b 0.
Proof.
 intros;unfold xt_progress in *;eapply xt_done_ext;[|exact H].
 intros r c [[Hr1 Hr2] Hc];unfold xt_region;lia.
Qed.
Lemma xt_progress_row_exit:forall F G O R k b,
 0<=b->xt_progress F G O R k b(xt_height G)->xt_progress F G O R(k+b)0 0.
Proof.
 intros F G O R k b Hb H;unfold xt_progress in *;eapply xt_done_ext;[|exact H].
 intros r c [[Hr1 Hr2] Hc];unfold xt_region;lia.
Qed.
Lemma xt_progress_finish:forall F G O R k,
 xt_cols G<=k->xt_progress F G O R k 0 0->xt_result F G O R.
Proof.
 intros F G O R k Hk [Hv Hf];split.
 - intros r c Hr Hc;apply Hv;[split;assumption|unfold xt_region;left;lia].
 - intros q Hq;apply Hf;intros r c [Hr Hc] Hp Eq;apply Hq.
   exists r,c;repeat split;try tauto;assumption.
Qed.
Lemma xt_progress_single_step:forall F G O R k row,
 xt_injective G->0<=k<xt_cols G->0<=row<xt_height G->
 xt_progress F G O R k 1 row->
 xt_progress F G O(xt_output_put R(xt_output_address G row k)(xt_get F(xt_input_address G row k)))k 1(row+1).
Proof.
 intros F G O R k row Hi Hk Hr H;unfold xt_progress in *.
 eapply xt_done_ext;[|eapply xt_done_put;[exact Hi|split;eassumption|exact H]].
 intros r c [[Hr1 Hr2][Hc1 Hc2]];unfold xt_region;lia.
Qed.
Print Assumptions xt_valid_injective.
Print Assumptions xt_done_initial.
Print Assumptions xt_done_ext.
Print Assumptions xt_done_put.
Print Assumptions xt_progress_initial.
Print Assumptions xt_progress_row_entry.
Print Assumptions xt_progress_row_exit.
Print Assumptions xt_progress_finish.
Print Assumptions xt_progress_single_step.
