From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From QcpRvv32 Require Import RvvStoreModel RvvResultBridge.
From F32F16 Require Import ProgramModel VectorModel Literal.
Import ListNotations. Local Open Scope Z_scope.
Definition f16_pipeline (i vl:Z)(a:list fp32):Z :=
 let x:=rvv_read_value i vl a in
 let ab:=f16_active___riscv_vfabs_v_f32m8 i vl x in
 let au:=bits_of_fp32 ab in
 let bias:=f16_active___riscv_vadd_vx_u32m8 i vl au 125829120 in
 let f:=f16_active___riscv_vfmul_vf_f32m8 i vl ab f16_scale_hi in
 let nan:=f16_active___riscv_vmsgtu_vx_u32m8_b4 i vl au 2139095040 in
 let bias:=f16_active___riscv_vand_vx_u32m8 i vl bias 2139095040 in
 let f:=f16_active___riscv_vfmul_vf_f32m8 i vl f f16_scale_lo in
 let bias:=f16_active___riscv_vmaxu_vx_u32m8 i vl bias 1073741824 in
 let f:=f16_active___riscv_vfadd_vv_f32m8 i vl f(fp32_of_bits bias)in
 let fu:=bits_of_fp32 f in
 let xu:=bits_of_fp32 x in
 let ex:=f16_active_qcp_f16_rvv_shrn_13 i vl fu in
 let mant:=f16_active_qcp_f16_rvv_shrn_0 i vl fu in
 let sign:=f16_active_qcp_f16_rvv_shrn_16 i vl xu in
 let ex:=f16_active___riscv_vand_vx_u16m4 i vl ex 31744 in
 let mant:=f16_active___riscv_vand_vx_u16m4 i vl mant 4095 in
 let sign:=f16_active___riscv_vand_vx_u16m4 i vl sign 32768 in
 let h:=f16_active___riscv_vadd_vv_u16m4 i vl mant ex in
 let h:=f16_active___riscv_vmerge_vxm_u16m4 i vl h nan 32256 in
 f16_active___riscv_vor_vv_u16m4 i vl h sign.
Lemma f16_pipeline_active : forall i vl a,0<=i<vl -> f16_pipeline i vl a=f16_rvv_lane(Znth i a fp32_zero).
Proof.
 intros i vl a Hi;unfold f16_pipeline.
 unfold rvv_read_value,f16_active___riscv_vfabs_v_f32m8,f16_active___riscv_vadd_vx_u32m8,f16_active___riscv_vand_vx_u32m8,f16_active___riscv_vmaxu_vx_u32m8,f16_active___riscv_vmsgtu_vx_u32m8_b4,f16_active___riscv_vfmul_vf_f32m8,f16_active___riscv_vfadd_vv_f32m8,f16_active_qcp_f16_rvv_shrn_0,f16_active_qcp_f16_rvv_shrn_13,f16_active_qcp_f16_rvv_shrn_16,f16_active___riscv_vand_vx_u16m4,f16_active___riscv_vadd_vv_u16m4,f16_active___riscv_vmerge_vxm_u16m4,f16_active___riscv_vor_vv_u16m4.
 assert(Hlt:(i<?vl)=true)by(apply Z.ltb_lt;lia);rewrite Hlt;cbv zeta.
 unfold f16_rvv_lane,f16_rvv_core,f16_bias,f16_core_half,f16_sign_half.
 destruct(Z.ltb 2139095040(bits_of_fp32(f16_abs(Znth i a fp32_zero))));reflexivity.
Qed.
Definition f16_pipeline_result32(vl:Z)(a:list fp32):list Z:=map(fun i=>f16_pipeline(Z.of_nat i)vl a)(seq 0 32).
Lemma f16_pipeline_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a -> f16_take vl(f16_pipeline_result32 vl a)=f16_rvv_values vl a.
Proof.
 intros vl a Hv Ha;apply nth_ext with(d:=0)(d':=0).
 - unfold f16_take,f16_pipeline_result32,f16_rvv_values;rewrite !length_firstn,!length_map,length_seq,Zlength_correct in *;rewrite !Nat.min_l by lia;reflexivity.
 - intros i Hi;unfold f16_take,f16_pipeline_result32 in *;rewrite length_firstn,length_map,length_seq in Hi.
   rewrite nth_firstn by lia;rewrite nth_map_seq_bounded by lia.
   rewrite f16_pipeline_active by lia;unfold Znth;rewrite Nat2Z.id.
   unfold f16_rvv_values;rewrite nth_firstn by lia.
   symmetry;rewrite nth_indep with(d':=f16_rvv_lane fp32_zero)by(rewrite length_map;rewrite Zlength_correct in Ha;lia).
   exact(map_nth f16_rvv_lane a fp32_zero i).
Qed.
Print Assumptions f16_pipeline_active.
Print Assumptions f16_pipeline_prefix.
