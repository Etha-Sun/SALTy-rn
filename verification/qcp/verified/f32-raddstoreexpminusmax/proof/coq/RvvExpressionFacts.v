From Coq Require Import ZArith Lia.
From ExpMinusMax Require Export RvvKernelModel.
Local Open Scope Z_scope.
Theorem em_rvv_expression_active:forall(F:EMMap)(p:Z)(maximum:fp32)(vl:Z)
 (LOAD VX BIAS VN VN2 VT C4 P4 C3 P3 C2 P2 C1 P1 TM FV OUT:Recordvfloat32m4_t)(SHIFT:Recordvint32m4_t)(MASK:Recordvbool8_t),
0<=vl<=16 ->
em_rvv_load_p F p vl LOAD ->
em_rvv_sub_p LOAD maximum vl VX ->
em_rvv_dup_p em_magic_bias vl BIAS ->
em_rvv_mac_vf_p BIAS em_log2e VX vl VN ->
em_rvv_shift_p(em_rvv_reint_f_i VN)23 vl SHIFT ->
em_rvv_sub_p VN em_magic_bias vl VN2 ->
em_rvv_mad_vf_p VN2 em_minus_ln2 VX vl VT ->
em_rvv_dup_p em_c4 vl C4 ->
em_rvv_mac_vf_p C4 em_c5 VT vl P4 ->
em_rvv_dup_p em_c3 vl C3 ->
em_rvv_mac_vv_p C3 P4 VT vl P3 ->
em_rvv_dup_p em_c2 vl C2 ->
em_rvv_mac_vv_p C2 P3 VT vl P2 ->
em_rvv_dup_p em_c1 vl C1 ->
em_rvv_mac_vv_p C1 P2 VT vl P1 ->
em_rvv_mul_p VT(em_rvv_reint_i_f SHIFT)vl TM ->
em_rvv_mac_vv_p(em_rvv_reint_i_f SHIFT)P1 TM vl FV ->
em_rvv_mask_p VX em_denorm_cutoff vl MASK ->
em_rvv_merge_p FV fp32_zero MASK vl OUT ->
em_rvv_active_float vl OUT(fun j=>em_rvv_value(em_get F(p+4*j))maximum).
Proof.
intros F p maximum vl LOAD VX BIAS VN VN2 VT C4 P4 C3 P3 C2 P2 C1 P1 TM FV OUT SHIFT MASK Hvl HLOAD HVX HBIAS HVN HSHIFT HVN2 HVT HC4 HP4 HC3 HP3 HC2 HP2 HC1 HP1 HTM HFV HMASK HOUT.
unfold em_rvv_load_p,em_rvv_sub_p,em_rvv_dup_p,em_rvv_mac_vf_p,em_rvv_mad_vf_p,em_rvv_mac_vv_p,em_rvv_mul_p,em_rvv_mask_p,em_rvv_merge_p,em_rvv_shift_p,em_rvv_active_float,em_rvv_active_int,em_rvv_active_mask in *;intros j Hj.
assert(Hbound:0<=j<16)by lia.
specialize(HLOAD j Hj).
specialize(HVX j Hj).
specialize(HBIAS j Hj).
specialize(HVN j Hj).
specialize(HSHIFT j Hj).
specialize(HVN2 j Hj).
specialize(HVT j Hj).
specialize(HC4 j Hj).
specialize(HP4 j Hj).
specialize(HC3 j Hj).
specialize(HP3 j Hj).
specialize(HC2 j Hj).
specialize(HP2 j Hj).
specialize(HC1 j Hj).
specialize(HP1 j Hj).
specialize(HTM j Hj).
specialize(HFV j Hj).
specialize(HMASK j Hj).
specialize(HOUT j Hj).
unfold em_rvv_reint_f_i in HSHIFT;rewrite em_get_make_vint32m4_t in HSHIFT by exact Hbound;change(Z.land 23 31)with 23 in HSHIFT.
unfold em_rvv_reint_i_f;repeat rewrite em_get_make_vfloat32m4_t by exact Hbound.
repeat progress(rewrite ?HOUT,?HMASK,?HFV,?HTM,?HP1,?HC1,?HP2,?HC2,?HP3,?HC3,?HP4,?HC4,?HVT,?HVN2,?HSHIFT,?HVN,?HBIAS,?HVX,?HLOAD;unfold em_rvv_reint_i_f;rewrite ?em_get_make_vfloat32m4_t by exact Hbound;rewrite ?em_shift_power).
unfold em_rvv_value,em_rvv_polynomial.
destruct(Z.eqb(em_clt(em_rvv_sub(em_get F(p+4*j))maximum)em_denorm_cutoff)0);reflexivity.
Qed.
Print Assumptions em_rvv_expression_active.
