From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export RvvUpdateIntoProbeFacts RvvKernelModel RvvUpdateIntoModel Model.
Local Open Scope Z_scope.
(* Source compatibility of each disclosed three-op grouping.  This is Coq
   equality of the binary32 constructor and UInt32 index, including NaN bits;
   inactive physical fields remain unconstrained by the original native view. *)
Lemma apuk_update_step : forall R J A I B index vl lane,
 0<=lane<vl -> vl<=32 -> ap_rvv_update32 R J A I B index vl ->
 (apup_float R lane,apup_int J lane)=
 ap_step(apup_float A lane,apup_int I lane)(apup_float B lane,index).
Proof.
 intros R J A I B index vl lane HL HV HU.
 destruct(apup_update_lane R J A I B index vl lane HL HV HU)as[HF HI].
 rewrite HF,HI;apply apr_update_pair.
Qed.
Lemma apuk_update_step_values : forall R J A I B index vl lane old oi candidate,
 0<=lane<vl -> vl<=32 -> ap_rvv_update32 R J A I B index vl ->
 apup_float A lane=old -> apup_int I lane=oi -> apup_float B lane=candidate ->
 (apup_float R lane,apup_int J lane)=ap_step(old,oi)(candidate,index).
Proof.
 intros;rewrite(apuk_update_step R J A I B index vl lane H H0 H1).
 now rewrite H2,H3,H4.
Qed.
Print Assumptions apuk_update_step.
Print Assumptions apuk_update_step_values.
