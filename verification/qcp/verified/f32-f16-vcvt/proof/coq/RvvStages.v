From Coq Require Import ZArith Lia List.
From F32F16 Require Import ProgramModel VectorModel Literal RvvResult.
Local Open Scope Z_scope.
(* Exact staged definitions of the existing RVV computation. No arithmetic
   step is changed and inactive representatives remain those of VectorModel. *)
Definition f16_stage_0 (i vl:Z)(a:list fp32):fp32 := rvv_read_value i vl a.
Definition f16_stage_1 (i vl:Z)(a:list fp32):fp32 := f16_active___riscv_vfabs_v_f32m8 i vl (f16_stage_0 i vl a).
Definition f16_stage_2 (i vl:Z)(a:list fp32):Z := bits_of_fp32 (f16_stage_1 i vl a).
Definition f16_stage_3 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vadd_vx_u32m8 i vl (f16_stage_2 i vl a) (125829120).
Definition f16_stage_4 (i vl:Z)(a:list fp32):fp32 := f16_active___riscv_vfmul_vf_f32m8 i vl (f16_stage_1 i vl a) (f16_scale_hi).
Definition f16_stage_5 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vmsgtu_vx_u32m8_b4 i vl (f16_stage_2 i vl a) (2139095040).
Definition f16_stage_6 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vand_vx_u32m8 i vl (f16_stage_3 i vl a) (2139095040).
Definition f16_stage_7 (i vl:Z)(a:list fp32):fp32 := f16_active___riscv_vfmul_vf_f32m8 i vl (f16_stage_4 i vl a) (f16_scale_lo).
Definition f16_stage_8 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vmaxu_vx_u32m8 i vl (f16_stage_6 i vl a) (1073741824).
Definition f16_stage_9 (i vl:Z)(a:list fp32):fp32 := f16_active___riscv_vfadd_vv_f32m8 i vl (f16_stage_7 i vl a) (fp32_of_bits (f16_stage_8 i vl a)).
Definition f16_stage_10 (i vl:Z)(a:list fp32):Z := bits_of_fp32 (f16_stage_9 i vl a).
Definition f16_stage_11 (i vl:Z)(a:list fp32):Z := bits_of_fp32 (f16_stage_0 i vl a).
Definition f16_stage_12 (i vl:Z)(a:list fp32):Z := f16_active_qcp_f16_rvv_shrn_13 i vl (f16_stage_10 i vl a).
Definition f16_stage_13 (i vl:Z)(a:list fp32):Z := f16_active_qcp_f16_rvv_shrn_0 i vl (f16_stage_10 i vl a).
Definition f16_stage_14 (i vl:Z)(a:list fp32):Z := f16_active_qcp_f16_rvv_shrn_16 i vl (f16_stage_11 i vl a).
Definition f16_stage_15 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vand_vx_u16m4 i vl (f16_stage_12 i vl a) (31744).
Definition f16_stage_16 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vand_vx_u16m4 i vl (f16_stage_13 i vl a) (4095).
Definition f16_stage_17 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vand_vx_u16m4 i vl (f16_stage_14 i vl a) (32768).
Definition f16_stage_18 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vadd_vv_u16m4 i vl (f16_stage_16 i vl a) (f16_stage_15 i vl a).
Definition f16_stage_19 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vmerge_vxm_u16m4 i vl (f16_stage_18 i vl a) (f16_stage_5 i vl a) (32256).
Definition f16_stage_20 (i vl:Z)(a:list fp32):Z := f16_active___riscv_vor_vv_u16m4 i vl (f16_stage_19 i vl a) (f16_stage_17 i vl a).
Lemma f16_staged_result : forall i vl a, f16_stage_20 i vl a=f16_pipeline i vl a.
Proof. intros;unfold f16_stage_20,f16_stage_19,f16_stage_18,f16_stage_17,f16_stage_16,f16_stage_15,f16_stage_14,f16_stage_13,f16_stage_12,f16_stage_11,f16_stage_10,f16_stage_9,f16_stage_8,f16_stage_7,f16_stage_6,f16_stage_5,f16_stage_4,f16_stage_3,f16_stage_2,f16_stage_1,f16_stage_0,f16_pipeline;reflexivity. Qed.
Print Assumptions f16_staged_result.
