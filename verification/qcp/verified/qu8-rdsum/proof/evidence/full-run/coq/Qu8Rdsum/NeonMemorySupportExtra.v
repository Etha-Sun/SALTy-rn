From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export NeonMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma rd_neon_unsigned_sum : forall a b,
 unsigned_last_nbits(unsigned_last_nbits a 32+unsigned_last_nbits b 32)32=
 rs_u32(a+b).
Proof. intros;change(rs_u32(rs_u32 a+rs_u32 b)=rs_u32(a+b));rewrite rs_u32_add_l,rs_u32_add_r;reflexivity. Qed.
Lemma rd_neon_modular_final_lane : forall M base rows channels stride k q i j Init,
 0<=k ->k<=j ->0<=i<4 ->j<channels ->j=q+i ->
 Zlength Init=channels ->
 rs_u32(Znth j(rd_partial M base rows channels stride k Init)0+
  rd_acc32 M base stride q rows i 4)=rd_result_lane M base rows stride j Init.
Proof.
 intros;rewrite rd_partial_suffix by lia.
 unfold rd_acc32;destruct(Z.ltb_spec i 4);[|lia].
 rewrite rs_u32_add_r;subst j;reflexivity.
Qed.
Lemma rd_neon_final_initial_lane : forall M base rows channels stride q i j Init,
 0<=j<channels ->0<=i<4 ->j=q+i ->Zlength Init=channels ->rd_init_range Init ->
 rs_add_u32(Znth j Init 0)(rd_acc32 M base stride q rows i 4)=
 rd_result_lane M base rows stride j Init.
Proof.
 intros M base rows channels stride q i j Init Hj Hi Heq Hlen Hrange.
 pose proof(rd_neon_final_lane_at M base rows channels stride 0 q i j Init
  ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption))as HH.
 rewrite rd_partial_initial in HH;exact HH.
Qed.
Print Assumptions rd_neon_unsigned_sum.
Print Assumptions rd_neon_modular_final_lane.
Print Assumptions rd_neon_final_initial_lane.

Lemma rd_neon_pull_left_tree : forall P A q R:Assertion,
 (P|--q ** R)->(P ** A|--q ** (R ** A)).
Proof.
 intros P A q R H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac rd_neon_pull_tree q :=
 lazymatch goal with
 | |-q ** ?R|--_=>apply derivable1_refl
 | |-q|--q ** ?R=>unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |-?A ** ?B|--_=>first[eapply rd_neon_pull_left_tree;rd_neon_pull_tree q|eapply rvv_pull_through;rd_neon_pull_tree q]
 end.
Lemma rd_neon_apply_two : forall P A B C R1 R2:Assertion,
 (P|--A ** R1)->(R1|--B ** R2)->(A ** B|--C)->P|--C ** R2.
Proof.
 intros P A B C R1 R2 H1 H2 H3.
 eapply derivable1_trans;[exact H1|].
 eapply derivable1_trans;[apply derivable1_sepcon_mono;[apply derivable1_refl|exact H2]|].
 rewrite logic_equiv_sepcon_assoc.
 apply derivable1_sepcon_mono;[exact H3|apply derivable1_refl].
Qed.
Ltac rd_neon_apply_pair H :=
 let T:=type of H in lazymatch T with (?A ** ?B|--?C)=>
 lazymatch goal with |-?P|--?Q=>
 eapply(derivable1_trans P(C ** _)Q);
 [eapply(rd_neon_apply_two P A B C);
  [rd_neon_pull_tree A|rd_neon_pull_tree B|exact H]|]
 end end.
Ltac rd_neon_clean_emp :=
 repeat first[
 match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
 |rewrite logic_equiv_sepcon_emp].
Print Assumptions rd_neon_pull_left_tree.
Print Assumptions rd_neon_apply_two.
