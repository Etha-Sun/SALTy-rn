From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic.
From LeaderAutomation Require Import FastFrame.
From VectorProof Require Import AddressFacts MemorySplit.
From VectorVle Require Import unit_goal.
From VectorVmin Require Import unit_goal.
From VectorVmax Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac norm_addresses := rewrite ?typed_field_address;rewrite <-?dot_field_address;
 rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r in *.
Ltac direct_frame_fast := first
 [apply _derivable1_andp_intros;[direct_frame_fast|direct_frame_fast]
 |solve[apply derivable1s_coq_prop_r;first[assumption|reflexivity|lia]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]].
Lemma proof_of___riscv_vle8_v_u8m8_partial_solve_wit_33:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_33.
Proof. unfold VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_33;intros;subst;unfold UndefStructPredvuint8m8_t;norm_addresses;direct_frame_fast. Qed.
Print Assumptions proof_of___riscv_vle8_v_u8m8_partial_solve_wit_33.
Lemma proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_33:VectorVmin.unit_goal.__riscv_vminu_vx_u8m8_partial_solve_wit_33.
Proof. unfold VectorVmin.unit_goal.__riscv_vminu_vx_u8m8_partial_solve_wit_33;intros;subst;unfold UndefStructPredvuint8m8_t;norm_addresses;direct_frame_fast. Qed.
Print Assumptions proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_33.
Lemma proof_of___riscv_vmaxu_vx_u8m8_partial_solve_wit_33:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_33.
Proof. unfold VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_33;intros;subst;unfold UndefStructPredvuint8m8_t;norm_addresses;direct_frame_fast. Qed.
Print Assumptions proof_of___riscv_vmaxu_vx_u8m8_partial_solve_wit_33.
