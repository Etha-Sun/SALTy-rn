From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APKernelModel.
Local Open Scope Z_scope.
Lemma app_group_cursor_initial:forall D,0<app_rows D->
 app_group_cursor D(app_rows D)=0.
Proof.
 intros;unfold app_group_cursor;destruct(Z.eqb_spec(app_rows D)0);[lia|].
 rewrite Z.sub_diag;reflexivity.
Qed.
Lemma app_group_cursor_zero:forall D,app_group_cursor D 0=app_groups(app_rows D).
Proof. reflexivity. Qed.
Lemma app_group_cursor_active:forall D k,0<k<=app_rows D->
 k=app_remaining(app_rows D)(app_group_cursor D k)->
 0<=app_group_cursor D k<app_groups(app_rows D) /\
 9*app_group_cursor D k=app_rows D-k.
Proof.
 intros D k Hk Hrem.
 assert(Hg:0<=app_group_cursor D k).
 { unfold app_group_cursor;destruct(Z.eqb_spec k 0);[lia|].
   apply Z.div_pos;lia. }
 assert(Ha:0<app_remaining(app_rows D)(app_group_cursor D k))by lia.
 assert(Hb:app_group_cursor D k<app_groups(app_rows D)).
 { apply(app_remaining_active(app_rows D)(app_group_cursor D k)ltac:(lia)Hg);exact Ha. }
 unfold app_remaining in Hrem;lia.
Qed.
Lemma app_group_cursor_step:forall D k,0<k<=app_rows D->
 k=app_remaining(app_rows D)(app_group_cursor D k)->
 app_group_cursor D(if Z.ltb 9 k then k-9 else 0)=app_group_cursor D k+1.
Proof.
 intros D k Hk Hr;pose proof(app_group_cursor_active D k Hk Hr)as[Hg He].
 destruct(Z.ltb_spec 9 k).
 - unfold app_group_cursor at 1;destruct(Z.eqb_spec(k-9)0);[lia|].
   replace(app_rows D-(k-9))with(9*(app_group_cursor D k+1))by lia.
   rewrite Z.mul_comm,Z.div_mul by lia;reflexivity.
 - rewrite app_group_cursor_zero;unfold app_groups.
   pose proof(Z.div_mod(app_rows D+8)9 ltac:(lia)).
   pose proof(Z.mod_pos_bound(app_rows D+8)9 ltac:(lia));lia.
Qed.
Lemma app_index_cursor_step:forall g,
 ap_u32(app_index_base_at g+9)=app_index_base_at(g+1).
Proof.
 intros;unfold app_index_base_at,ap_u32.
 rewrite unsigned_unsigned_add_l by lia;f_equal;ring.
Qed.
Lemma app_u32_range:forall z,0<=ap_u32 z<4294967296.
Proof. intros;apply(unsigned_Lastnbits_range z 32);lia. Qed.
Lemma app_step_index_range:forall old candidate,
 0<=snd old<4294967296->0<=snd(ap_step old candidate)<4294967296.
Proof.
 intros[old oi][candidate ci]H;unfold ap_step;cbn[fst snd]in *.
 destruct(Z.eqb(ap_gt_mask candidate old)4294967295);[apply app_u32_range|exact H].
Qed.
Lemma app_scan_index_range:forall values old,
 0<=snd old<4294967296->0<=snd(ap_scan values old)<4294967296.
Proof. induction values;intros;simpl;[assumption|apply IHvalues;apply app_step_index_range;assumption]. Qed.
Print Assumptions app_group_cursor_initial.
Print Assumptions app_group_cursor_zero.
Print Assumptions app_group_cursor_active.
Print Assumptions app_group_cursor_step.
Print Assumptions app_index_cursor_step.
Print Assumptions app_u32_range.
Print Assumptions app_step_index_range.
Print Assumptions app_scan_index_range.
