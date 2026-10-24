From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullModel.
From FullGemmGeometry Require Import Geometry.
Local Open Scope Z_scope.
Lemma input_read_offset : forall kc k mr row width,
 0<=k<=kc -> Z.rem kc 4=0 -> Z.rem k 4=0 ->
 1<=mr<=4 -> 0<=row<4 -> 0<=width -> 4*width<=k ->
 let off:=row_alias mr row*(kc÷4)+(kc-k)÷4 in
 0<=off /\ off+width<=kc.
Proof.
 intros kc k mr row width Hk Hkc Hkr Hmr Hrow Hw Hsize.
 pose proof(row_alias_range mr row Hmr Hrow)as R.
 destruct(quotient4_depth kc k Hk Hkc Hkr)as[D[K1[K2 K3]]].
 pose proof(Z.quot_rem kc 4 ltac:(lia))as E;rewrite Hkc in E.
 cbn zeta;split;nia.
Qed.
Lemma input_read_pointer : forall base ptr kc k mr row width,
 0<=k<=kc -> Z.rem kc 4=0 -> Z.rem k 4=0 ->
 1<=mr<=4 -> 0<=row<4 -> 0<=width -> 4*width<=k ->
 ptr=base+(row_alias mr row*(kc÷4)+(kc-k)÷4)*4 ->
 (ptr-base)÷4+width<=kc /\ 0<=(ptr-base)÷4 /\
 ptr=base+((ptr-base)÷4)*4.
Proof.
 intros base ptr kc k mr row width Hk Hkc Hkr Hmr Hrow Hw Hsize Hp.
 pose proof(input_read_offset kc k mr row width Hk Hkc Hkr Hmr Hrow Hw Hsize)as[B0 B1].
 subst ptr;rewrite !float_byte_quot;repeat split;lia.
Qed.
Print Assumptions input_read_offset.
Print Assumptions input_read_pointer.
