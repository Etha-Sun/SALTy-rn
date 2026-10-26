From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Import Model.
Import ListNotations.
Local Open Scope Z_scope.

(* Lane semantics only. Source correspondence is separately reviewed against
   ACLE/A64 and RISC-V V; these lemmas do not constitute an ISA refinement. *)
Definition ap_rvv_gt (a b:fp32):Z :=
 match fp32_compare a b with Some Datatypes.Gt=>1 | _=>0 end.
Definition ap_rvv_select_f32 (m:Z) (old new:fp32):fp32 :=
 if Z.eqb m 0 then old else new.
Definition ap_rvv_select_u32 (m old new:Z):Z :=
 if Z.eqb m 0 then old else new.
Definition ap_neon_update (old candidate:fp32*Z):fp32*Z :=
 let m:=ap_gt_mask (fst candidate) (fst old) in
 (ap_select_f32 m (fst candidate) (fst old),
  ap_select_u32 m (ap_u32(snd candidate)) (snd old)).
Definition ap_rvv_update (old candidate:fp32*Z):fp32*Z :=
 let m:=ap_rvv_gt (fst candidate) (fst old) in
 (ap_rvv_select_f32 m (fst old) (fst candidate),
  ap_rvv_select_u32 m (snd old) (ap_u32(snd candidate))).

(* VLEN=128, SEW=32, LMUL=8, VLMAX=32. All V1.0 legal AVL choices
   are admitted. ap_vl from the early prototype denotes one allowed schedule,
   never a claim that hardware must select min(AVL,VLMAX). *)
Definition ap_vl_allowed (avl vl:Z):Prop :=
 (0<=avl<=32 /\ vl=avl) \/
 (32<avl<64 /\ (avl+1)/2<=vl<=32) \/
 (64<=avl /\ vl=32).

(* No constraint on inactive lanes: preserving only the active prefix does not
   silently choose zero for tail-agnostic lanes. *)
Definition ap_active_matches {A:Type} (v:list A) (value:Z->A) (vl:Z):Prop :=
 forall j,0<=j<vl -> forall d,nth(Z.to_nat j)v d=value j.

Lemma ap_rvv_gt_cases:forall a b,ap_rvv_gt a b=0 \/ ap_rvv_gt a b=1.
Proof.
 intros;unfold ap_rvv_gt;destruct(fp32_compare a b)as[c|];
 [destruct c|];auto.
Qed.
Lemma ap_rvv_gt_correct:forall a b,ap_rvv_gt a b=1 <-> fp32_gt a b.
Proof.
 intros;unfold ap_rvv_gt,fp32_gt;destruct(fp32_compare a b)as[c|];
 [destruct c|];simpl;split;intro H;try discriminate;reflexivity.
Qed.
Lemma ap_neon_update_step:forall old candidate,
 ap_neon_update old candidate=ap_step old candidate.
Proof.
 intros [old oi] [candidate ci];unfold ap_neon_update,ap_step,
 ap_select_f32,ap_select_u32;simpl.
 destruct(Z.eqb(ap_gt_mask candidate old)4294967295);reflexivity.
Qed.
Lemma ap_rvv_update_step:forall old candidate,
 ap_rvv_update old candidate=ap_step old candidate.
Proof.
 intros [old oi] [candidate ci];unfold ap_rvv_update,ap_step,
 ap_rvv_select_f32,ap_rvv_select_u32,ap_rvv_gt,ap_gt_mask;simpl.
 destruct(fp32_compare candidate old)as[c|];[destruct c|];reflexivity.
Qed.
Lemma ap_cross_isa_update:forall old candidate,
 ap_neon_update old candidate=ap_rvv_update old candidate.
Proof. intros;rewrite ap_neon_update_step,ap_rvv_update_step;reflexivity. Qed.
Lemma ap_neon_scan:forall values old,
 fold_left ap_neon_update values old=ap_scan values old.
Proof.
 induction values;intros;simpl;[reflexivity|].
 rewrite ap_neon_update_step;apply IHvalues.
Qed.
Lemma ap_rvv_scan:forall values old,
 fold_left ap_rvv_update values old=ap_scan values old.
Proof.
 induction values;intros;simpl;[reflexivity|].
 rewrite ap_rvv_update_step;apply IHvalues.
Qed.
Lemma ap_cross_isa_scan:forall values old,
 fold_left ap_neon_update values old=fold_left ap_rvv_update values old.
Proof. intros;rewrite ap_neon_scan,ap_rvv_scan;reflexivity. Qed.
Lemma ap_vl_progress:forall avl vl,0<avl -> ap_vl_allowed avl vl ->
 0<vl /\ vl<=avl /\ vl<=32.
Proof.
 intros avl vl Ha H;unfold ap_vl_allowed in H.
 destruct H as [[H ->]|[[H Hv]|[H ->]]];try lia.
 pose proof(Z.div_le_lower_bound (avl+1) 2 1 ltac:(lia) ltac:(lia));lia.
Qed.
Lemma ap_min_vl_allowed:forall avl,0<=avl -> ap_vl_allowed avl(ap_vl avl).
Proof.
 intros avl Ha;unfold ap_vl,ap_vl_allowed.
 destruct(Z_le_gt_dec avl 32).
 - left;rewrite Z.min_l by lia;auto.
 - rewrite Z.min_r by lia;right;destruct(Z_lt_ge_dec avl 64).
   + left;split;[lia|];split;[apply Z.div_le_upper_bound;lia|lia].
   + right;split;lia.
Qed.
Lemma ap_active_prefix:forall A (v:list A) value vl prefix,
 ap_active_matches v value vl -> 0<=prefix<=vl ->
 ap_active_matches v value prefix.
Proof. unfold ap_active_matches;intros;apply H;lia. Qed.

Print Assumptions ap_rvv_gt_cases.
Print Assumptions ap_rvv_gt_correct.
Print Assumptions ap_neon_update_step.
Print Assumptions ap_rvv_update_step.
Print Assumptions ap_cross_isa_update.
Print Assumptions ap_neon_scan.
Print Assumptions ap_rvv_scan.
Print Assumptions ap_cross_isa_scan.
Print Assumptions ap_vl_progress.
Print Assumptions ap_min_vl_allowed.
Print Assumptions ap_active_prefix.
