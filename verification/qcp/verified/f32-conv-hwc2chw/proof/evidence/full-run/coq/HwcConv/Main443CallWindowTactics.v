From HwcConv Require Export Main443CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hcc_window_solve :=
 hcc_prepare;hcm_domain;hcp_columns;try hcp_window_fast;hcc_frame.
