From Coq Require Import List.
From HwcConv Require Export Model.
(* A missing right-edge tap is skipped, rather than represented by an FMA
   with artificial zero: 0*Inf would introduce a NaN. Actual kernel-to-tap
   correspondence and the exact 27-tap source order remain separate duties. *)
Definition HwcTap:=option(fp32*fp32).
Definition hwc_arm_tap(acc:fp32)(tap:HwcTap):fp32:=
 match tap with None=>acc|Some(input,weight)=>dw_arm_fma acc input weight end.
Definition hwc_rvv_tap(acc:fp32)(tap:HwcTap):fp32:=
 match tap with None=>acc|Some(input,weight)=>dw_rvv_fma acc weight input end.
Definition hwc_arm_fold(terms:list HwcTap)(bias:fp32):fp32:=
 fold_left hwc_arm_tap terms bias.
Definition hwc_rvv_fold(terms:list HwcTap)(bias:fp32):fp32:=
 fold_left hwc_rvv_tap terms bias.
Definition hwc_neon_pixel(terms:list HwcTap)(bias lo hi:fp32):fp32:=
 dw_arm_min(dw_arm_max(hwc_arm_fold terms bias)lo)hi.
Definition hwc_repaired_rvv_pixel(terms:list HwcTap)(bias lo hi:fp32):fp32:=
 dw_repaired_min(dw_repaired_max(hwc_rvv_fold terms bias)lo)hi.
