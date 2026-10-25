From Coq Require Import ZArith Lia Reals.
From Qs8Gemm Require Import Model NaNRepair.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma qs8_quant_chain : forall (vl lane lo hi offset:Z) (magic scale:fp32)
(r0:Z) (r0_2:fp32) (r0_3:fp32) (r0_4:fp32) (r0_5:Z) (r0_6:Z) (r0_7:Z) (r0_8:Z) (r0_9:fp32) (r0_10:Z) (r0_11:Z) (r0_12:Z) (r0_13:Z) (r0_14:Z) (r0_15:Z) (r0_16:fp32) (r0_17:Z) (r0_18:Z) (r0_19:Z) (r0_20:Z) (r0_21:Z) (r0_22:Z) (r0_23:Z) (r0_24:Z),
 lane<vl ->
(qs8_active_z vl lane r0_24 (qs8_min (r0_23) (hi)) ) ->
(qs8_active_z vl lane r0_23 (qs8_max (r0_22) (lo)) ) ->
(qs8_active_z vl lane r0_22 (qs8_narrow8 (r0_21)) ) ->
(qs8_active_z vl lane r0_21 (qs8_narrow16 (r0_20)) ) ->
(qs8_active_z vl lane r0_20 (qs8_ssub32 (r0_19) (offset)) ) ->
(qs8_active_z vl lane r0_19 (qs8_merge (r0_18) (r0_15) (r0_14)) ) ->
(qs8_active_z vl lane r0_18 (qs8_merge (r0_17) (r0_7) (r0_8)) ) ->
(qs8_active_z vl lane r0_17 (qs8_merge ((qs8_reinterpret (r0_16))) (r0_15) (r0_11)) ) ->
(qs8_active_f vl lane r0_16 (f16_rvv_add ((qs8_uninterpret (r0_7))) (magic)) ) ->
(qs8_active_z vl lane r0_15 (qs8_or32 ((qs8_reinterpret (r0_9))) (4194304)) ) ->
(qs8_active_z vl lane r0_14 (qs8_mask_and (r0_11) (r0_13)) ) ->
(qs8_active_z vl lane r0_13 (qs8_eq (r0_12) (0)) ) ->
(qs8_active_z vl lane r0_12 (qs8_and32 ((qs8_reinterpret (r0_9))) (4194304)) ) ->
(qs8_active_z vl lane r0_11 (qs8_gt (r0_10) (2139095040)) ) ->
(qs8_active_z vl lane r0_10 (qs8_and32 ((qs8_reinterpret (r0_9))) (INT_MAX)) ) ->
(qs8_active_f vl lane r0_9 magic ) ->
(qs8_active_z vl lane r0_8 (qs8_nan ((qs8_uninterpret (r0_7)))) ) ->
(qs8_active_z vl lane r0_7 (qs8_merge ((qs8_reinterpret (r0_4))) (r0_6) (r0_5)) ) ->
(qs8_active_z vl lane r0_6 (qs8_or32 ((qs8_reinterpret (r0_3))) (4194304)) ) ->
(qs8_active_z vl lane r0_5 (qs8_nan (r0_3)) ) ->
(qs8_active_f vl lane r0_4 (f16_rvv_mul (r0_2) (r0_3)) ) ->
(qs8_active_f vl lane r0_3 scale ) ->
(qs8_active_f vl lane r0_2 (fp32_of_Z (r0)) ) ->
 r0_24=qs8_quant r0 scale magic offset lo hi.
Proof.
 intros;unfold qs8_active_z,qs8_active_f in *.
 repeat match goal with H: lane<vl -> _ |- _ => specialize(H ltac:(lia)) end.
 subst.
 fold (qs8_product_bits(fp32_of_Z r0)scale).
 rewrite qs8_product_bits_exact,qs8_uninterpret_reinterpret.
 fold (qs8_sum_bits(qs8_mul_repaired(fp32_of_Z r0)scale)magic).
 rewrite qs8_sum_bits_exact,qs8_repaired_float_chain.
 unfold qs8_quant,qs8_sat,qs8_min,qs8_max,qs8_magic_bits,qs8_reinterpret.
 rewrite Z.min_comm,Z.max_comm.
 reflexivity.
Qed.
Print Assumptions qs8_quant_chain.
