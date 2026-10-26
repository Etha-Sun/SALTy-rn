From HwcConv Require Export AddressFacts rvv_unit_goal RvvKernelModel HwcRvvPixel9Model.
From Coq Require Import Lia ZArith.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_acc_prefix hc_rvv_raw
 hc_rvv_pixel9_prefix hc_rvv_pixel9_fold hc_canonical_min hc_canonical_max.
Lemma hm401_v4_eta : forall A,
 make_record_vfloat32m1_t A.(vfloat32m1_t_s0) A.(vfloat32m1_t_s1)
 A.(vfloat32m1_t_s2) A.(vfloat32m1_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Ltac hm401_call_prepare := intros;rewrite ?hm401_v4_eta in *;subst.
Ltac hm401_call_frame :=
 unfold StructPredvfloat32m1_t,UndefStructPredvfloat32m1_t in *;
 cbn[vfloat32m1_t_s0 vfloat32m1_t_s1 vfloat32m1_t_s2 vfloat32m1_t_s3]in *;
 rewrite ?hc_local_field_address in *;
 entailer!;try assumption;try reflexivity;try lia.
Ltac hm401_call_solve := hm401_call_prepare;hm401_call_frame.
Print Assumptions hm401_v4_eta.
