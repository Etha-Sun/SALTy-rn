From Coq Require Import List ZArith Lia.
From VCMul Require Import Model RvvMemoryModel RvvStoreModel NeonFacts.
Import ListNotations.
Local Open Scope Z_scope.
Definition vcmul_lane_real (i vl idx n:Z)(A B:list fp32) : fp32 :=
 vcmul_active_sub i vl
  (vcmul_active_mul i vl (vcmul_read_lane_model i vl idx A) (vcmul_read_lane_model i vl (idx) B))
  (vcmul_active_mul i vl (vcmul_read_lane_model i vl (n+idx) A) (vcmul_read_lane_model i vl (n+idx) B)).
Definition vcmul_real16 (vl idx n:Z)(A B:list fp32) : list fp32 :=
 vcmul_pack16 (vcmul_lane_real 0 vl idx n A B) (vcmul_lane_real 1 vl idx n A B) (vcmul_lane_real 2 vl idx n A B) (vcmul_lane_real 3 vl idx n A B) (vcmul_lane_real 4 vl idx n A B) (vcmul_lane_real 5 vl idx n A B) (vcmul_lane_real 6 vl idx n A B) (vcmul_lane_real 7 vl idx n A B) (vcmul_lane_real 8 vl idx n A B) (vcmul_lane_real 9 vl idx n A B) (vcmul_lane_real 10 vl idx n A B) (vcmul_lane_real 11 vl idx n A B) (vcmul_lane_real 12 vl idx n A B) (vcmul_lane_real 13 vl idx n A B) (vcmul_lane_real 14 vl idx n A B) (vcmul_lane_real 15 vl idx n A B).
Lemma vcmul_lane_real_active : forall i vl idx n A B,
 0<=n -> 0<=idx -> 0<=i<vl -> idx+vl<=n ->
 Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 vcmul_lane_real i vl idx n A B = complex_real (Z.to_nat n) A B (Z.to_nat(idx+i)).
Proof.
 intros i vl idx n A B Hn Hidx Hi Hcount HA HB.
 unfold vcmul_lane_real,vcmul_active_sub,vcmul_active_mul,vcmul_read_lane_model.
 destruct(Z.ltb_spec i vl);[|lia].
 replace(n+idx+i)with(n+(idx+i))by lia.
 apply complex_real_mls;lia.
Qed.
Lemma vcmul_real16_length : forall vl idx n A B,
 length(vcmul_real16 vl idx n A B)=16%nat.
Proof. reflexivity. Qed.
Lemma vcmul_real16_get : forall i vl idx n A B,
 0<=i<16 -> rvv_get i (vcmul_real16 vl idx n A B)=vcmul_lane_real i vl idx n A B.
Proof.
 intros i vl idx n A B Hi.
 assert (i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7 \/ i=8 \/ i=9 \/ i=10 \/ i=11 \/ i=12 \/ i=13 \/ i=14 \/ i=15) as Hcases by lia.
 destruct Hcases as [H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|H]]]]]]]]]]]]]]];subst i;reflexivity.
Qed.
Lemma vcmul_real_chunk : forall vl idx n A B,
 0<=n -> 0<=idx -> 0<=vl<=16 -> idx+vl<=n ->
 Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 rvv_take vl(vcmul_real16 vl idx n A B)=
 map (complex_real(Z.to_nat n)A B)(seq(Z.to_nat idx)(Z.to_nat vl)).
Proof.
 intros vl idx n A B Hn Hidx Hvl Hcount HA HB.
 unfold rvv_take.
 assert (Hlen:length(firstn(Z.to_nat vl)(vcmul_real16 vl idx n A B))=Z.to_nat vl).
 {rewrite length_firstn,vcmul_real16_length,Nat.min_l;lia. }
 apply nth_ext with(d:=fp32_zero)(d':=fp32_zero).
 - rewrite Hlen,length_map,length_seq;reflexivity.
 - intros j Hj. rewrite Hlen in Hj.
   rewrite List.nth_firstn. assert(E:(j <? Z.to_nat vl)%nat=true)by(apply Nat.ltb_lt;exact Hj). rewrite E.
   rewrite complex_map_seq_nth by exact Hj.
   replace(nth j (vcmul_real16 vl idx n A B) fp32_zero)with
    (rvv_get(Z.of_nat j)(vcmul_real16 vl idx n A B))
    by(unfold rvv_get,Znth;rewrite Nat2Z.id;reflexivity).
   rewrite vcmul_real16_get by lia.
   rewrite vcmul_lane_real_active by lia.
   rewrite Z2Nat.inj_add by lia. rewrite Nat2Z.id;reflexivity.
Qed.
Definition vcmul_lane_imag (i vl idx n:Z)(A B:list fp32) : fp32 :=
 vcmul_active_add i vl
  (vcmul_active_mul i vl (vcmul_read_lane_model i vl idx A) (vcmul_read_lane_model i vl (n+idx) B))
  (vcmul_active_mul i vl (vcmul_read_lane_model i vl (n+idx) A) (vcmul_read_lane_model i vl (idx) B)).
Definition vcmul_imag16 (vl idx n:Z)(A B:list fp32) : list fp32 :=
 vcmul_pack16 (vcmul_lane_imag 0 vl idx n A B) (vcmul_lane_imag 1 vl idx n A B) (vcmul_lane_imag 2 vl idx n A B) (vcmul_lane_imag 3 vl idx n A B) (vcmul_lane_imag 4 vl idx n A B) (vcmul_lane_imag 5 vl idx n A B) (vcmul_lane_imag 6 vl idx n A B) (vcmul_lane_imag 7 vl idx n A B) (vcmul_lane_imag 8 vl idx n A B) (vcmul_lane_imag 9 vl idx n A B) (vcmul_lane_imag 10 vl idx n A B) (vcmul_lane_imag 11 vl idx n A B) (vcmul_lane_imag 12 vl idx n A B) (vcmul_lane_imag 13 vl idx n A B) (vcmul_lane_imag 14 vl idx n A B) (vcmul_lane_imag 15 vl idx n A B).
Lemma vcmul_lane_imag_active : forall i vl idx n A B,
 0<=n -> 0<=idx -> 0<=i<vl -> idx+vl<=n ->
 Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 vcmul_lane_imag i vl idx n A B = complex_imag (Z.to_nat n) A B (Z.to_nat(idx+i)).
Proof.
 intros i vl idx n A B Hn Hidx Hi Hcount HA HB.
 unfold vcmul_lane_imag,vcmul_active_add,vcmul_active_mul,vcmul_read_lane_model.
 destruct(Z.ltb_spec i vl);[|lia].
 replace(n+idx+i)with(n+(idx+i))by lia.
 apply complex_imag_mla;lia.
Qed.
Lemma vcmul_imag16_length : forall vl idx n A B,
 length(vcmul_imag16 vl idx n A B)=16%nat.
Proof. reflexivity. Qed.
Lemma vcmul_imag16_get : forall i vl idx n A B,
 0<=i<16 -> rvv_get i (vcmul_imag16 vl idx n A B)=vcmul_lane_imag i vl idx n A B.
Proof.
 intros i vl idx n A B Hi.
 assert (i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7 \/ i=8 \/ i=9 \/ i=10 \/ i=11 \/ i=12 \/ i=13 \/ i=14 \/ i=15) as Hcases by lia.
 destruct Hcases as [H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|[H|H]]]]]]]]]]]]]]];subst i;reflexivity.
Qed.
Lemma vcmul_imag_chunk : forall vl idx n A B,
 0<=n -> 0<=idx -> 0<=vl<=16 -> idx+vl<=n ->
 Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 rvv_take vl(vcmul_imag16 vl idx n A B)=
 map (complex_imag(Z.to_nat n)A B)(seq(Z.to_nat idx)(Z.to_nat vl)).
Proof.
 intros vl idx n A B Hn Hidx Hvl Hcount HA HB.
 unfold rvv_take.
 assert (Hlen:length(firstn(Z.to_nat vl)(vcmul_imag16 vl idx n A B))=Z.to_nat vl).
 {rewrite length_firstn,vcmul_imag16_length,Nat.min_l;lia. }
 apply nth_ext with(d:=fp32_zero)(d':=fp32_zero).
 - rewrite Hlen,length_map,length_seq;reflexivity.
 - intros j Hj. rewrite Hlen in Hj.
   rewrite List.nth_firstn. assert(E:(j <? Z.to_nat vl)%nat=true)by(apply Nat.ltb_lt;exact Hj). rewrite E.
   rewrite complex_map_seq_nth by exact Hj.
   replace(nth j (vcmul_imag16 vl idx n A B) fp32_zero)with
    (rvv_get(Z.of_nat j)(vcmul_imag16 vl idx n A B))
    by(unfold rvv_get,Znth;rewrite Nat2Z.id;reflexivity).
   rewrite vcmul_imag16_get by lia.
   rewrite vcmul_lane_imag_active by lia.
   rewrite Z2Nat.inj_add by lia. rewrite Nat2Z.id;reflexivity.
Qed.
