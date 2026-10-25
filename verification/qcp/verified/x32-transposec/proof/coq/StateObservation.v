From X32Transpose Require Export TransposeObservation.
From Coq Require Import ZArith Classical_Prop.
Local Open Scope Z_scope.
Lemma xt_kernel_posts_written_and_frames:forall F G oldL oldR L R,
 xt_result F G oldL L->xt_result F G oldR R->
 (forall q,xt_written G q->L q=R q) /\
 (forall q,~xt_written G q->L q=oldL q /\ R q=oldR q).
Proof.
 intros F G oldL oldR L R HL HR;split.
 - eapply xt_result_written_equal;eassumption.
 - intros q Hq;split;apply xt_result_keeps_own_unwritten_initial with(F:=F)(G:=G);assumption.
Qed.
Lemma xt_kernel_posts_full_map:forall F G oldL oldR L R,
 xt_result F G oldL L->xt_result F G oldR R->
 (forall q,~xt_written G q->oldL q=oldR q)->forall q,L q=R q.
Proof.
 intros F G oldL oldR L R HL HR Hframes q.
 destruct(classic(xt_written G q))as[Hw|Hnot].
 - eapply xt_result_written_equal;eassumption.
 - destruct(xt_kernel_posts_written_and_frames F G oldL oldR L R HL HR)as[_ Hkeep].
   destruct(Hkeep q Hnot)as[-> ->];apply Hframes;exact Hnot.
Qed.
Print Assumptions xt_kernel_posts_written_and_frames.
Print Assumptions xt_kernel_posts_full_map.
