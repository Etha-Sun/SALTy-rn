(* Reuse the checked all-Z layout/ownership window bridge; no extra public premise. *)
From HwcConv Require Export Main443WindowFacts RvvKernelModel.
From Coq Require Import ZArith List Lia.
Local Open Scope Z_scope.
Lemma hm401_clipped_write_window : forall W output hs cs H N C start finish y ch lane row x vl,
 hc_output_owned W output hs cs C start finish ((N+1)/2) ->
 hc_output_layout output hs cs H N C finish ->
 0<N -> 0<=start -> start<=y<finish -> 0<=ch<C ->
 0<=lane<4 -> 0<=row<=1 -> 0<=x -> 0<vl -> x+vl<=(N+1)/2 ->
 hc_write_window W
 (hc_output_address output hs cs (hc_store_channel C ch lane) (hc_store_row finish y row) x) vl.
Proof.
 intros W output hs cs H N C start finish y ch lane row x vl
 HO HL HN HS HY HC Hlane Hrow HX HV HXV.
 assert(HOW:0<(N+1)/2)by(apply Z.div_str_pos;lia).
 unfold hc_output_layout in HL;cbn zeta in HL.
 destruct HL as[Hp[Hhs[Hcs Hlimit]]].
 pose proof (hcm_clipped_output_window W output hs cs C start finish ((N+1)/2)
 y ch lane row x vl HO HS HY HC Hlane Hrow HX HV HXV Hp HOW Hhs Hcs Hlimit)
 as[Ha[Hmod Hwindow]].
 now rewrite Hmod in Hwindow.
Qed.
Print Assumptions hm401_clipped_write_window.
