From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export Model Address ShapeFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma spmm_prefix_aligned_nat : forall count ds,
 Forall (fun d=>d mod 4=0) ds -> prefix_sum_nat count ds mod 4=0.
Proof.
 induction count;intros ds H;[reflexivity|].
 destruct ds as[|d ds];[reflexivity|].
 inversion H;subst;cbn [prefix_sum_nat];rewrite Z.add_mod by lia.
 rewrite H2,IHcount by assumption;reflexivity.
Qed.
Lemma spmm_prefix_aligned : forall ds cursor,
 Forall (fun d=>d mod 4=0) ds -> prefix_sum ds cursor mod 4=0.
Proof. intros;unfold prefix_sum;now apply spmm_prefix_aligned_nat. Qed.
Lemma spmm_div_exact : forall x,x mod 4=0 -> 4*(x/4)=x.
Proof. intros;pose proof(Z.div_mod x 4 ltac:(lia));lia. Qed.
Lemma spmm_input_index_step : forall ds cursor start row,
 Forall (fun d=>d mod 4=0) ds -> 0<=cursor<Zlength ds ->
 4*input_index ds start row (cursor+1)=4*input_index ds start row cursor+z_at ds cursor.
Proof.
 intros;unfold input_index.
 pose proof(spmm_div_exact (prefix_sum ds cursor) (spmm_prefix_aligned ds cursor H)).
 pose proof(spmm_div_exact (prefix_sum ds (cursor+1)) (spmm_prefix_aligned ds (cursor+1) H)).
 pose proof(prefix_sum_step ds cursor H0);lia.
Qed.
Lemma spmm_delta_range : forall ds cursor,
 Forall (fun d=>-2147483648<=d<=2147483647 /\ d mod 4=0) ds ->
 0<=cursor<Zlength ds -> -2147483648<=z_at ds cursor<=2147483647 /\ z_at ds cursor mod 4=0.
Proof.
 intros;unfold z_at;rewrite Forall_forall in H;apply H;apply nth_In.
 rewrite Zlength_correct in H0;lia.
Qed.
Lemma spmm_next_column_cursor : forall nnz ds column start row,
 0<=column<Zlength nnz ->
 input_index ds start row(nnz_before nnz column+z_at nnz column)=
 input_index ds start row(nnz_before nnz (column+1)).
Proof. intros;unfold nnz_before;now rewrite prefix_sum_step by assumption. Qed.
Lemma spmm_nnz_end : forall rows columns start nnz ds input weights,
 spmm_shape rows columns start nnz ds input weights -> nnz_before nnz columns=Zlength ds.
Proof.
 intros;unfold spmm_shape in H;decompose [and] H;unfold nnz_before.
 replace columns with(Zlength nnz)by lia;rewrite prefix_sum_all;lia.
Qed.

Lemma spmm_float_loan : forall base i len xs,
 0<=i<len -> FloatArray.full base len xs |--
 (base+i*4)#Float |-> fp_at xs i ** FloatArray.missing_i base i 0 len xs.
Proof.
 intros;pose proof(FloatArray.full_split_to_missing_i base i len xs fp32_zero H)as E.
 unfold StoreFloatAsElement.storeA in E;rewrite sizeof_float in E;exact E.
Qed.
Lemma spmm_float_restore : forall base i len xs,
 0<=i<len ->
 (base+i*4)#Float |-> fp_at xs i ** FloatArray.missing_i base i 0 len xs |--
 FloatArray.full base len xs.
Proof.
 intros;pose proof(FloatArray.missing_i_merge_to_full base i len (Znth i xs fp32_zero) xs H)as E.
 unfold StoreFloatAsElement.storeA in E;rewrite sizeof_float,replace_Znth_Znth in E;exact E.
Qed.
Lemma spmm_int_loan : forall base i len xs,
 0<=i<len -> IntArray.full base len xs |--
 (base+i*4)#Int |-> z_at xs i ** IntArray.missing_i base i 0 len xs.
Proof.
 intros;pose proof(IntArray.full_split_to_missing_i base i len xs 0 H)as E.
 unfold StoreIntAsElement.storeA in E;rewrite sizeof_int in E;exact E.
Qed.
Lemma spmm_uint_loan : forall base i len xs,
 0<=i<len -> UIntArray.full base len xs |--
 (base+i*sizeof(UINT))#UInt |-> z_at xs i ** UIntArray.missing_i base i 0 len xs.
Proof. intros;exact(UIntArray.full_split_to_missing_i base i len xs 0 H). Qed.
Print Assumptions spmm_input_index_step.
Print Assumptions spmm_delta_range.
Print Assumptions spmm_next_column_cursor.
Print Assumptions spmm_nnz_end.
Print Assumptions spmm_float_loan.
Print Assumptions spmm_float_restore.
Print Assumptions spmm_int_loan.
Print Assumptions spmm_uint_loan.
