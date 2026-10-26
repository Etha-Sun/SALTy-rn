From Coq Require Import ZArith List.
From ArgmaxPool Require Export APBlock32Model RvvUpdateIntoProbeFacts.
From ArgmaxPool Require Import RvvUpdateIntoModel Model.
Import ListNotations. Local Open Scope Z_scope.
Definition ap_block32_after_first(F:APMap)(O:APOutput)(I:APIndex)(ab ib p0 idx lane:Z):fp32*Z:=
 if Z.eqb ab 0 then(ap_load_lane F p0 lane,ap_u32 idx)
 else ap_step(ap_block32_initial F O I ab ib p0 idx lane)(ap_load_lane F p0 lane,idx).
Definition ap_block32_prefix(F:APMap)(O:APOutput)(I:APIndex)
 (ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane step:Z):fp32*Z:=
 fold_left(fun old candidate=>ap_step old(ap_load_lane F(fst candidate)lane,snd candidate))
 (firstn(Z.to_nat step)[(p1,idx+1);(p2,idx+2);(p3,idx+3);(p4,idx+4);(p5,idx+5);(p6,idx+6);(p7,idx+7);(p8,idx+8)])
 (ap_block32_after_first F O I ab ib p0 idx lane).
Definition ap_block32_acc(A:Recordvfloat32m8_t)(J:Recordvuint32m8_t)(F:APMap)(O:APOutput)(I:APIndex)
 (ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl step:Z):Prop:=
 forall lane,0<=lane<vl->(apup_float A lane,apup_int J lane)=
 ap_block32_prefix F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane step.
Lemma ap_block32_prefix_final:forall F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane,
 ap_block32_prefix F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane 8=
 ap_block32_value F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane.
Proof.
 intros;unfold ap_block32_prefix,ap_block32_value,ap_block32_after_first,ap_block32_initial.
 destruct(Z.eqb ab 0);reflexivity.
Qed.
Print Assumptions ap_block32_prefix_final.
