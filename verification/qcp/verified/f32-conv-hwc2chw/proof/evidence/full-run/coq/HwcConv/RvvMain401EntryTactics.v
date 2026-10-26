From HwcConv Require Export RvvMain401BoundarySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hmb_entry_dispatch:=lazymatch goal with
 | |-hc_rows_pending _ _ _ _ _ _ _ _ _ _ _ _=>hmb_rows_initial
 | |-hc_pending_outputs _ _ _ _ _ _=>hmb_pending_outputs
 | |- _ = _=>first[solve[hmi_word_goal;first[reflexivity|ring]]|
  solve[hmi_word_goal;hmb_mod_nf;apply(f_equal hc_addr64);ring]]
 end.
