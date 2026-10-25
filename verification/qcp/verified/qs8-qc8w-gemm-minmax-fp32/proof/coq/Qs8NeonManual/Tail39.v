From Coq Require Import ZArith List Lia.
From Qs8NeonGoals Require Import G0448.
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
Lemma checked_tail39:test_neon_entail_wit_4_39.
Proof.
 unfold test_neon_entail_wit_4_39;right;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 assert(Hk:k=1)by lia;subst k.
 assert(Hnc:nc=1)by(qs8_tail_cases nc;try congruence;lia);subst nc.
 replace(8*(kc_pre-1)+0)with(8*((kc_pre-1)+0))by ring.
 rewrite ?qs8_mac_tail1 by lia.
 replace(kc_pre-1+1)with kc_pre by lia.
 rewrite ?Z.sub_0_r,?Z.add_0_l,?Z.add_0_r.
 change(4+1)with 5;change(4+2)with 6;change(4+3)with 7.
 rewrite ?qs8_neon_quant_formula.
 assert(Hd:0<=nc_pre-1)by lia.
 assert(Hmod:(nc_pre-1) mod 8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 rewrite ?Z.quot_div_nonneg by lia.
 pose proof(qs8_completed_neon_tile kc_pre (nc_pre-1) 1 A Ps magic offset lo hi Hd Hmod ltac:(lia))as Hb.
 replace(nc_pre-1+1)with nc_pre in Hb by lia.
 qs8_neon_ext.
 change(Z.land 1 4)with 0;change(Z.land 1 2)with 0.
 unfold qs8_output_prefix,qs8_append,qs8_take,sublist in *.
 change(Z.to_nat 1)with 1%nat in Hb.
 cbn[Z.to_nat firstn skipn]in Hb.
 rewrite <-?app_assoc;cbn[app].
 rewrite <-Hb.
 repeat multimatch goal with |-context[qs8_write_state c_pre nc_pre ?count ?L]=>progress replace count with nc_pre by lia end.
 qs8_kernel_frame.
Qed.
Print Assumptions checked_tail39.
