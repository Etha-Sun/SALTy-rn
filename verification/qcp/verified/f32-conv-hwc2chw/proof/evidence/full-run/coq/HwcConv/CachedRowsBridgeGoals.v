(* PRIVATE UNCHECKED SOURCE PROPOSAL. No Coq run, no theorem credit. *)
From Coq Require Import ZArith List Lia Ring.
From HwcConv Require Export NeonRowsPixelModel HwcSourcePixelFacts HwcTileFacts.
Import ListNotations. Local Open Scope Z_scope.

(* Rows are the cached immutable rowbases, NOT the advancing i0..i4 cursors.
   Packed block stride is112 float cells=448 bytes. No FP algebra is used. *)
Definition hc_cached_rows(F:HwcROMap)(input zero H W top y p0 p1 p2 p3 p4:Z):Prop:=
 p0=hc_row_base input zero H W(2*y-top) /\
 p1=hc_row_base input zero H W(2*y-top+1) /\
 p2=hc_row_base input zero H W(2*y-top+2) /\
 p3=hc_row_base input zero H W(2*y-top+3) /\
 p4=hc_row_base input zero H W(2*y-top+4).

(* First bridge: unfold ONLY list structure, tap selection, and address
   arithmetic. Keep dw_arm_fma opaque: each Some tap remains one real FMA,
   including left-padding0*weight. None skips the entire right-edge tap. *)
Definition hc_cached_fold9_statement:Prop:=
 forall F input zero weights H W top y x block lane,
 hc_neon_rows_fold F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block) W x lane 9 =
 hwc_arm_fold(hc_terms F input zero weights H W top y x block lane)
 (hc_get F(weights+4*(112*block+lane))).

(* A small group lemma is the recommended proof boundary; dx/ci/lane are
   arbitrary integers, so instantiating the nine literal groups needs no
   runtime dimension restriction. *)
Definition hc_cached_group_statement:Prop:=
 forall acc F input zero weights H W top y x block lane dx ci,
 hc_neon_row_group acc F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block) W x dx ci lane =
 fold_left hwc_arm_tap
 (map(fun ky=>hc_tap F input zero weights H W top y x block lane dx ci(Z.of_nat ky))(seq 0 3)) acc.

(* Once exact fold equality is checked, the consumer bridge is structural;
   this declaration is a goal value, not an axiom or a claimed theorem. *)
Definition hc_cached_pixel_statement:Prop:=
 forall F input zero weights H W top y x block lane lo hi,
 dw_arm_min(dw_arm_max
 (hc_neon_rows_fold F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block) W x lane 9)lo)hi =
 hc_neon_pixel F input zero weights H W top y x block lane lo hi.

(* Both output rows share oneRO map. Row1 is computed at y+1 even when the
   store row is clipped to End-1; store order (row1 then row0) is essential. *)
Definition hc_cached_second_row_statement:Prop:=
 forall input zero H W top y,
 hc_row_base input zero H W(2*y-top+2)=
 hc_row_base input zero H W(2*(y+1)-top) /\
 hc_row_base input zero H W(2*y-top+3)=
 hc_row_base input zero H W(2*(y+1)-top+1) /\
 hc_row_base input zero H W(2*y-top+4)=
 hc_row_base input zero H W(2*(y+1)-top+2).

(* These four source-level arithmetical obligations link x to the actual
   source branch. In particular iw=3 gives TWO live output columns. *)
Definition hc_cached_column_statement:Prop:=forall N iw,
 0<N -> 0<=iw<=N -> (N-iw) mod 4=0 ->
 (4<=iw -> 0<=(N-iw)/2 /\ (N-iw)/2+1<(N+1)/2) /\
 (0<iw<4 -> 0<=(N-iw)/2<(N+1)/2) /\
 (iw=3 -> (N-iw)/2+1<(N+1)/2).
