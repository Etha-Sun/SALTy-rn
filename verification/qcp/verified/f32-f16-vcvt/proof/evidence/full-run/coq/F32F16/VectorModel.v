From Coq Require Import ZArith.
From F32F16 Require Export Types IntegerModel.
Local Open Scope Z_scope.
Definition f16_active___riscv_vfabs_v_f32m8 (i vl:Z) (x:fp32) : fp32 := if Z.ltb i vl then (f16_abs x) else fp32_zero.
Definition f16_active___riscv_vadd_vx_u32m8 (i vl:Z) (x:Z) (b:Z) : Z := if Z.ltb i vl then (f16_add32 x b) else 0.
Definition f16_active___riscv_vand_vx_u32m8 (i vl:Z) (x:Z) (b:Z) : Z := if Z.ltb i vl then (f16_and32 x b) else 0.
Definition f16_active___riscv_vmaxu_vx_u32m8 (i vl:Z) (x:Z) (b:Z) : Z := if Z.ltb i vl then (f16_max32 x b) else 0.
Definition f16_active___riscv_vmsgtu_vx_u32m8_b4 (i vl:Z) (x:Z) (b:Z) : Z := if Z.ltb i vl then (if Z.ltb b x then 1 else 0) else 0.
Definition f16_active___riscv_vfmul_vf_f32m8 (i vl:Z) (x:fp32) (b:fp32) : fp32 := if Z.ltb i vl then (f16_rvv_mul x b) else fp32_zero.
Definition f16_active___riscv_vfadd_vv_f32m8 (i vl:Z) (x:fp32) (y:fp32) : fp32 := if Z.ltb i vl then (f16_rvv_add x y) else fp32_zero.
Definition f16_active_qcp_f16_rvv_shrn_0 (i vl:Z) (x:Z) : Z := if Z.ltb i vl then (f16_narrow16 x) else 0.
Definition f16_active_qcp_f16_rvv_shrn_13 (i vl:Z) (x:Z) : Z := if Z.ltb i vl then (f16_shrn13 x) else 0.
Definition f16_active_qcp_f16_rvv_shrn_16 (i vl:Z) (x:Z) : Z := if Z.ltb i vl then (f16_shrn16 x) else 0.
Definition f16_active___riscv_vand_vx_u16m4 (i vl:Z) (x:Z) (b:Z) : Z := if Z.ltb i vl then (f16_and16 x b) else 0.
Definition f16_active___riscv_vadd_vv_u16m4 (i vl:Z) (x:Z) (y:Z) : Z := if Z.ltb i vl then (f16_add16 x y) else 0.
Definition f16_active___riscv_vmerge_vxm_u16m4 (i vl:Z) (x:Z) (m:Z) (b:Z) : Z := if Z.ltb i vl then (if Z.eqb m 0 then x else b) else 0.
Definition f16_active___riscv_vor_vv_u16m4 (i vl:Z) (x:Z) (y:Z) : Z := if Z.ltb i vl then (f16_or16 x y) else 0.
