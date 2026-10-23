From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout ModeFacts U8Logic U8KernelLogic full10_goal.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma typed_nested_field_address : forall (R:rvalue_expr) (t f g:string),
 eval_addr_expr (RE_addr_of (LE_dot_field (LE_arrow_field
   (RE_const (eval_addr_expr R) (FET_alias t)) f) g)) =
 eval_addr_expr (RE_addr_of (LE_dot_field (LE_arrow_field R f) g)).
Proof.
 intros; apply eval_addr_expr_congr; apply RE_addr_of_congr;
 apply LE_dot_field_congr; [|reflexivity].
 apply LE_arrow_field_congr; [apply eval_addr|reflexivity].
Qed.
Print Assumptions typed_nested_field_address.
Ltac facts batch_pre lo hi :=
 try (pose proof (u8_phase_split batch_pre ltac:(lia)));
 try (pose proof (Z.mod_pos_bound lo 256 ltac:(lia)));
 try (pose proof (Z.mod_pos_bound hi 256 ltac:(lia)));
 unfold unsigned_last_nbits,u8_bound in *;
 try change (2^8)%Z with 256%Z in *;
 rewrite ?sizeof_uchar in *;
 rewrite ?Z.sub_0_r, ?Z.add_0_l, ?Z.add_0_r, ?Z.mul_1_r, ?Z.mul_0_l in *;
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;
 rewrite ?typed_field_address; rewrite <-?nested_field_address; rewrite <-?dot_field_address;
 rewrite ?typed_nested_field_address;
 entailer!;
 rewrite ?typed_field_address; rewrite <-?nested_field_address; rewrite <-?dot_field_address;
 rewrite ?typed_nested_field_address;
 try (opaque_leaves; sepcon_assoc_change; fast_cancel).
Lemma proof_of_test_neon_partial_solve_wit_11 : full10_goal.test_neon_partial_solve_wit_11.
Proof. unfold full10_goal.test_neon_partial_solve_wit_11; intros; facts batch_pre lo hi.  Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_11.
