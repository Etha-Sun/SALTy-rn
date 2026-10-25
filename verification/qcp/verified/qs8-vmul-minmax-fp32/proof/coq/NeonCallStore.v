From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import NeonMemoryTactics.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma qm_store8_undef_prefix : forall p n,8<=n ->
 CharArray.undef_full p n |--
 p # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ **
 (p+3) # Char |->_ ** (p+4) # Char |->_ ** (p+5) # Char |->_ **
 (p+6) # Char |->_ ** (p+7) # Char |->_ ** CharArray.undef_full(p+8)(n-8).
Proof.
 intros p n Hn.
 pose proof(CharArray.undef_full_split_to_undef_full p 8 n ltac:(lia))as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 replace(p+8*1)with(p+8)in Hsplit by lia.
 eapply derivable1_trans;[exact Hsplit|].
 unfold CharArray.undef_full at 1;unfold store_undef_array at 1.
 change(Z.to_nat 8)with 8%nat;cbn[store_undef_array_rec].
 unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;entailer!.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_56:
 Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof.
 unfold Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_56;qm_nm_intro.
 change(sizeof(CHAR))with 1 in *.
 sep_apply(qm_store8_undef_prefix output batch ltac:(lia)).
 replace((((((((batch-1)-1)-1)-1)-1)-1)-1)-1)with(batch-8)by lia.
 replace(((((((1+1)+1)+1)+1)+1)+1)+1)with 8 by reflexivity.
 qm_nm_start;qm_k_finish.
Qed.
Print Assumptions qm_store8_undef_prefix.
Print Assumptions proof_of_test_neon_partial_solve_wit_56.
