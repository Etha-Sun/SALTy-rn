From Coq Require Import ZArith Lia.
From ExpMinusMax Require Export NeonRepairTactics NeonTailFootprintFacts.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope Z_scope.
Ltac emkf_alias:=repeat match goal with H:@eq Z ?x ?v|-_=>is_var x;subst x end.
Ltac emkf_footprints:=
 emk_prepare;emkf_alias;
 repeat match goal with H:sizeof(FLOAT)=4|-_=>rewrite H in *;clear H end;
 try change (2*4)with 8 in *;try change (1*4)with 4 in *;
 match goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>
  let HD:=fresh "Hdecomposition"in pose proof(em_four_decomposition N)as HD;
  try(let HR:=fresh "Htailread"in assert(HR:em_window F(P+16*(Z.quot N 4))4)
    by(eapply em_valid_tail_read;[exact H|lia]));
  try(let HW:=fresh "Htailwrite2"in assert(HW:em_write_window W(Q+16*(Z.quot N 4))2)
    by(eapply em_valid_tail_two_write;[exact H|eapply em_tail_two_bit;[lia|assumption]]));
  try(let HW:=fresh "Htailwrite1"in assert(HW:em_write_window W(Q+16*(Z.quot N 4))1)
    by(eapply em_valid_tail_one_write;[exact H|lia]));
  try(let HW:=fresh "Htailwrite3"in assert(HW:em_write_window W(Q+16*(Z.quot N 4)+8)1)
    by(eapply em_valid_tail_third_write;[exact H|eapply em_tail_both_bits;[lia|assumption|assumption]]))
 end.
Ltac emkf_prepare:=emk_literal;rewrite ?em_zero_Q_literal;emkf_footprints.
Ltac emkf_pure_goal:=first[
 solve[em_intro;emkf_prepare;emkx_pure]|
 solve[left;em_intro;emkf_prepare;emkx_pure]|
 right;em_intro;emkf_prepare;emkx_pure].
Ltac emkf_frame:=emkf_prepare;emkx_frame.
