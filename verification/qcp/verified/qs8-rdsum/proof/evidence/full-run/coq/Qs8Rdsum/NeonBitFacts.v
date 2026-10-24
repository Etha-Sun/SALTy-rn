From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma rd_bit4_set_lower : forall n,0<=n ->Z.land n 4<>0 ->4<=n.
Proof. intros n Hn Hbit;destruct(Z_le_gt_dec 4 n);[assumption|assert(n=0 \/ n=1 \/ n=2 \/ n=3)by lia;destruct H as[ ->|[->|[->| ->]]];exfalso;apply Hbit;reflexivity]. Qed.
Lemma rd_bit2_set_lower : forall n,0<=n ->Z.land n 2<>0 ->2<=n.
Proof. intros n Hn Hbit;destruct(Z_le_gt_dec 2 n);[assumption|assert(n=0 \/ n=1)by lia;destruct H as[ ->| ->];exfalso;apply Hbit;reflexivity]. Qed.
Print Assumptions rd_bit4_set_lower.
Print Assumptions rd_bit2_set_lower.
