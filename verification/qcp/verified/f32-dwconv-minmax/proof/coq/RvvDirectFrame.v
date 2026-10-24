From Dwconv Require Export RvvBorrowFrame.
Import Snaive_C_Rules64.
Local Open Scope sac.
(* A map is normally the second leaf of the precondition. Pull it once and
   apply the proved map rule under sepcon_mono, avoiding the generic global
   sep_apply normalization of hundreds of unrelated register fields. *)
Ltac dwr_apply_under_frame H :=
 sepcon_assoc_change;
 lazymatch type of H with ?A |-- ?B=>
 lazymatch goal with |- ?P |-- ?Q=>
 let frame:=fresh "map_frame"in evar(frame:Assertion);
 eapply(derivable1_trans P(A**frame)Q);
 [sepcon_assoc_change;fast_cancel
 |eapply(derivable1_trans(A**frame)(B**frame)Q);
  [apply derivable1_sepcon_mono;[exact H|apply derivable1_refl]
  |subst frame]]
 end end.
Ltac dwr_direct_borrow :=
 lazymatch goal with |- ?P |-- ?Q=>
 multimatch Q with context[dw_data(dw_pop ?F ?p)]=>
 let Hp:=fresh "Hpresent"in assert(Hp:dw_present F p)by assumption;
 let H:=fresh "Hopen"in pose proof(proj1(dw_data_pop F p Hp))as H;
 dwr_apply_under_frame H;clear H
 end end.
