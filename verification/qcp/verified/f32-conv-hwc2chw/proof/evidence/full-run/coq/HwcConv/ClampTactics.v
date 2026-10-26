From HwcConv Require Export nan_helpers_unit_goal ClampFacts FastFrame AddressFacts.
Import Snaive_C_Rules64. Local Open Scope sac.
Ltac hc_record_eta:=rewrite ?hc_float_record_eta,?hc_uint_record_eta,?hc_mask_record_eta in *.
Ltac hc_clamp_frame:=
 unfold StructPredvfloat32m1_t,UndefStructPredvfloat32m1_t,
 StructPredvuint32m1_t,UndefStructPredvuint32m1_t,
 StructPredvbool32_t,UndefStructPredvbool32_t in *;
 rewrite ?hc_local_field_address;entailer!.
Ltac hc_clamp_return_math:=
 lazymatch goal with
 | |- context[hc_clamp_min ?R ?A ?b ?vl]=>
   let H:=fresh "Hresult"in assert(H:hc_clamp_min R A b vl)by
   first[solve[eapply hc_min_merge_correct;eauto]|solve[eapply hc_min_nan_correct;eauto]]
 | |- context[hc_clamp_max ?R ?A ?b ?vl]=>
   let H:=fresh "Hresult"in assert(H:hc_clamp_max R A b vl)by
   first[solve[eapply hc_max_merge_correct;eauto]|solve[eapply hc_max_nan_correct;eauto]]
 end;entailer!.
Ltac hc_clamp_start:=intros;hc_record_eta;unfold hc_same_bits in *;subst.
