From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* Same four physical-row resources as FullState; stage follows NEON's
   literal full8 row order or 4/2/1 tail phases. No duplicate alias ownership. *)
Definition neon_phase_progress (base phase width step row:Z):Z :=
 base+phase+(if row <? step then width else 0).
Definition neon_phase_state (c mr nc k base phase width step:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 output_row c mr nc k (neon_phase_progress base phase width step 0) 0 A W lo hi **
 output_row c mr nc k (neon_phase_progress base phase width step 1) 1 A W lo hi **
 output_row c mr nc k (neon_phase_progress base phase width step 2) 2 A W lo hi **
 output_row c mr nc k (neon_phase_progress base phase width step 3) 3 A W lo hi.
Definition neon_phase_frame_row (c mr nc k base phase width step target row:Z)
 (A W:list fp32)(lo hi:fp32):Assertion :=
 if Z.eqb row target then
 FloatArray.seg c (row*nc) (row*nc+base+phase)
  (full_row_values A W k row (base+phase) lo hi) **
 FloatArray.undef_seg c (row*nc+base+phase+width) ((row+1)*nc)
 else output_row c mr nc k (neon_phase_progress base phase width step row) row A W lo hi.
Definition neon_phase_frame (c mr nc k base phase width step target:Z)
 (A W:list fp32)(lo hi:fp32):Assertion :=
 neon_phase_frame_row c mr nc k base phase width step target 0 A W lo hi **
 neon_phase_frame_row c mr nc k base phase width step target 1 A W lo hi **
 neon_phase_frame_row c mr nc k base phase width step target 2 A W lo hi **
 neon_phase_frame_row c mr nc k base phase width step target 3 A W lo hi.
Lemma neon_phase_start : forall c mr nc k base phase width A W lo hi,
 neon_phase_state c mr nc k base phase width 0 A W lo hi =
 output_state c mr nc k (base+phase) A W lo hi.
Proof. intros;unfold neon_phase_state,neon_phase_progress,output_state;
 cbn[Z.ltb];rewrite !Z.add_0_r;reflexivity. Qed.
Lemma neon_phase_end : forall c mr nc k base phase width A W lo hi,
 neon_phase_state c mr nc k base phase width 4 A W lo hi =
 output_state c mr nc k (base+phase+width) A W lo hi.
Proof. reflexivity. Qed.
Print Assumptions neon_phase_start.
Print Assumptions neon_phase_end.
