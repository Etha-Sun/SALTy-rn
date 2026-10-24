From Coq Require Import ZArith Lia List.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullModel.
From GemmKernelBridge Require Import ScheduleBridge.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
Local Open Scope Z_scope.
Lemma panel_count_multiple : forall d,0<=d ->Z.rem d 8=0 ->panel_count d=Z.quot d 8.
Proof.
 intros d Hd Hr;pose proof(Z.quot_rem d 8 ltac:(lia))as Q;rewrite Hr in Q.
 unfold panel_count;symmetry;apply Z.div_unique with(r:=7);lia.
Qed.
Lemma bias_at_panel : forall k done j,0<=done ->Z.rem done 8=0 ->0<=j<8 ->
 bias_index k(done+j)=8*(k+1)*Z.quot done 8+j.
Proof.
 intros k done j Hd Hr Hj;pose proof(Z.quot_rem done 8 ltac:(lia))as Q;rewrite Hr in Q.
 assert(Hdiv:Z.div(done+j)8=Z.quot done 8)by(symmetry;apply Z.div_unique with(r:=j);lia).
 assert(Hmod:Z.modulo(done+j)8=j)by(symmetry;apply Z.mod_unique with(q:=Z.quot done 8);lia).
 unfold bias_index;rewrite Hdiv,Hmod;ring.
Qed.
Lemma weight_at_panel : forall k done j d,0<=done ->Z.rem done 8=0 ->0<=j<8 ->
 weight_index k(done+j)d=8*(k+1)*Z.quot done 8+8*(d+1)+j.
Proof. intros;unfold weight_index;rewrite bias_at_panel by lia;ring. Qed.
Lemma fulln_acc_step_two : forall d k row col A W,0<=d ->
 fulln_acc(d+2)k row col A W=
 fma_rne(gget(row*k+(d+1))A)(gget(weight_index k col(d+1))W)
 (fma_rne(gget(row*k+d)A)(gget(weight_index k col d)W)(fulln_acc d k row col A W)).
Proof.
 intros;replace(d+2)with((d+1)+1)by ring;rewrite !fulln_acc_step by lia;reflexivity.
Qed.
Lemma quotient_four_exact : forall k,0<=k ->Z.rem k 4=0 ->4*Z.quot k 4=k.
Proof. intros;pose proof(Z.quot_rem k 4 ltac:(lia));lia. Qed.
Lemma depth_quot_two : forall kc k,0<=k-8 ->k<=kc ->
 Z.quot(kc-(k-8))4=Z.quot(kc-k)4+2.
Proof.
 intros;replace(kc-(k-8))with(kc-k+2*4)by ring.
 rewrite Z.quot_add by nia;ring.
Qed.
Lemma address_cell_offset4 : forall base t, Z.quot(base+4*t-base)4=t.
Proof. intros;replace(base+4*t-base)with(t*4)by ring;apply Z.quot_mul;lia. Qed.
Print Assumptions panel_count_multiple.
Print Assumptions bias_at_panel.
Print Assumptions weight_at_panel.
Print Assumptions fulln_acc_step_two.
Print Assumptions quotient_four_exact.
Print Assumptions depth_quot_two.
Print Assumptions address_cell_offset4.
