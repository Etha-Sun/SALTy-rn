From Coq Require Import List.
From HwcConv Require Export HwcProgramModel ClampModel.
Import ListNotations.
Definition hc_rvv_source_tap(acc:fp32)(tap:HwcTap):fp32:=
 match tap with None=>acc|Some(weight,input)=>dw_rvv_fma acc weight input end.
Definition hc_rvv_source_fold(terms:list HwcTap)(bias:fp32):fp32:=
 fold_left hc_rvv_source_tap terms bias.
Definition hc_rvv_source_result(terms:list HwcTap)(bias lo hi:fp32):fp32:=
 hc_canonical_min(hc_canonical_max(hc_rvv_source_fold terms bias)lo)hi.
