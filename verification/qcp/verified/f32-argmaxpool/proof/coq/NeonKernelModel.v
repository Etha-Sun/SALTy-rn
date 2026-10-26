From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export KernelLaneFacts ReadPreviousModel.
Local Open Scope Z_scope.
Definition app_previous_float_value(F:APMap)(P:APPtrMap)(D:APProgram)(pixel group channel:Z):fp32:=
 fst(app_lane_value true F P D pixel group channel).
Definition app_previous_index_value(F:APMap)(P:APPtrMap)(D:APProgram)(pixel group channel:Z):Z:=
 snd(app_lane_value true F P D pixel group channel).
Lemma app_previous_float_initialized:forall F P D pixel group done lane O I,
 0<group -> 0<=done -> 0<=lane -> done+lane<app_channels D ->
 ap_float_initialized(app_neon_partial_output F P D pixel group done O I)
 (app_output_cursor(app_output_at D pixel)done+4*lane)
 (app_previous_float_value F P D pixel group(done+lane)).
Proof.
 intros;unfold ap_float_initialized,app_neon_partial_output,app_previous_float_value,app_output_cursor.
 replace(app_output_at D pixel+4*done+4*lane)with(app_output_at D pixel+4*(done+lane))by ring.
 apply app_partial_output_previous;lia.
Qed.
Lemma app_previous_index_initialized:forall F P D pixel group done lane O I,
 0<group -> 0<=done -> 0<=lane -> done+lane<app_channels D ->
 ap_uint_initialized(app_neon_partial_index F P D pixel group done O I)
 (app_output_cursor(app_index_at D pixel)done+4*lane)
 (app_previous_index_value F P D pixel group(done+lane)).
Proof.
 intros;unfold ap_uint_initialized,app_neon_partial_index,app_previous_index_value,app_output_cursor.
 replace(app_index_at D pixel+4*done+4*lane)with(app_index_at D pixel+4*(done+lane))by ring.
 apply app_partial_index_previous;lia.
Qed.
Print Assumptions app_previous_float_initialized.
Print Assumptions app_previous_index_initialized.
