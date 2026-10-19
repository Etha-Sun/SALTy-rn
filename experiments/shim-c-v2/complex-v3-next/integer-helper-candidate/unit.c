#include "fp_repr.c"
#include "fp_index.c"
#include "quantized.c"
/*@ \wp::strategy IntSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy IntArray: \tactic("Wp.array",\ingoal(A[I[V]][J]),\children(IntSolve)),IntSolve;
 \wp::proof IntArray: vandq_u32,vbicq_u32,vaddq_u32,__riscv_vid_v_u32m1,__riscv_vadd_vx_u32m1,__riscv_vmul_vx_u32m1,__riscv_vmsge_vx_i32m1_b32,__riscv_vmslt_vx_i32m1_b32,__riscv_vmand_mm_b32,__riscv_vle32_v_u32m8,__riscv_vmv_v_x_u32m8,__riscv_vse32_v_u32m8; */
