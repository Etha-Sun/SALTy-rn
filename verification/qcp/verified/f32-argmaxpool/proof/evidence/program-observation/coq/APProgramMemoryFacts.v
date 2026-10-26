From Coq Require Import ZArith Lia List FunctionalExtensionality Classical_Prop.
From ArgmaxPool Require Export APProgramModel.
Local Open Scope Z_scope.
Lemma app_write_inside:forall A(O:APState A)p n value j,
 0<=j<Z.of_nat n->ap_state_write_n O p n value(p+4*j)=Some(value j).
Proof.
 intros A O p n;revert O;induction n as[|n IH];intros O value j Hj;[lia|].
 cbn[ap_state_write_n];unfold ap_put.
 destruct(Z.eqb_spec(p+4*j)(p+4*Z.of_nat n))as[Heq|Hneq].
 - assert(j=Z.of_nat n)by lia;subst j;reflexivity.
 - apply IH;rewrite Nat2Z.inj_succ in Hj;lia.
Qed.
Lemma app_write_outside:forall A(O:APState A)p n value q,
 (forall j,0<=j<Z.of_nat n->q<>p+4*j)->ap_state_write_n O p n value q=O q.
Proof.
 intros A O p n;revert O;induction n as[|n IH];intros O value q Hout;[reflexivity|].
 cbn[ap_state_write_n];unfold ap_put.
 destruct(Z.eqb_spec q(p+4*Z.of_nat n))as[Heq|Hneq].
 - exfalso;apply(Hout(Z.of_nat n));[rewrite Nat2Z.inj_succ;lia|exact Heq].
 - apply IH;intros;apply Hout;rewrite Nat2Z.inj_succ;lia.
Qed.
Lemma app_write_ext:forall A(O:APState A)p n f g,
 (forall j,0<=j<Z.of_nat n->f j=g j)->
 ap_state_write_n O p n f=ap_state_write_n O p n g.
Proof.
 intros A O p n;revert O;induction n as[|n IH];intros O f g Hfg;[reflexivity|].
 cbn[ap_state_write_n];rewrite(IH O f g ltac:(intros;apply Hfg;rewrite Nat2Z.inj_succ;lia)).
 rewrite Hfg by(rewrite Nat2Z.inj_succ;lia);reflexivity.
Qed.
Lemma app_write_append:forall A(O:APState A)p n m value,
 ap_state_write_n(ap_state_write_n O p n value)(p+4*Z.of_nat n)m(fun j=>value(Z.of_nat n+j))=
 ap_state_write_n O p(n+m)value.
Proof.
 intros A O p n m;induction m as[|m IH];intro value.
 - cbn[ap_state_write_n];rewrite Nat.add_0_r;reflexivity.
 - rewrite Nat.add_succ_r;cbn[ap_state_write_n];rewrite IH.
   rewrite Nat2Z.inj_add;repeat first[solve[reflexivity|ring]|f_equal].
Qed.
Lemma app_write_overwrite:forall A(O:APState A)p n f g,
 ap_state_write_n(ap_state_write_n O p n f)p n g=ap_state_write_n O p n g.
Proof.
 intros;apply functional_extensionality;intro q.
 destruct(classic(exists j,0<=j<Z.of_nat n /\ q=p+4*j))as[[j[Hj ->]]|Hnone].
 - rewrite !app_write_inside by assumption;reflexivity.
 - assert(Hout:forall j,0<=j<Z.of_nat n->q<>p+4*j)by(intros j Hj Heq;apply Hnone;exists j;auto).
   rewrite !app_write_outside by assumption;reflexivity.
Qed.
Lemma app_write_pair_zero:forall S out idx value,app_write_pair S out idx 0 value=S.
Proof. intros[O I]out idx value;reflexivity. Qed.
Lemma app_write_pair_overwrite:forall S out idx count f g,0<=count->
 app_write_pair(app_write_pair S out idx count f)out idx count g=app_write_pair S out idx count g.
Proof. intros;unfold app_write_pair,ap_output_write,ap_index_write;cbn[fst snd];rewrite !app_write_overwrite;reflexivity. Qed.
Lemma app_pass_partial_zero:forall side F P D pixel group S,
 app_pass_partial side F P D pixel group 0 S=app_pass_complete side F P D pixel group S.
Proof. intros;unfold app_pass_partial;apply app_write_pair_zero. Qed.
Lemma app_pass_partial_full:forall side F P D pixel group S,0<=group->0<=app_channels D->
 app_pass_partial side F P D pixel group(app_channels D)S=app_pass_complete side F P D pixel(group+1)S.
Proof.
 intros;unfold app_pass_partial,app_pass_complete.
 assert(Hpos:Z.leb(group+1)0=false)by(apply Z.leb_gt;lia);rewrite Hpos.
 destruct(Z.leb group 0);[reflexivity|apply app_write_pair_overwrite;assumption].
Qed.
Lemma app_write_Z_append:forall A(O:APState A)p done vl value,0<=done->0<=vl->
 ap_state_write_n(ap_state_write_n O p(Z.to_nat done)value)(p+4*done)(Z.to_nat vl)(fun j=>value(done+j))=
 ap_state_write_n O p(Z.to_nat(done+vl))value.
Proof.
 intros;rewrite Z2Nat.inj_add by assumption.
 pose proof(app_write_append A O p(Z.to_nat done)(Z.to_nat vl)value)as Happ.
 rewrite Z2Nat.id in Happ by assumption;exact Happ.
Qed.
Lemma app_pass_partial_append:forall side F P D pixel group done vl S,
 0<=done->0<=vl->
 app_write_pair(app_pass_partial side F P D pixel group done S)
 (app_output_cursor(app_output_at D pixel)done)
 (app_output_cursor(app_index_at D pixel)done)vl
 (fun j=>app_lane_value side F P D pixel(group+1)(done+j))=
 app_pass_partial side F P D pixel group(done+vl)S.
Proof.
 intros;unfold app_pass_partial,app_write_pair,app_output_cursor,ap_output_write,ap_index_write;cbn[fst snd].
 rewrite !app_write_Z_append by assumption;reflexivity.
Qed.
Print Assumptions app_write_inside.
Print Assumptions app_write_outside.
Print Assumptions app_write_ext.
Print Assumptions app_write_append.
Print Assumptions app_write_overwrite.
Print Assumptions app_write_pair_zero.
Print Assumptions app_write_pair_overwrite.
Print Assumptions app_pass_partial_zero.
Print Assumptions app_pass_partial_full.
Print Assumptions app_write_Z_append.
Print Assumptions app_pass_partial_append.
