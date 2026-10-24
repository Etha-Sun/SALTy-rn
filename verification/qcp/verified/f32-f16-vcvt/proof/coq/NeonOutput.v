From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From F32F16 Require Import ProgramModel ProgramFacts Observation NeonResult NeonEightFacts PackModel.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_init_lemmas LoopMemory TailMemory.
Import ListNotations. Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* These bridges merge exactly the initialized output cells.  An arbitrary
   output suffix and spatial frame remain available to sep_apply callers. *)
Lemma f16_output_eight : forall p k (A:list fp32) d0 d1,
 0<=k -> k+8<=Zlength A ->
 let W:=fp32_slice k (Zlength A) A in
 let S:=fp32_slice 4 (Zlength A-k) W in
 UShortArray.full p k (f16_values k A) **
 UShortArray.full (p+k*sizeof(USHORT)) 8
   (f16_pack8
     (f16_arm_lane(Znth 0 W d0)) (f16_arm_lane(Znth 1 W d0))
     (f16_arm_lane(Znth 2 W d0)) (f16_arm_lane(Znth 3 W d0))
     (f16_arm_lane(Znth 0 S d1)) (f16_arm_lane(Znth 1 S d1))
     (f16_arm_lane(Znth 2 S d1)) (f16_arm_lane(Znth 3 S d1))) |--
 UShortArray.full p (k+8) (f16_values(k+8) A).
Proof.
 intros p k A d0 d1 Hk Ha; cbn zeta.
 pose proof (UShortArray.full_merge_to_full p k (k+8)
   (f16_values k A)
   (f16_pack8
     (f16_arm_lane(Znth 0 (fp32_slice k (Zlength A) A) d0))
     (f16_arm_lane(Znth 1 (fp32_slice k (Zlength A) A) d0))
     (f16_arm_lane(Znth 2 (fp32_slice k (Zlength A) A) d0))
     (f16_arm_lane(Znth 3 (fp32_slice k (Zlength A) A) d0))
     (f16_arm_lane(Znth 0 (fp32_slice 4 (Zlength A-k) (fp32_slice k (Zlength A) A)) d1))
     (f16_arm_lane(Znth 1 (fp32_slice 4 (Zlength A-k) (fp32_slice k (Zlength A) A)) d1))
     (f16_arm_lane(Znth 2 (fp32_slice 4 (Zlength A-k) (fp32_slice k (Zlength A) A)) d1))
     (f16_arm_lane(Znth 3 (fp32_slice 4 (Zlength A-k) (fp32_slice k (Zlength A) A)) d1)))
   ltac:(lia)) as HM.
 replace (k+8-k) with 8 in HM by lia; sep_apply HM.
 rewrite (f16_tail_eight k 8 (Zlength A) A d0 d1 Hk ltac:(lia) Ha eq_refl).
 unfold f16_pack8; cbn [Z.to_nat firstn]; entailer!.
Qed.

Lemma f16_output_four : forall p k (A:list fp32) d,
 0<=k -> k+4<=Zlength A ->
 let W:=fp32_slice k (Zlength A) A in
 UShortArray.full p k (f16_values k A) **
 UShortArray.full (p+k*sizeof(USHORT)) 4
   (f16_pack4
     (f16_arm_lane(Znth 0 W d)) (f16_arm_lane(Znth 1 W d))
     (f16_arm_lane(Znth 2 W d)) (f16_arm_lane(Znth 3 W d))) |--
 UShortArray.full p (k+4) (f16_values(k+4) A).
Proof.
 intros p k A d Hk Ha; cbn zeta.
 pose proof (UShortArray.full_merge_to_full p k (k+4)
   (f16_values k A)
   (f16_pack4
     (f16_arm_lane(Znth 0 (fp32_slice k (Zlength A) A) d))
     (f16_arm_lane(Znth 1 (fp32_slice k (Zlength A) A) d))
     (f16_arm_lane(Znth 2 (fp32_slice k (Zlength A) A) d))
     (f16_arm_lane(Znth 3 (fp32_slice k (Zlength A) A) d)))
   ltac:(lia)) as HM.
 replace (k+4-k) with 4 in HM by lia; sep_apply HM.
 rewrite (f16_tail_four k 4 A d Hk ltac:(lia) Ha).
 unfold f16_pack4; cbn [Z.to_nat firstn]; entailer!.
Qed.

Lemma f16_output_two_one : forall p k (A:list fp32) d,
 0<=k -> k+4<=Zlength A ->
 let W:=fp32_slice k (Zlength A) A in
 UShortArray.full p k (f16_values k A) **
 UShortArray.full (p+2*k) 2
   (f16_pack2 (f16_arm_lane(Znth 0 W d)) (f16_arm_lane(Znth 1 W d))) **
 UShortArray.full (p+2*k+4) 1 (f16_pack1 (f16_arm_lane(Znth 2 W d))) |--
 UShortArray.full p (k+3) (f16_values(k+3) A).
Proof.
 intros p k A d Hk Ha; cbn zeta.
 set (x0:=f16_arm_lane(Znth 0 (fp32_slice k (Zlength A) A) d)).
 set (x1:=f16_arm_lane(Znth 1 (fp32_slice k (Zlength A) A) d)).
 set (x2:=f16_arm_lane(Znth 2 (fp32_slice k (Zlength A) A) d)).
 replace (p+2*k+4) with (p+(k+2)*sizeof(USHORT)) by (change (sizeof(USHORT)) with 2; ring).
 replace (p+2*k) with (p+k*sizeof(USHORT)) by (change (sizeof(USHORT)) with 2; ring).
 pose proof (UShortArray.full_merge_to_full p k (k+2)
   (f16_values k A) (f16_pack2 x0 x1) ltac:(lia)) as HM.
 replace (k+2-k) with 2 in HM by lia; sep_apply HM.
 pose proof (UShortArray.full_merge_to_full p (k+2) (k+3)
   (f16_values k A ++ f16_pack2 x0 x1) (f16_pack1 x2) ltac:(lia)) as Hnext.
 replace (k+3-(k+2)) with 1 in Hnext by lia; sep_apply Hnext.
 rewrite (f16_tail_four k 3 A d Hk ltac:(lia) Ha).
 unfold f16_pack1, f16_pack2; cbn [Z.to_nat firstn].
 rewrite <- app_assoc; subst x0 x1 x2; entailer!.
Qed.

Print Assumptions f16_output_eight.
Print Assumptions f16_output_four.
Print Assumptions f16_output_two_one.
