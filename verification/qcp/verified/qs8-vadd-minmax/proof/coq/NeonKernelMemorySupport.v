From Coq Require Import ZArith Lia List.
From Qs8Add Require Export NeonKernelAutomation ProgramFacts NeonLaneFacts ComposedBridge KernelBounds.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* Introduction and outer-branch selection are done explicitly per actual
   field, so a spatial postcondition disjunction cannot be chosen too early. *)
Ltac qa_kernel_memory_prepare :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.

Ltac qa_kernel_memory_frame :=
 qa_kernel_memory_prepare;
 first [solve [unfold derivable1,andp,coq_prop,truep;intros;
   repeat first[assumption|split|reflexivity];lia]
 |solve [qa_kernel_frame]].

Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.

Lemma qa_kernel_lane_expression : forall a b az bz ma mb raw oz lo hi,
 qa_min(qa_max(qa_sat8(qa_neon_add16(qa_sat16(qa_neon_shift(qa_neon_mla(qa_neon_mul(qa_s16(a-az))ma)(qa_s16(b-bz))mb)(qa_ctrl raw)))oz))lo)hi =
 qa_neon_lane a b az bz ma mb raw oz lo hi.
Proof. intros;apply qa_neon_observed_lane_correct. Qed.

Lemma qa_kernel_output_window : forall p k r az bz ma mb raw oz lo hi A B,
 0<=k -> 0<=r -> k+r<=Zlength A -> k+r<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) r (qa_window k r az bz ma mb raw oz lo hi A B) |--
 CharArray.full p (k+r) (qa_values (k+r) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 pose proof (CharArray.full_merge_to_full p k (k+r)
  (qa_values k az bz ma mb raw oz lo hi A B)
  (qa_window k r az bz ma mb raw oz lo hi A B) ltac:(lia)) as HM.
 unfold StoreCharAsElement.sizeA in HM;rewrite sizeof_char in HM.
 replace(k+r-k)with r in HM by lia;rewrite Z.mul_1_r in HM.
 eapply derivable1_trans;[exact HM|].
 rewrite <-qa_values_append by assumption;apply derivable1_refl.
Qed.
Print Assumptions qa_kernel_lane_expression.
Print Assumptions qa_kernel_output_window.

Lemma qa_kernel_output_1 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+1<=Zlength A -> k+1<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) 1 (qa_pack1 (qa_at az bz ma mb raw oz lo hi A B (k+0))) |--
 CharArray.full p (k+1) (qa_values (k+1) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qa_pack1.
 rewrite <-(qa_window_1 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qa_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qa_kernel_output_1.

Lemma qa_kernel_output_2 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+2<=Zlength A -> k+2<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) 2 (qa_pack2 (qa_at az bz ma mb raw oz lo hi A B (k+0)) (qa_at az bz ma mb raw oz lo hi A B (k+1))) |--
 CharArray.full p (k+2) (qa_values (k+2) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qa_pack2.
 rewrite <-(qa_window_2 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qa_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qa_kernel_output_2.

Lemma qa_kernel_output_4 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+4<=Zlength A -> k+4<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) 4 (qa_pack4 (qa_at az bz ma mb raw oz lo hi A B (k+0)) (qa_at az bz ma mb raw oz lo hi A B (k+1)) (qa_at az bz ma mb raw oz lo hi A B (k+2)) (qa_at az bz ma mb raw oz lo hi A B (k+3))) |--
 CharArray.full p (k+4) (qa_values (k+4) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold qa_pack4.
 rewrite <-(qa_window_4 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qa_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qa_kernel_output_4.

Lemma qa_kernel_output_8 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+8<=Zlength A -> k+8<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) 8 (s8_pack8 (qa_at az bz ma mb raw oz lo hi A B (k+0)) (qa_at az bz ma mb raw oz lo hi A B (k+1)) (qa_at az bz ma mb raw oz lo hi A B (k+2)) (qa_at az bz ma mb raw oz lo hi A B (k+3)) (qa_at az bz ma mb raw oz lo hi A B (k+4)) (qa_at az bz ma mb raw oz lo hi A B (k+5)) (qa_at az bz ma mb raw oz lo hi A B (k+6)) (qa_at az bz ma mb raw oz lo hi A B (k+7))) |--
 CharArray.full p (k+8) (qa_values (k+8) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold s8_pack8.
 rewrite <-(qa_window_8 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qa_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qa_kernel_output_8.

Lemma qa_kernel_output_16 : forall p k az bz ma mb raw oz lo hi A B,
 0<=k -> k+16<=Zlength A -> k+16<=Zlength B ->
 CharArray.full p k (qa_values k az bz ma mb raw oz lo hi A B) **
 CharArray.full (p+k) 16 (s8_pack16 (qa_at az bz ma mb raw oz lo hi A B (k+0)) (qa_at az bz ma mb raw oz lo hi A B (k+1)) (qa_at az bz ma mb raw oz lo hi A B (k+2)) (qa_at az bz ma mb raw oz lo hi A B (k+3)) (qa_at az bz ma mb raw oz lo hi A B (k+4)) (qa_at az bz ma mb raw oz lo hi A B (k+5)) (qa_at az bz ma mb raw oz lo hi A B (k+6)) (qa_at az bz ma mb raw oz lo hi A B (k+7)) (qa_at az bz ma mb raw oz lo hi A B (k+8)) (qa_at az bz ma mb raw oz lo hi A B (k+9)) (qa_at az bz ma mb raw oz lo hi A B (k+10)) (qa_at az bz ma mb raw oz lo hi A B (k+11)) (qa_at az bz ma mb raw oz lo hi A B (k+12)) (qa_at az bz ma mb raw oz lo hi A B (k+13)) (qa_at az bz ma mb raw oz lo hi A B (k+14)) (qa_at az bz ma mb raw oz lo hi A B (k+15))) |--
 CharArray.full p (k+16) (qa_values (k+16) az bz ma mb raw oz lo hi A B).
Proof.
 intros.
 unfold s8_pack16.
 rewrite <-(qa_window_16 k az bz ma mb raw oz lo hi A B) by assumption.
 apply qa_kernel_output_window;try assumption;lia.
Qed.
Print Assumptions qa_kernel_output_16.

Lemma qa_memory_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof. intros P A q R H; eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac qa_memory_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply qa_memory_pull_left_tree;qa_memory_pull_tree q|eapply rvv_pull_through;qa_memory_pull_tree q]
 end.
Ltac qa_memory_clean_emp :=
 repeat first[
  match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
  |rewrite logic_equiv_sepcon_emp].
Lemma qa_memory_apply_two : forall P A B C R1 R2 : Assertion,
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
Ltac qa_memory_apply_pair H :=
 let T:=type of H in lazymatch T with (?A ** ?B |-- ?C)=>
 lazymatch goal with |-?P|--?Q=>
 eapply(derivable1_trans P(C ** _)Q);
 [eapply(qa_memory_apply_two P A B C);
  [qa_memory_pull_tree A|qa_memory_pull_tree B|exact H]|]
 end end.
Print Assumptions qa_memory_pull_left_tree.
Print Assumptions qa_memory_apply_two.

Lemma qa_memory_true_emp : (“ (0:Z)=0 ” && emp) --||-- emp.
Proof. split;entailer!. Qed.
Print Assumptions qa_memory_true_emp.
