From Coq Require Import ZArith List Lia.
From S8Clamp Require Export MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition s8_rvv_min_lane (x bound i vl:Z) : Z :=
 if Z.ltb i vl then s8_min x bound else x.
Definition s8_rvv_max_lane (x bound i vl:Z) : Z :=
 if Z.ltb i vl then s8_max x bound else x.
Definition s8_rvv_prefix (n:Z) (xs:list Z) := firstn (Z.to_nat n) xs.
Definition s8_rvv_nth (xs:list Z) (i:Z) := Znth i xs 0.
Definition s8_rvv_pack128 (a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a77 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97 a98 a99 a100 a101 a102 a103 a104 a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127:Z) : list Z := [a0;a1;a2;a3;a4;a5;a6;a7;a8;a9;a10;a11;a12;a13;a14;a15;a16;a17;a18;a19;a20;a21;a22;a23;a24;a25;a26;a27;a28;a29;a30;a31;a32;a33;a34;a35;a36;a37;a38;a39;a40;a41;a42;a43;a44;a45;a46;a47;a48;a49;a50;a51;a52;a53;a54;a55;a56;a57;a58;a59;a60;a61;a62;a63;a64;a65;a66;a67;a68;a69;a70;a71;a72;a73;a74;a75;a76;a77;a78;a79;a80;a81;a82;a83;a84;a85;a86;a87;a88;a89;a90;a91;a92;a93;a94;a95;a96;a97;a98;a99;a100;a101;a102;a103;a104;a105;a106;a107;a108;a109;a110;a111;a112;a113;a114;a115;a116;a117;a118;a119;a120;a121;a122;a123;a124;a125;a126;a127].
Lemma s8_rvv_min_lane_range : forall x b i vl,
 -128<=x<=127 -> -128<=b<=127 -> -128<=s8_rvv_min_lane x b i vl<=127.
Proof. intros. unfold s8_rvv_min_lane. destruct (Z.ltb i vl);auto using s8_min_range. Qed.
Lemma s8_rvv_max_lane_range : forall x b i vl,
 -128<=x<=127 -> -128<=b<=127 -> -128<=s8_rvv_max_lane x b i vl<=127.
Proof. intros. unfold s8_rvv_max_lane. destruct (Z.ltb i vl);auto using s8_max_range. Qed.
Lemma s8_rvv_pack128_length : forall a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a77 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97 a98 a99 a100 a101 a102 a103 a104 a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127,
 Zlength (s8_rvv_pack128 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a77 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97 a98 a99 a100 a101 a102 a103 a104 a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127)=128.
Proof. intros. reflexivity. Qed.

Definition s8_rvv_snoc (xs:list Z) (x:Z) := xs ++ [x].
Definition s8_rvv_length (xs:list Z) := Zlength xs.
