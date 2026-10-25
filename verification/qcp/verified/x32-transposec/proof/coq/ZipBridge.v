From Coq Require Import ZArith.
Definition XT2:Type:=(Z*Z)%type.
Definition xt_zip_pair(a b:XT2):XT2*XT2:=((fst a,fst b),(snd a,snd b)).
Definition xt_zip1(a b:XT2):XT2:=(fst a,fst b).
Definition xt_zip2(a b:XT2):XT2:=(snd a,snd b).
Lemma xt_zip_low_projection:forall a b,fst(xt_zip_pair a b)=xt_zip1 a b.
Proof. reflexivity. Qed.
Lemma xt_zip_high_projection:forall a b,snd(xt_zip_pair a b)=xt_zip2 a b.
Proof. reflexivity. Qed.
Print Assumptions xt_zip_low_projection.
Print Assumptions xt_zip_high_projection.
