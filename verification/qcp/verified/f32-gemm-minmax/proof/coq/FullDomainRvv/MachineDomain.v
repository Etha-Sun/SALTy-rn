From Coq Require Import ZArith.
From FullDomainRvv Require Import FullModel.
Local Open Scope Z_scope.
Definition machine_capacity (a w c params kc nc:Z):Prop :=
 4*kc<=18446744073709551615 /\ 16*nc<=18446744073709551615 /\
 4*(panel_count nc*8*(kc/4+1))<=18446744073709551615 /\
 a<>0 /\ w<>0 /\ c<>0 /\ params<>0 /\
 a<=18446744073709551615-4*kc /\
 w<=18446744073709551615-4*(panel_count nc*8*(kc/4+1)) /\
 c<=18446744073709551615-16*nc /\ params<=18446744073709551615-8.
Lemma machine_capacity_expand : forall a w c params kc nc,
 machine_capacity a w c params kc nc <->
 (4*kc<=18446744073709551615 /\ 16*nc<=18446744073709551615 /\
 4*(panel_count nc*8*(kc/4+1))<=18446744073709551615 /\
 a<>0 /\ w<>0 /\ c<>0 /\ params<>0 /\
 a<=18446744073709551615-4*kc /\
 w<=18446744073709551615-4*(panel_count nc*8*(kc/4+1)) /\
 c<=18446744073709551615-16*nc /\ params<=18446744073709551615-8).
Proof. reflexivity. Qed.
Print Assumptions machine_capacity_expand.
