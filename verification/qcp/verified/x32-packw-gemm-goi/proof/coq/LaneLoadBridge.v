From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.

Definition pw_pair_lane(a0 a1 k:Z):Z:=if Z.eqb k 0 then a0 else a1.
(* ACLE LD2 lane: update the selected lane in both destination vectors from
   two consecutive memory words. Other lanes retain their original bits. *)
Definition pw_ld2_lane_spec(a0 a1 b0 b1 x0 x1 lane vector k:Z):Z:=
 if Z.eqb lane 0 then
   if Z.eqb vector 0 then pw_pair_lane x0 a1 k else pw_pair_lane x1 b1 k
 else
   if Z.eqb vector 0 then pw_pair_lane a0 x0 k else pw_pair_lane b0 x1 k.
(* ACLE LD1 lane applied independently to each original two-lane vector. *)
Definition pw_ld1_lane_spec(a0 a1 x lane k:Z):Z:=
 if Z.eqb k lane then x else pw_pair_lane a0 a1 k.
Definition pw_split_ld2_lane(a0 a1 b0 b1 x0 x1 lane vector k:Z):Z:=
 if Z.eqb vector 0 then pw_ld1_lane_spec a0 a1 x0 lane k
 else pw_ld1_lane_spec b0 b1 x1 lane k.
Lemma pw_native_lane_load_decomposition:forall a0 a1 b0 b1 x0 x1 lane vector k,
 0<=lane<2->0<=vector<2->0<=k<2->
 pw_ld2_lane_spec a0 a1 b0 b1 x0 x1 lane vector k=
 pw_split_ld2_lane a0 a1 b0 b1 x0 x1 lane vector k.
Proof.
 intros;assert(Hlane:lane=0 \/ lane=1)by lia;
 assert(Hvec:vector=0 \/ vector=1)by lia;
 assert(Hk:k=0 \/ k=1)by lia;
 destruct Hlane as[Hlane|Hlane];destruct Hvec as[Hvec|Hvec];destruct Hk as[Hk|Hk];
 subst lane vector k;reflexivity.
Qed.
Lemma pw_native_single_lane_preserves_other:forall a0 a1 x lane k,
 k<>lane->pw_ld1_lane_spec a0 a1 x lane k=pw_pair_lane a0 a1 k.
Proof. intros;unfold pw_ld1_lane_spec;destruct(Z.eqb_spec k lane);congruence. Qed.
Print Assumptions pw_native_lane_load_decomposition.
Print Assumptions pw_native_single_lane_preserves_other.
