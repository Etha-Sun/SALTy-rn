From Coq Require Import ZArith Bool List Lia.
From DwChw Require Export ProgressModel MemoryViewFacts ProgramFactsFast VectorPixelFacts MemoryProbeTactics.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dw_input_windows:forall F input zero weights params H N,
 dw_inputs F input zero weights params H N ->
 dw_window F input(H*N+3)/\dw_window F zero(N+3)/\dw_window F weights 10/\dw_window F params 2.
Proof. unfold dw_inputs;tauto. Qed.
Lemma dw_input_geometry:forall F input zero weights params H N,
 dw_inputs F input zero weights params H N ->
 0<H/\0<N/\dw_footprint input(H*N+3)/\dw_footprint zero(N+3).
Proof. unfold dw_inputs;tauto. Qed.
Lemma dw_read_window_shift:forall F p count k n,
 dw_window F p count->0<=k->0<=n->k+n<=count->dw_window F(p+4*k)n.
Proof.
 unfold dw_window;intros F p count k n[Hp[Hc HW]]Hk Hn Hkn;split;[nia|split;[lia|]].
 intros i Hi;replace(p+4*k+4*i)with(p+4*(k+i))by ring;apply HW;lia.
Qed.
Lemma dw_row_read_window:forall F input zero weights params H N y x n,
 dw_inputs F input zero weights params H N ->0<=x->0<=n->x+n<=N+3->
 dw_window F(dw_row_base input zero H N y+4*x)n.
Proof.
 intros F input zero weights params H N y x n HI Hx Hn Hxn.
 pose proof(dw_input_windows _ _ _ _ _ _ _ HI)as[Wi[Wz _]].
 pose proof(dw_input_geometry _ _ _ _ _ _ _ HI)as[HH[HN _]].
 unfold dw_row_base;destruct(orb(y<?0)(H<=?y))eqn:E.
 - eapply dw_read_window_shift;[exact Wz|lia|lia|lia].
 - apply orb_false_iff in E;destruct E as[E1 E2];apply Z.ltb_ge in E1;apply Z.leb_gt in E2.
   replace(input+4*y*N+4*x)with(input+4*(y*N+x))by ring.
   eapply dw_read_window_shift;[exact Wi|nia|lia|nia].
Qed.
Lemma dw_row_read_present:forall F input zero weights params H N y x,
 dw_inputs F input zero weights params H N ->0<=x<N+3->
 dw_present F(dw_row_base input zero H N y+4*x).
Proof.
 intros;pose proof(dw_row_read_window F input zero weights params H N y 0(N+3)H0 ltac:(lia)ltac:(lia)ltac:(lia))as HW.
 rewrite Z.mul_0_r,Z.add_0_r in HW;eapply dw_window_lane;[exact HW|lia].
Qed.
Lemma dw_row_footprint:forall F input zero weights params H N y,
 dw_inputs F input zero weights params H N ->dw_footprint(dw_row_base input zero H N y)(N+3).
Proof.
 intros F input zero weights params H N y HI.
 pose proof(dw_input_geometry _ _ _ _ _ _ _ HI)as[HH[HN[Hi Hz]]].
 unfold dw_row_base;destruct(orb(y<?0)(H<=?y))eqn:E;[exact Hz|].
 apply orb_false_iff in E;destruct E as[E1 E2];apply Z.ltb_ge in E1;apply Z.leb_gt in E2.
 unfold dw_footprint in *;destruct Hi as[Hp[Hcount He]];repeat split;nia.
Qed.
Lemma dw_row_address_bounds:forall F input zero weights params H N y x,
 dw_inputs F input zero weights params H N ->0<=x<=N->
 0<dw_row_base input zero H N y+4*x<dw_u64_limit.
Proof.
 intros F input zero weights params H N y x HI Hx.
 pose proof(dw_row_footprint F input zero weights params H N y HI)as HW;unfold dw_footprint in HW;destruct HW as[Hp[Hc He]];lia.
Qed.
Lemma dw_legal_vl_positive:forall n vl,0<n->dw_vl_allowed n vl->0<vl<=n/\vl<=8.
Proof.
 unfold dw_vl_allowed;intros n vl Hn [[Hsmall->]|[[Hmid Hb]|[Hbig->]]];try lia.
 pose proof(Z.div_mod(n+1)2 ltac:(lia))as E;pose proof(Z.mod_pos_bound(n+1)2 ltac:(lia))as B;lia.
Qed.
Lemma dw_addresses_contains:forall output H N k,
 0<=k<H*N->In(output+4*k)(dw_addresses output H N).
Proof.
 intros output H N k Hk;unfold dw_addresses;apply in_map_iff;exists(Z.to_nat k);split.
 - rewrite Z2Nat.id by lia;reflexivity.
 - apply in_seq;split;[lia|]. change (Z.to_nat k<Z.to_nat(H*N))%nat;rewrite<-Z2Nat.inj_lt by lia;lia.
Qed.
Lemma dw_store_row_bounds:forall H y j,0<H->0<=y<H->0<=j->0<=dw_store_row H y j<H.
Proof. unfold dw_store_row;intros;pose proof(Z.le_min_l(y+j)(H-1));pose proof(Z.le_min_r(y+j)(H-1));split;[apply Z.min_glb;lia|lia]. Qed.
Lemma dw_output_row_window:forall output H N y j x n,
 dw_footprint output(H*N)->0<H->0<N->0<=y<H->0<=j->0<=x->0<=n->x+n<=N->
 dw_write_window(dw_addresses output H N)(output+4*(dw_store_row H y j*N+x))n.
Proof.
 intros output H N y j x n HF HH HN Hy Hj Hx Hn Hxn.
 pose proof(dw_store_row_bounds H y j HH Hy Hj)as Hr.
 unfold dw_footprint in HF;destruct HF as[Hp[Hcount He]].
 unfold dw_write_window;split;[nia|split;[lia|]].
 intros k Hk;replace(output+4*(dw_store_row H y j*N+x)+4*k)with(output+4*(dw_store_row H y j*N+x+k))by ring.
 apply dw_addresses_contains;nia.
Qed.
Print Assumptions dw_input_windows.
Print Assumptions dw_input_geometry.
Print Assumptions dw_read_window_shift.
Print Assumptions dw_row_read_window.
Print Assumptions dw_row_read_present.
Print Assumptions dw_row_footprint.
Print Assumptions dw_row_address_bounds.
Print Assumptions dw_legal_vl_positive.
Print Assumptions dw_addresses_contains.
Print Assumptions dw_store_row_bounds.
Print Assumptions dw_output_row_window.
