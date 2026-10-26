From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export NeonKernelPureFacts APKernelMemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma apkr_group_nonnegative:forall D k,0<=k<=app_rows D->0<=app_group_cursor D k.
Proof. intros D k H;unfold app_group_cursor.
 destruct(Z.eqb k 0);[unfold app_groups|];apply Z.div_pos;lia. Qed.
Lemma apkr_previous_window:forall W p q g base done n,
 p=app_previous_cursor g base done ->p<>0 ->
 q=app_output_cursor base done ->ap_write_window W q n ->ap_write_window W p n.
Proof. intros W p q g base done n Hp Hnz Hq Hw.
 unfold app_previous_cursor in Hp;destruct(Z.eqb g 0);[congruence|].
 unfold app_output_cursor in Hq;congruence. Qed.
Lemma apkr_previous_output_readable:forall side F P D pixel group done n O I base p,
 0<=group ->p=app_previous_cursor group base done ->p<>0 ->base=app_output_at D pixel ->
 0<=done ->0<=n ->done+n<=app_channels D ->
 ap_output_readable(app_partial_output side F P D pixel group done O I)p n.
Proof. intros side F P D pixel group done n O I base p Hg Hp Hnz Hb Hd Hn HC.
 unfold app_previous_cursor in Hp;destruct(Z.eqb_spec group 0);[congruence|].
 subst base p;change(ap_output_readable(app_partial_output side F P D pixel group done O I)(app_output_cursor(app_output_at D pixel)done)n).
 apply app_partial_output_readable;lia. Qed.
Lemma apkr_previous_index_readable:forall side F P D pixel group done n O I base p,
 0<=group ->p=app_previous_cursor group base done ->p<>0 ->base=app_index_at D pixel ->
 0<=done ->0<=n ->done+n<=app_channels D ->
 ap_index_readable(app_partial_index side F P D pixel group done O I)p n.
Proof. intros side F P D pixel group done n O I base p Hg Hp Hnz Hb Hd Hn HC.
 unfold app_previous_cursor in Hp;destruct(Z.eqb_spec group 0);[congruence|].
 subst base p;change(ap_index_readable(app_partial_index side F P D pixel group done O I)(app_output_cursor(app_index_at D pixel)done)n).
 apply app_partial_index_readable;lia. Qed.
Lemma apkr_previous_is_current:forall p g base done,
 p=app_previous_cursor g base done->p<>0->p=app_output_cursor base done.
Proof. intros p g base done Hp Hnz;unfold app_previous_cursor in Hp;
 destruct(Z.eqb g 0);[congruence|exact Hp]. Qed.
Lemma apkr_previous_positive_group:forall p g base done,
 0<=g->p=app_previous_cursor g base done->p<>0->0<g.
Proof. intros p g base done Hg Hp Hnz.
 assert(g<>0). { intro E;subst g;unfold app_previous_cursor in Hp;cbn in Hp;congruence. } lia. Qed.
Lemma apkr_window_owned:forall W p n j,
 ap_write_window W p n->0<=j<n->ap_owned W(p+4*j).
Proof. intros W p n j [_[_ H]]Hj;exact(H j Hj). Qed.
Lemma apkr_window_positive:forall W p n j,
 ap_write_window W p n->0<=j->p+4*j<>0.
Proof. intros W p n j [Hp _]Hj;lia. Qed.
Ltac apkr_nonnegative:=first[lia|apply apkr_group_nonnegative;lia].
Ltac apkr_readable:=first[
 eapply apkr_previous_window;[eassumption|eassumption|eassumption|eassumption]
 |unfold app_neon_partial_output; eapply apkr_previous_output_readable;
 [apkr_nonnegative|eassumption|eassumption|eassumption|lia|lia|lia]
 |unfold app_neon_partial_index; eapply apkr_previous_index_readable;
 [apkr_nonnegative|eassumption|eassumption|eassumption|lia|lia|lia]].
Ltac apkr_props:=repeat first[solve[apk_basic_prop|apkp_window|apkr_readable]|split].
Ltac apkr_pure:=lazymatch goal with
 | |- ?P |-- coq_prop ?Q=>apply apb_pure_right;apkr_props
 | |- ?P |-- andp ?Q ?R=>apply _derivable1_andp_intros;[apkr_pure|apkr_pure]
 | |- ?P |-- truep=>unfold derivable1,truep;intros;exact I
 end.
Ltac apkr_pure_goal:=lazymatch goal with
 | |- _ \/ _=>first[solve[left;apb_intro;apkr_pure]|right;apb_intro;apkr_pure]
 | |- _=>apb_intro;apkr_pure
 end.
Print Assumptions apkr_group_nonnegative.
Print Assumptions apkr_previous_window.
Print Assumptions apkr_previous_output_readable.
Print Assumptions apkr_previous_index_readable.
Print Assumptions apkr_previous_is_current.
Print Assumptions apkr_previous_positive_group.
Print Assumptions apkr_window_owned.
Print Assumptions apkr_window_positive.
