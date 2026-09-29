(* Pending: requires the checked, unconditional load theorem. *)
Require Import isla.riscv64.riscv64.
Require Import RvvLoadChecked RvvKernelConditional RvvProgramConditional RvvByteSpecConditional.
Local Existing Instance isla.riscv64.arch.riscv64_arch.
Section checked_program.
Context `{!islaG Σ} `{!threadG}.
Definition rvv_kernel_correct := rvv_kernel_from_load_contract rvv_load_active_bytes_checked.
Definition rvv_program_correct := rvv_program_from_load_contract rvv_load_active_bytes_checked.
Definition rvv_program_byte_spec := rvv_program_byte_spec_from_load_contract rvv_load_active_bytes_checked.
End checked_program.
Print Assumptions rvv_kernel_correct.
Print Assumptions rvv_program_correct.
Print Assumptions rvv_program_byte_spec.
