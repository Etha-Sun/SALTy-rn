From Coq Require Import ZArith.
From Rndne Require Export Types.
Local Open Scope Z_scope.
Definition rndne_active___riscv_vfabs_v_f32m8 (i vl:Z) (xi:fp32) : fp32 := if Z.ltb i vl then rndne_abs xi else fp32_zero.
Definition rndne_active___riscv_vfadd_vf_f32m8 (i vl:Z) (xi:fp32) (b:fp32) : fp32 := if Z.ltb i vl then rndne_rvv_add xi b else fp32_zero.
Definition rndne_active___riscv_vfsub_vf_f32m8 (i vl:Z) (xi:fp32) (b:fp32) : fp32 := if Z.ltb i vl then rndne_rvv_sub xi b else fp32_zero.
Definition rndne_active___riscv_vfsgnj_vv_f32m8 (i vl:Z) (xi:fp32) (yi:fp32) : fp32 := if Z.ltb i vl then rndne_sign xi yi else fp32_zero.
Definition rndne_active___riscv_vmfgt_vf_f32m8_b4 (i vl:Z) (xi:fp32) (b:fp32) : Z := if Z.ltb i vl then rndne_gt xi b else 0.
Definition rndne_active___riscv_vor_vx_u32m8 (i vl:Z) (xi:Z) (b:Z) : Z := if Z.ltb i vl then Z.lor xi b else 0.
Definition rndne_active___riscv_vmerge_vvm_f32m8 (i vl:Z) (xi:fp32) (yi:fp32) (mi:Z) : fp32 := if Z.ltb i vl then if Z.eqb mi 0 then xi else yi else fp32_zero.
Definition rndne_active_self_ne (i vl:Z) (x:fp32) : Z := if Z.ltb i vl then rndne_ne x x else 0.
Definition rndne_active_ne (i vl:Z) (x y:fp32) : Z := if Z.ltb i vl then rndne_ne x y else 0.
