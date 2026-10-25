From Coq Require Import ZArith List Lia.
From Qs8Gemm Require Import Model OutputTile.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma qs8_neon_quant_formula : forall acc scale magic off lo hi,
 qs8_min (qs8_max (qs8_narrow8 (qs8_narrow16
 (qs8_ssub32 (qs8_reinterpret (f16_arm_add (f16_arm_mul (fp32_of_Z acc) scale) magic)) off))) lo) hi =
 qs8_quant acc scale magic off lo hi.
Proof.
 intros;unfold qs8_min,qs8_max,qs8_quant,qs8_sat,qs8_reinterpret,qs8_magic_bits,fp32_of_Z.
 rewrite (Z.min_comm _ hi),(Z.max_comm _ lo);reflexivity.
Qed.
Lemma qs8_completed_neon_tile : forall K d n A Ps magic off lo hi,
 0<=d -> d mod 8=0 -> 1<=n<=8 ->
 completed_values K (d+n) A Ps magic off lo hi =
 qs8_append(completed_values K d A Ps magic off lo hi)
 (qs8_take n [qs8_quant(qs8_acc K (d/8) 0 A Ps)(qs8_scale(d/8)0 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 1 A Ps)(qs8_scale(d/8)1 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 2 A Ps)(qs8_scale(d/8)2 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 3 A Ps)(qs8_scale(d/8)3 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 4 A Ps)(qs8_scale(d/8)4 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 5 A Ps)(qs8_scale(d/8)5 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 6 A Ps)(qs8_scale(d/8)6 Ps)magic off lo hi;qs8_quant(qs8_acc K (d/8) 7 A Ps)(qs8_scale(d/8)7 Ps)magic off lo hi]).
Proof. intros;apply qs8_completed_tile;try assumption;unfold qs8_active_z;auto. Qed.
Print Assumptions qs8_neon_quant_formula.
Print Assumptions qs8_completed_neon_tile.
Lemma qs8_ext2_0 : forall a b c d e f g h, qs8_ext 2 0 [a;b;c;d;e;f;g;h]=c.
Proof. reflexivity. Qed.
Lemma qs8_ext2_1 : forall a b c d e f g h, qs8_ext 2 1 [a;b;c;d;e;f;g;h]=d.
Proof. reflexivity. Qed.
Lemma qs8_ext2_2 : forall a b c d e f g h, qs8_ext 2 2 [a;b;c;d;e;f;g;h]=e.
Proof. reflexivity. Qed.
Lemma qs8_ext2_3 : forall a b c d e f g h, qs8_ext 2 3 [a;b;c;d;e;f;g;h]=f.
Proof. reflexivity. Qed.
Lemma qs8_ext2_4 : forall a b c d e f g h, qs8_ext 2 4 [a;b;c;d;e;f;g;h]=g.
Proof. reflexivity. Qed.
Lemma qs8_ext2_5 : forall a b c d e f g h, qs8_ext 2 5 [a;b;c;d;e;f;g;h]=h.
Proof. reflexivity. Qed.
Lemma qs8_ext2_6 : forall a b c d e f g h, qs8_ext 2 6 [a;b;c;d;e;f;g;h]=a.
Proof. reflexivity. Qed.
Lemma qs8_ext2_7 : forall a b c d e f g h, qs8_ext 2 7 [a;b;c;d;e;f;g;h]=b.
Proof. reflexivity. Qed.
Lemma qs8_ext4_0 : forall a b c d e f g h, qs8_ext 4 0 [a;b;c;d;e;f;g;h]=e.
Proof. reflexivity. Qed.
Lemma qs8_ext4_1 : forall a b c d e f g h, qs8_ext 4 1 [a;b;c;d;e;f;g;h]=f.
Proof. reflexivity. Qed.
Lemma qs8_ext4_2 : forall a b c d e f g h, qs8_ext 4 2 [a;b;c;d;e;f;g;h]=g.
Proof. reflexivity. Qed.
Lemma qs8_ext4_3 : forall a b c d e f g h, qs8_ext 4 3 [a;b;c;d;e;f;g;h]=h.
Proof. reflexivity. Qed.
Lemma qs8_ext4_4 : forall a b c d e f g h, qs8_ext 4 4 [a;b;c;d;e;f;g;h]=a.
Proof. reflexivity. Qed.
Lemma qs8_ext4_5 : forall a b c d e f g h, qs8_ext 4 5 [a;b;c;d;e;f;g;h]=b.
Proof. reflexivity. Qed.
Lemma qs8_ext4_6 : forall a b c d e f g h, qs8_ext 4 6 [a;b;c;d;e;f;g;h]=c.
Proof. reflexivity. Qed.
Lemma qs8_ext4_7 : forall a b c d e f g h, qs8_ext 4 7 [a;b;c;d;e;f;g;h]=d.
Proof. reflexivity. Qed.
Ltac qs8_neon_ext := rewrite ?qs8_ext2_0,?qs8_ext2_1,?qs8_ext2_2,?qs8_ext2_3,?qs8_ext2_4,?qs8_ext2_5,?qs8_ext2_6,?qs8_ext2_7,?qs8_ext4_0,?qs8_ext4_1,?qs8_ext4_2,?qs8_ext4_3,?qs8_ext4_4,?qs8_ext4_5,?qs8_ext4_6,?qs8_ext4_7.
