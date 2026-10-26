From Coq Require Import ZArith.
From ArgmaxPool Require Export RvvUpdateIntoModel APKernelModel.
Local Open Scope Z_scope.
Definition ap_probe_written(F:APMap)(pa pb Old New vl output index:Z)(O2:APOutput)(I2:APIndex):Prop :=
 forall j,0<=j<vl ->
 let a:=ap_load_lane F pa j in let b:=ap_load_lane F pb j in
 let mask:=ap_rvv_gt b a in
 O2(output+4*j)=Some(ap_rvv_select_f32 mask a b) /\
 I2(index+4*j)=Some(ap_rvv_select_u32 mask (ap_u32 Old) (ap_u32 New)).
Definition ap_probe_frames(O:APOutput)(I:APIndex)(O2:APOutput)(I2:APIndex)(vl output index:Z):Prop :=
 (forall q,~(exists j,0<=j<vl /\ q=output+4*j)->O2 q=O q) /\
 (forall q,~(exists j,0<=j<vl /\ q=index+4*j)->I2 q=I q).
