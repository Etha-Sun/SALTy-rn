From Coq Require Import ZArith List Lia.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From GemmRvv Require Import Model.
Import ListNotations.
Local Open Scope Z_scope.

(* These are the actual mathematical postcondition models of the two C
   candidates. This bridge does not assume that either C contract is proved. *)
Lemma scalar_depth_snoc : forall (A W:list fp32) j n,
 fold_left
  (fun acc t => fma_rne (rvv_at A (Z.of_nat t))
       (rvv_at W (8+8*Z.of_nat t+j)) acc)
  (seq 0 (S n)) (rvv_at W j) =
 fma_rne (rvv_at A (Z.of_nat n)) (rvv_at W (8+8*Z.of_nat n+j))
  (fold_left
   (fun acc t => fma_rne (rvv_at A (Z.of_nat t))
        (rvv_at W (8+8*Z.of_nat t+j)) acc)
   (seq 0 n) (rvv_at W j)).
Proof. intros; rewrite seq_S, fold_left_app; reflexivity. Qed.

Theorem recursive_depth_matches_scalar : forall n j A W,
 gacc_nat n j A W =
 fold_left
  (fun acc t => fma_rne (rvv_at A (Z.of_nat t))
       (rvv_at W (8+8*Z.of_nat t+j)) acc)
  (seq 0 n) (rvv_at W j).
Proof.
 induction n; intros; [reflexivity|].
 rewrite scalar_depth_snoc; cbn [gacc_nat].
 rewrite IHn; reflexivity.
Qed.

Theorem neon_rvv_accumulators_match : forall d j A W,
 gacc d j A W = rvv_acc A W j d.
Proof. intros; unfold gacc,rvv_acc; apply recursive_depth_matches_scalar. Qed.

Theorem neon_rvv_output_models_match : forall d A W lo hi,
 gout d A W lo hi = rvv_output A W d lo hi.
Proof.
 intros; unfold gout,rvv_output; apply map_ext; intro j.
 now rewrite neon_rvv_accumulators_match.
Qed.

(* NR8 packed addresses for subsequent complete-column-block contracts.
   Integer-address bounds only: no restriction on floating-point values. *)
Definition blocks (nc:Z):Z := Z.div (nc+7) 8.
Definition bias_index (k col:Z):Z := Z.div col 8*(k+1)*8+Z.modulo col 8.
Definition weight_index (k col depth:Z):Z := bias_index k col+(depth+1)*8.
Theorem packed_indices_in_bounds : forall nc k col depth,
 0<nc -> 0<k -> 0<=col<nc -> 0<=depth<k ->
 0<=bias_index k col<blocks nc*(k+1)*8 /\
 0<=weight_index k col depth<blocks nc*(k+1)*8.
Proof.
 intros nc k col depth Hnc Hk Hcol Hdepth.
 pose proof (Z.div_mod col 8 ltac:(lia)) as C.
 pose proof (Z.mod_pos_bound col 8 ltac:(lia)) as Cr.
 pose proof (Z.div_pos col 8 ltac:(lia) ltac:(lia)) as Cq.
 pose proof (Z.div_mod (nc+7) 8 ltac:(lia)) as N.
 pose proof (Z.mod_pos_bound (nc+7) 8 ltac:(lia)) as Nr.
 assert (Q : Z.div col 8 < Z.div (nc+7) 8) by lia.
 unfold weight_index,bias_index,blocks; nia.
Qed.

Print Assumptions recursive_depth_matches_scalar.
Print Assumptions neon_rvv_accumulators_match.
Print Assumptions neon_rvv_output_models_match.
Print Assumptions packed_indices_in_bounds.
