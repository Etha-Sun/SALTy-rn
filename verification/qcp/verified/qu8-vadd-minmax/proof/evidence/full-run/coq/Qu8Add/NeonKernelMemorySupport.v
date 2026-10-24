From Coq Require Import ZArith Lia List.
From Qu8Add Require Export NeonKernelAutomation ProgramFacts NeonLaneFacts ComposedBridge KernelBounds.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* Introduction and outer-branch selection are done explicitly per actual
   field, so a spatial postcondition disjunction cannot be chosen too early. *)
Ltac qu_kernel_memory_prepare :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.

Ltac qu_kernel_memory_frame :=
 qu_kernel_memory_prepare;
 first [solve [unfold derivable1,andp,coq_prop,truep;intros;
   repeat first[assumption|split|reflexivity];lia]
 |solve [qu_kernel_frame]].

Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_udiff qu_sat16 qu_usat8 qu_umin qu_umax qu_ctrl qu_values qu_window.

Lemma qu_kernel_lane_expression : forall a b az bz ma mb raw oz lo hi,
 qu_umin(qu_umax(qu_usat8(qu_neon_add16(qu_sat16(qu_neon_shift(qu_neon_mla(qu_neon_mul(qu_s16(qu_udiff a az))ma)(qu_s16(qu_udiff b bz))mb)(qu_ctrl raw)))oz))lo)hi =
 qu_neon_lane a b az bz ma mb raw oz lo hi.
Proof. intros;apply qu_neon_observed_lane_correct. Qed.

Lemma qu_kernel_output_window : forall p k r az bz ma mb raw oz lo hi A B,
 0<=k -> 0<=r -> k+r<=Zlength A -> k+r<=Zlength B ->
 UCharArray.full p k (qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full (p+k) r (qu_window k r az bz ma mb raw oz lo hi A B) |--
 UCharArray.full p (k+r) (qu_values (k+r) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 pose proof (UCharArray.full_merge_to_full p k (k+r)
  (qu_values k az bz ma mb raw oz lo hi A B)
  (qu_window k r az bz ma mb raw oz lo hi A B) ltac:(lia)) as HM.
 unfold StoreUCharAsElement.sizeA in HM;rewrite sizeof_uchar in HM.
 replace(k+r-k)with r in HM by lia;rewrite Z.mul_1_r in HM.
 eapply derivable1_trans;[exact HM|].
 rewrite <-qu_values_append by assumption;apply derivable1_refl.
Qed.
Print Assumptions qu_kernel_lane_expression.
Print Assumptions qu_kernel_output_window.

Lemma qu_kernel_output_1 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+1<=Zlength A -> k+1<=Zlength B ->
 UCharArray.full p k (qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full (p+k) 1 (qu_pack1 (qu_at az bz ma mb raw oz lo hi A B (k+0))) |--
 UCharArray.full p (k+1) (qu_values (k+1) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qu_pack1.
 rewrite <-(qu_window_1 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qu_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qu_kernel_output_1.

Lemma qu_kernel_output_2 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+2<=Zlength A -> k+2<=Zlength B ->
 UCharArray.full p k (qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full (p+k) 2 (qu_pack2 (qu_at az bz ma mb raw oz lo hi A B (k+0)) (qu_at az bz ma mb raw oz lo hi A B (k+1))) |--
 UCharArray.full p (k+2) (qu_values (k+2) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qu_pack2.
 rewrite <-(qu_window_2 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qu_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qu_kernel_output_2.

Lemma qu_kernel_output_4 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+4<=Zlength A -> k+4<=Zlength B ->
 UCharArray.full p k (qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full (p+k) 4 (qu_pack4 (qu_at az bz ma mb raw oz lo hi A B (k+0)) (qu_at az bz ma mb raw oz lo hi A B (k+1)) (qu_at az bz ma mb raw oz lo hi A B (k+2)) (qu_at az bz ma mb raw oz lo hi A B (k+3))) |--
 UCharArray.full p (k+4) (qu_values (k+4) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qu_pack4.
 rewrite <-(qu_window_4 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qu_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qu_kernel_output_4.

Lemma qu_kernel_output_8 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+8<=Zlength A -> k+8<=Zlength B ->
 UCharArray.full p k (qu_values k az bz ma mb raw oz lo hi A B) **
 UCharArray.full (p+k) 8 (u8_pack8 (qu_at az bz ma mb raw oz lo hi A B (k+0)) (qu_at az bz ma mb raw oz lo hi A B (k+1)) (qu_at az bz ma mb raw oz lo hi A B (k+2)) (qu_at az bz ma mb raw oz lo hi A B (k+3)) (qu_at az bz ma mb raw oz lo hi A B (k+4)) (qu_at az bz ma mb raw oz lo hi A B (k+5)) (qu_at az bz ma mb raw oz lo hi A B (k+6)) (qu_at az bz ma mb raw oz lo hi A B (k+7))) |--
 UCharArray.full p (k+8) (qu_values (k+8) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold u8_pack8.
 rewrite <-(qu_window_8 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qu_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qu_kernel_output_8.

Lemma qu_memory_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof. intros P A q R H; eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac qu_memory_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply qu_memory_pull_left_tree;qu_memory_pull_tree q|eapply rvv_pull_through;qu_memory_pull_tree q]
 end.
Ltac qu_memory_clean_emp :=
 repeat first[
  match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
  |rewrite logic_equiv_sepcon_emp].
Lemma qu_memory_apply_two : forall P A B C R1 R2 : Assertion,
 (P |-- A ** R1) -> (R1 |-- B ** R2) -> (A ** B |-- C) ->
 P |-- C ** R2.
Proof.
 intros P A B C R1 R2 H1 H2 H3.
 eapply derivable1_trans;[exact H1|].
 eapply derivable1_trans;
 [apply derivable1_sepcon_mono;[apply derivable1_refl|exact H2]|].
 rewrite logic_equiv_sepcon_assoc.
 apply derivable1_sepcon_mono;[exact H3|apply derivable1_refl].
Qed.
Ltac qu_memory_apply_pair H :=
 let T:=type of H in lazymatch T with (?A ** ?B |-- ?C)=>
 lazymatch goal with |-?P|--?Q=>
 eapply(derivable1_trans P(C ** _)Q);
 [eapply(qu_memory_apply_two P A B C);
  [qu_memory_pull_tree A|qu_memory_pull_tree B|exact H]|]
 end end.
Print Assumptions qu_memory_pull_left_tree.
Print Assumptions qu_memory_apply_two.

Lemma qu_memory_true_emp : (“ (0:Z)=0 ” && emp) --||-- emp.
Proof. split;entailer!. Qed.
Print Assumptions qu_memory_true_emp.
