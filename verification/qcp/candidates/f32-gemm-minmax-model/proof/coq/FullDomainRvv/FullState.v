From Coq Require Import ZArith List.
From GemmRvv Require Export Model SLBounds.
From FullDomainRvv Require Export FullModel.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition active_value (vl lane:Z)(actual expected:fp32):Prop := lane<vl -> bit_same actual expected.
Definition active_mask (vl lane actual expected:Z):Prop := lane<vl -> actual=expected.
Definition full_acc (A W:list fp32)(k row b lane d:Z):fp32 :=
 fold_left (fun acc t=>fma_rne (rvv_at A (row*k+Z.of_nat t))
 (rvv_at W (panel_wbase k b+8*(Z.of_nat t+1)+lane)) acc)
 (seq 0(Z.to_nat d)) (rvv_at W(panel_wbase k b+lane)).
Definition full_cell (A W:list fp32)(k row col:Z)(lo hi:fp32):fp32 :=
 neon_clamp(full_acc A W k row (col/8)(col mod 8)k)lo hi.
Definition full_row_values (A W:list fp32)(k row done:Z)(lo hi:fp32):list fp32 :=
 map(fun j=>full_cell A W k row (Z.of_nat j)lo hi)(seq 0(Z.to_nat done)).
Definition output_row (c mr nc k done row:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 if row <? mr then
 FloatArray.seg c (row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c (row*nc+done)((row+1)*nc)
 else FloatArray.undef_seg c (row*nc)((row+1)*nc).
Definition output_state (c mr nc k done:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 output_row c mr nc k done 0 A W lo hi ** output_row c mr nc k done 1 A W lo hi **
 output_row c mr nc k done 2 A W lo hi ** output_row c mr nc k done 3 A W lo hi.
Definition row_progress (nc b step row:Z):Z :=
 if row <? step then processed_cols nc(b+1) else processed_cols nc b.
Definition output_panel (c mr nc k b step:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 output_row c mr nc k (row_progress nc b step 0) 0 A W lo hi **
 output_row c mr nc k (row_progress nc b step 1) 1 A W lo hi **
 output_row c mr nc k (row_progress nc b step 2) 2 A W lo hi **
 output_row c mr nc k (row_progress nc b step 3) 3 A W lo hi.
Definition frame_row (c mr nc k b step target row:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 if Z.eqb row target then
 FloatArray.seg c (row*nc)(row*nc+8*b)(full_row_values A W k row (8*b) lo hi) **
 FloatArray.undef_seg c (row*nc+processed_cols nc(b+1))((row+1)*nc)
 else output_row c mr nc k (row_progress nc b step row) row A W lo hi.
Definition output_frame (c mr nc k b step target:Z)(A W:list fp32)(lo hi:fp32):Assertion :=
 frame_row c mr nc k b step target 0 A W lo hi ** frame_row c mr nc k b step target 1 A W lo hi **
 frame_row c mr nc k b step target 2 A W lo hi ** frame_row c mr nc k b step target 3 A W lo hi.
Lemma active_value_same : forall vl lane x, active_value vl lane x x.
Proof. unfold active_value,bit_same;auto. Qed.
Print Assumptions active_value_same.

Definition outer_cursor_state (mr nc0 kc nc a c a0 a1 a2 a3 c0 c1 c2 c3:Z):Prop :=
 nc=0 \/ ((nc0-nc) mod 8=0 /\
 a0=a+4*(row_alias mr 0*(kc/4)) /\ a1=a+4*(row_alias mr 1*(kc/4)) /\
 a2=a+4*(row_alias mr 2*(kc/4)) /\ a3=a+4*(row_alias mr 3*(kc/4)) /\
 c0=c+4*(row_alias mr 0*nc0+(nc0-nc)) /\ c1=c+4*(row_alias mr 1*nc0+(nc0-nc)) /\
 c2=c+4*(row_alias mr 2*nc0+(nc0-nc)) /\ c3=c+4*(row_alias mr 3*nc0+(nc0-nc))).
