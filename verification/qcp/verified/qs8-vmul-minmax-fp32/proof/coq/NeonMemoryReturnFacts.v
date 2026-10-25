From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export NeonOutputFacts NeonLaneFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_nm_cells1:forall p x0:Z,(p+0)#Char |-> x0|--CharArray.full p 1 [x0].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values1:forall M pa pb az bz scale oz lo hi,qm_values 1 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells1.
Print Assumptions qm_nm_values1.
Lemma qm_nm_cells2:forall p x0 x1:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1|--CharArray.full p 2 [x0;x1].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values2:forall M pa pb az bz scale oz lo hi,qm_values 2 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells2.
Print Assumptions qm_nm_values2.
Lemma qm_nm_cells3:forall p x0 x1 x2:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2|--CharArray.full p 3 [x0;x1;x2].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values3:forall M pa pb az bz scale oz lo hi,qm_values 3 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells3.
Print Assumptions qm_nm_values3.
Lemma qm_nm_cells4:forall p x0 x1 x2 x3:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3|--CharArray.full p 4 [x0;x1;x2;x3].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values4:forall M pa pb az bz scale oz lo hi,qm_values 4 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells4.
Print Assumptions qm_nm_values4.
Lemma qm_nm_cells5:forall p x0 x1 x2 x3 x4:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3 ** (p+4)#Char |-> x4|--CharArray.full p 5 [x0;x1;x2;x3;x4].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values5:forall M pa pb az bz scale oz lo hi,qm_values 5 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3;qm_lane M pa pb az bz scale oz lo hi 4].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells5.
Print Assumptions qm_nm_values5.
Lemma qm_nm_cells6:forall p x0 x1 x2 x3 x4 x5:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3 ** (p+4)#Char |-> x4 ** (p+5)#Char |-> x5|--CharArray.full p 6 [x0;x1;x2;x3;x4;x5].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values6:forall M pa pb az bz scale oz lo hi,qm_values 6 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3;qm_lane M pa pb az bz scale oz lo hi 4;qm_lane M pa pb az bz scale oz lo hi 5].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells6.
Print Assumptions qm_nm_values6.
Lemma qm_nm_cells7:forall p x0 x1 x2 x3 x4 x5 x6:Z,(p+0)#Char |-> x0 ** (p+1)#Char |-> x1 ** (p+2)#Char |-> x2 ** (p+3)#Char |-> x3 ** (p+4)#Char |-> x4 ** (p+5)#Char |-> x5 ** (p+6)#Char |-> x6|--CharArray.full p 7 [x0;x1;x2;x3;x4;x5;x6].
Proof. intros;unfold CharArray.full,store_array;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!. Qed.
Lemma qm_nm_values7:forall M pa pb az bz scale oz lo hi,qm_values 7 M pa pb az bz scale oz lo hi=[qm_lane M pa pb az bz scale oz lo hi 0;qm_lane M pa pb az bz scale oz lo hi 1;qm_lane M pa pb az bz scale oz lo hi 2;qm_lane M pa pb az bz scale oz lo hi 3;qm_lane M pa pb az bz scale oz lo hi 4;qm_lane M pa pb az bz scale oz lo hi 5;qm_lane M pa pb az bz scale oz lo hi 6].
Proof. reflexivity. Qed.
Print Assumptions qm_nm_cells7.
Print Assumptions qm_nm_values7.
