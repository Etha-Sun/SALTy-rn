From Coq Require Import ZArith Lia List.
From F32F16 Require Import RvvNamedCore RvvResult ProgramModel VectorModel Literal.
Local Open Scope Z_scope.
Definition f16_rvv_after_named_core (i vl:Z)(a:list fp32)(f:fp32):Z :=
 let x:=rvv_read_value i vl a in
 let ab:=f16_active___riscv_vfabs_v_f32m8 i vl x in
 let nan:=f16_active___riscv_vmsgtu_vx_u32m8_b4 i vl(bits_of_fp32 ab)2139095040 in
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
Lemma f16_pipeline_from_named_core:forall i vl a,
 f16_rvv_after_named_core i vl a(f16_rvv_named_core i vl a)=f16_pipeline i vl a.
Proof. intros;unfold f16_rvv_after_named_core,f16_rvv_named_core,f16_pipeline;reflexivity. Qed.
Lemma f16_rvv_named_core_active:forall i vl a,0<=i<vl ->
 f16_rvv_named_core i vl a=f16_rvv_core(Znth i a fp32_zero).
Proof.
 intros i vl a Hi;unfold f16_rvv_named_core,rvv_read_value.
 unfold f16_active___riscv_vfabs_v_f32m8,f16_active___riscv_vadd_vx_u32m8,
 f16_active___riscv_vfmul_vf_f32m8,f16_active___riscv_vand_vx_u32m8,
 f16_active___riscv_vmaxu_vx_u32m8,f16_active___riscv_vfadd_vv_f32m8.
 assert(Hlt:(i<?vl)=true)by(apply Z.ltb_lt;lia);rewrite Hlt;cbv zeta.
 unfold f16_rvv_core,f16_bias;reflexivity.
Qed.
Print Assumptions f16_pipeline_from_named_core.
Print Assumptions f16_rvv_named_core_active.
