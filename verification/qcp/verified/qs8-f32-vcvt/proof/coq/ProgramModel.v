From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Export MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.

(* A reference for all requested outputs, with the actual wrapped16 operation
   order. The input contract supplies n+7 bytes; no default is read in bounds. *)
Definition cvt_values (n:Z) (A:list Z) (z:Z) (scale:fp32) : list fp32 :=
 map (fun i => cvt_neon_lane (nth i A 0) z scale) (seq 0 (Z.to_nat n)).
Definition cvt_rvv_values (n:Z) (A:list Z) (z:Z) (scale:fp32) : list fp32 :=
 map (fun i => cvt_rvv_lane (nth i A 0) z scale) (seq 0 (Z.to_nat n)).
Definition cvt_chunk (k r:Z) (A:list Z) (z:Z) (scale:fp32) : list fp32 :=
 map (fun i => cvt_neon_lane (Znth (k+Z.of_nat i) A 0) z scale)
     (seq 0 (Z.to_nat r)).

Lemma cvt_values_zero : forall A z scale, cvt_values 0 A z scale=[].
Proof. reflexivity. Qed.
Lemma cvt_values_length : forall n A z scale,
 0<=n -> Zlength(cvt_values n A z scale)=n.
Proof.
 intros. unfold cvt_values. rewrite Zlength_correct,map_length,seq_length.
 rewrite Z2Nat.id by assumption. reflexivity.
Qed.
Lemma cvt_rvv_values_eq : forall n A z scale,
 cvt_rvv_values n A z scale=cvt_values n A z scale.
Proof.
 intros. unfold cvt_values,cvt_rvv_values. apply map_ext. intro i.
 symmetry. apply cvt_lane_equiv.
Qed.
Lemma cvt_values_nth : forall n A z scale i d,
 0<=i<n -> Znth i(cvt_values n A z scale)d=cvt_neon_lane(Znth i A 0)z scale.
Proof.
 intros n A z scale i d Hi. unfold cvt_values,Znth.
 rewrite (@List.nth_indep fp32
  (map(fun j=>cvt_neon_lane(nth j A 0)z scale)(seq 0(Z.to_nat n)))
  (Z.to_nat i) d (cvt_neon_lane (nth 0 A 0) z scale))
  by(rewrite map_length,seq_length;lia).
 rewrite (@List.map_nth nat fp32 (fun j=>cvt_neon_lane(nth j A 0)z scale)
   (seq 0(Z.to_nat n)) 0%nat (Z.to_nat i)).
 rewrite seq_nth by lia. reflexivity.
Qed.
Lemma cvt_chunk_length : forall k r A z scale,
 0<=r -> Zlength(cvt_chunk k r A z scale)=r.
Proof.
 intros. unfold cvt_chunk. rewrite Zlength_correct,map_length,seq_length.
 rewrite Z2Nat.id by assumption. reflexivity.
Qed.

Print Assumptions cvt_values_length.
Print Assumptions cvt_rvv_values_eq.
Print Assumptions cvt_values_nth.
