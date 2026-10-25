From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import NeonVectorPixelModel Store8Model neon_pixel_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_fma dw_arm_min dw_arm_max.
Lemma proof_of_dw_neon_pixel_compute_return_wit_1:
 DwChw.neon_pixel_unit_goal.dw_neon_pixel_compute_return_wit_1.
Proof.
 unfold DwChw.neon_pixel_unit_goal.dw_neon_pixel_compute_return_wit_1;right;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 lazymatch goal with |- _ |-- andp(coq_prop ?P)_=>assert(Hresult:P)end.
 - unfold dw_neon_vector_match4;intros i Hi.
   assert(Hcases:i=0 \/ i=1 \/ i=2 \/ i=3)by lia.
   destruct Hcases as[H0|[H1|[H2|H3]]];subst i;
   unfold dw_neon_vector_pixel,dw_load,dw_chw_neon_pixel,dw_chw_arm_fold,dw_chw_terms;
   cbn[List.fold_left fst snd dw_fp4 dw_fp2 dw_arm_ext dw_rvv_slide_up dw_rvv_slide_down List.nth Z.to_nat];
   unfold dw_same in PreH1,PreH2,PreH3,PreH4,PreH5,PreH6,PreH7,PreH8,PreH9,PreH10;
   rewrite PreH1,PreH2,PreH3,PreH4,PreH5,PreH6,PreH7,PreH8,PreH9,PreH10;
   reflexivity.
 - entailer!.
Qed.
Print Assumptions proof_of_dw_neon_pixel_compute_return_wit_1.
