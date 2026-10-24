From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullModel.
From FullNeonLoopProof Require Import LoopFacts.
From GemmNeon Require Import CopyFacts.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Inductive normalized_index : Z -> Prop := normalized_index_done : forall i, normalized_index i.
Ltac normalize_index i :=
 tryif (match goal with _:normalized_index i|-_=>idtac end) then fail 0 else
 let H:=fresh "Hnormalized" in assert(H:normalized_index i) by constructor;ring_simplify i.
Lemma proof_of_test_neon_entail_wit_3 : test_neon_entail_wit_3.
Proof.
 unfold test_neon_entail_wit_3;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 unfold fulln_outer_ptrs in PreH26;destruct PreH26 as[Hz|Hp];[lia|].
 decompose [and] Hp;clear Hp.
 assert(Hpcount:panel_count(nc_pre-nc)=(nc_pre-nc)÷8)by(apply panel_count_multiple;lia).
 assert(Hoff:((w-w_pre)÷4)=8*((kc_pre÷4)+1)*((nc_pre-nc)÷8)).
 { rewrite PreH27,Hpcount;replace(w_pre+8*(kc_pre÷4+1)*((nc_pre-nc)÷8)*4-w_pre)with((8*(kc_pre÷4+1)*((nc_pre-nc)÷8))*4)by ring;rewrite Z.quot_mul by lia;reflexivity. }
 assert(Hoff4:((w+4*4-w_pre)÷4)=8*((kc_pre÷4)+1)*((nc_pre-nc)÷8)+4).
 { rewrite PreH27,Hpcount;replace(w_pre+8*(kc_pre÷4+1)*((nc_pre-nc)÷8)*4+4*4-w_pre)with((8*(kc_pre÷4+1)*((nc_pre-nc)÷8)+4)*4)by ring;rewrite Z.quot_mul by lia;reflexivity. }
 rewrite !Z.sub_diag;rewrite !Z.quot_0_l by lia.
 rewrite !fulln_acc_zero.
 rewrite !bias_at_panel by lia.
 rewrite !Hoff,!Hoff4.
 pose proof(Z.quot_pos kc_pre 4 ltac:(lia) ltac:(lia))as HK.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];rewrite ?Hpcount;nia.
 - repeat multimatch goal with |-context[KernelModel.gget ?i ?xs]=>normalize_index i end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
