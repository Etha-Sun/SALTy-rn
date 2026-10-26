From HwcConv Require Export HwcRvvPixel9Support2.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hp2_atom:=first[hp_atom|solve[eapply hc_pixel9_prefix0;eassumption]].
Ltac hp2_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply hp_pure_right;hp2_atom
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp2_pure|hp2_pure] end.
Ltac hp2_rhs:=first[solve[hp2_pure]|lazymatch goal with
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp2_rhs|hp2_rhs]
 | |-?P|--?Q=>hp_frame end].
Ltac hp2_solve:=hp_intro;hp_norm;hp2_rhs.
