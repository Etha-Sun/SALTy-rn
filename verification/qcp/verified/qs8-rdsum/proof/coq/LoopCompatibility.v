From Coq Require Import ZArith.
(* A normal body transition includes the complete machine state.  The source
   ledger separately checks that the adapted body is byte-identical and has no
   break, continue, return or goto.  This theorem adds no C execution premise. *)
Section NormalLoop.
Context {S:Type} (guard:S->Prop) (body:S->S->Prop).
Inductive rd_while : S->S->Prop :=
| rd_while_stop : forall s,~guard s -> rd_while s s
| rd_while_next : forall s m t,guard s -> body s m -> rd_while m t -> rd_while s t.
Inductive rd_do_while : S->S->Prop :=
| rd_do_stop : forall s t,body s t -> ~guard t -> rd_do_while s t
| rd_do_next : forall s m t,body s m -> guard m -> rd_do_while m t -> rd_do_while s t.
Lemma rd_while_to_do : forall s t,rd_while s t -> guard s -> rd_do_while s t.
Proof.
 intros s t H;induction H as[s Hnot|s m t Hs HB HW IH];intro HG.
 - contradiction.
 - destruct HW as[m Hnot|m m2 t Hm HB2 HW2].
   + apply rd_do_stop;assumption.
   + eapply rd_do_next;[exact HB|exact Hm|apply IH;exact Hm].
Qed.
Lemma rd_do_to_while : forall s t,rd_do_while s t -> guard s -> rd_while s t.
Proof.
 intros s t H;induction H as[s t HB Hnot|s m t HB Hm HD IH];intro Hs.
 - eapply rd_while_next;[exact Hs|exact HB|apply rd_while_stop;exact Hnot].
 - eapply rd_while_next;[exact Hs|exact HB|apply IH;exact Hm].
Qed.
Theorem rd_guarded_do_while_equiv : forall s t,guard s ->
 (rd_do_while s t <-> rd_while s t).
Proof. intros;split;intro;[apply rd_do_to_while|apply rd_while_to_do];assumption. Qed.
End NormalLoop.
Print Assumptions rd_guarded_do_while_equiv.
