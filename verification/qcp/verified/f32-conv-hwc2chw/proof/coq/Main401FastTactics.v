From HwcConv Require Export Main401CallTactics3.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hm401_opaque_maps :=
 repeat match goal with |- context[hc_output ?w ?o]=>let P:=fresh "OutputFrame" in set(P:=hc_output w o);clearbody P end;
 repeat match goal with |- context[hc_data ?f]=>let P:=fresh "ReadOnlyFrame" in set(P:=hc_data f);clearbody P end.
Ltac hm401_fast := hm401_call_prepare;hm401_range;hm401_opaque_maps;hm401_call_frame.
