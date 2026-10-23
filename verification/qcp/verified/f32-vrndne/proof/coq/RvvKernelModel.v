From Coq Require Import ZArith Reals.
From QcpRvv32 Require Import RvvStoreModel.
From Rndne Require Import VectorModel.
Local Open Scope Z_scope.
Definition rndne_kernel_vx(i vl:Z)(a:list fp32):fp32 := rvv_read_value i vl a.
Definition rndne_kernel_vabsx (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vfabs_v_f32m8 (i) (vl) ((rvv_read_value i vl a))).
Definition rndne_kernel_cmp (i vl:Z)(a:list fp32):Z :=
 (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R))).
Definition rndne_kernel_vrndabsx_add (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vfadd_vf_f32m8 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R))).
Definition rndne_kernel_vrndabsx_sub (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vfsub_vf_f32m8 (i) (vl) ((rndne_active___riscv_vfadd_vf_f32m8 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R)))) ((fp32_of_real (8388608.0)%R))).
Definition rndne_kernel_vrnd_signed (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vfsgnj_vv_f32m8 (i) (vl) ((rndne_active___riscv_vfsub_vf_f32m8 (i) (vl) ((rndne_active___riscv_vfadd_vf_f32m8 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R)))) ((fp32_of_real (8388608.0)%R)))) ((rvv_read_value i vl a))).
Definition rndne_kernel_vy_merged (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vmerge_vvm_f32m8 (i) (vl) ((rndne_active___riscv_vfsgnj_vv_f32m8 (i) (vl) ((rndne_active___riscv_vfsub_vf_f32m8 (i) (vl) ((rndne_active___riscv_vfadd_vf_f32m8 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R)))) ((fp32_of_real (8388608.0)%R)))) ((rvv_read_value i vl a)))) ((rvv_read_value i vl a)) ((rndne_active___riscv_vmfgt_vf_f32m8_b4 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R))))).
Definition rndne_kernel_is_nan (i vl:Z)(a:list fp32):Z :=
 (rndne_active_self_ne (i) (vl) ((rvv_read_value i vl a))).
Definition rndne_kernel_vx_u32 (i vl:Z)(a:list fp32):Z :=
 (bits_of_fp32 ((rvv_read_value i vl a))).
Definition rndne_kernel_vx_quiet (i vl:Z)(a:list fp32):Z :=
 (rndne_active___riscv_vor_vx_u32m8 (i) (vl) ((rndne_kernel_vx_u32 i vl a)) (4194304)).
Definition rndne_kernel_vx_qnan (i vl:Z)(a:list fp32):fp32 :=
 (fp32_of_bits ((rndne_active___riscv_vor_vx_u32m8 (i) (vl) ((rndne_kernel_vx_u32 i vl a)) (4194304)))).
Definition rndne_kernel_result (i vl:Z)(a:list fp32):fp32 :=
 (rndne_active___riscv_vmerge_vvm_f32m8 (i) (vl) ((rndne_active___riscv_vmerge_vvm_f32m8 (i) (vl) ((rndne_active___riscv_vfsgnj_vv_f32m8 (i) (vl) ((rndne_active___riscv_vfsub_vf_f32m8 (i) (vl) ((rndne_active___riscv_vfadd_vf_f32m8 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R)))) ((fp32_of_real (8388608.0)%R)))) ((rvv_read_value i vl a)))) ((rvv_read_value i vl a)) ((rndne_active___riscv_vmfgt_vf_f32m8_b4 (i) (vl) ((rndne_kernel_vabsx i vl a)) ((fp32_of_real (8388608.0)%R)))))) ((fp32_of_bits ((rndne_active___riscv_vor_vx_u32m8 (i) (vl) ((rndne_kernel_vx_u32 i vl a)) (4194304))))) ((rndne_kernel_is_nan i vl a))).
