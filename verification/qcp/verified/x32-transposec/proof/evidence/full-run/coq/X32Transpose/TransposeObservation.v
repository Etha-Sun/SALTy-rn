From Coq Require Import ZArith Lia.
From X32Transpose Require Export Geometry.
Local Open Scope Z_scope.

(* These observation lemmas do not establish either actual C kernel. *)
Lemma xt_result_written_equal:forall F G oldL oldR L R,
 xt_result F G oldL L->xt_result F G oldR R->
 forall q,xt_written G q->L q=R q.
Proof.
 intros F G oldL oldR L R[HL _][HR _]q[r[c[Hr[Hc ->]]]].
 rewrite(HL r c Hr Hc),(HR r c Hr Hc);reflexivity.
Qed.
Lemma xt_low_column_store_last:forall(O:XTOutput)p high low,
 xt_output_put(xt_output_put O p high)p low p=Some low.
Proof. intros;apply xt_put_same. Qed.
Lemma xt_two_stores_frame:forall(O:XTOutput)p q high low x,
 x<>p->x<>q->xt_output_put(xt_output_put O p high)q low x=O x.
Proof. intros;unfold xt_output_put;rewrite!xt_put_other by congruence;reflexivity. Qed.
Lemma xt_result_keeps_own_unwritten_initial:forall F G old current q,
 xt_result F G old current->~xt_written G q->current q=old q.
Proof. intros F G old current q[_ Hframe]H;apply Hframe;exact H. Qed.
Print Assumptions xt_result_written_equal.
Print Assumptions xt_low_column_store_last.
Print Assumptions xt_two_stores_frame.
Print Assumptions xt_result_keeps_own_unwritten_initial.
