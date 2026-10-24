From Coq Require Import ZArith Lia List.
From F32F16 Require Import ProgramModel VectorModel Literal RvvResult.
Local Open Scope Z_scope.
(* A name for the exact existing RVV floating intermediate, including inactive
   representatives. It adds no input restriction and changes no arithmetic. *)
Definition f16_rvv_named_core (i vl:Z)(a:list fp32):fp32 :=
 let x:=rvv_read_value i vl a in
 let ab:=f16_active___riscv_vfabs_v_f32m8 i vl x in
 let au:=bits_of_fp32 ab in
 let bias:=f16_active___riscv_vadd_vx_u32m8 i vl au 125829120 in
 let f:=f16_active___riscv_vfmul_vf_f32m8 i vl ab f16_scale_hi in
 let bias:=f16_active___riscv_vand_vx_u32m8 i vl bias 2139095040 in
 let f:=f16_active___riscv_vfmul_vf_f32m8 i vl f f16_scale_lo in
 let bias:=f16_active___riscv_vmaxu_vx_u32m8 i vl bias 1073741824 in
 f16_active___riscv_vfadd_vv_f32m8 i vl f(fp32_of_bits bias).
