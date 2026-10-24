From Coq Require Import ZArith List.
From Qs8Rdsum Require Export VectorModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition rd_ext4(a b:list Z)(n:Z):list Z := firstn 4(skipn(Z.to_nat n)(a++b)).
Definition rd_add4(a b:list Z):list Z := map(fun xy=>rs_add_s32(fst xy)(snd xy))(combine a b).
Definition rd_addw16_low(a b:list Z):list Z := rd_add4 a(firstn 4 b).
Definition rd_addw16_high(a b:list Z):list Z := rd_add4 a(skipn 4 b).
Lemma rd_self_ext2 : forall a0 a1 a2 a3,
 rd_ext4 [a0;a1;a2;a3][a0;a1;a2;a3]2=[a2;a3;a0;a1].
Proof. reflexivity. Qed.
Lemma rd_low_wadd : forall a0 a1 a2 a3 b0 b1 b2 b3 b4 b5 b6 b7,
 rd_addw16_low [a0;a1;a2;a3][b0;b1;b2;b3;b4;b5;b6;b7]=
 [rs_add_s32 a0 b0;rs_add_s32 a1 b1;rs_add_s32 a2 b2;rs_add_s32 a3 b3].
Proof. reflexivity. Qed.
Lemma rd_high_wadd : forall a0 a1 a2 a3 b0 b1 b2 b3 b4 b5 b6 b7,
 rd_addw16_high [a0;a1;a2;a3][b0;b1;b2;b3;b4;b5;b6;b7]=
 [rs_add_s32 a0 b4;rs_add_s32 a1 b5;rs_add_s32 a2 b6;rs_add_s32 a3 b7].
Proof. reflexivity. Qed.
Lemma rd_low2_add : forall a0 a1 b0 b1 b2 b3,
 rd_add4[a0;a1](firstn 2[b0;b1;b2;b3])=[rs_add_s32 a0 b0;rs_add_s32 a1 b1].
Proof. reflexivity. Qed.
Print Assumptions rd_self_ext2.
Print Assumptions rd_low_wadd.
Print Assumptions rd_high_wadd.
Print Assumptions rd_low2_add.
