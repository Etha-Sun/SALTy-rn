From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import Types output_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_output_split : forall base count L idx i,0<=idx+i<count ->
 IntArray.full base count L |-- IntArray.missing_i base(idx+i)0 count L ** (base+idx*4+i*4) # Int |-> Znth(idx+i)L 0.
Proof.
 intros base count L idx i H.
 pose proof(IntArray.full_split_to_missing_i base(idx+i)count L 0 H)as Hsplit.
 unfold StoreIntAsElement.storeA in Hsplit;rewrite sizeof_int in Hsplit.
 replace(base+idx*4+i*4)with(base+(idx+i)*4)by ring.
 eapply derivable1_trans;[exact Hsplit|apply derivable1_sepcon_comm].
Qed.
Lemma rd_output_merge : forall base count L idx i v,0<=idx+i<count ->
 IntArray.missing_i base(idx+i)0 count L ** (base+idx*4+i*4) # Int |-> v |-- IntArray.full base count(replace_Znth(idx+i)v L).
Proof.
 intros base count L idx i v H.
 pose proof(IntArray.missing_i_merge_to_full base(idx+i)count v L H)as Hmerge.
 unfold StoreIntAsElement.storeA in Hmerge;rewrite sizeof_int in Hmerge.
 replace(base+idx*4+i*4)with(base+(idx+i)*4)by ring.
 eapply derivable1_trans;[apply derivable1_sepcon_comm|exact Hmerge].
Qed.
Module CheckedOutputScalar : Qs8Rdsum.output_scalar_goal.VC_Correct.
Lemma proof_of_rdsum_get_i32_entail_wit_1 : Qs8Rdsum.output_scalar_goal.rdsum_get_i32_entail_wit_1.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_get_i32_entail_wit_1;right;intros;subst p_pre;rewrite sizeof_int;apply rd_output_split;lia. Qed.
Lemma proof_of_rdsum_get_i32_entail_wit_2 : Qs8Rdsum.output_scalar_goal.rdsum_get_i32_entail_wit_2.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_get_i32_entail_wit_2;right;intros i_pre p_pre A idx count base;intros;subst p_pre;rewrite sizeof_int;pose proof(rd_output_merge base count A idx i_pre (Znth(idx+i_pre)A 0)ltac:(lia))as Hmerge;rewrite replace_Znth_Znth in Hmerge;exact Hmerge. Qed.
Lemma proof_of_rdsum_get_i32_return_wit_1 : Qs8Rdsum.output_scalar_goal.rdsum_get_i32_return_wit_1.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_get_i32_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_rdsum_put_i32_entail_wit_1 : Qs8Rdsum.output_scalar_goal.rdsum_put_i32_entail_wit_1.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_put_i32_entail_wit_1;right;intros;subst p_pre;rewrite sizeof_int;apply rd_output_split;lia. Qed.
Lemma proof_of_rdsum_put_i32_entail_wit_2 : Qs8Rdsum.output_scalar_goal.rdsum_put_i32_entail_wit_2.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_put_i32_entail_wit_2;right;intros;subst p_pre;rewrite sizeof_int;apply rd_output_merge;lia. Qed.
Lemma proof_of_rdsum_put_i32_return_wit_1 : Qs8Rdsum.output_scalar_goal.rdsum_put_i32_return_wit_1.
Proof. unfold Qs8Rdsum.output_scalar_goal.rdsum_put_i32_return_wit_1;intros;apply derivable1_refl. Qed.
End CheckedOutputScalar.
