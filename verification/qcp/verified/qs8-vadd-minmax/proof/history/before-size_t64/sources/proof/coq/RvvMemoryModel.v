From Coq Require Import ZArith List Lia.
From Qs8Add Require Export MemoryModel RvvModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition s8_rvv_prefix(n:Z)(xs:list Z):=firstn(Z.to_nat n)xs.
Definition s8_rvv_nth(xs:list Z)(i:Z):=Znth i xs 0.
Definition s8_rvv_snoc(xs:list Z)(x:Z):=xs++[x].
Definition s8_rvv_length(xs:list Z):=Zlength xs.
Definition s8_rvv_pack32 (x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:Z):list Z :=[x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31].
Lemma s8_rvv_pack32_length : forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31,Zlength(s8_rvv_pack32 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31)=32.
Proof. intros;reflexivity. Qed.
