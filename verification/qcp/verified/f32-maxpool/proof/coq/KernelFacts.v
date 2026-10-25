From Coq Require Import ZArith Lia FunctionalExtensionality.
From MaxPool Require Import KernelState MemoryViews WriteFacts.
Local Open Scope Z_scope.
Lemma mp_row_load_cursor:forall F PT table offset K group row channel j,
 mp_load_lane F(mp_row_cursor PT table offset K group row channel)j=
 mp_load_lane F(mp_row_base PT table offset K group row)(channel+j).
Proof. intros;unfold mp_load_lane,mp_row_cursor;f_equal;lia. Qed.
Lemma mp_group_lane_rows:forall F PT table offset K group channel,
 mp_group_lane F PT table offset K group channel=
 mp_tree9(fun row=>mp_load_lane F(mp_row_base PT table offset K group row)channel).
Proof. intros;unfold mp_group_lane,mp_group,mp_tree9,mp_row_base,mp_row_index,mp_load_lane;reflexivity. Qed.
Lemma mp_after_groups_zero:forall F PT table offset K channel lo hi,
 mp_after_groups F PT table offset K 0 channel lo hi=
 mp_first lo hi(mp_group_lane F PT table offset K 0 channel).
Proof. reflexivity. Qed.
Lemma mp_after_groups_successor:forall F PT table offset K group channel lo hi,
 0<=group->
 mp_after_groups F PT table offset K(group+1)channel lo hi=
 mp_more hi(mp_after_groups F PT table offset K group channel lo hi)
 (mp_group_lane F PT table offset K(group+1)channel).
Proof.
 intros;unfold mp_after_groups.
 replace(Z.to_nat(group+1))with(S(Z.to_nat group))by(rewrite Z2Nat.inj_add by lia;simpl;lia).
 cbn[mp_more_groups]. rewrite Nat2Z.inj_succ,Z2Nat.id by lia.
 replace(Z.succ group)with(group+1)by lia;reflexivity.
Qed.
Lemma mp_k_after_initial:forall K,mp_k_after K 0=mp_remaining K.
Proof. intro;unfold mp_k_after,mp_remaining;destruct(Z.ltb_spec 9 K);lia. Qed.
Lemma mp_k_after_step:forall K group,
 mp_k_after K(group+1)=mp_remaining(mp_k_after K group).
Proof.
 intros;unfold mp_k_after,mp_remaining;destruct(Z.ltb_spec 9(Z.max 0(K-9*(group+1))));lia.
Qed.
Lemma mp_k_after_nonnegative:forall K group,0<=mp_k_after K group.
Proof. intros;unfold mp_k_after;lia. Qed.
Lemma mp_extra_groups_nonnegative:forall K,0<=mp_extra_groups K.
Proof.
 intro K;unfold mp_extra_groups,mp_remaining;destruct(Z.ltb_spec 9 K);
 apply Z.div_pos;lia.
Qed.
Lemma mp_k_after_finished:forall K group,0<=K->0<=group->
 (mp_k_after K group=0<->mp_extra_groups K<=group).
Proof.
 intros K group HK Hg;unfold mp_k_after,mp_extra_groups,mp_remaining.
 destruct(Z.ltb_spec 9 K).
 - pose proof(Z.div_mod(K-9+8)9 ltac:(lia));pose proof(Z.mod_pos_bound(K-9+8)9 ltac:(lia));lia.
 - change((Z.max 0(K-9*(group+1))=0)<->0<=group);lia.
Qed.
Lemma mp_table_read_complete:forall table K group,0<=K->0<=group->
 (group=0\/9*group<K)->
 mp_table_read_cursor table K group 9=mp_table_cursor table K group.
Proof.
 intros;unfold mp_table_read_cursor,mp_table_cursor,mp_consumed.
 destruct(Z.ltb_spec K 1);destruct H1;subst;lia.
Qed.
Lemma mp_consumed_next_group:forall K group,0<=K->0<=group->0<mp_k_after K group->
 mp_consumed K group=9*(group+1).
Proof. intros;unfold mp_consumed,mp_k_after in *;destruct(Z.ltb_spec K 1);lia. Qed.
Lemma mp_write_zero:forall O p value,mp_write O p 0 value=O.
Proof. reflexivity. Qed.
Lemma mp_write_ext_bounded:forall O p count f g,0<=count->
 (forall j,0<=j<count->f j=g j)->mp_write O p count f=mp_write O p count g.
Proof.
 intros O p count f g Hcount Hfg;apply functional_extensionality;intro q.
 pose proof(Z.div_mod(q-p)4 ltac:(lia))as Hdiv.
 destruct(Z.eq_dec((q-p)mod 4)0)as[Hmod|Hmod].
 - destruct(Z_lt_dec((q-p)/4)0)as[Hneg|Hpos];
   destruct(Z_lt_dec((q-p)/4)count)as[Hin|Hout].
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
   + pose proof(Z.div_mod(q-p)4 ltac:(lia)).
     replace q with(p+4*((q-p)/4))by lia.
     rewrite !mp_write_inside by lia;rewrite Hfg by lia;reflexivity.
   + repeat rewrite mp_write_outside by(intros;lia);reflexivity.
 - assert(Houtside:forall j,0<=j<count->q<>p+4*j).
   { intros j Hj Heq;apply Hmod;rewrite Heq.
     replace(p+4*j-p)with(j*4)by lia;apply Z.mod_mul;lia. }
   rewrite(mp_write_outside O p count f q Hcount Houtside).
   rewrite(mp_write_outside O p count g q Hcount Houtside);reflexivity.
Qed.
