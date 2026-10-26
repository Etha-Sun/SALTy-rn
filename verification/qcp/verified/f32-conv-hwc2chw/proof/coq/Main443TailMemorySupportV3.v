From HwcConv Require Export Main443TailMemorySupportV2.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hct_pending_tail:=unfold hc_channel_pending;intro;repeat split;intros;
 first[solve[lia]|hmb_mod_nf2;unfold hc_output_address,hc_store_channel,hc_store_row;
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];apply(f_equal hc_addr64);nia].
