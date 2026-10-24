From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullModel.
From FullNeonLoopProof Require Import LoopFacts.
From GemmNeon Require Import KernelModel CopyFacts.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma scaled_offset4 : forall base t,Z.quot(base+t*4-base)4=t.
Proof. intros;replace(base+t*4-base)with(t*4)by ring;rewrite Z.quot_mul by lia;reflexivity. Qed.
Lemma scaled_offset4_add : forall base t off,Z.quot(base+t*4+off*4-base)4=t+off.
Proof. intros;replace(base+t*4+off*4-base)with((t+off)*4)by ring;rewrite Z.quot_mul by lia;reflexivity. Qed.
Inductive normalized_index : Z -> Prop := normalized_index_done : forall i, normalized_index i.
Ltac normalize_index i :=
 tryif (match goal with _:normalized_index i|-_=>idtac end) then fail 0 else
 let H:=fresh "Hnormalized" in assert(H:normalized_index i) by constructor;ring_simplify i.
Lemma proof_of_test_neon_entail_wit_4 : test_neon_entail_wit_4.
Proof.
 unfold test_neon_entail_wit_4;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 replace(2*4)with 8 in * by reflexivity.
 replace(4+4+4+4)with 16 by reflexivity.
 replace(4+4+4)with 12 by reflexivity.
 subst a0 a1 a2 a3 w.
 rewrite depth_quot_two by lia.
 rewrite !fulln_acc_step_two by lia.
 rewrite !weight_at_panel by lia.
 rewrite !scaled_offset4_add,!scaled_offset4.
 cbn [glane Z.eqb].
 assert(Hrem4:Z.rem(k-8)4=0).
 { rewrite Z.rem_mod_nonneg by lia;rewrite Z.rem_mod_nonneg in PreH32 by lia;rewrite Zminus_mod,PreH32;reflexivity. }
 assert(Heven:Z.rem((kc_pre-k)÷4+2)2=0).
 { rewrite Z.rem_mod_nonneg by lia;rewrite Z.rem_mod_nonneg in PreH29 by lia;rewrite Z.add_mod,PreH29 by lia;reflexivity. }
 assert(Hbound:(kc_pre-k)÷4+2<=kc_pre÷4).
 { rewrite <-depth_quot_two by lia;apply Z.quot_le_mono;lia. }
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];nia.
 - repeat multimatch goal with |-context[KernelModel.gget ?i ?xs]=>normalize_index i end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
