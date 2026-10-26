From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export NeonKernelReadabilityFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma apkra_float:forall F P D pixel group done lane O I base p,
 0<=group->p=app_previous_cursor group base done->p<>0->base=app_output_at D pixel->
 0<=done->0<=lane->done+lane<app_channels D->
 ap_float_initialized(app_neon_partial_output F P D pixel group done O I)(p+4*lane)
 (app_previous_float_value F P D pixel group(done+lane)).
Proof. intros F P D pixel group done lane O I base p Hg Hp Hnz Hb Hd Hl HC.
 pose proof(apkr_previous_is_current p group base done Hp Hnz)as E.
 pose proof(apkr_previous_positive_group p group base done Hg Hp Hnz)as Hpos.
 rewrite E,Hb;apply app_previous_float_initialized;assumption. Qed.
Lemma apkra_index:forall F P D pixel group done lane O I base p,
 0<=group->p=app_previous_cursor group base done->p<>0->base=app_index_at D pixel->
 0<=done->0<=lane->done+lane<app_channels D->
 ap_uint_initialized(app_neon_partial_index F P D pixel group done O I)(p+4*lane)
 (app_previous_index_value F P D pixel group(done+lane)).
Proof. intros F P D pixel group done lane O I base p Hg Hp Hnz Hb Hd Hl HC.
 pose proof(apkr_previous_is_current p group base done Hp Hnz)as E.
 pose proof(apkr_previous_positive_group p group base done Hg Hp Hnz)as Hpos.
 rewrite E,Hb;apply app_previous_index_initialized;assumption. Qed.
Lemma apkra_positive_cursor:forall g base done,0<g->
 app_previous_cursor g base done=app_output_cursor base done.
Proof. intros;unfold app_previous_cursor,app_output_cursor;
 destruct(Z.eqb_spec g 0);[lia|reflexivity]. Qed.
Lemma apkra_positive_window:forall W p q g base done n,
 0<g->p=app_previous_cursor g base done->q=app_output_cursor base done->
 ap_write_window W q n->ap_write_window W p n.
Proof. intros W p q g base done n Hg Hp Hq Hw;
 rewrite(apkra_positive_cursor g base done Hg)in Hp;congruence. Qed.
Ltac apkra_prepare :=
 try match goal with H:Z.land ?c 2<>0|-_=>pose proof(apk_tail_two c ltac:(lia) H)end;
 try match goal with H:Z.land ?c 2<>0,H1:Z.land ?c 1<>0|-_=>pose proof(apk_tail_both c ltac:(lia) H H1)end;
 try match goal with H:app_valid ?F ?P ?W ?WI ?D|-_=>
  let HW:=fresh "distinct_output"in let HI:=fresh "distinct_index"in
  pose proof H as[_[HW HI]];change(ap_distinct W)in HW;change(ap_distinct WI)in HI end;
 repeat first[
 match goal with H:?k=app_remaining ?n(app_group_cursor ?D ?k)|-_=>
  let T:=constr:(0<=app_group_cursor D k)in
  match goal with _:T|-_=>fail 1|_=>assert(T)by(apply apkr_group_nonnegative;lia)end end
 |match goal with Hp:?p=app_previous_cursor ?g ?base ?done,Hnz:?p<>0|-_=>
 let T:=constr:(0<g)in match goal with _:T|-_=>fail 1|_=>
 assert(T)by(eapply apkr_previous_positive_group;[apkr_nonnegative|exact Hp|exact Hnz])end end
 |match goal with Hp:?p=app_previous_cursor ?g ?base ?done,Hg:0< ?g,
 Hq:?q=app_output_cursor ?base ?done,Hw:ap_write_window ?W ?q ?n|-_=>
 let T:=constr:(ap_write_window W p n)in match goal with _:T|-_=>fail 1|_=>
 pose proof(apkra_positive_window W p q g base done n Hg Hp Hq Hw)end end
 |match goal with Hwin:ap_write_window ?W ?p ?n|-_=>is_var p;
 let T:=constr:(p<>0)in match goal with _:T|-_=>fail 1|_=>
 assert(T)by(let Hpos:=fresh in pose proof Hwin as[Hpos _];lia)end end
 |match goal with Hp:?p=app_previous_cursor ?g ?base ?done,Hnz:?p<>0,
 Hq:?q=app_output_cursor ?base ?done,Hw:ap_write_window ?W ?q ?n|-_=>
 let T:=constr:(ap_write_window W p n)in
 match goal with _:T|-_=>fail 1|_=>pose proof(apkr_previous_window W p q g base done n Hp Hnz Hq Hw)end end].
Ltac apkra_owned:=lazymatch goal with
 | |- ap_owned ?W ?q=>match goal with H:ap_write_window W ?p ?n|-_=>
  first[replace q with(p+4*0)by ring;eapply(apkr_window_owned W p n 0 H);lia
  |replace q with(p+4*1)by ring;eapply(apkr_window_owned W p n 1 H);lia
  |replace q with(p+4*2)by ring;eapply(apkr_window_owned W p n 2 H);lia
  |replace q with(p+4*3)by ring;eapply(apkr_window_owned W p n 3 H);lia]end end.
Ltac apkra_positive:=match goal with H:ap_write_window ?W ?p ?n|- ?q<>0=>
 let Hp:=fresh in pose proof H as[Hp _];lia end.
Ltac apkra_initialized:=first[
 lazymatch goal with|-ap_float_initialized(app_neon_partial_output ?F ?P ?D ?pix ?g ?done ?O ?I)?q(app_previous_float_value ?F ?P ?D ?pix ?g ?chan)=>
 match goal with Hp:?p=app_previous_cursor g ?base done|-_=>
 let lane:=constr:(chan-done)in
 replace q with(p+4*lane)by ring;
 replace chan with(done+lane)by ring;
 eapply(apkra_float F P D pix g done lane O I base p);
 [apkr_nonnegative|exact Hp|eassumption|eassumption|lia|lia|lia]end end
 |lazymatch goal with|-ap_uint_initialized(app_neon_partial_index ?F ?P ?D ?pix ?g ?done ?O ?I)?q(app_previous_index_value ?F ?P ?D ?pix ?g ?chan)=>
 match goal with Hp:?p=app_previous_cursor g ?base done|-_=>
 let lane:=constr:(chan-done)in
 replace q with(p+4*lane)by ring;
 replace chan with(done+lane)by ring;
 eapply(apkra_index F P D pix g done lane O I base p);
 [apkr_nonnegative|exact Hp|eassumption|eassumption|eassumption|lia|lia|lia]end end].
Ltac apkra_subrange:=match goal with H:ap_write_window ?W ?p ?n|-ap_write_window ?W ?q ?take=>
 replace q with(p+4*2)by(change (sizeof(UINT)) with 4;ring);
 eapply apk_write_window_subrange;[exact H|lia|lia|apkp_tail_arith]end.
Ltac apkra_props:=repeat first[solve[apk_basic_prop|apkp_window|apkr_readable|apkra_owned|apkra_positive|apkra_initialized|apkra_subrange]|split].
Ltac apkra_pure:=lazymatch goal with
 | |- ?P |-- coq_prop ?Q=>apply apb_pure_right;apkra_props
 | |- ?P |-- andp ?Q ?R=>apply _derivable1_andp_intros;[apkra_pure|apkra_pure]
 | |- ?P |-- truep=>unfold derivable1,truep;intros;exact I end.
Ltac apkra_pure_goal:=lazymatch goal with
 | |- _ \/ _=>first[solve[left;apb_intro;apkra_prepare;first[solve[exfalso;lia]|apkra_pure]]|right;apb_intro;apkra_prepare;first[solve[exfalso;lia]|apkra_pure]]
 | |- _=>apb_intro;apkra_prepare;first[solve[exfalso;lia]|apkra_pure] end.
Print Assumptions apkra_float.
Print Assumptions apkra_index.

Print Assumptions apkra_positive_cursor.
Print Assumptions apkra_positive_window.
