From Coq Require Import List.
From DwChw Require Export Model.
Import ListNotations.
(* The raw kernels evaluate center, left, right columns in this exact order.
   c/l/r are pixel values from top/middle/bottom rows; weights are source
   weights[1]..weights[9], bias=weights[0]. No reassociation is used. *)
Definition dw_chw_terms
 (c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9:fp32)
 :list(fp32*fp32):=
 [(c0,w2);(c1,w5);(c2,w8);(l0,w1);(l1,w4);(l2,w7);(r0,w3);(r1,w6);(r2,w9)].
Definition dw_chw_arm_fold (terms:list(fp32*fp32))(bias:fp32):fp32:=
 List.fold_left(fun acc iw=>dw_arm_fma acc (fst iw)(snd iw))terms bias.
Definition dw_chw_rvv_fold (terms:list(fp32*fp32))(bias:fp32):fp32:=
 List.fold_left(fun acc iw=>dw_rvv_fma acc (snd iw)(fst iw))terms bias.
Definition dw_chw_neon_pixel
 (bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi:fp32):fp32:=
 dw_arm_min(dw_arm_max(dw_chw_arm_fold(dw_chw_terms c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9)bias)lo)hi.
Definition dw_chw_rvv_pixel
 (bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi:fp32):fp32:=
 dw_repaired_min(dw_repaired_max(dw_chw_rvv_fold(dw_chw_terms c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9)bias)lo)hi.
