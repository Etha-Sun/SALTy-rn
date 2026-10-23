From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Export ProgramFacts LreluFacts.
Import ListNotations.
Local Open Scope Z_scope.
Lemma qlr_map_window_1 : forall(f:Z->Z) k A,
 0<=k -> k+1<=Zlength A -> map f(qlr_window k 1 A)=[f(Znth(k+0)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 1 A))0=nth i [f(Znth(k+0)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 1(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_1 : forall k z pm nm o A,
 0<=k -> k+1<=Zlength A -> qlr_chunk k 1 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 1 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_1;assumption.
Qed.
Print Assumptions qlr_chunk_expression_1.
Lemma qlr_map_window_2 : forall(f:Z->Z) k A,
 0<=k -> k+2<=Zlength A -> map f(qlr_window k 2 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 2 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 2(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_2 : forall k z pm nm o A,
 0<=k -> k+2<=Zlength A -> qlr_chunk k 2 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 2 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_2;assumption.
Qed.
Print Assumptions qlr_chunk_expression_2.
Lemma qlr_map_window_3 : forall(f:Z->Z) k A,
 0<=k -> k+3<=Zlength A -> map f(qlr_window k 3 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 3 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 3(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_3 : forall k z pm nm o A,
 0<=k -> k+3<=Zlength A -> qlr_chunk k 3 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 3 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_3;assumption.
Qed.
Print Assumptions qlr_chunk_expression_3.
Lemma qlr_map_window_4 : forall(f:Z->Z) k A,
 0<=k -> k+4<=Zlength A -> map f(qlr_window k 4 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 4 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 4(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_4 : forall k z pm nm o A,
 0<=k -> k+4<=Zlength A -> qlr_chunk k 4 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 4 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_4;assumption.
Qed.
Print Assumptions qlr_chunk_expression_4.
Lemma qlr_map_window_5 : forall(f:Z->Z) k A,
 0<=k -> k+5<=Zlength A -> map f(qlr_window k 5 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 5 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 5(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_5 : forall k z pm nm o A,
 0<=k -> k+5<=Zlength A -> qlr_chunk k 5 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o;qlr_neon_expression(Znth(k+4)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 5 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_5;assumption.
Qed.
Print Assumptions qlr_chunk_expression_5.
Lemma qlr_map_window_6 : forall(f:Z->Z) k A,
 0<=k -> k+6<=Zlength A -> map f(qlr_window k 6 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 6 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 6(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_6 : forall k z pm nm o A,
 0<=k -> k+6<=Zlength A -> qlr_chunk k 6 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o;qlr_neon_expression(Znth(k+4)A 0)z pm nm o;qlr_neon_expression(Znth(k+5)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 6 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_6;assumption.
Qed.
Print Assumptions qlr_chunk_expression_6.
Lemma qlr_map_window_7 : forall(f:Z->Z) k A,
 0<=k -> k+7<=Zlength A -> map f(qlr_window k 7 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 7 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 7(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_7 : forall k z pm nm o A,
 0<=k -> k+7<=Zlength A -> qlr_chunk k 7 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o;qlr_neon_expression(Znth(k+4)A 0)z pm nm o;qlr_neon_expression(Znth(k+5)A 0)z pm nm o;qlr_neon_expression(Znth(k+6)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 7 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_7;assumption.
Qed.
Print Assumptions qlr_chunk_expression_7.
Lemma qlr_map_window_8 : forall(f:Z->Z) k A,
 0<=k -> k+8<=Zlength A -> map f(qlr_window k 8 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0);f(Znth(k+7)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 8 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0);f(Znth(k+7)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 8(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_8 : forall k z pm nm o A,
 0<=k -> k+8<=Zlength A -> qlr_chunk k 8 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o;qlr_neon_expression(Znth(k+4)A 0)z pm nm o;qlr_neon_expression(Znth(k+5)A 0)z pm nm o;qlr_neon_expression(Znth(k+6)A 0)z pm nm o;qlr_neon_expression(Znth(k+7)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 8 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_8;assumption.
Qed.
Print Assumptions qlr_chunk_expression_8.
Lemma qlr_map_window_32 : forall(f:Z->Z) k A,
 0<=k -> k+32<=Zlength A -> map f(qlr_window k 32 A)=[f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0);f(Znth(k+7)A 0);f(Znth(k+8)A 0);f(Znth(k+9)A 0);f(Znth(k+10)A 0);f(Znth(k+11)A 0);f(Znth(k+12)A 0);f(Znth(k+13)A 0);f(Znth(k+14)A 0);f(Znth(k+15)A 0);f(Znth(k+16)A 0);f(Znth(k+17)A 0);f(Znth(k+18)A 0);f(Znth(k+19)A 0);f(Znth(k+20)A 0);f(Znth(k+21)A 0);f(Znth(k+22)A 0);f(Znth(k+23)A 0);f(Znth(k+24)A 0);f(Znth(k+25)A 0);f(Znth(k+26)A 0);f(Znth(k+27)A 0);f(Znth(k+28)A 0);f(Znth(k+29)A 0);f(Znth(k+30)A 0);f(Znth(k+31)A 0)].
Proof.
 intros f k A Hk Hb;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,qlr_window_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,qlr_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(qlr_window k 32 A))0=nth i [f(Znth(k+0)A 0);f(Znth(k+1)A 0);f(Znth(k+2)A 0);f(Znth(k+3)A 0);f(Znth(k+4)A 0);f(Znth(k+5)A 0);f(Znth(k+6)A 0);f(Znth(k+7)A 0);f(Znth(k+8)A 0);f(Znth(k+9)A 0);f(Znth(k+10)A 0);f(Znth(k+11)A 0);f(Znth(k+12)A 0);f(Znth(k+13)A 0);f(Znth(k+14)A 0);f(Znth(k+15)A 0);f(Znth(k+16)A 0);f(Znth(k+17)A 0);f(Znth(k+18)A 0);f(Znth(k+19)A 0);f(Znth(k+20)A 0);f(Znth(k+21)A 0);f(Znth(k+22)A 0);f(Znth(k+23)A 0);f(Znth(k+24)A 0);f(Znth(k+25)A 0);f(Znth(k+26)A 0);f(Znth(k+27)A 0);f(Znth(k+28)A 0);f(Znth(k+29)A 0);f(Znth(k+30)A 0);f(Znth(k+31)A 0)] 0).
   rewrite qlr_map_window_nth by lia.
   do 32(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qlr_chunk_expression_32 : forall k z pm nm o A,
 0<=k -> k+32<=Zlength A -> qlr_chunk k 32 z pm nm o A=[qlr_neon_expression(Znth(k+0)A 0)z pm nm o;qlr_neon_expression(Znth(k+1)A 0)z pm nm o;qlr_neon_expression(Znth(k+2)A 0)z pm nm o;qlr_neon_expression(Znth(k+3)A 0)z pm nm o;qlr_neon_expression(Znth(k+4)A 0)z pm nm o;qlr_neon_expression(Znth(k+5)A 0)z pm nm o;qlr_neon_expression(Znth(k+6)A 0)z pm nm o;qlr_neon_expression(Znth(k+7)A 0)z pm nm o;qlr_neon_expression(Znth(k+8)A 0)z pm nm o;qlr_neon_expression(Znth(k+9)A 0)z pm nm o;qlr_neon_expression(Znth(k+10)A 0)z pm nm o;qlr_neon_expression(Znth(k+11)A 0)z pm nm o;qlr_neon_expression(Znth(k+12)A 0)z pm nm o;qlr_neon_expression(Znth(k+13)A 0)z pm nm o;qlr_neon_expression(Znth(k+14)A 0)z pm nm o;qlr_neon_expression(Znth(k+15)A 0)z pm nm o;qlr_neon_expression(Znth(k+16)A 0)z pm nm o;qlr_neon_expression(Znth(k+17)A 0)z pm nm o;qlr_neon_expression(Znth(k+18)A 0)z pm nm o;qlr_neon_expression(Znth(k+19)A 0)z pm nm o;qlr_neon_expression(Znth(k+20)A 0)z pm nm o;qlr_neon_expression(Znth(k+21)A 0)z pm nm o;qlr_neon_expression(Znth(k+22)A 0)z pm nm o;qlr_neon_expression(Znth(k+23)A 0)z pm nm o;qlr_neon_expression(Znth(k+24)A 0)z pm nm o;qlr_neon_expression(Znth(k+25)A 0)z pm nm o;qlr_neon_expression(Znth(k+26)A 0)z pm nm o;qlr_neon_expression(Znth(k+27)A 0)z pm nm o;qlr_neon_expression(Znth(k+28)A 0)z pm nm o;qlr_neon_expression(Znth(k+29)A 0)z pm nm o;qlr_neon_expression(Znth(k+30)A 0)z pm nm o;qlr_neon_expression(Znth(k+31)A 0)z pm nm o].
Proof.
 intros;unfold qlr_chunk.
 transitivity(map(fun x=>qlr_neon_expression x z pm nm o)(qlr_window k 32 A)).
 - apply List.map_ext;intro x;apply eq_sym;apply qlr_neon_expression_exact.
 - apply qlr_map_window_32;assumption.
Qed.
Print Assumptions qlr_chunk_expression_32.
