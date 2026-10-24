From Coq Require Import ZArith Lia Strings.String.
From FullDomainNeonVC Require Import neon_full_goal.
From FullNeonLoopProof Require Import Tail61Assoc.
From GemmNeon Require Import CopyFacts LayoutModel.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_7_2: test_neon_entail_wit_7_2.
Proof. unfold test_neon_entail_wit_7_2;left;intros.
assert(Hmask:Z.land nc 2=0)by assumption;rewrite Hmask.
unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t.
rewrite ?neon_local_field_address.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
apply _derivable1_andp_intros.
- unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
- repeat multimatch goal with |-context[FullState.full_cell ?a ?w ?k ?r ?col ?lo ?hi]=>normalize_index col end.
  repeat multimatch goal with |-context[FullState.output_state ?c ?mr ?nc ?k ?done ?a ?w ?lo ?hi]=>normalize_index done end.
  rewrite ?Z.add_0_r;sepcon_assoc_change;forget_fields_direct;
  LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_7_2.
