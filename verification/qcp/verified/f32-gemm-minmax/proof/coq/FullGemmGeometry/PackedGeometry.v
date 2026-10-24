From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullModel.
From FullGemmGeometry Require Import Geometry.
Local Open Scope Z_scope.
Lemma bias_read_offset : forall kc n r extra width,
 0<=kc -> 0<r<=n -> Z.rem(n-r)8=0 ->
 0<=extra -> 0<=width -> extra+width<=8 ->
 let off:=8*(kc÷4+1)*panel_count(n-r)+extra in
 0<=off /\ off+width<=8*(kc÷4+1)*panel_count n.
Proof.
 intros kc n r extra width Hkc Hr Hrem He Hw Hsize.
 destruct(panel_prefix_range n r Hr Hrem)as[B E].
 pose proof(Z.quot_pos kc 4 ltac:(lia)ltac:(lia))as K.
 cbn zeta;split;nia.
Qed.
Lemma bias_read_pointer : forall base ptr kc n r extra width,
 0<=kc -> 0<r<=n -> Z.rem(n-r)8=0 ->
 0<=extra -> 0<=width -> extra+width<=8 ->
 ptr=base+(8*(kc÷4+1)*panel_count(n-r)+extra)*4 ->
 (ptr-base)÷4+width<=8*(kc÷4+1)*panel_count n /\
 0<=(ptr-base)÷4 /\ ptr=base+((ptr-base)÷4)*4.
Proof.
 intros base ptr kc n r extra width Hkc Hr Hrem He Hw Hsize Hp.
 pose proof(bias_read_offset kc n r extra width Hkc Hr Hrem He Hw Hsize)as[B0 B1].
 subst ptr;rewrite !float_byte_quot;repeat split;lia.
Qed.
Lemma packed_read_offset : forall kc k n r extra width,
 0<=k<=kc -> Z.rem kc 4=0 -> Z.rem k 4=0 ->
 0<r<=n -> Z.rem(n-r)8=0 ->
 0<=extra -> 0<=width -> extra+width<=2*k ->
 let off:=8*(kc÷4+1)*((n-r)÷8)+8+8*((kc-k)÷4)+extra in
 0<=off /\ off+width<=8*(kc÷4+1)*panel_count n.
Proof.
 intros kc k n r extra width Hk Hkc Hkr Hr Hrem He Hw Hsize.
 destruct(panel_prefix_range n r Hr Hrem)as[B E].
 destruct(quotient4_depth kc k Hk Hkc Hkr)as[D[K1[K2 K3]]].
 pose proof(Z.quot_pos (kc-k) 4 ltac:(lia)ltac:(lia))as D0.
 rewrite <-E;cbn zeta;split;nia.
Qed.
Lemma packed_read_pointer : forall base ptr kc k n r extra width,
 0<=k<=kc -> Z.rem kc 4=0 -> Z.rem k 4=0 ->
 0<r<=n -> Z.rem(n-r)8=0 ->
 0<=extra -> 0<=width -> extra+width<=2*k ->
 ptr=base+(8*(kc÷4+1)*((n-r)÷8)+8+8*((kc-k)÷4)+extra)*4 ->
 (ptr-base)÷4+width<=8*(kc÷4+1)*panel_count n /\
 0<=(ptr-base)÷4 /\ ptr=base+((ptr-base)÷4)*4.
Proof.
 intros base ptr kc k n r extra width Hk Hkc Hkr Hr Hrem He Hw Hsize Hp.
 pose proof(packed_read_offset kc k n r extra width Hk Hkc Hkr Hr Hrem He Hw Hsize)as[B0 B1].
 subst ptr;rewrite !float_byte_quot;repeat split;lia.
Qed.
Print Assumptions bias_read_offset.
Print Assumptions bias_read_pointer.
Print Assumptions packed_read_offset.
Print Assumptions packed_read_pointer.
