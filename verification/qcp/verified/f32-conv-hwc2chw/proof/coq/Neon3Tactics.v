From HwcConv Require Export neon3_unit_goal Neon3Facts FastFrame AddressFacts.
Import Snaive_C_Rules64. Local Open Scope sac.
Ltac hc_neon3_eta:=rewrite ?hc_neon_record_eta in *.
Ltac hc_neon3_frame:=unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t in *;
 rewrite ?hc_local_field_address;entailer!.
Ltac hc_neon3_return:=
 lazymatch goal with|-context[hc_neon3 ?R ?A ?W0 ?W1 ?W2 ?X0 ?X1 ?X2 ?k]=>
 let H:=fresh "Hresult"in assert(H:hc_neon3 R A W0 W1 W2 X0 X1 X2 k)by(eapply hc_neon3_chain;eauto)end;entailer!.
