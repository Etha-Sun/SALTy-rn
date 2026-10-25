From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export NeonMemoryTactics NeonCallStore.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_store1_undef_prefix:forall p n,1<=n->
 CharArray.undef_full p n |-- p # Char |->_ ** CharArray.undef_full(p+1)(n-1).
Proof.
 intros p n Hn.
 pose proof(CharArray.undef_full_split_to_undef_full p 1 n ltac:(lia))as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 replace(p+1*1)with(p+1)in Hsplit by lia.
 eapply derivable1_trans;[exact Hsplit|].
 unfold CharArray.undef_full at 1;unfold store_undef_array at 1.
 change(Z.to_nat 1)with 1%nat;cbn[store_undef_array_rec].
 unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;entailer!.
Qed.
Print Assumptions qm_store1_undef_prefix.
Lemma qm_store2_undef_prefix:forall p n,2<=n->
 CharArray.undef_full p n |-- p # Char |->_ ** (p+1) # Char |->_ ** CharArray.undef_full(p+2)(n-2).
Proof.
 intros p n Hn.
 pose proof(CharArray.undef_full_split_to_undef_full p 2 n ltac:(lia))as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 replace(p+2*1)with(p+2)in Hsplit by lia.
 eapply derivable1_trans;[exact Hsplit|].
 unfold CharArray.undef_full at 1;unfold store_undef_array at 1.
 change(Z.to_nat 2)with 2%nat;cbn[store_undef_array_rec].
 unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;entailer!.
Qed.
Print Assumptions qm_store2_undef_prefix.
Lemma qm_store4_undef_prefix:forall p n,4<=n->
 CharArray.undef_full p n |-- p # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** CharArray.undef_full(p+4)(n-4).
Proof.
 intros p n Hn.
 pose proof(CharArray.undef_full_split_to_undef_full p 4 n ltac:(lia))as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 replace(p+4*1)with(p+4)in Hsplit by lia.
 eapply derivable1_trans;[exact Hsplit|].
 unfold CharArray.undef_full at 1;unfold store_undef_array at 1.
 change(Z.to_nat 4)with 4%nat;cbn[store_undef_array_rec].
 unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;entailer!.
Qed.
Print Assumptions qm_store4_undef_prefix.
