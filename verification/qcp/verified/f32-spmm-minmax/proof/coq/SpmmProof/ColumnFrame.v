From Coq Require Import ZArith List Lia.
From SpmmProof Require Export RvvFrame.
From SpmmSpec Require Export FinalStore NanFacts ActiveFirstStep.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac spmm_nan_facts :=
 repeat match goal with
 | H:fp32_ne ?x ?x |- _ => let Hn:=fresh "Hnan" in pose proof(spmm_ne_self_nan x H)as Hn;clear H
 | H:fp32_eq ?x ?x |- _ => let Hn:=fresh "Hnotnan" in pose proof(spmm_eq_self_not_nan x H)as Hn;clear H
 end.
Ltac spmm_acc_active :=
 first[eassumption|solve[eapply spmm_active32_first_step;eassumption]].
Ltac spmm_min_active :=
 first[solve[eapply spmm_active32_min_nan_bound;[assumption|eassumption]]
 |solve[eapply spmm_active32_min_repair;[assumption|spmm_acc_active|eassumption|eassumption|eassumption]]].
Ltac spmm_clamp_active :=
 unfold spmm_cell,neon_clamp;rewrite ?Z.add_0_r;
 try match goal with H:z_at ?NN ?c=0 |- _ => rewrite H end;
 try match goal with H:z_at ?NN ?c-1=0 |- _ =>
 let He:=fresh "Hone_nnz" in assert(He:z_at NN c=1)by lia;rewrite He end;
 rewrite ?spmm_acc_zero;
 first[solve[eapply spmm_active32_max_nan_bound;[assumption|eassumption]]
 |solve[eapply spmm_active32_max_repair;[assumption|spmm_min_active|eassumption|eassumption|eassumption]]].
Ltac spmm_column_normalize :=
 spmm_normalize2;rewrite ?spmm_z_get in *;spmm_normalize2;
 rewrite ?spmm_acc_zero in *;spmm_nan_facts.
Ltac spmm_stored_block :=
 multimatch goal with |- ?P |-- ?Q =>
 multimatch P with context[spmm_output_hole ?out ?rows ?cols ?stride ?row ?col ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
 multimatch P with context[FloatArray.full ?base width(sublist 0 width [?x0;?x1;?x2;?x3;?x4;?x5;?x6;?x7;?x8;?x9;?x10;?x11;?x12;?x13;?x14;?x15;?x16;?x17;?x18;?x19;?x20;?x21;?x22;?x23;?x24;?x25;?x26;?x27;?x28;?x29;?x30;?x31])] =>
 let Ha:=fresh "Hactive_clamp" in
 assert(Ha:spmm_active32 width x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 (spmm_cell col(row+0)start NN D A W lo hi) (spmm_cell col(row+1)start NN D A W lo hi) (spmm_cell col(row+2)start NN D A W lo hi) (spmm_cell col(row+3)start NN D A W lo hi) (spmm_cell col(row+4)start NN D A W lo hi) (spmm_cell col(row+5)start NN D A W lo hi) (spmm_cell col(row+6)start NN D A W lo hi) (spmm_cell col(row+7)start NN D A W lo hi) (spmm_cell col(row+8)start NN D A W lo hi) (spmm_cell col(row+9)start NN D A W lo hi) (spmm_cell col(row+10)start NN D A W lo hi) (spmm_cell col(row+11)start NN D A W lo hi) (spmm_cell col(row+12)start NN D A W lo hi) (spmm_cell col(row+13)start NN D A W lo hi) (spmm_cell col(row+14)start NN D A W lo hi) (spmm_cell col(row+15)start NN D A W lo hi) (spmm_cell col(row+16)start NN D A W lo hi) (spmm_cell col(row+17)start NN D A W lo hi) (spmm_cell col(row+18)start NN D A W lo hi) (spmm_cell col(row+19)start NN D A W lo hi) (spmm_cell col(row+20)start NN D A W lo hi) (spmm_cell col(row+21)start NN D A W lo hi) (spmm_cell col(row+22)start NN D A W lo hi) (spmm_cell col(row+23)start NN D A W lo hi) (spmm_cell col(row+24)start NN D A W lo hi) (spmm_cell col(row+25)start NN D A W lo hi) (spmm_cell col(row+26)start NN D A W lo hi) (spmm_cell col(row+27)start NN D A W lo hi) (spmm_cell col(row+28)start NN D A W lo hi) (spmm_cell col(row+29)start NN D A W lo hi) (spmm_cell col(row+30)start NN D A W lo hi) (spmm_cell col(row+31)start NN D A W lo hi))by spmm_clamp_active;
 let Hb:=fresh "Hstored_block" in
 pose proof(spmm_active32_block width row col start NN D A W lo hi x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 ltac:(lia) ltac:(lia) Ha)as Hb;
 rewrite Hb
 end end end.

Ltac spmm_column_finish output_pre rows nc_pre output_stride_pre m n vl start NN D A W lo hi :=
 spmm_column_normalize;spmm_stored_block;
 spmm_shape_facts;
 sep_apply(spmm_close_stored_column output_pre rows nc_pre output_stride_pre (rows-m)(nc_pre-n)vl start NN D A W lo hi ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia));
 replace(nc_pre-(n-1))with((nc_pre-n)+1)by lia;
 rewrite spmm_output_cursor_next;
 rewrite spmm_next_nnz_index by lia;
 rewrite next_bias_index by lia;
 rewrite ?spmm_z_get;
 try match goal with H:z_at ?NN ?c=0 |- _ => rewrite H end;
 spmm_normalize2;spmm_fast_frame.

