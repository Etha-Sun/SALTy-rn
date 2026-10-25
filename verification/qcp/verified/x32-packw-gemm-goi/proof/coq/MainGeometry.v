From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export MainModel AccessFacts ControlBounds.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Ltac pw_unpack H:=
 unfold pw_program_storage,pw_call_inputs,pw_input_map_valid in H;
 repeat match goal with K:_ /\ _ |- _=>destruct K end.
Lemma pw_tiles_arithmetic:forall G,0<pw_channels G->
 0<pw_tiles G /\2*pw_tiles G-1<=pw_channels G<=2*pw_tiles G.
Proof.
 intros G Hnc;unfold pw_tiles.
 pose proof(Z.div_mod(pw_channels G+1)2 ltac:(lia)).
 pose proof(Z.mod_pos_bound(pw_channels G+1)2 ltac:(lia));lia.
Qed.
Lemma pw_storage_sizes:forall F W G,pw_program_storage F W G->
 0<pw_groups G<18446744073709551616 /\
 0<pw_channels G<18446744073709551616 /\
 0<pw_depth G<18446744073709551616 /\
 0<=pw_extra_bytes G<18446744073709551616 /\
 0<pw_tiles G /\ 0<pw_tile_bytes G.
Proof.
 intros F W G Hv;pw_unpack Hv.
 pose proof(pw_tiles_arithmetic G ltac:(lia));unfold pw_tile_bytes;intuition lia.
Qed.
Lemma pw_storage_bounds:forall F W G,pw_program_storage F W G->
 (0<pw_output_base G /\pw_output_base G+pw_output_bytes G<18446744073709551616) /\
 (0<pw_weights G /\pw_weights G+4*pw_groups G*pw_channels G*pw_depth G<18446744073709551616).
Proof. intros F W G H;pw_unpack H;intuition. Qed.
Definition pw_tile_words(G:PWCall):Z:=2*(pw_depth G+1)+pw_extra_bytes G/4.
Lemma pw_tile_words_exact:forall F W G,pw_program_storage F W G->
 pw_tile_bytes G=4*pw_tile_words G /\
 pw_output_bytes G/4=pw_groups G*pw_tiles G*pw_tile_words G /\
 0<=pw_extra_bytes G/4 /\0<pw_tile_words G.
Proof.
 intros F W G H;pose proof(pw_storage_sizes F W G H)as Hsizes.
 assert(Hgap:0<=pw_extra_bytes G /\pw_extra_bytes G mod 4=0)by(pw_unpack H;intuition lia).
 pose proof(Z.div_mod(pw_extra_bytes G)4 ltac:(lia)).
 assert(Hquot:0<=pw_extra_bytes G/4)by(apply Z.div_pos;lia).
 assert(Htile:pw_tile_bytes G=4*pw_tile_words G)by(unfold pw_tile_bytes,pw_tile_words;lia).
 split;[assumption|];split.
 - unfold pw_output_bytes;rewrite Htile.
   replace(pw_groups G*pw_tiles G*(4*pw_tile_words G))with((pw_groups G*pw_tiles G*pw_tile_words G)*4)by ring.
   rewrite Z.div_mul by lia;reflexivity.
 - unfold pw_tile_words;intuition lia.
Qed.
Lemma pw_tile_output_span:forall F W G group tile,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile<pw_tiles G->
 0<pw_tile_output G group tile /\
 pw_tile_output G group tile+pw_tile_bytes G<=pw_output_base G+pw_output_bytes G.
Proof.
 intros F W G group tile Hv Hg Ht.
 pose proof(pw_storage_sizes F W G Hv)as Hs;destruct Hs as[Hgs[Hnc[Hkc[Hgap[Htiles Hbytes]]]]].
 pose proof(pw_storage_bounds F W G Hv)as[[Hbase Htotal]Hw].
 pose proof(pw_block_index_bound(pw_groups G)(pw_tiles G)group tile ltac:(lia)ltac:(lia)Hg ltac:(lia))as Hi.
 pose proof(pw_block_index_bound(pw_groups G)(pw_tiles G)group(tile+1)ltac:(lia)ltac:(lia)Hg ltac:(lia))as Hj.
 pose proof(Z.mul_le_mono_nonneg_r(group*pw_tiles G+(tile+1))(pw_groups G*pw_tiles G)(pw_tile_bytes G)ltac:(lia)ltac:(lia))as Hmul.
 unfold pw_tile_output,pw_output_bytes;split;nia.
Qed.
Lemma pw_tile_window:forall F W G group tile offset count,
 pw_program_storage F W G->0<=group<pw_groups G->0<=tile<pw_tiles G->
 0<=offset->0<=count->offset+count<=pw_tile_words G->
 pw_write_window W(pw_tile_output G group tile+4*offset)count.
Proof.
 intros F W G group tile offset count Hv Hg Ht Ho Hc Hend.
 pose proof(pw_tile_output_span F W G group tile Hv Hg Ht)as[Hp Hspan].
 pose proof(pw_tile_words_exact F W G Hv)as[Htile[Htotal[Hgap Hwords]]].
 destruct Hv as[Hcall[Hnd Howned]].
 unfold pw_write_window;split;[lia|];split;[assumption|];intros i Hi.
 unfold pw_tile_output;rewrite Htile.
 replace(pw_output_base G+(group*pw_tiles G+tile)*(4*pw_tile_words G)+4*offset+4*i)
 with(pw_output_base G+4*((group*pw_tiles G+tile)*pw_tile_words G+offset+i))by ring.
 apply Howned;rewrite Htotal.
 assert(Hidx:0<=group*pw_tiles G+tile)by nia.
 assert(Hidxend:group*pw_tiles G+tile+1<=pw_groups G*pw_tiles G)by nia.
 pose proof(Z.mul_le_mono_nonneg_r(group*pw_tiles G+tile+1)(pw_groups G*pw_tiles G)(pw_tile_words G)ltac:(lia)Hidxend).
 nia.
Qed.
Print Assumptions pw_tiles_arithmetic.
Print Assumptions pw_storage_sizes.
Print Assumptions pw_storage_bounds.
Print Assumptions pw_tile_words_exact.
Print Assumptions pw_tile_output_span.
Print Assumptions pw_tile_window.
