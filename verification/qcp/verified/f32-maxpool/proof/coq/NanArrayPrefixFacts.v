From Coq Require Import ZArith Lia List.
From MaxPool Require Export NanArrayFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma mp_array_firstn_nth:forall k(B:list Z)j,(j<k)%nat->(k<=length B)%nat->nth j(firstn k B)0=nth j B 0.
Proof. induction k;intros B j Hj Hb;[lia|]. destruct B as[|b B];cbn in Hb;[lia|].
 destruct j;[reflexivity|]. cbn[firstn nth];apply IHk;lia. Qed.
Lemma mp_u32_prefix_active:forall L V vl j,0<=j<vl->vl<=Zlength V->
 Znth j(mp_u32_prefix L V vl)0=Znth j V 0.
Proof. intros;unfold Znth,mp_u32_prefix;rewrite app_nth1.
 - apply mp_array_firstn_nth;rewrite Zlength_correct in *;lia.
 - rewrite length_firstn,Nat.min_l by(rewrite Zlength_correct in *;lia);lia.
Qed.
Lemma mp_u32_prefix_length:forall L V vl,length L=32%nat->length V=32%nat->0<=vl<=32->
 length(mp_u32_prefix L V vl)=32%nat.
Proof. intros;unfold mp_u32_prefix;rewrite length_app,length_firstn,length_skipn,H,H0.
 rewrite Nat.min_l by lia;lia. Qed.
Lemma mp_zero32_repeat:mp_zero32=repeat_Z 0 32.
Proof. reflexivity. Qed.
Lemma mp_zero32_length:length mp_zero32=32%nat.
Proof. reflexivity. Qed.

Lemma mp_u32_vec_length:forall (u0:Z) (u1:Z) (u2:Z) (u3:Z) (u4:Z) (u5:Z) (u6:Z) (u7:Z) (u8:Z) (u9:Z) (u10:Z) (u11:Z) (u12:Z) (u13:Z) (u14:Z) (u15:Z) (u16:Z) (u17:Z) (u18:Z) (u19:Z) (u20:Z) (u21:Z) (u22:Z) (u23:Z) (u24:Z) (u25:Z) (u26:Z) (u27:Z) (u28:Z) (u29:Z) (u30:Z) (u31:Z),length(mp_u32_vec u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31)=32%nat.
Proof. intros;reflexivity. Qed.
