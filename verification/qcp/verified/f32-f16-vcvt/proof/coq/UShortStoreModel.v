From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Export Mem SeparationLogic.
Import ListNotations.
Local Open Scope Z_scope.
Definition f16_u16_equal (a b:Z) : Prop := a=b.
Definition f16_pack32 (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) : list Z := [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31].
Definition f16_take (i:Z) (xs:list Z) := firstn (Z.to_nat i) xs.
Definition f16_get (i:Z) (xs:list Z) := Znth i xs 0.
Definition f16_snoc (xs:list Z) (x:Z) := xs ++ [x].
Definition f16_length (xs:list Z) := Zlength xs.
Lemma f16_take_step : forall (xs:list Z) i,
 0<=i<Zlength xs -> f16_snoc (f16_take i xs) (f16_get i xs)=f16_take (i+1) xs.
Proof.
 assert (Hnth:forall(n:nat)(l:list Z),(n<length l)%nat -> firstn n l++[nth n l 0]=firstn(S n)l).
 { induction n;destruct l;simpl;intros;try lia;try reflexivity;f_equal;apply IHn;lia. }
 intros xs i Hi;unfold f16_snoc,f16_take,f16_get,Znth.
 replace (Z.to_nat(i+1))with(S(Z.to_nat i))by lia;apply Hnth;rewrite Zlength_correct in Hi;lia.
Qed.
Print Assumptions f16_take_step.
