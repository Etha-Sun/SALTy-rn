From HwcConv Require Export HwcRvvPixel9Support4.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hp2_atom:=first[assumption|solve[hp_next]
 |solve[eapply hc_pixel9_prefix0;eassumption]
 |solve[eapply hc_pixel9_bias_present;[eassumption|lia]]
 |reflexivity|lia].
Ltac hp2_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply hp_pure_right;hp2_atom
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp2_pure|hp2_pure] end.
Ltac hp2_rhs:=first[solve[hp2_pure]|lazymatch goal with
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp2_rhs|hp2_rhs]
 | |-?P|--coq_prop ?Q=>fail 1 "pixel9 pure formula unresolved"
 | |-?P|--?Q=>hp_frame end].
Ltac hp2_solve:=hp_intro;hp_norm;hp2_rhs.
