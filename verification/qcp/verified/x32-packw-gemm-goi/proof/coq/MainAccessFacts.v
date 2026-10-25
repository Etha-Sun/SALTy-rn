From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export MainGeometry TileAccessFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_tile_input_span:forall F W G group tile count,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile->0<count->
 2*tile+count<=pw_channels G->
 0<pw_tile_weight G group tile /\
 pw_tile_weight G group tile+4*count*pw_depth G<=pw_weights G+4*pw_groups G*pw_channels G*pw_depth G.
Proof.
 intros F W G group tile count Hv Hg Ht Hc Hend.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc Hrest]]].
 pose proof(pw_storage_bounds F W G Hv)as[Hout[Hw Hwend]].
 pose proof(pw_window_index_bound(pw_groups G)(pw_channels G)group(2*tile)count(pw_depth G)ltac:(lia)ltac:(lia)Hg ltac:(lia)ltac:(lia)Hend ltac:(lia))as[Hlo Hhi].
 unfold pw_tile_weight;split;nia.
Qed.
Lemma pw_tile_input_window:forall F W G group tile count,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile->0<count->
 2*tile+count<=pw_channels G->
 pw_window F(pw_tile_weight G group tile)(count*pw_depth G).
Proof.
 intros F W G group tile count Hv Hg Ht Hc Hend.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc Hrest]]].
 assert(Hfull:pw_window F(pw_weights G)(pw_groups G*pw_channels G*pw_depth G))by(pw_unpack Hv;assumption).
 pose proof(pw_window_index_bound(pw_groups G)(pw_channels G)group(2*tile)count(pw_depth G)ltac:(lia)ltac:(lia)Hg ltac:(lia)ltac:(lia)Hend ltac:(lia))as[Hlo Hhi].
 unfold pw_tile_weight;replace(pw_weights G+(group*pw_channels G+2*tile)*pw_depth G*4)
 with(pw_weights G+4*((group*pw_channels G+2*tile)*pw_depth G))by ring.
 apply pw_window_shift with(cap:=pw_groups G*pw_channels G*pw_depth G);assumption||nia.
Qed.
Lemma pw_tile_pair_pre:forall F W G group tile,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile->2*tile+2<=pw_channels G->
 pw_pair_pre F W(pw_tile_weight G group tile)(pw_tile_weight G group tile+4*pw_depth G)
  (pw_tile_output G group tile+8)(pw_depth G).
Proof.
 intros F W G group tile Hv Hg Ht Hend.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc[Hgap[Htiles Hbytes]]]]].
 pose proof(pw_tiles_arithmetic G ltac:(lia))as Htilearith.
 assert(Htile:0<=tile<pw_tiles G)by lia.
 pose proof(pw_tile_input_span F W G group tile 2 Hv Hg Ht ltac:(lia)Hend)as[Ha Hae].
 pose proof(pw_tile_input_window F W G group tile 2 Hv Hg Ht ltac:(lia)Hend)as Haw.
 pose proof(pw_tile_output_span F W G group tile Hv Hg Htile)as[Hp Hpe].
 pose proof(pw_storage_bounds F W G Hv)as[[Hout Houtend][Hw Hwend]].
 pose proof(pw_tile_words_exact F W G Hv)as[Hbt[Htw[Hq Hwords]]].
 assert(Hpw:pw_write_window W(pw_tile_output G group tile+8)(2*pw_depth G)).
 { replace(pw_tile_output G group tile+8)with(pw_tile_output G group tile+4*2)by ring.
   apply pw_tile_window with(F:=F)(offset:=2);try assumption;unfold pw_tile_words in *;lia. }
 assert(Hnd:NoDup W)by(destruct Hv as[_[Hnd _]];assumption).
 assert(Haone:pw_window F(pw_tile_weight G group tile)(pw_depth G)).
 { replace(pw_tile_weight G group tile)with(pw_tile_weight G group tile+4*0)at 1 by ring.
   apply pw_window_shift with(cap:=2*pw_depth G);assumption||lia. }
 assert(Hbone:pw_window F(pw_tile_weight G group tile+4*pw_depth G)(pw_depth G)).
 { apply pw_window_shift with(cap:=2*pw_depth G);assumption||lia. }
 unfold pw_tile_bytes in Hpe;unfold pw_pair_pre;repeat first[assumption|split|lia].
Qed.
Lemma pw_tile_odd_pre:forall F W G group tile,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile->2*tile+1<=pw_channels G->
 pw_odd_pre F W(pw_tile_weight G group tile)(pw_tile_output G group tile+8)(pw_depth G).
Proof.
 intros F W G group tile Hv Hg Ht Hend.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc[Hgap[Htiles Hbytes]]]]].
 pose proof(pw_tiles_arithmetic G ltac:(lia))as Htilearith.
 assert(Htile:0<=tile<pw_tiles G)by lia.
 pose proof(pw_tile_input_span F W G group tile 1 Hv Hg Ht ltac:(lia)Hend)as[Ha Hae].
 pose proof(pw_tile_input_window F W G group tile 1 Hv Hg Ht ltac:(lia)Hend)as Haw.
 rewrite Z.mul_1_l in Haw.
 pose proof(pw_tile_output_span F W G group tile Hv Hg Htile)as[Hp Hpe].
 pose proof(pw_storage_bounds F W G Hv)as[[Hout Houtend][Hw Hwend]].
 pose proof(pw_tile_words_exact F W G Hv)as[Hbt[Htw[Hq Hwords]]].
 assert(Hpw:pw_write_window W(pw_tile_output G group tile+8)(2*pw_depth G)).
 { replace(pw_tile_output G group tile+8)with(pw_tile_output G group tile+4*2)by ring.
   apply pw_tile_window with(F:=F)(offset:=2);try assumption;unfold pw_tile_words in *;lia. }
 assert(Hnd:NoDup W)by(destruct Hv as[_[Hnd _]];assumption).
 unfold pw_tile_bytes in Hpe;unfold pw_odd_pre;repeat first[assumption|split|lia].
Qed.
Lemma pw_storage_map_nodup:forall F W G,pw_program_storage F W G->pw_map_nodup F.
Proof.
 intros F W G Hv;assert(Hfst:NoDup(map fst F))by(pw_unpack Hv;assumption).
 unfold pw_map_nodup;apply NoDup_map_inv in Hfst;assumption.
Qed.
Lemma pw_tile_header_pre:forall F W G group tile count,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile->
 (count=1\/count=2)->2*tile+count<=pw_channels G->
 pw_header_pre F W(pw_bias_at G group(2*tile))(pw_tile_output G group tile)count.
Proof.
 intros F W G group tile count Hv Hg Ht Hc Hend.
 pose proof(pw_storage_sizes F W G Hv)as[Hgs[Hnc[Hkc[Hgap[Htiles Hbytes]]]]].
 pose proof(pw_tiles_arithmetic G ltac:(lia))as Htilearith.
 assert(Htile:0<=tile<pw_tiles G)by(destruct Hc;lia).
 pose proof(pw_storage_map_nodup F W G Hv)as HF.
 assert(Hpw:pw_write_window W(pw_tile_output G group tile)2).
 { replace(pw_tile_output G group tile)with(pw_tile_output G group tile+4*0)at 1 by ring.
   apply pw_tile_window with(F:=F)(offset:=0);try assumption;unfold pw_tile_words;pose proof(Z.div_pos(pw_extra_bytes G)4 ltac:(lia)ltac:(lia));lia. }
 assert(Hnd:NoDup W)by(destruct Hv as[_[Hnd _]];assumption).
 unfold pw_header_pre;split;[assumption|];split;[assumption|];split;[assumption|];split;[assumption|].
 unfold pw_bias_at;destruct(Z.eqb_spec(pw_bias G)0)as[Hz|Hnz];[left;reflexivity|right].
 assert(Hbias:pw_window F(pw_bias G)(pw_groups G*pw_channels G)).
 { pw_unpack Hv;match goal with H:pw_bias G=0\/_ |- _=>destruct H as[H|H];[contradiction|destruct H as[Hpos[Halign[Hbound Hwindow]]];exact Hwindow]end. }
 apply pw_window_shift with(cap:=pw_groups G*pw_channels G);try assumption;try(destruct Hc;lia).
 pose proof(pw_block_index_bound(pw_groups G)(pw_channels G)group(2*tile+count)ltac:(lia)ltac:(lia)Hg ltac:(destruct Hc;lia));lia.
Qed.
Print Assumptions pw_tile_input_span.
Print Assumptions pw_tile_input_window.
Print Assumptions pw_tile_pair_pre.
Print Assumptions pw_tile_odd_pre.
Print Assumptions pw_storage_map_nodup.
Print Assumptions pw_tile_header_pre.
