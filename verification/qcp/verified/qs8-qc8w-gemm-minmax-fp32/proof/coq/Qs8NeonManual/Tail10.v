From Coq Require Import ZArith List Lia.
From Qs8NeonGoals Require Import G0390.
From Qs8Gemm Require Import KernelFrame NeonMac NeonOutput.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_tail_cases nc :=
 assert(Hcases:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7) by lia;
 repeat match goal with H:_ \/ _ |- _ => destruct H end;subst nc;
 repeat match goal with
 | H:context[Z.land ?x ?y] |- _ =>
   let v:=eval vm_compute in (Z.land x y) in change(Z.land x y)with v in H
 end.
Lemma checked_tail10:test_neon_entail_wit_4_10.
Proof.
 unfold test_neon_entail_wit_4_10;right;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 assert(Hk:k=6)by lia;subst k.
 assert(Hnc:nc=7)by(qs8_tail_cases nc;try congruence;lia);subst nc.
 replace(8*(kc_pre-6)+0)with(8*((kc_pre-6)+0))by ring.
 replace(8*(kc_pre-6)+8)with(8*((kc_pre-6)+1))by ring.
 replace(8*(kc_pre-6)+16)with(8*((kc_pre-6)+2))by ring.
 replace(8*(kc_pre-6)+24)with(8*((kc_pre-6)+3))by ring.
 replace(8*(kc_pre-6)+32)with(8*((kc_pre-6)+4))by ring.
 replace(8*(kc_pre-6)+40)with(8*((kc_pre-6)+5))by ring.
 rewrite ?qs8_mac_tail6 by lia.
 replace(kc_pre-6+6)with kc_pre by lia.
 rewrite ?Z.sub_0_r,?Z.add_0_l,?Z.add_0_r.
 change(4+1)with 5;change(4+2)with 6;change(4+3)with 7.
 rewrite ?qs8_neon_quant_formula.
 assert(Hd:0<=nc_pre-7)by lia.
 assert(Hmod:(nc_pre-7) mod 8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 rewrite ?Z.quot_div_nonneg by lia.
 pose proof(qs8_completed_neon_tile kc_pre (nc_pre-7) 7 A Ps magic offset lo hi Hd Hmod ltac:(lia))as Hb.
 replace(nc_pre-7+7)with nc_pre in Hb by lia.
 qs8_neon_ext.
 change(Z.land 7 4)with 4;change(Z.land 7 2)with 2.
 unfold qs8_output_prefix,qs8_append,qs8_take,sublist in *.
 change(Z.to_nat 7)with 7%nat in Hb.
 cbn[Z.to_nat firstn skipn]in Hb.
 rewrite <-?app_assoc;cbn[app].
 rewrite <-Hb.
 repeat multimatch goal with |-context[qs8_write_state c_pre nc_pre ?count ?L]=>progress replace count with nc_pre by lia end.
 qs8_kernel_frame.
Qed.
Print Assumptions checked_tail10.
