From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullModel.
Local Open Scope Z_scope.
Lemma input_reset_bounds : forall base ptr kc mr row limit,
 0<=base ->0<=kc ->Z.rem kc 4=0 ->1<=mr<=4 ->0<=row<4 ->
 base+4*kc<=limit ->ptr=base+(row_alias mr row*(kc÷4)+(kc÷4))*4 ->
 0<=ptr<=limit /\ 0<=ptr-kc<=limit.
Proof.
 intros base ptr kc mr row limit Hb Hkc Hr Hmr Hrow Hlim Hp.
 pose proof(row_alias_range mr row Hmr Hrow)as R.
 pose proof(Z.quot_pos kc 4 ltac:(lia)ltac:(lia))as K.
 pose proof(Z.quot_rem kc 4 ltac:(lia))as E;rewrite Hr in E.
 subst ptr;split;split;nia.
Qed.
Lemma output_next_bounds : forall base ptr n r mr row limit,
 0<=base ->0<n ->8<=r<=n ->1<=mr<=4 ->0<=row<4 ->
 base+16*n<=limit ->ptr=base+(row_alias mr row*n+(n-r)+0)*4 ->
 0<=ptr<=limit /\ 0<=ptr+32<=limit.
Proof.
 intros base ptr n r mr row limit Hb Hn Hr Hmr Hrow Hlim Hp.
 pose proof(row_alias_range mr row Hmr Hrow)as R.
 subst ptr;split;split;nia.
Qed.
Print Assumptions input_reset_bounds.
Print Assumptions output_next_bounds.
