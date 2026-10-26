From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export APBlockMainControlSupport APOptionalMemoryModel APKernelMemoryFacts.
Local Open Scope Z_scope.
Lemma apbmc_optional_windows : forall side F P D pixel group done vl O I W WI,
 0<=group -> 0<=done -> 0<=vl -> done+vl<=app_channels D ->
 ap_write_window W(app_output_cursor(app_output_at D pixel)done)vl ->
 ap_write_window WI(app_output_cursor(app_index_at D pixel)done)vl ->
 ap_optional_output_readable(app_partial_output side F P D pixel group done O I)
  (app_previous_cursor group(app_output_at D pixel)done)vl /\
 ap_optional_index_readable(app_partial_index side F P D pixel group done O I)
  (app_previous_cursor group(app_index_at D pixel)done)vl /\
 ap_optional_write_window W(app_previous_cursor group(app_output_at D pixel)done)vl /\
 ap_optional_write_window WI(app_previous_cursor group(app_index_at D pixel)done)vl.
Proof.
 intros side F P D pixel group done vl O I W WI Hg Hd Hv HC HW HWI.
 unfold app_previous_cursor.
 destruct(Z.eqb_spec group 0)as[H0|HN].
 - unfold ap_optional_output_readable,ap_optional_index_readable,ap_optional_write_window.
   repeat split;left;reflexivity.
 - assert(Hpos:0<group)by lia.
   unfold ap_optional_output_readable,ap_optional_index_readable,ap_optional_write_window.
   split;[right;apply app_partial_output_readable;assumption|].
   split;[right;apply app_partial_index_readable;assumption|].
   split;right;assumption.
Qed.
Print Assumptions apbmc_optional_windows.
