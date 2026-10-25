From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export MainGeometry.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_tiles_run_step:forall n F G group O,0<=n->
 pw_tiles_run(n+1)F G group O=pw_tile F G group n(pw_tiles_run n F G group O).
Proof.
 intros;unfold pw_tiles_run;rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r;cbn[pw_tiles_run_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma pw_group_state_zero:forall F G O,pw_group_state F G O 0=O.
Proof. reflexivity. Qed.
Lemma pw_tile_state_zero:forall F G O group,pw_tile_state F G O group 0=pw_group_state F G O group.
Proof. reflexivity. Qed.
Lemma pw_group_state_step:forall F G O group,0<=group->
 pw_group_state F G O(group+1)=pw_tile_state F G O group(pw_tiles G).
Proof.
 intros;unfold pw_group_state,pw_tile_state,pw_groups_run.
 rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r;cbn[pw_groups_run_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma pw_tile_state_step:forall F G O group tile,0<=tile->
 pw_tile_state F G O group(tile+1)=pw_tile F G group tile(pw_tile_state F G O group tile).
Proof. intros;unfold pw_tile_state;rewrite pw_tiles_run_step by lia;reflexivity. Qed.
Lemma pw_bias_at_initial:forall G,pw_bias_at G 0 0=pw_bias G.
Proof. intro G;unfold pw_bias_at;destruct(Z.eqb_spec(pw_bias G)0);[lia|ring]. Qed.
Lemma pw_bias_at_nonzero:forall F W G group channel,
 pw_program_storage F W G->0<=group->0<=channel->pw_bias G<>0->
 0<pw_bias_at G group channel.
Proof.
 intros F W G group channel Hv Hg Hch Hnz.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc Hrest]].
 assert(Hb:0<pw_bias G).
 { pw_unpack Hv;match goal with H:pw_bias G=0\/_ |- _=>destruct H as[H|H];[contradiction|tauto]end. }
 unfold pw_bias_at;destruct(Z.eqb_spec(pw_bias G)0);[contradiction|nia].
Qed.
Lemma pw_bias_at_null_iff:forall F W G group channel,
 pw_program_storage F W G->0<=group->0<=channel->
 (pw_bias_at G group channel=0<->pw_bias G=0).
Proof.
 intros F W G group channel Hv Hg Hch;split.
 - intro Hcur;destruct(Z.eqb_spec(pw_bias G)0);[assumption|].
   pose proof(pw_bias_at_nonzero F W G group channel Hv Hg Hch n);lia.
 - intro Hbase;unfold pw_bias_at;rewrite Hbase;reflexivity.
Qed.
Lemma pw_bias_at_step_present:forall G group channel count,
 pw_bias_at G group channel<>0->
 pw_bias_at G group channel+4*count=pw_bias_at G group(channel+count).
Proof. intros;unfold pw_bias_at in *;destruct(Z.eqb(pw_bias G)0);[contradiction|ring]. Qed.
Lemma pw_bias_at_next_group:forall G group,
 pw_bias_at G group(pw_channels G)=pw_bias_at G(group+1)0.
Proof. intros;unfold pw_bias_at;destruct(Z.eqb(pw_bias G)0);[reflexivity|f_equal;ring]. Qed.
Lemma pw_header_at_tile:forall F W G group tile count p O,
 pw_program_storage F W G->0<=group->0<=tile->
 pw_header_run F(pw_bias_at G group(2*tile))p count O=
 pw_header F(negb(Z.eqb(pw_bias G)0))(Z.eqb count 2)(pw_tile_bias G group tile)p O.
Proof.
 intros F W G group tile count p O Hv Hg Ht.
 destruct(Z.eqb_spec(pw_bias G)0)as[Hz|Hnz].
 - unfold pw_header_run,pw_bias_at,pw_header;rewrite Hz;reflexivity.
 - assert(Hcur:pw_bias_at G group(2*tile)<>0)by(pose proof(pw_bias_at_nonzero F W G group(2*tile)Hv Hg ltac:(lia)Hnz);lia).
   unfold pw_header_run;destruct(Z.eqb_spec(pw_bias_at G group(2*tile))0);[contradiction|].
   unfold pw_bias_at;destruct(Z.eqb_spec(pw_bias G)0);[contradiction|].
   cbn[negb];unfold pw_tile_bias.
   replace(pw_bias G+4*(group*pw_channels G+2*tile))with(pw_bias G+(group*pw_channels G+2*tile)*4)by ring;reflexivity.
Qed.
Lemma pw_pair_tile_progress:forall F W G O group tile,
 pw_program_storage F W G->0<=group->0<=tile->2*tile+2<=pw_channels G->
 pw_pair_run(pw_depth G)F(pw_tile_weight G group tile)
 (pw_tile_weight G group tile+4*pw_depth G)(pw_tile_output G group tile+8)
 (pw_header_run F(pw_bias_at G group(2*tile))(pw_tile_output G group tile)2(pw_tile_state F G O group tile))=
 pw_tile_state F G O group(tile+1).
Proof.
 intros;rewrite pw_tile_state_step by lia;unfold pw_tile.
 destruct(Z.ltb_spec(2*tile+1)(pw_channels G));[|lia].
 rewrite(pw_header_at_tile F W G group tile 2)by assumption;reflexivity.
Qed.
Lemma pw_odd_tile_progress:forall F W G O group tile,
 pw_program_storage F W G->0<=group->0<=tile->2*tile+1=pw_channels G->
 pw_odd_run(pw_depth G)F(pw_tile_weight G group tile)(pw_tile_output G group tile+8)
 (pw_header_run F(pw_bias_at G group(2*tile))(pw_tile_output G group tile)1(pw_tile_state F G O group tile))=
 pw_tile_state F G O group(tile+1).
Proof.
 intros;rewrite pw_tile_state_step by lia;unfold pw_tile.
 destruct(Z.ltb_spec(2*tile+1)(pw_channels G));[lia|].
 rewrite(pw_header_at_tile F W G group tile 1)by assumption;reflexivity.
Qed.
Print Assumptions pw_tiles_run_step.
Print Assumptions pw_group_state_zero.
Print Assumptions pw_tile_state_zero.
Print Assumptions pw_group_state_step.
Print Assumptions pw_tile_state_step.
Print Assumptions pw_bias_at_initial.
Print Assumptions pw_bias_at_nonzero.
Print Assumptions pw_bias_at_null_iff.
Print Assumptions pw_bias_at_step_present.
Print Assumptions pw_bias_at_next_group.
Print Assumptions pw_header_at_tile.
Print Assumptions pw_pair_tile_progress.
Print Assumptions pw_odd_tile_progress.
