From Coq Require Import ZArith List.
From ArgmaxPool Require Export RvvUpdateIntoModel OutputMemory ReadWindows APOptionalMemoryModel.
From ArgmaxPool Require Import Model.
Import ListNotations. Local Open Scope Z_scope.
Definition ap_block32_initial(F:APMap)(O:APOutput)(I:APIndex)(ab ib p0 idx lane:Z):fp32*Z:=
 if Z.eqb ab 0 then(ap_load_lane F p0 lane,ap_u32 idx)
 else((match O(ab+4*lane)with Some v=>v|None=>fp32_zero end),(match I(ib+4*lane)with Some v=>v|None=>0 end)).
Definition ap_block32_value(F:APMap)(O:APOutput)(I:APIndex)
 (ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane:Z):fp32*Z:=
 let initial:=ap_block32_initial F O I ab ib p0 idx lane in
 let rows:=if Z.eqb ab 0 then[(p1,idx+1);(p2,idx+2);(p3,idx+3);(p4,idx+4);(p5,idx+5);(p6,idx+6);(p7,idx+7);(p8,idx+8)]
 else[(p0,idx);(p1,idx+1);(p2,idx+2);(p3,idx+3);(p4,idx+4);(p5,idx+5);(p6,idx+6);(p7,idx+7);(p8,idx+8)]in
 fold_left(fun old candidate=>ap_step old(ap_load_lane F(fst candidate)lane,snd candidate))rows initial.
Definition ap_block32_written(F:APMap)(O:APOutput)(I:APIndex)
 (ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index:Z)(O2:APOutput)(I2:APIndex):Prop:=
 forall lane,0<=lane<vl->let value:=ap_block32_value F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane in
 O2(output+4*lane)=Some(fst value)/\I2(index+4*lane)=Some(snd value).

Definition ap_block32_previous(ab ib:Z):Prop:=(ab=0<->ib=0).
Definition ap_block32_frames(O:APOutput)(I:APIndex)(O2:APOutput)(I2:APIndex)(vl output index:Z):Prop:=
 (forall q,(~exists j,0<=j<vl/\q=output+4*j)->O2 q=O q)/\
 (forall q,(~exists j,0<=j<vl/\q=index+4*j)->I2 q=I q).
