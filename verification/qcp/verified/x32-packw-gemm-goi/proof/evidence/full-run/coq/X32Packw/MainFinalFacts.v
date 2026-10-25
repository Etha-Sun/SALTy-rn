From Coq Require Import ZArith List Lia.
From X32Packw Require Export MainAccessFacts MainProgressFacts MainPointerFacts.
Local Open Scope Z_scope.
Lemma pw_pair_tile_progress_null:forall F W G O group tile,
 pw_program_storage F W G->0<=group->0<=tile->2*tile+2<=pw_channels G->
 pw_bias_at G group(2*tile)=0->
 pw_pair_run(pw_depth G)F(pw_tile_weight G group tile)
 (pw_tile_weight G group tile+4*pw_depth G)(pw_tile_output G group tile+8)
 (pw_header_run F 0(pw_tile_output G group tile)2(pw_tile_state F G O group tile))=
 pw_tile_state F G O group(tile+1).
Proof. intros;rewrite <-H3;apply pw_pair_tile_progress with(W:=W);assumption. Qed.
Lemma pw_odd_tile_progress_null:forall F W G O group tile,
 pw_program_storage F W G->0<=group->0<=tile->2*tile+1=pw_channels G->
 pw_bias_at G group(2*tile)=0->
 pw_odd_run(pw_depth G)F(pw_tile_weight G group tile)(pw_tile_output G group tile+8)
 (pw_header_run F 0(pw_tile_output G group tile)1(pw_tile_state F G O group tile))=
 pw_tile_state F G O group(tile+1).
Proof. intros;rewrite <-H3;apply pw_odd_tile_progress with(W:=W);assumption. Qed.
Lemma pw_tile_finished_even:forall G tile,
 0<pw_channels G->pw_channels G=2*tile->tile=pw_tiles G.
Proof. intros;pose proof(pw_tiles_arithmetic G H);lia. Qed.
Lemma pw_tile_finished_odd:forall G tile,
 0<pw_channels G->pw_channels G=2*tile+1->tile+1=pw_tiles G.
Proof. intros;pose proof(pw_tiles_arithmetic G H);lia. Qed.
Print Assumptions pw_pair_tile_progress_null.
Print Assumptions pw_odd_tile_progress_null.
Print Assumptions pw_tile_finished_even.
Print Assumptions pw_tile_finished_odd.
