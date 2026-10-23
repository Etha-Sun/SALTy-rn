From Coq Require Import ZArith Lia List.
Import ListNotations.
Local Open Scope Z_scope.
(* Pure sequencing bridge only. The source audit binds the original comma list
   and compatibility statements to these actions. This is not an original-C
   kernel theorem and does not replace the modified actual-C QCP gate. *)
Record cvt_step_state (Memory:Type) := {
 step_batch:Z;step_input:Z;step_output:Z;step_memory:Memory
}.
Arguments step_batch {Memory} _.
Arguments step_input {Memory} _.
Arguments step_output {Memory} _.
Arguments step_memory {Memory} _.
Inductive cvt_step_action := BatchSub | InputAdd | OutputAddFloat.
Definition cvt_one_action {M} (vl:Z)(a:cvt_step_action)(s:cvt_step_state M) :=
 match a with
 | BatchSub => {|step_batch:=step_batch s-vl;step_input:=step_input s;step_output:=step_output s;step_memory:=step_memory s|}
 | InputAdd => {|step_batch:=step_batch s;step_input:=step_input s+vl;step_output:=step_output s;step_memory:=step_memory s|}
 | OutputAddFloat => {|step_batch:=step_batch s;step_input:=step_input s;step_output:=step_output s+4*vl;step_memory:=step_memory s|}
 end.
Definition cvt_comma_step {M}(vl:Z)(s:cvt_step_state M) :=
 fold_left (fun state action=>cvt_one_action vl action state)
 [BatchSub;InputAdd;OutputAddFloat] s.
Definition cvt_statement_step {M}(vl:Z)(s:cvt_step_state M) :=
 let s1:=cvt_one_action vl BatchSub s in
 let s2:=cvt_one_action vl InputAdd s1 in
 cvt_one_action vl OutputAddFloat s2.
Lemma cvt_for_step_equiv : forall M vl(s:cvt_step_state M),
 cvt_comma_step vl s=cvt_statement_step vl s.
Proof. reflexivity. Qed.
Lemma cvt_for_step_bounds : forall M vl(s:cvt_step_state M),
 0<=vl<=step_batch s ->step_batch s<=18446744073709551615 ->
 0<=step_input s ->step_input s+vl<=18446744073709551615 ->
 0<=step_output s ->step_output s+4*vl<=18446744073709551615 ->
 let t:=cvt_statement_step vl s in
 0<=step_batch t<=18446744073709551615 /\
 0<=step_input t<=18446744073709551615 /\
 0<=step_output t<=18446744073709551615 /\ step_memory t=step_memory s.
Proof. intros M vl [batch input output memory] Hvl Hmax Hip Hin Hop Hon.
 change(0<=vl<=batch)in Hvl;change(batch<=18446744073709551615)in Hmax;change(0<=input)in Hip;change(input+vl<=18446744073709551615)in Hin;change(0<=output)in Hop;change(output+4*vl<=18446744073709551615)in Hon.
 change(0<=batch-vl<=18446744073709551615 /\ 0<=input+vl<=18446744073709551615 /\ 0<=output+4*vl<=18446744073709551615 /\ memory=memory).
 repeat split;try reflexivity;lia. Qed.
Print Assumptions cvt_for_step_equiv.
Print Assumptions cvt_for_step_bounds.
