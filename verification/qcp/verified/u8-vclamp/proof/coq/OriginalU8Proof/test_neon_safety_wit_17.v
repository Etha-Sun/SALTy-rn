From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout ModeFacts U8Logic U8KernelLogic full10_goal.
From CapabilitySplit Require Import NewModeFacts AllChecked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac kernel_frame :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;
 rewrite ?typed_field_address; rewrite <-?nested_field_address; rewrite <-?dot_field_address;
 repeat apply derivable1s_truep_intros;
 first [solve [apply derivable1s_coq_prop_r; lia] | opaque_leaves; sepcon_assoc_change; fast_cancel].
Lemma proof_of_test_neon_safety_wit_17 : full10_goal.test_neon_safety_wit_17.
Proof. pre_process_default; rewrite ?sizeof_uchar in *; first [solve [kernel_frame] | solve [entailer!]]. Qed.
Print Assumptions proof_of_test_neon_safety_wit_17.
