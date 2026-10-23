From Qu8Rsum Require Import __riscv_vmv_v_x_u32m8_goal __riscv_vmv_v_x_u32m8_proof_auto __riscv_vmv_v_x_u32m8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include __riscv_vmv_v_x_u32m8_proof_auto.
  Include __riscv_vmv_v_x_u32m8_proof_manual.
End VC_Correctness.
