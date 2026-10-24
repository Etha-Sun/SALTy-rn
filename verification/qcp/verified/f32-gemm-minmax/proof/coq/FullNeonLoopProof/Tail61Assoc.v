From Coq Require Import ZArith Lia Strings.String.
Local Open Scope string_scope.
From FullDomainNeonVC Require Import neon_full_goal.
From GemmNeon Require Import CopyFacts LayoutModel.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Inductive normalized_index : Z -> Prop := normalized_index_done : forall i, normalized_index i.
Ltac normalize_index i :=
 tryif (match goal with _:normalized_index i|-_=>idtac end) then fail 0 else
 let H:=fresh "Hnormalized" in assert(H:normalized_index i) by constructor; ring_simplify i.
Ltac forget_cell_direct p v :=
 match goal with |- ?P |-- ?Q =>
 eapply (derivable1_trans P (undef_store_float p ** _) Q);
 [eapply (derivable1_trans P (store_float p v ** _) (undef_store_float p ** _));
  [LeaderAutomation.FastFrame.pull_cell (store_float p v)
  |apply derivable1_sepcon_mono;[apply store_float_undef_store_float|apply derivable1_refl]]
 |idtac]
 end.
Ltac forget_fields_direct :=
 repeat match goal with |- ?P |-- ?Q =>
 multimatch Q with context[undef_store_float ?p] =>
 multimatch P with context[store_float p ?v] =>forget_cell_direct p v end end end.
Ltac report_missing_rec P l :=
 lazymatch l with
 | nil=>idtac
 | cons(norm_asrt ?q)?tail=>
   tryif (multimatch P with context[q]=>idtac end)then report_missing_rec P tail
   else (idtac "MISSING_RHS_LEAF" q;report_missing_rec P tail)
 end.
Ltac report_missing := match goal with |-?P|--?Q=>let leaves:=All_listasrts Q in report_missing_rec P leaves end.
Ltac show_float_leaves l :=
 lazymatch l with
 | nil=>idtac
 | cons(norm_asrt ?q)?tail=>
   lazymatch q with
   | store_float ?p ?v=>idtac "FLOAT_ADDRESS" p
   | undef_store_float ?p=>idtac "UNDEF_ADDRESS" p
   | _=>idtac
   end;show_float_leaves tail
 end.
Ltac show_float_left :=match goal with |-?P|--_=>let l:=All_listasrts P in show_float_leaves l end.
Lemma tail_mask4 : forall n, 0<n<8 -> Z.land n 4<>0 -> Z.land n 4=4.
Proof. intros;assert(n=1\/n=2\/n=3\/n=4\/n=5\/n=6\/n=7)by lia;repeat destruct H1 as[H1|H1];subst n;cbn in *;lia. Qed.
Lemma tail_mask2 : forall n, 0<n<8 -> Z.land n 2<>0 -> Z.land n 2=2.
Proof. intros;assert(n=1\/n=2\/n=3\/n=4\/n=5\/n=6\/n=7)by lia;repeat destruct H1 as[H1|H1];subst n;cbn in *;lia. Qed.
Lemma tail_mask1_sum : forall n, 0<n<8 -> Z.land n 1<>0 -> Z.land n 4+Z.land n 2+1=n.
Proof. intros;assert(n=1\/n=2\/n=3\/n=4\/n=5\/n=6\/n=7)by lia;repeat destruct H1 as[H1|H1];subst n;cbn in *;lia. Qed.
Lemma tail_mask0_sum : forall n, 0<n<8 -> Z.land n 1=0 -> Z.land n 4+Z.land n 2=n.
Proof. intros;assert(n=1\/n=2\/n=3\/n=4\/n=5\/n=6\/n=7)by lia;repeat destruct H1 as[H1|H1];subst n;cbn in *;lia. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Proof.
 unfold test_neon_entail_wit_6_1;left;intros.
 assert(Hmask:Z.land nc 4=4)by(apply tail_mask4;lia);rewrite Hmask.
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t.
 rewrite ?neon_local_field_address.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
 - Time (repeat multimatch goal with |-context[FullState.full_cell ?a ?w ?k ?r ?col ?lo ?hi] => normalize_index col end).
   Time (repeat multimatch goal with |-context[FullState.output_state ?c ?mr ?nc ?k ?done ?a ?w ?lo ?hi] => normalize_index done end).
   Time sepcon_assoc_change.
   Time forget_fields_direct.
   show_float_left.
   Time LeaderAutomation.FastFrame.opaque_leaves.
   Time sepcon_assoc_change.
   report_missing.
   Time LeaderAutomation.FastFrame.fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_6_1.
