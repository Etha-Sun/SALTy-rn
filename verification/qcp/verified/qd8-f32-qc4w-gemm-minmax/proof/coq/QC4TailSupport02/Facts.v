From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma qc_column_tail_bits : forall n,0<=n<16 ->
 (Z.land n 8=0 \/ Z.land n 8=8) /\
 (Z.land n 4=0 \/ Z.land n 4=4) /\
 (Z.land n 2=0 \/ Z.land n 2=2) /\
 (Z.land n 1=0 \/ Z.land n 1=1) /\
 Z.land n 12=Z.land n 8+Z.land n 4 /\
 Z.land n 14=Z.land n 12+Z.land n 2 /\
 n=Z.land n 14+Z.land n 1 /\
 0<=Z.land n 8<=Z.land n 12 /\
 Z.land n 12<=Z.land n 14<=n.
Proof.
 intros n Hn.
assert(Hcases:n=0 \/ n=1 \/ n=2 \/ n=3 \/ n=4 \/ n=5 \/ n=6 \/ n=7 \/ n=8 \/ n=9 \/ n=10 \/ n=11 \/ n=12 \/ n=13 \/ n=14 \/ n=15)by lia.
destruct Hcases as [H0|[H1|[H2|[H3|[H4|[H5|[H6|[H7|[H8|[H9|[H10|[H11|[H12|[H13|[H14|H15]]]]]]]]]]]]]]];subst n;vm_compute;intuition discriminate.
Qed.
Print Assumptions qc_column_tail_bits.
