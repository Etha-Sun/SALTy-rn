From HwcConv Require Export Main443CallWindowTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hcc_word_direct :=
 try multimatch goal with
 | |-context[unsigned_last_nbits(((?n-?i)/2)+1)64] =>
  let H0:=fresh "Hq0" in let H1:=fresh "Hq1"in
  pose proof(hcm_word_quot_index n i ltac:(lia)ltac:(split;lia))as[H0 H1];
  repeat rewrite Z.quot_div_nonneg in H0,H1 by lia;
  rewrite H1 in *
 end.
Ltac hcc_general_solve :=
 hcc_prepare;hcm_domain;hcp_columns;hcc_word_direct;try hcp_window_fast;hcc_frame.
