From Coq Require Import List ZArith Lia.
From VCMul Require Export Model.
From QcpVadd Require Export VaddBits.
Import ListNotations.
Local Open Scope Z_scope.
Definition complex_at (xs:list fp32)(i:nat) : fp32 := nth i xs fp32_zero.
Definition complex_real (n:nat)(A B:list fp32)(i:nat) : fp32 :=
 fp32_sub (fp32_mul (complex_at A i) (complex_at B i))
          (fp32_mul (complex_at A (n+i)) (complex_at B (n+i))).
Definition complex_imag (n:nat)(A B:list fp32)(i:nat) : fp32 :=
 fp32_add (fp32_mul (complex_at A i) (complex_at B (n+i)))
          (fp32_mul (complex_at A (n+i)) (complex_at B i)).
Definition vcmul_values (n:Z)(A B:list fp32) : list fp32 :=
 let k:=Z.to_nat n in map (complex_real k A B) (seq 0 k) ++ map (complex_imag k A B) (seq 0 k).
Lemma vcmul_values_length : forall n A B, Z.of_nat (length (vcmul_values n A B))=2*Z.max n 0.
Proof.
 intros; unfold vcmul_values.
 rewrite length_app,!length_map,!length_seq,Nat2Z.inj_add.
 destruct (Z_le_gt_dec 0 n).
 - rewrite !Z2Nat.id by lia. rewrite Z.max_l by lia. lia.
 - assert (Z.to_nat n=0%nat) as Hzero by (destruct n; simpl in *; lia).
   rewrite Hzero. rewrite Z.max_r by lia. simpl. lia.
Qed.

Definition complex_real_prefix (count n:Z)(A B:list fp32) : list fp32 :=
 map (complex_real (Z.to_nat n) A B) (seq 0 (Z.to_nat count)).
Definition complex_imag_prefix (count n:Z)(A B:list fp32) : list fp32 :=
 map (complex_imag (Z.to_nat n) A B) (seq 0 (Z.to_nat count)).
Lemma complex_zero_prefix : forall n A B,
 complex_real_prefix 0 n A B=nil /\ complex_imag_prefix 0 n A B=nil.
Proof. intros; split; reflexivity. Qed.
Lemma vcmul_values_parts : forall n A B,
 vcmul_values n A B=complex_real_prefix n n A B++complex_imag_prefix n n A B.
Proof. reflexivity. Qed.
