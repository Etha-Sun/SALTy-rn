From HwcConv Require Export RvvMain401BareFacts RvvMain401OuterTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hr401_bare_output:=multimatch goal with
 | HL:hc_output_layout ?output ?hs ?cs ?H ?N ?C ?finish,
 HS:Z.le 0 ?start,HY:Z.le ?start ?y,HE:Z.lt ?y ?finish
 |-?p=hc_output_address ?output ?hs ?cs(hc_store_channel ?C ?ch ?lane)(hc_store_row ?finish ?y ?dy)?x=>
 rewrite<-(hr401_clipped_no_wrap output hs cs H N C start finish y ch lane dy x HL
 ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 ltac:(first[lia|split;[lia|apply Z.div_str_pos;lia]]));
 unfold hc_output_address;hmi_output_solve
 end.
Ltac hr401g_atom:=first[solve[hmi_init_atom2]|solve[hmi_word_goal;hmi_addr;lia]|
 solve[apply Z.div_pos;lia]|solve[unfold hc_outer_input;repeat split;hmi_init_atom2]|
 solve[hr401_bare_output]|solve[unfold hc_output_address;hmi_output_solve]|
 solve[unfold hc_channel_output;repeat split;unfold hc_output_address;hmi_output_solve]].
Ltac hr401g_dispatch:=first[solve[apply hmi_pure_intro;hr401g_atom]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hr401g_dispatch|hr401g_dispatch]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
