From Coq Require Import ZArith List Lia.
From Qd8Phase Require Import IntegerFold.
From Qd8Indirect Require Import IndirectionModel.
Import ListNotations.
Open Scope Z_scope.

(* Each entry contributes K signed-byte products in source order.
   Read-only input aliases do not give separate ownership of each entry. *)
Fixpoint indirect_dot32 (acc:Z) (blocks:list (list (Z*Z))) : Z :=
 match blocks with
 | [] => acc
 | terms::rest => indirect_dot32 (dot32 acc terms) rest
 end.
Theorem indirect_dot32_flatten : forall blocks acc,
 indirect_dot32 acc blocks = dot32 acc (concat blocks).
Proof.
 induction blocks as [|terms rest IH];intro acc;cbn;[reflexivity|].
 rewrite dot32_chunk;apply IH.
Qed.
Theorem indirect_dot32_single_mod : forall blocks acc,
 wrap32 (indirect_dot32 acc blocks) =
 wrap32 (acc + sum_products (concat blocks)).
Proof. intros;rewrite indirect_dot32_flatten;apply dot32_as_single_mod. Qed.
Definition panel_bytes (entries K:Z):Z:=96+8*entries*K.
Theorem packed_panel_decomposition : forall entries K,
 panel_bytes entries K = 32+entries*(8*K)+32+32.
Proof. intros;unfold panel_bytes;ring. Qed.
Theorem packed_weight_cell_in_panel : forall entries K e k lane,
 0<=e<entries -> 0<=k<K -> 0<=lane<8 ->
 32<=32+(e*K+k)*8+lane<panel_bytes entries K-64.
Proof. intros;unfold panel_bytes;nia. Qed.
Theorem table_cursor_safe_and_rewinds : forall table ks index,
 0<=table -> 0<=ks -> Z.rem ks 8=0 ->
 table+ks<=18446744073709551615 ->
 0<=index<=Z.quot ks 8 ->
 0<=table+8*index<=18446744073709551615 /\
 table+8*(Z.quot ks 8)-ks=table.
Proof.
 intros table ks index Ht Hks Hrem Hmax Hi.
 pose proof (Z.quot_rem ks 8) as E.
 specialize (E ltac:(lia));rewrite Hrem in E;split;lia.
Qed.
Theorem zero_entry_ignores_offset : forall zero zero_data offset,
 selected_address zero zero zero_data offset = zero_data.
Proof. intros;unfold selected_address;destruct (Z.eq_dec zero zero);congruence. Qed.
Print Assumptions indirect_dot32_flatten.
Print Assumptions indirect_dot32_single_mod.
Print Assumptions packed_weight_cell_in_panel.
Print Assumptions table_cursor_safe_and_rewinds.
Print Assumptions zero_entry_ignores_offset.
