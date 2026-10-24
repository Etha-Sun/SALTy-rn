From Coq Require Import ZArith List Lia.
From FullDomainRvv Require Import FullState ActiveVector.
From FullDomainMemory Require Import ChunkState.
From SimpleC.SL Require Import SeparationLogic.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma active8_prefix_map : forall(f:Z->fp32)vl v0 v1 v2 v3 v4 v5 v6 v7,
 0<=vl<=8 ->active8 vl v0 v1 v2 v3 v4 v5 v6 v7(f 0)(f 1)(f 2)(f 3)(f 4)(f 5)(f 6)(f 7) ->
 sublist 0 vl[v0;v1;v2;v3;v4;v5;v6;v7] =
 map(fun j=>f(Z.of_nat j))(seq 0(Z.to_nat vl)).
Proof.
 intros f vl v0 v1 v2 v3 v4 v5 v6 v7 Hvl Hactive.
 unfold active8,active_value,bit_same in Hactive.
 destruct Hactive as[H0[H1[H2[H3[H4[H5[H6 H7]]]]]]].
 assert(vl=0\/vl=1\/vl=2\/vl=3\/vl=4\/vl=5\/vl=6\/vl=7\/vl=8)as Hcases by lia.
 repeat match goal with Hcase : _ \/ _ |- _=>destruct Hcase end;subst vl;
 cbv [sublist Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add firstn skipn seq map Z.of_nat Pos.of_succ_nat];
 repeat f_equal;first[apply H0;lia|apply H1;lia|apply H2;lia|apply H3;lia|apply H4;lia|apply H5;lia|apply H6;lia|apply H7;lia].
Qed.
Print Assumptions active8_prefix_map.
Lemma seq_map_shift : forall start len,
 map(fun j=>(start+j)%nat)(seq 0 len)=seq start len.
Proof.
 intros start len;revert start;induction len as[|len IH];intros start;[reflexivity|].
 cbn [seq map];rewrite Nat.add_0_r;f_equal.
 rewrite <-(seq_shift len 0),map_map,<-(IH(S start)).
 apply map_ext;intro j;lia.
Qed.
Lemma chunk_values_shift : forall A W k row done width lo hi,0<=done ->
 chunk_values A W k row done width lo hi =
 map(fun j=>full_cell A W k row(done+Z.of_nat j)lo hi)(seq 0(Z.to_nat width)).
Proof.
 intros;unfold chunk_values;rewrite <-(seq_map_shift(Z.to_nat done)(Z.to_nat width)),map_map.
 apply map_ext;intro j;rewrite Nat2Z.inj_add,Z2Nat.id by lia;reflexivity.
Qed.
Lemma active8_prefix_chunk : forall A W k row done vl lo hi v0 v1 v2 v3 v4 v5 v6 v7,
 0<=done ->0<=vl<=8 ->
 active8 vl v0 v1 v2 v3 v4 v5 v6 v7
 (full_cell A W k row(done+0)lo hi)(full_cell A W k row(done+1)lo hi)
 (full_cell A W k row(done+2)lo hi)(full_cell A W k row(done+3)lo hi)
 (full_cell A W k row(done+4)lo hi)(full_cell A W k row(done+5)lo hi)
 (full_cell A W k row(done+6)lo hi)(full_cell A W k row(done+7)lo hi) ->
 sublist 0 vl[v0;v1;v2;v3;v4;v5;v6;v7]=chunk_values A W k row done vl lo hi.
Proof.
 intros A W k row done vl lo hi v0 v1 v2 v3 v4 v5 v6 v7 Hd Hvl Ha.
 rewrite chunk_values_shift by lia.
 apply(active8_prefix_map(fun j=>full_cell A W k row(done+j)lo hi)vl v0 v1 v2 v3 v4 v5 v6 v7 Hvl Ha).
Qed.
Lemma full_active8_chunk : forall p A W k row done vl lo hi v0 v1 v2 v3 v4 v5 v6 v7,
 0<=done ->0<=vl<=8 ->
 active8 vl v0 v1 v2 v3 v4 v5 v6 v7
 (full_cell A W k row(done+0)lo hi)(full_cell A W k row(done+1)lo hi)
 (full_cell A W k row(done+2)lo hi)(full_cell A W k row(done+3)lo hi)
 (full_cell A W k row(done+4)lo hi)(full_cell A W k row(done+5)lo hi)
 (full_cell A W k row(done+6)lo hi)(full_cell A W k row(done+7)lo hi) ->
 FloatArray.full p vl(sublist 0 vl[v0;v1;v2;v3;v4;v5;v6;v7]) |--
 FloatArray.full p vl(chunk_values A W k row done vl lo hi).
Proof. intros;rewrite(active8_prefix_chunk A W k row done vl lo hi v0 v1 v2 v3 v4 v5 v6 v7 H H0 H1);apply derivable1_refl. Qed.
Print Assumptions seq_map_shift.
Print Assumptions chunk_values_shift.
Print Assumptions active8_prefix_chunk.
Print Assumptions full_active8_chunk.
Lemma output_panel_finish_active8 : forall c mr nc k b step A W lo hi v0 v1 v2 v3 v4 v5 v6 v7,
 1<=mr<=4 ->0<nc ->0<=b<panel_count nc ->0<=step<4 ->
 active8(panel_cols nc b)v0 v1 v2 v3 v4 v5 v6 v7
 (full_cell A W k(row_alias mr step)(8*b+0)lo hi)(full_cell A W k(row_alias mr step)(8*b+1)lo hi)
 (full_cell A W k(row_alias mr step)(8*b+2)lo hi)(full_cell A W k(row_alias mr step)(8*b+3)lo hi)
 (full_cell A W k(row_alias mr step)(8*b+4)lo hi)(full_cell A W k(row_alias mr step)(8*b+5)lo hi)
 (full_cell A W k(row_alias mr step)(8*b+6)lo hi)(full_cell A W k(row_alias mr step)(8*b+7)lo hi) ->
 output_frame c mr nc k b step(row_alias mr step)A W lo hi **
 FloatArray.full(c+(row_alias mr step*nc+8*b)*sizeof(FLOAT))(panel_cols nc b)
 (sublist 0(panel_cols nc b)[v0;v1;v2;v3;v4;v5;v6;v7]) |--
 output_panel c mr nc k b(step+1)A W lo hi.
Proof.
 intros c mr nc k b step A W lo hi v0 v1 v2 v3 v4 v5 v6 v7 Hmr Hnc Hb Hstep Hactive.
 pose proof(valid_panel_start nc b Hnc Hb)as Hstart.
 pose proof(panel_width_range nc b Hnc Hb)as Hwidth.
 rewrite(active8_prefix_chunk A W k(row_alias mr step)(8*b)(panel_cols nc b)lo hi v0 v1 v2 v3 v4 v5 v6 v7 ltac:(lia)ltac:(lia)Hactive).
 apply output_panel_finish;assumption.
Qed.
Lemma missing_active_lane_rejected :
 ~active8 1 fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero
 canonical_qnan fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero.
Proof.
 intro H;unfold active8,active_value,bit_same in H;destruct H as[H _].
 specialize(H ltac:(lia));unfold fp32_zero,canonical_qnan in H;discriminate.
Qed.
Lemma inactive_lanes_unconstrained :
 active8 1 fp32_zero canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan
 fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero fp32_zero.
Proof. unfold active8,active_value,bit_same;repeat split;intros H;try reflexivity;lia. Qed.
Print Assumptions output_panel_finish_active8.
Print Assumptions missing_active_lane_rejected.
Print Assumptions inactive_lanes_unconstrained.
