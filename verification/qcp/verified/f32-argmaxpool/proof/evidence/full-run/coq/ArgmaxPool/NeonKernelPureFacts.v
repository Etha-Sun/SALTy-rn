From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export NeonKernelSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma apk_write_window_prefix:forall W p n m,
 ap_write_window W p n ->0<=m<=n ->ap_write_window W p m.
Proof. unfold ap_write_window;intros W p n m [Hp [Hn Hcells]] Hm.
 split;[assumption|split;[lia|]];intros j Hj;apply Hcells;lia. Qed.
Lemma apk_write_window_subrange:forall W p n skip take,
 ap_write_window W p n ->0<=skip ->0<=take ->skip+take<=n ->
 ap_write_window W(p+4*skip)take.
Proof. unfold ap_write_window;intros W p n skip take [Hp [Hn Hcells]] Hs Ht Hsum.
 split;[lia|split;[assumption|]];intros j Hj.
 replace(p+4*skip+4*j)with(p+4*(skip+j))by ring;apply Hcells;lia. Qed.
Lemma apk_tail_two:forall c,0<=c<4 ->Z.land c 2<>0 ->2<=c.
Proof. intros c Hc Hb;assert(c=0\/c=1\/c=2\/c=3)by lia;
 destruct H as[H|[H|[H|H]]];subst c;cbn in Hb;lia. Qed.
Lemma apk_tail_both:forall c,0<=c<4 ->Z.land c 2<>0 ->Z.land c 1<>0 ->3<=c.
Proof. intros c Hc Hb H1;assert(c=0\/c=1\/c=2\/c=3)by lia;
 destruct H as[H|[H|[H|H]]];subst c;cbn in Hb,H1;lia. Qed.

Ltac apkp_tail_arith := first[lia
 |match goal with H:Z.land ?c 2<>0 |- _ =>pose proof(apk_tail_two c ltac:(lia) H);lia end
 |match goal with H:Z.land ?c 2<>0,H1:Z.land ?c 1<>0 |- _ =>
   pose proof(apk_tail_both c ltac:(lia) H H1);lia end].
Ltac apkp_window := first[
 eapply apk_write_window_prefix;[eassumption|split;apkp_tail_arith]
 |lazymatch goal with
  | H:ap_write_window ?W ?p ?n |- ap_write_window ?W ?q ?take =>
    replace q with(p+4*2)by(change (sizeof (FLOAT)) with 4;ring);
    eapply apk_write_window_subrange;[exact H|lia|lia|apkp_tail_arith]
  end].
Ltac apkp_props := repeat first[solve[apk_basic_prop|apkp_window]|split].
Ltac apkp_pure := lazymatch goal with
 | |- ?P |-- coq_prop ?Q =>apply apb_pure_right;apkp_props
 | |- ?P |-- andp ?Q ?R =>apply _derivable1_andp_intros;[apkp_pure|apkp_pure]
 | |- ?P |-- truep =>unfold derivable1,truep;intros;exact I
 end.
Ltac apkp_pure_goal := lazymatch goal with
 | |- _ \/ _ =>first[solve[left;apb_intro;apkp_pure]|right;apb_intro;apkp_pure]
 | |- _ =>apb_intro;apkp_pure
 end.
Print Assumptions apk_write_window_prefix.
Print Assumptions apk_write_window_subrange.
Print Assumptions apk_tail_two.
Print Assumptions apk_tail_both.

Ltac apkp_call_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apkp_pure]
 |apply _derivable1_andp_intros;[apkp_pure|apk_spatial]
 |apk_spatial].
Ltac apkp_call_goal :=
 apb_intro;first[solve[apkp_call_frame]|apk_fold_float_values;apkp_call_frame].
