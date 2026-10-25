From Coq Require Import ZArith Lia.
From Qs8NeonGoals Require Import G0360.
From Qs8Gemm Require Import NeonMac KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked_neon_loop:test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2;left;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 replace(kc_pre-(k-8*1)) with (kc_pre-k+8) by ring.
 replace(8*(kc_pre-k)+0) with (8*((kc_pre-k)+0)) by ring.
 replace(8*(kc_pre-k)+8) with (8*((kc_pre-k)+1)) by ring.
 replace(8*(kc_pre-k)+16) with (8*((kc_pre-k)+2)) by ring.
 replace(8*(kc_pre-k)+24) with (8*((kc_pre-k)+3)) by ring.
 replace(8*(kc_pre-k)+32) with (8*((kc_pre-k)+4)) by ring.
 replace(8*(kc_pre-k)+40) with (8*((kc_pre-k)+5)) by ring.
 replace(8*(kc_pre-k)+48) with (8*((kc_pre-k)+6)) by ring.
 replace(8*(kc_pre-k)+56) with (8*((kc_pre-k)+7)) by ring.
 rewrite ?qs8_mac8 by lia.
 assert(Halign:Z.rem(kc_pre-k+8)8=0).
 { rewrite Z.rem_mod_nonneg by lia.
   rewrite Z.rem_mod_nonneg in PreH20 by lia.
   rewrite Z.add_mod by lia;rewrite PreH20;reflexivity. }
 qs8_kernel_frame.
Qed.
Print Assumptions checked_neon_loop.
