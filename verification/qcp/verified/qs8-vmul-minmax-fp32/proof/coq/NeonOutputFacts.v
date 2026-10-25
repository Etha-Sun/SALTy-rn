From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export ProgramFacts IntrinsicModel FastFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_char_full_append : forall p k r L R,
 0<=k ->0<=r ->CharArray.full p k L **CharArray.full(p+k)r R |--CharArray.full p(k+r)(L++R).
Proof.
 intros p k r L R Hk Hr.
 pose proof(CharArray.full_merge_to_full p k(k+r)L R ltac:(lia))as H.
 unfold StoreCharAsElement.sizeA in H;rewrite sizeof_char in H.
 replace(p+k*1)with(p+k)in H by lia;replace(k+r-k)with r in H by lia;exact H.
Qed.
Lemma qm_char_cells1 : forall p x0:Z, (p+0)#Char |-> x0 |--CharArray.full p 1 [x0].
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_char_cells2 : forall p x0 x1:Z, (p+0)#Char |-> x0 ** (p+1)#Char |-> x1 |--CharArray.full p 2 [x0;x1].
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_char_cells4 : forall p x0 x1 x2 x3:Z, (p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3 |--CharArray.full p 4 [x0;x1;x2;x3].
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_char_cells8 : forall p x0 x1 x2 x3 x4 x5 x6 x7:Z, (p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3 ** (p+4)#Char |-> x4 ** (p+5)#Char |-> x5 ** (p+6)#Char |-> x6 ** (p+7)#Char |-> x7 |--CharArray.full p 8 [x0;x1;x2;x3;x4;x5;x6;x7].
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_values_1 : forall M pa pb az bz scale oz lo hi, qm_values 1 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0].
Proof. reflexivity. Qed.
Lemma qm_values_2 : forall M pa pb az bz scale oz lo hi, qm_values 2 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1].
Proof. reflexivity. Qed.
Lemma qm_values_4 : forall M pa pb az bz scale oz lo hi, qm_values 4 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3].
Proof. reflexivity. Qed.
Lemma qm_values_8 : forall M pa pb az bz scale oz lo hi, qm_values 8 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3;qm_lane M pa pb az bz scale oz lo hi 4;qm_lane M pa pb az bz scale oz lo hi 5;qm_lane M pa pb az bz scale oz lo hi 6;qm_lane M pa pb az bz scale oz lo hi 7].
Proof. reflexivity. Qed.
Lemma qm_values_32 : forall M pa pb az bz scale oz lo hi, qm_values 32 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3;qm_lane M pa pb az bz scale oz lo hi 4;qm_lane M pa pb az bz scale oz lo hi 5;qm_lane M pa pb az bz scale oz lo hi 6;qm_lane M pa pb az bz scale oz lo hi 7;qm_lane M pa pb az bz scale oz lo hi 8;qm_lane M pa pb az bz scale oz lo hi 9;qm_lane M pa pb az bz scale oz lo hi 10;qm_lane M pa pb az bz scale oz lo hi 11;qm_lane M pa pb az bz scale oz lo hi 12;qm_lane M pa pb az bz scale oz lo hi 13;qm_lane M pa pb az bz scale oz lo hi 14;qm_lane M pa pb az bz scale oz lo hi 15;qm_lane M pa pb az bz scale oz lo hi 16;qm_lane M pa pb az bz scale oz lo hi 17;qm_lane M pa pb az bz scale oz lo hi 18;qm_lane M pa pb az bz scale oz lo hi 19;qm_lane M pa pb az bz scale oz lo hi 20;qm_lane M pa pb az bz scale oz lo hi 21;qm_lane M pa pb az bz scale oz lo hi 22;qm_lane M pa pb az bz scale oz lo hi 23;qm_lane M pa pb az bz scale oz lo hi 24;qm_lane M pa pb az bz scale oz lo hi 25;qm_lane M pa pb az bz scale oz lo hi 26;qm_lane M pa pb az bz scale oz lo hi 27;qm_lane M pa pb az bz scale oz lo hi 28;qm_lane M pa pb az bz scale oz lo hi 29;qm_lane M pa pb az bz scale oz lo hi 30;qm_lane M pa pb az bz scale oz lo hi 31].
Proof. reflexivity. Qed.
Lemma qm_char_values_append : forall p k r M pa pb az bz scale oz lo hi,
 0<=k ->0<=r ->
 CharArray.full p k(qm_values k M pa pb az bz scale oz lo hi) **
 CharArray.full(p+k)r(qm_values r M(pa+k)(pb+k)az bz scale oz lo hi) |--
 CharArray.full p(k+r)(qm_values(k+r)M pa pb az bz scale oz lo hi).
Proof. intros;rewrite qm_values_append by assumption;apply qm_char_full_append;assumption. Qed.
Print Assumptions qm_char_full_append.
Print Assumptions qm_char_cells1.
Print Assumptions qm_char_cells2.
Print Assumptions qm_char_cells4.
Print Assumptions qm_char_cells8.
Print Assumptions qm_values_1.
Print Assumptions qm_values_2.
Print Assumptions qm_values_4.
Print Assumptions qm_values_8.
Print Assumptions qm_values_32.
Print Assumptions qm_char_values_append.
