From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export MemoryModel IntrinsicSemantics.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One owner per distinct pointer-table cell, even when pixels reuse tables. *)
Definition APPtrMap:Type:=list(Z*Z).
Fixpoint ap_ptr_get(P:APPtrMap)(p:Z):Z:=
 match P with []=>0|(q,v)::rest=>if Z.eqb p q then v else ap_ptr_get rest p end.
Fixpoint ap_ptr_data(P:APPtrMap):Assertion:=
 match P with []=>emp|(p,v)::rest=>(p # Ptr |-> v)**ap_ptr_data rest end.
Definition ap_ptr_present(P:APPtrMap)(p:Z):Prop:=In(p,ap_ptr_get P p)P.
Definition ap_ptr_window(P:APPtrMap)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->ap_ptr_present P(p+8*j).
Definition ap_u64(x:Z):Z:=unsigned_last_nbits x 64.
Definition ap_pixel_table(input increment pixel:Z):Z:=ap_u64(input+pixel*increment).
Definition ap_pixel_offset(offset stride pixel:Z):Z:=ap_u64(offset+pixel*stride).
Definition ap_input_value(F:APMap)(P:APPtrMap)(table offset row channel:Z):fp32:=
 ap_get F(ap_u64(ap_ptr_get P(table+8*row)+offset)+4*channel).

(* Model the actual nine-input pass, including its i0 padding. No claim that
   this padded sequence has been replaced by a different abstract algorithm. *)
Definition ap_pass_row(base remaining j:Z):Z:=if Z.ltb j remaining then base+j else base.
Definition ap_candidate(F:APMap)(P:APPtrMap)(table offset channel base remaining j:Z):fp32*Z:=
 (ap_input_value F P table offset(ap_pass_row base remaining j)channel,ap_u32(base+j)).
Definition ap_pass_tail(F:APMap)(P:APPtrMap)(table offset channel base remaining:Z):list(fp32*Z):=
 map(fun j=>ap_candidate F P table offset channel base remaining(Z.of_nat j))(seq 1 8).
Definition ap_pass_start(F:APMap)(P:APPtrMap)(table offset channel base remaining:Z)(old:option(fp32*Z)):fp32*Z:=
 let first:=ap_candidate F P table offset channel base remaining 0 in
 match old with None=>first|Some prev=>ap_step prev first end.
Definition ap_pass(F:APMap)(P:APPtrMap)(table offset channel base remaining:Z)(old:option(fp32*Z)):fp32*Z:=
 ap_scan(ap_pass_tail F P table offset channel base remaining)
 (ap_pass_start F P table offset channel base remaining old).
Definition ap_neon_pass(F:APMap)(P:APPtrMap)(table offset channel base remaining:Z)(old:option(fp32*Z)):fp32*Z:=
 let first:=ap_candidate F P table offset channel base remaining 0 in
 let start:=match old with None=>first|Some prev=>ap_neon_update prev first end in
 fold_left ap_neon_update(ap_pass_tail F P table offset channel base remaining)start.
Definition ap_rvv_pass(F:APMap)(P:APPtrMap)(table offset channel base remaining:Z)(old:option(fp32*Z)):fp32*Z:=
 let first:=ap_candidate F P table offset channel base remaining 0 in
 let start:=match old with None=>first|Some prev=>ap_rvv_update prev first end in
 fold_left ap_rvv_update(ap_pass_tail F P table offset channel base remaining)start.
Fixpoint ap_run_passes(step:Z->Z->option(fp32*Z)->fp32*Z)(count:nat)
 (base remaining:Z)(old:option(fp32*Z)):option(fp32*Z):=
 match count with O=>old|S n=>
 ap_run_passes step n(base+9)(Z.max 0(remaining-9))(Some(step base remaining old))end.
Definition ap_pass_count(pooling_elements:Z):nat:=Z.to_nat((pooling_elements+8)/9).
Definition ap_finish(result:option(fp32*Z)):fp32*Z:=
 match result with Some v=>v|None=>(ap_zero,0)end.
Definition ap_pool(F:APMap)(P:APPtrMap)(table offset channel pooling_elements:Z):fp32*Z:=
 ap_finish(ap_run_passes(ap_pass F P table offset channel)(ap_pass_count pooling_elements)0 pooling_elements None).
Definition ap_neon_pool(F:APMap)(P:APPtrMap)(table offset channel pooling_elements:Z):fp32*Z:=
 ap_finish(ap_run_passes(ap_neon_pass F P table offset channel)(ap_pass_count pooling_elements)0 pooling_elements None).
Definition ap_rvv_pool(F:APMap)(P:APPtrMap)(table offset channel pooling_elements:Z):fp32*Z:=
 ap_finish(ap_run_passes(ap_rvv_pass F P table offset channel)(ap_pass_count pooling_elements)0 pooling_elements None).

Lemma ap_pass_tail_length:forall F P t o c b r,
 length(ap_pass_tail F P t o c b r)=8%nat.
Proof. intros;unfold ap_pass_tail;rewrite length_map,length_seq;reflexivity. Qed.
Lemma ap_pass_row_first:forall b r,0<r->ap_pass_row b r 0=b.
Proof. intros;unfold ap_pass_row;destruct(Z.ltb_spec 0 r);lia. Qed.
Lemma ap_neon_pass_correct:forall F P t o c b r old,
 ap_neon_pass F P t o c b r old=ap_pass F P t o c b r old.
Proof.
 intros;unfold ap_neon_pass,ap_pass,ap_pass_start.
 rewrite ap_neon_scan;destruct old as[prev|];[rewrite ap_neon_update_step|];reflexivity.
Qed.
Lemma ap_rvv_pass_correct:forall F P t o c b r old,
 ap_rvv_pass F P t o c b r old=ap_pass F P t o c b r old.
Proof.
 intros;unfold ap_rvv_pass,ap_pass,ap_pass_start.
 rewrite ap_rvv_scan;destruct old as[prev|];[rewrite ap_rvv_update_step|];reflexivity.
Qed.
Lemma ap_run_passes_ext:forall left right,
 (forall b r old,left b r old=right b r old)->
 forall count b r old,ap_run_passes left count b r old=ap_run_passes right count b r old.
Proof. intros left right H count;induction count;intros;cbn;[reflexivity|rewrite H;apply IHcount]. Qed.
Lemma ap_neon_pool_correct:forall F P t o c k,
 ap_neon_pool F P t o c k=ap_pool F P t o c k.
Proof. intros;unfold ap_neon_pool,ap_pool;f_equal;apply ap_run_passes_ext;intros;apply ap_neon_pass_correct. Qed.
Lemma ap_rvv_pool_correct:forall F P t o c k,
 ap_rvv_pool F P t o c k=ap_pool F P t o c k.
Proof. intros;unfold ap_rvv_pool,ap_pool;f_equal;apply ap_run_passes_ext;intros;apply ap_rvv_pass_correct. Qed.
Lemma ap_cross_isa_pool_model:forall F P t o c k,
 ap_neon_pool F P t o c k=ap_rvv_pool F P t o c k.
Proof. intros;rewrite ap_neon_pool_correct,ap_rvv_pool_correct;reflexivity. Qed.
Lemma ap_run_passes_some:forall step n b r v,
 exists out,ap_run_passes step n b r(Some v)=Some out.
Proof. intros step n;induction n;intros;cbn;[eauto|apply IHn]. Qed.
Lemma ap_pass_count_positive:forall k,0<k->(0<ap_pass_count k)%nat.
Proof.
 intros k H;unfold ap_pass_count.
 assert(Hq:1<=(k+8)/9)by(apply Z.div_le_lower_bound;lia).
 lia.
Qed.
Lemma ap_pool_has_result:forall F P t o c k,0<k->
 exists out,ap_run_passes(ap_pass F P t o c)(ap_pass_count k)0 k None=Some out.
Proof.
 intros F P t o c k H;pose proof(ap_pass_count_positive k H).
 destruct(ap_pass_count k);[lia|cbn;apply ap_run_passes_some].
Qed.
Lemma ap_ptr_window_lane:forall P p n j,
 ap_ptr_window P p n->0<=j<n->ap_ptr_present P(p+8*j).
Proof. unfold ap_ptr_window;intros P p n j[? [? H]]Hj;apply H;assumption. Qed.
Print Assumptions ap_pass_tail_length.
Print Assumptions ap_pass_row_first.
Print Assumptions ap_neon_pass_correct.
Print Assumptions ap_rvv_pass_correct.
Print Assumptions ap_run_passes_ext.
Print Assumptions ap_neon_pool_correct.
Print Assumptions ap_rvv_pool_correct.
Print Assumptions ap_cross_isa_pool_model.
Print Assumptions ap_run_passes_some.
Print Assumptions ap_pass_count_positive.
Print Assumptions ap_pool_has_result.
Print Assumptions ap_ptr_window_lane.
