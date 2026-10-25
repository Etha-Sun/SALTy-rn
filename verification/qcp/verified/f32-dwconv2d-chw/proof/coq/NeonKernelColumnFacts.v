From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelProgressFacts.
Local Open Scope Z_scope.
Lemma dw_neon_quot_position_exact:forall N w,
 0<=w<=4*N->w mod 4=0->4*((4*N-w)÷4)=4*N-w.
Proof.
 intros N w Hw Hmod;rewrite Z.quot_div_nonneg by lia.
 apply dw_neon_position_exact;assumption.
Qed.
Lemma dw_neon_next_column:forall N w,
 0<=w<=4*N->w mod 4=0->
 (4*N-(w-16))÷4=(4*N-w)÷4+4.
Proof.
 intros N w Hw Hmod;pose proof(dw_neon_quot_position_exact N w Hw Hmod)as He.
 replace(4*N-(w-16))with(((4*N-w)÷4+4)*4)by lia.
 rewrite Z.quot_mul by lia;reflexivity.
Qed.
Lemma dw_neon_previous_advance:forall F p x i,
 0<=x->0<=i<4->
 dw_get F(p+4*(x+i))=dw_previous4 F p(x+4)i.
Proof.
 intros F p x i Hx Hi;unfold dw_previous4.
 destruct(Z.eqb_spec(x+4)0);[lia|f_equal;ring].
Qed.
Print Assumptions dw_neon_quot_position_exact.
Print Assumptions dw_neon_next_column.
Print Assumptions dw_neon_previous_advance.
