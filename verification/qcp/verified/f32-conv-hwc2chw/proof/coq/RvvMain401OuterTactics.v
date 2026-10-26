From HwcConv Require Export RvvMain401OuterFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hmb_outer_pending2:=first[
 solve[eapply hmb_next_outputs;first[eassumption|reflexivity]]|
 solve[eapply hmb_next_rows;[eassumption|lia|eassumption]]].
Ltac hmb_outer_atom:=first[solve[hmb_outer_pending2]|hmi_atom3].
Ltac hmb_outer_dispatch:=first[solve[apply hmi_pure_intro;hmb_outer_atom]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hmb_outer_dispatch|hmb_outer_dispatch]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
