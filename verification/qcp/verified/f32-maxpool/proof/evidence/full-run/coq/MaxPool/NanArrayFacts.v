From Coq Require Import ZArith Lia List.
From MaxPool Require Export NanArrayModel.
Local Open Scope Z_scope.
Lemma mp_array_map_seq_nth:forall(f:nat->Z)start count i d,(i<count)%nat->
 nth i(map f(seq start count))d=f(start+i)%nat.
Proof. intros f start count i d Hi.
 rewrite(@List.nth_indep Z(map f(seq start count))i d(f 0%nat))by(rewrite length_map,length_seq;assumption).
 rewrite(@List.map_nth nat Z f(seq start count)0%nat i);rewrite seq_nth by assumption;reflexivity.
Qed.
Lemma mp_array_list_ext:forall A B:list Z,
 length A=length B->(forall j,0<=j<Zlength A->Znth j A 0=Znth j B 0)->A=B.
Proof. intros A B Hlen H;apply nth_ext with(0%Z)(0%Z);[exact Hlen|].
 intros n Hn;pose proof(H(Z.of_nat n)ltac:(rewrite Zlength_correct;lia))as HH.
 unfold Znth in HH;rewrite Nat2Z.id in HH;exact HH.
Qed.
Lemma mp_restore_prefix_length:forall A B N done,length(mp_restore_prefix A B N done)=32%nat.
Proof. intros;unfold mp_restore_prefix;rewrite length_map,length_seq;reflexivity. Qed.
Lemma mp_restore_prefix_index:forall A B N done j,0<=j<32->
 Znth j(mp_restore_prefix A B N done)0=
 (if Z.ltb j done then mp_restore_bits(Znth j A 0)(Znth j B 0)(Znth j N 0)else Znth j N 0).
Proof. intros;unfold mp_restore_prefix,Znth at 1;rewrite mp_array_map_seq_nth by lia.
 cbn[Nat.add];rewrite Z2Nat.id by lia;reflexivity. Qed.
Lemma mp_restore_prefix_zero:forall A B N,length N=32%nat->mp_restore_prefix A B N 0=N.
Proof. intros;apply mp_array_list_ext;[rewrite mp_restore_prefix_length;lia|].
 intros j Hj;rewrite Zlength_correct,mp_restore_prefix_length in Hj.
 rewrite mp_restore_prefix_index by lia;destruct(Z.ltb_spec j 0);[lia|reflexivity].
Qed.
Lemma mp_restore_prefix_original:forall A B N i,0<=i<32->
 Znth i(mp_restore_prefix A B N i)0=Znth i N 0.
Proof. intros;rewrite mp_restore_prefix_index by lia;rewrite Z.ltb_irrefl;reflexivity. Qed.
Lemma mp_array_replace_length:forall(L:list Z)i value,length(replace_Znth i value L)=length L.
Proof. intros;pose proof(Zlength_replace_Znth L i value)as H;rewrite!Zlength_correct in H;lia. Qed.
Lemma mp_restore_prefix_step:forall A B N i,0<=i<32->
 replace_Znth i(mp_restore_bits(Znth i A 0)(Znth i B 0)(Znth i N 0))(mp_restore_prefix A B N i)=mp_restore_prefix A B N(i+1).
Proof.
 intros A B N i Hi;apply mp_array_list_ext.
 - rewrite mp_array_replace_length,!mp_restore_prefix_length;reflexivity.
 - intros j Hj;rewrite Zlength_correct,mp_array_replace_length,mp_restore_prefix_length in Hj.
   destruct(Z.eq_dec i j)as[He|Hne].
   + subst j;rewrite Znth_replace_Znth_Same by(rewrite Zlength_correct,mp_restore_prefix_length;lia).
     rewrite mp_restore_prefix_index by lia;destruct(Z.ltb_spec i(i+1));[reflexivity|lia].
   + rewrite Znth_replace_Znth_Diff by(rewrite ?Zlength_correct,?mp_restore_prefix_length;lia).
     rewrite !mp_restore_prefix_index by lia.
     destruct(Z.ltb_spec j i);destruct(Z.ltb_spec j(i+1));try lia;reflexivity.
Qed.
