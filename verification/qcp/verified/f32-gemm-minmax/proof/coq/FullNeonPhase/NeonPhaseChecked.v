From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState FullModel.
From FullDomainNeon Require Import NeonStoreState.
From FullDomainMemory Require Import RowWindows ChunkState.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* All physical geometries of one original four-row NEON tile. No restriction
   on width/base/K/fp32; mr=1..4 and step=0..3 are the original control domain. *)
Lemma neon_phase_prepare_0 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_state c mr nc k base phase width 0 A W lo hi |--
 neon_phase_frame c mr nc k base phase width 0 (row_alias mr 0) A W lo hi ** FloatArray.undef_full (c+(row_alias mr 0*nc+(base+phase))*sizeof(FLOAT)) width.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 2 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 2 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 3 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 3 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 4 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 4 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
Qed.
Lemma neon_phase_finish_0 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_frame c mr nc k base phase width 0 (row_alias mr 0) A W lo hi ** FloatArray.full (c+(row_alias mr 0*nc+(base+phase))*sizeof(FLOAT)) width
 (chunk_values A W k (row_alias mr 0)(base+phase)width lo hi) |--
 neon_phase_state c mr nc k base phase width 1 A W lo hi.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 2 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 2 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 3 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 3 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 4 0) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 4 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
Qed.
Lemma neon_phase_prepare_1 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_state c mr nc k base phase width 1 A W lo hi |--
 neon_phase_frame c mr nc k base phase width 1 (row_alias mr 1) A W lo hi ** FloatArray.undef_full (c+(row_alias mr 1*nc+(base+phase))*sizeof(FLOAT)) width.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 1) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 2 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 3 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 3 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 4 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 4 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
Qed.
Lemma neon_phase_finish_1 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_frame c mr nc k base phase width 1 (row_alias mr 1) A W lo hi ** FloatArray.full (c+(row_alias mr 1*nc+(base+phase))*sizeof(FLOAT)) width
 (chunk_values A W k (row_alias mr 1)(base+phase)width lo hi) |--
 neon_phase_state c mr nc k base phase width 2 A W lo hi.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 1) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 2 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 3 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 3 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 4 1) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 4 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
Qed.
Lemma neon_phase_prepare_2 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_state c mr nc k base phase width 2 A W lo hi |--
 neon_phase_frame c mr nc k base phase width 2 (row_alias mr 2) A W lo hi ** FloatArray.undef_full (c+(row_alias mr 2*nc+(base+phase))*sizeof(FLOAT)) width.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 2) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 2 2) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 3 2) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 3 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 4 2) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 4 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
Qed.
Lemma neon_phase_finish_2 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_frame c mr nc k base phase width 2 (row_alias mr 2) A W lo hi ** FloatArray.full (c+(row_alias mr 2*nc+(base+phase))*sizeof(FLOAT)) width
 (chunk_values A W k (row_alias mr 2)(base+phase)width lo hi) |--
 neon_phase_state c mr nc k base phase width 3 A W lo hi.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 2) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 2 2) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 3 2) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 3 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 4 2) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 4 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
Qed.
Lemma neon_phase_prepare_3 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_state c mr nc k base phase width 3 A W lo hi |--
 neon_phase_frame c mr nc k base phase width 3 (row_alias mr 3) A W lo hi ** FloatArray.undef_full (c+(row_alias mr 3*nc+(base+phase))*sizeof(FLOAT)) width.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 3) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 2 3) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 3 3) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_repeat_full c 3 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
 - replace (row_alias 4 3) with 3 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sep_apply(output_row_prepare_fresh_full c 4 nc k 3 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   entailer!.
Qed.
Lemma neon_phase_finish_3 : forall c mr nc k base phase width A W lo hi,
 1<=mr<=4 ->0<=base+phase ->0<=width ->base+phase+width<=nc ->
 neon_phase_frame c mr nc k base phase width 3 (row_alias mr 3) A W lo hi ** FloatArray.full (c+(row_alias mr 3*nc+(base+phase))*sizeof(FLOAT)) width
 (chunk_values A W k (row_alias mr 3)(base+phase)width lo hi) |--
 neon_phase_state c mr nc k base phase width 4 A W lo hi.
Proof.
 intros c mr nc k base phase width A W lo hi Hmr Hd Hw Hbound.
 assert(Hcases:mr=1 \/ mr=2 \/ mr=3 \/ mr=4)by lia.
 destruct Hcases as [Hcase | [Hcase | [Hcase | Hcase]]];subst mr.
 - replace (row_alias 1 3) with 0 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 1 nc k 0 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 2 3) with 1 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 2 nc k 1 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 3 3) with 2 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 3 nc k 2 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
 - replace (row_alias 4 3) with 3 by reflexivity.
   unfold neon_phase_state,neon_phase_frame.
   unfold neon_phase_frame_row,neon_phase_progress;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont Z.eqb Pos.eqb].
   repeat rewrite Z.add_0_r.
   replace (0*nc+base+phase) with (0*nc+(base+phase)) by ring.
   replace (1*nc+base+phase) with (1*nc+(base+phase)) by ring.
   replace (2*nc+base+phase) with (2*nc+(base+phase)) by ring.
   replace (3*nc+base+phase) with (3*nc+(base+phase)) by ring.
   sepcon_assoc_change.
   sep_apply(output_row_finish_full c 4 nc k 3 (base+phase) width A W lo hi ltac:(lia) Hd Hw Hbound).
   unfold output_row;cbn[Z.ltb Z.compare Pos.compare Pos.compare_cont].
   entailer!.
Qed.
Print Assumptions neon_phase_prepare_0.
Print Assumptions neon_phase_finish_0.
Print Assumptions neon_phase_prepare_1.
Print Assumptions neon_phase_finish_1.
Print Assumptions neon_phase_prepare_2.
Print Assumptions neon_phase_finish_2.
Print Assumptions neon_phase_prepare_3.
Print Assumptions neon_phase_finish_3.
