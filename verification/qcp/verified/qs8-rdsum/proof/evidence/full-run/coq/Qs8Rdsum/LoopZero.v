From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvFacts.
Local Open Scope Z_scope.
Lemma rd_splat_zero : forall i vl,rd_splat 0 i vl=0.
Proof. intros;unfold rd_splat;destruct(Z.ltb i vl);reflexivity. Qed.
Lemma rd_vl_active : forall n,0<n ->0<rd_vl n /\rd_vl n<=n.
Proof. intros;unfold rd_vl;pose proof(Z.le_min_l n 32);pose proof(Z.le_min_r n 32);split;[apply Z.min_glb_lt;lia|lia]. Qed.
Print Assumptions rd_splat_zero.
Print Assumptions rd_vl_active.
