From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition completed_values (A W:list fp32)(k mr nc:Z)(lo hi:fp32):list fp32 :=
 concat(map(fun r=>full_row_values A W k (Z.of_nat r) nc lo hi)(seq 0(Z.to_nat mr))).
Lemma output_row_complete_active : forall c mr nc k row A W lo hi,row<mr ->
 output_row c mr nc k nc row A W lo hi --||--
 FloatArray.seg c(row*nc)((row+1)*nc)(full_row_values A W k row nc lo hi).
Proof.
 intros;unfold output_row;assert(Hb:row <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hb.
 replace(row*nc+nc)with((row+1)*nc)by ring.
 rewrite FloatArray.undef_seg_empty;split;entailer!.
Qed.
Lemma output_row_inactive : forall c mr nc k done row A W lo hi,mr<=row ->
 output_row c mr nc k done row A W lo hi --||--FloatArray.undef_seg c(row*nc)((row+1)*nc).
Proof. intros;unfold output_row;assert(Hb:row <? mr=false)by(apply Z.ltb_ge;lia);rewrite Hb;split;entailer!. Qed.
Ltac collect_rows c nc k A W lo hi :=
 let V0:=constr:(full_row_values A W k 0 nc lo hi)in
 let V1:=constr:(full_row_values A W k 1 nc lo hi)in
 let V2:=constr:(full_row_values A W k 2 nc lo hi)in
 let V3:=constr:(full_row_values A W k 3 nc lo hi)in
 try(sep_apply(FloatArray.seg_merge_to_seg c 0 nc (2*nc) V0 V1 ltac:(lia)));
 try(sep_apply(FloatArray.seg_merge_to_seg c 0 (2*nc)(3*nc)(V0++V1)V2 ltac:(lia)));
 try(sep_apply(FloatArray.seg_merge_to_seg c 0 (3*nc)(4*nc)((V0++V1)++V2)V3 ltac:(lia)));
 try(sep_apply(FloatArray.undef_seg_merge_to_undef_seg c nc (2*nc)(3*nc)ltac:(lia)));
 try(sep_apply(FloatArray.undef_seg_merge_to_undef_seg c nc (3*nc)(4*nc)ltac:(lia)));
 try(sep_apply(FloatArray.undef_seg_merge_to_undef_seg c (2*nc)(3*nc)(4*nc)ltac:(lia)));
 rewrite ?app_nil_r,?app_assoc;
 match goal with |- ?P |-- ?Q=>multimatch Q with context[FloatArray.full c ?n ?L]=>sep_apply(FloatArray.seg_to_full c 0 n L)end end;
 rewrite ?FloatArray.undef_seg_empty;
 entailer!;rewrite ?Z.mul_0_l,?Z.add_0_r,?Z.sub_0_r;apply derivable1_refl.
Lemma completed_output_state : forall c mr nc k A W lo hi,1<=mr<=4 ->0<=nc ->
 output_state c mr nc k nc A W lo hi |--
 FloatArray.full c(mr*nc)(completed_values A W k mr nc lo hi) ** FloatArray.undef_seg c(mr*nc)(4*nc).
Proof.
 intros c mr nc k A W lo hi Hmr Hnc.
 assert(mr=1\/mr=2\/mr=3\/mr=4)by lia;destruct H as[H|[H|[H|H]]];subst mr;
 unfold completed_values;cbv [Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add Z.of_nat Pos.of_succ_nat seq map concat];rewrite ?app_nil_r;
 unfold output_state;
 repeat first[rewrite output_row_complete_active by lia|rewrite output_row_inactive by lia];
 replace(0*nc)with 0 by ring;replace(1*nc)with nc by ring;replace((0+1)*nc)with nc by ring;
 replace((1+1)*nc)with (2*nc)by ring;replace((2+1)*nc)with (3*nc)by ring;replace((3+1)*nc)with (4*nc)by ring;
 collect_rows c nc k A W lo hi.
Qed.
Print Assumptions output_row_complete_active.
Print Assumptions output_row_inactive.
Print Assumptions completed_output_state.
