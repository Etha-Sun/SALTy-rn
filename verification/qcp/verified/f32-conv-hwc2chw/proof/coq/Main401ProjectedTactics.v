From HwcConv Require Export Main401FastTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hm401_vl_bounds : forall a v,hc_rvv_vl a v->0<=v<=4 /\ v<=a.
Proof.
 intros a v[HB HC];destruct HC as[HC|[HC|HC]];decompose[and]HC;split;lia.
Qed.
Lemma hm401_pure_right : forall(P:Assertion)(Q:Prop),Q->P|--coq_prop Q.
Proof. unfold derivable1,coq_prop;intros;assumption. Qed.
Ltac hm401_range_full := first[match goal with H:hc_rvv_vl ?a ?v |- _=>let Hb:=fresh "HVl" in pose proof(hm401_vl_bounds a v H)as Hb;destruct Hb as[[? ?]?]end|idtac].
Ltac hm401_strip_pure := lazymatch goal with
 | |- ?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hm401_strip_pure|hm401_strip_pure]
 | |- ?P|--coq_prop ?Q=>apply hm401_pure_right;first[assumption|reflexivity|lia]
 | _=>hm401_call_frame end.
Ltac hm401_projected := hm401_call_prepare;hm401_range_full;hm401_opaque_maps;hm401_strip_pure.
Print Assumptions hm401_vl_bounds.
Print Assumptions hm401_pure_right.
