From Coq Require Import ZArith Lia.
From GemmRvv Require Export Model SLFacts FastFrame.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac safe_frame :=
 first [ apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
