From HwcConv Require Export Main401ProjectedTactics Main401WindowFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hm401_window :=
 lazymatch goal with
 | |- hc_write_window ?w (hc_output_address ?o ?hs ?cs (hc_store_channel ?cn ?ch ?lane) (hc_store_row ?finish ?y ?row) ?x) ?vl=>
  match goal with
  | HO:hc_output_owned w o hs cs cn ?start finish (Z.quot (?n+1) 2),
    HL:hc_output_layout o hs cs ?height ?n cn finish |- _=>
    let Hq:=fresh "Hquot" in
    assert(Hq:Z.quot(n+1)2=(n+1)/2)by(apply Z.quot_div_nonneg;lia);
    apply(hm401_clipped_write_window w o hs cs height n cn start finish y ch lane row x vl);
    [rewrite<-Hq;exact HO|exact HL|lia|lia|lia|lia|lia|lia|lia|lia|rewrite<-Hq;lia]
  end
 end.
Ltac hm401_final_strip := lazymatch goal with
 | |- ?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hm401_final_strip|hm401_final_strip]
 | |- ?P|--coq_prop ?Q=>apply hm401_pure_right;first[assumption|reflexivity|hm401_window|lia]
 | _=>hm401_call_frame end.
Ltac hm401_final := hm401_call_prepare;hm401_range_full;hm401_opaque_maps;hm401_final_strip.
