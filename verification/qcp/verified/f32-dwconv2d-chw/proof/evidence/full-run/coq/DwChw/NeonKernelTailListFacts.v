From Coq Require Import ZArith Lia List.
From DwChw Require Export NeonKernelOuterPointerAdapterFacts.
Import ListNotations. Local Open Scope Z_scope.
Lemma dw_neon_singleton_fp4:forall a b c d i,0<=i<1->
 nth(Z.to_nat i)[a]fp32_zero=dw_fp4 a b c d i.
Proof. intros;assert(i=0)by lia;subst i;reflexivity. Qed.
Lemma dw_neon_pack2_fp4:forall a b c d i,0<=i<2->
 nth(Z.to_nat i)(dw_pack2 a b)fp32_zero=dw_fp4 a b c d i.
Proof. intros;assert(i=0\/i=1)by lia;destruct H0 as[->| ->];reflexivity. Qed.
Print Assumptions dw_neon_singleton_fp4.
Print Assumptions dw_neon_pack2_fp4.
